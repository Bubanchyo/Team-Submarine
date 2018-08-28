package t4.submarine.com.controllers;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import t4.submarine.com.DAO.MemberMapper;
import t4.submarine.com.VO.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AlbumController {
	
	@Autowired
	SqlSession sqlSession;
	
	 //Register form 불러오기 
	@RequestMapping(value = "/journeyDiary", method = RequestMethod.GET)
	public String goToJourneyDiary() {

		
		return "album/albumList";
	}


	
	
}
