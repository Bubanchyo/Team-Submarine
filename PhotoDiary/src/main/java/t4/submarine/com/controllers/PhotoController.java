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
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.WebDetection;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.WebDetection.WebEntity;
import com.google.cloud.vision.v1.WebDetection.WebImage;
import com.google.cloud.vision.v1.WebDetection.WebLabel;
import com.google.cloud.vision.v1.WebDetection.WebPage;
import com.google.protobuf.ByteString;

import t4.submarine.com.DAO.PhotoMapper;
import t4.submarine.com.VO.Photo;
import t4.submarine.com.VO.Uploadimage;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PhotoController {

	@Autowired
	SqlSession sqlSession;

	// photoList 불러오기
	@RequestMapping(value = "/createPost", method = RequestMethod.GET)
	public String createPost(int albumno, Model model, HttpSession session) {

		model.addAttribute("albumno", albumno);

		return "photo/createPost";
	}

	// photoDetails불러오기
	@RequestMapping(value = "/photoDetails", method = RequestMethod.GET)
	public String photoDetails(int photono, Model model, HttpSession session) {

		PhotoMapper photoMapper = sqlSession.getMapper(PhotoMapper.class);
		Photo photo = new Photo();
		photo = photoMapper.selectOnePhoto(photono);
		
		model.addAttribute("photoDetail", photo);
		
		
		System.out.println("photo:::" + photo);

		return "photo/photoDetails";
	}

	// Ajax image Upload
	// String UPLOADPATH = System.getProperty("user.dir") +
	// "\\workSpace\\PhotoDiary\\src\\main\\webapp\\resources\\upload";
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
					return "Fail";
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
			return "Fail";
		}
	}

	@RequestMapping(value = "/registerPhoto", method = RequestMethod.POST)
	public String RegisterPhoto(Model model, HttpSession session, Photo photo, MultipartFile uploadfile) {

		int memberno = (int) session.getAttribute("memberno");

		PhotoMapper photoManager = sqlSession.getMapper(PhotoMapper.class);

		photo.setMemberno(memberno);

		String realPath = photo.getPhotoimg();
		String imgPath = realPath.substring(UPLOADPATH.length(), realPath.length());
		String path = "./resources/img/daehoonupload/" + imgPath;

		photo.setPhotoimg(path);

		System.out.println(photo);
		
		int result = photoManager.photoUpload(photo);
		
		
		return "album/photoList";
	}

}
