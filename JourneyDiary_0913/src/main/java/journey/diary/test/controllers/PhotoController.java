package journey.diary.test.controllers;

import java.util.ArrayList;
import java.util.Locale;

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

import journey.diary.test.DAO.AlbumMapper;
import journey.diary.test.DAO.UserMapper;
import journey.diary.test.VO.Album;
import journey.diary.test.VO.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PhotoController {
	
	@Autowired
	SqlSession sqlSession;
		
		@RequestMapping(value = "/photoList", method = RequestMethod.GET)
		public String photoList(Locale locale, Model model, HttpSession session, int albumno) {
			

			//photoList불러오기
			
			

			return "photo/photoList";

		}
		

		
	}
