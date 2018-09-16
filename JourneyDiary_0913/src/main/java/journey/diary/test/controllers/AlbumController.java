package journey.diary.test.controllers;

import java.io.File;
import java.util.ArrayList;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import journey.diary.test.DAO.AlbumMapper;
import journey.diary.test.DAO.PhotoMapper;
import journey.diary.test.VO.Album;
import journey.diary.test.VO.Uploadimage;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AlbumController {
	
	@Autowired
	SqlSession sqlSession;
		
		@RequestMapping(value = "/showAlbum", method = RequestMethod.GET)
		public String intro(Locale locale, Model model, HttpSession session) {
			

			int userno = (Integer) session.getAttribute("userno");

			AlbumMapper albumMapper = sqlSession.getMapper(AlbumMapper.class);
			ArrayList<Album> albumList = new ArrayList<Album>();
			albumList = albumMapper.getAlbumList(userno);

			model.addAttribute("albumList", albumList);

			return "album/albumList";

		}
		
		@RequestMapping(value = "/createAlbum", method = RequestMethod.GET)
		public String createAlbum(Locale locale, Model model, HttpSession session) {
			
			return "album/createAlbum";

		}
		
		String ALBUMUPLOADPATH = "C:\\Users\\kita\\git\\Team-Submarine3\\JourneyDiary_0913\\src\\main\\webapp\\resources\\img\\album\\";
		String LINKPATH = "./resources/img/album/";
		@RequestMapping(value = "/createAlbum", produces = "application/text; charset=utf8", method = RequestMethod.POST)
		public String makeAlbum(HttpSession session, Album album, MultipartFile uploadfile) {
			
			int userno = (int)session.getAttribute("userno");
			
			
			AlbumMapper albumMapper = sqlSession.getMapper(AlbumMapper.class);
			
			UUID uuid = UUID.randomUUID();
			
			String saveFileName = uuid + "_" + uploadfile.getOriginalFilename();
			
			File saveFile = new File(ALBUMUPLOADPATH, saveFileName);
			
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
			album.setUserno(userno);
			album.setAlbumimg(saveFileName);
			
			albumMapper.createAlbum(album);
			return "album/createAlbum";

		}
		
	}
