package journey.diary.test;

import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import journey.diary.test.DAO.PhotoMapper;
import journey.diary.test.VO.Photo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		PhotoMapper manager = sqlSession.getMapper(PhotoMapper.class);
		List<Photo> photoList = manager.getPhotoList();
		
		model.addAttribute("photoList", photoList);
		
		return "index";
	}
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String goindex(Locale locale, Model model) {
		

		return "index";


	}
	
	
	
	
	
}
