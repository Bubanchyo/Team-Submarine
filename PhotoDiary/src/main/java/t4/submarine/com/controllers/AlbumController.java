package t4.submarine.com.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.WebDetection;
import com.google.cloud.vision.v1.WebDetection.WebEntity;
import com.google.cloud.vision.v1.WebDetection.WebImage;
import com.google.cloud.vision.v1.WebDetection.WebLabel;
import com.google.cloud.vision.v1.WebDetection.WebPage;
import com.google.protobuf.ByteString;

import t4.submarine.com.DAO.AlbumMapper;
import t4.submarine.com.DAO.MemberMapper;
import t4.submarine.com.DAO.PhotoMapper;
import t4.submarine.com.VO.Album;
import t4.submarine.com.VO.Photo;
import t4.submarine.com.VO.Uploadimage;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AlbumController {
	
	@Autowired
	SqlSession sqlSession;
	
	 //[My Journey Diary] 클릭 -> albumList불러오기 
	@RequestMapping(value = "/journeyDiary", method = RequestMethod.GET)
	public String journeyDiary(Model model, HttpSession session) {
		
		int memberno = (int) session.getAttribute("memberno");
		System.out.println("[my journey diary]클릭 시 memberno:::" + memberno);
		AlbumMapper albumMapper = sqlSession.getMapper(AlbumMapper.class);
		ArrayList<Album> albumList = new ArrayList<>();
				albumList = albumMapper.getAlbumList(memberno);
			System.out.println("albumList FROM DB::: " + albumList);
		
		model.addAttribute("albumList", albumList);
		

			
		return "album/albumList";
	}
	
	 //photoList 불러오
	@RequestMapping(value = "/photoList", method = RequestMethod.GET)
	public String albumDetails(int albumno, HttpSession session, Model model) {
		
		
		
		AlbumMapper albumMapper = sqlSession.getMapper(AlbumMapper.class);
		ArrayList<Photo> photoList = albumMapper.getPhotoList(albumno);
			System.out.println("photoList from DB:::" + photoList);

		
		model.addAttribute("photoList", photoList);
		model.addAttribute("albumno", albumno);
		
		return "album/photoList";
	}
	
	 //createAlbum 불러오기 
	@RequestMapping(value = "/createAlbum", method = RequestMethod.GET)
	public String createAlbum(Model model) {
			
		return "album/createAlbum";
	}

	 //createAlbum  
	@RequestMapping(value = "/createAlbum", method = RequestMethod.POST)
	public String createAlbum(Album album, Model model, HttpSession session) {
		int memberno = (int) session.getAttribute("memberno");
			
		album.setMemberno(memberno); //memberno from HttpSession 
			System.out.println("createAlbum.jsp로부터 받아온 데이터 :::" + album);
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int result = memberMapper.createAlbum(album);
			System.out.println(result);
		if(result == 1) {
			model.addAttribute("message", "successfully created");
		}else {
			model.addAttribute("message", "failed");
		}
	
		
		
		return "album/createAlbum";
	}
	
	
	
	
	
	//Ajax image Upload
	//String UPLOADPATH = System.getProperty("user.dir") + "\\workSpace\\PhotoDiary\\src\\main\\webapp\\resources\\upload";
	String UPLOADPATH = "C:\\Users\\kita\\git\\Team-Submarine\\PhotoDiary\\src\\main\\webapp\\resources\\img\\daehoonupload\\";
	@RequestMapping(value = "/ajaximage", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public @ResponseBody String ajaximage(MultipartFile uploadfile) {
		
		UUID uuid = UUID.randomUUID();
		String saveFileName = uuid + "_" + uploadfile.getOriginalFilename();
		
		File saveFile = new File(UPLOADPATH, saveFileName);
		
		PhotoMapper photoManager = sqlSession.getMapper(PhotoMapper.class);
		
		
		try {
			uploadfile.transferTo(saveFile);
			Uploadimage image = new Uploadimage();
			image.setOriginalfilename(uploadfile.getOriginalFilename());
			image.setSavedfilename(saveFileName);
			photoManager.uploadimg(image);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		return UPLOADPATH + saveFileName;
	}
	
	@RequestMapping(value = "/hashtag", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public @ResponseBody String hashtag(String saveFileName) {
		
		try {
			return detectWebDetections(saveFileName); 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "Failed";
	}
	
	// 로컬 이미지 감지
		public static String detectWebDetections(String filePath) throws Exception, IOException {
			List<AnnotateImageRequest> requests = new ArrayList<>();

			ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

			Image img = Image.newBuilder().setContent(imgBytes).build();
			Feature feat = Feature.newBuilder().setType(Type.WEB_DETECTION).build();
			AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
			requests.add(request);

			try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
				BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
				List<AnnotateImageResponse> responses = response.getResponsesList();

				for (AnnotateImageResponse res : responses) {
					if (res.hasError()) {
						System.out.printf("Error: %s\n", res.getError().getMessage());
						return "";
					}

					// Search the web for usages of the image. You could use these signals later
					// for user input moderation or linking external references.
					// For a full list of available annotations, see http://g.co/cloud/vision/docs
					WebDetection annotation = res.getWebDetection();
					System.out.println("Entity:Id:Score");
					System.out.println("===============");
					int i = 0;
					for (WebLabel label : annotation.getBestGuessLabelsList()) {
						System.out.format("\nBest guess label: %s", label.getLabel());
						return label.getLabel();
					}
				}
				return "end";
			}
		}
		
		@RequestMapping(value = "/registerPhoto", method = RequestMethod.POST)
		public String RegisterPhoto(Model model, HttpSession session, Photo photo, MultipartFile uploadfile) {
			
			/*PhotoMapper photoManager = sqlSession.getMapper(PhotoMapper.class);
			int result = photoManager.photoUpload(photo);
			
			System.out.println(result);*/
			
			return "album/photoList";
		}
	
}
