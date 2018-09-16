package journey.diary.test.controllers;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import journey.diary.test.DAO.PhotoMapper;
import journey.diary.test.VO.Photo;

@Controller
public class PhotoController {
	
	@Autowired
	SqlSession sqlSession;
	
		
	@RequestMapping(value = "/createPhoto", method = RequestMethod.GET)
	public String createPhoto(/*Model model, HttpSession session, int photono*/) {
		
		return "photo/createPhoto";
	}
	
	@RequestMapping(value = "/createPhoto", method = RequestMethod.POST)
	public String makePhoto(Model model, HttpSession session, int photono, MultipartFile uploadfile) {
		
		
		
		return "photo/createPhoto";
	}
		
	@RequestMapping(value = "/photoDetail", method = RequestMethod.GET)
	public String publicPhoto(Model model, HttpSession session, int photono) {
		
		PhotoMapper manager = sqlSession.getMapper(PhotoMapper.class);
		Photo photo = manager.getOnePhoto(photono);
		
		model.addAttribute("photo", photo);
		
		return "photo/photoDetails";
	}

}
