package t4.submarine.com.controllers;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import t4.submarine.com.DAO.PhotoMapper;
import t4.submarine.com.VO.Photo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PhotoController {
	
	@Autowired
	SqlSession sqlSession;
	
	
	//photoList 불러오기 
		@RequestMapping(value = "/createPost", method = RequestMethod.GET)
		public String createPost(int albumno, Model model, HttpSession session) {
		
			model.addAttribute("albumno", albumno);
			
			return "photo/createPost";
		}
	
	 //photoDetails불러오 
	@RequestMapping(value = "/photoDetails", method = RequestMethod.GET)
	public String photoDetails(int photono, Model model, HttpSession session) {
		
		PhotoMapper photoMapper = sqlSession.getMapper(PhotoMapper.class);
		Photo photo = new Photo();
		photo = photoMapper.selectOnePhoto(photono);
			System.out.println("photo:::" + photo);
		
		
		
		return "photo/photoDetails";
	}
	

	

	
	
}
