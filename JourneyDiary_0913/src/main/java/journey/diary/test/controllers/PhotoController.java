package journey.diary.test.controllers;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import journey.diary.test.DAO.PhotoMapper;
import journey.diary.test.VO.Photo;

@Controller
public class PhotoController {
	
	@Autowired
	SqlSession sqlSession;
		
		@RequestMapping(value = "/photoList", method = RequestMethod.GET)
		public String photoList(Locale locale, Model model, HttpSession session, int albumno) {
			
			PhotoMapper manager = sqlSession.getMapper(PhotoMapper.class);
			Photo photo = manager.getOnePhoto(albumno);
			
			model.addAttribute("photo", photo);
			
			return "photo/photoList";

		}
		
		@RequestMapping(value = "/photoDetail", method = RequestMethod.GET)
		public String publicPhoto(Model model, HttpSession session, int photono) {
			
			PhotoMapper manager = sqlSession.getMapper(PhotoMapper.class);
			Photo photo = manager.getOnePhoto(photono);
			
			model.addAttribute("photo", photo);
			
			return "photo/photoDetails";

		}

}
