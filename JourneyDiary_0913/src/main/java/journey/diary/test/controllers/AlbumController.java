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
import journey.diary.test.DAO.MemberMapper;
import journey.diary.test.VO.Album;
import journey.diary.test.VO.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AlbumController {
	
	@Autowired
	SqlSession sqlSession;
		
		@RequestMapping(value = "/showAlbum", method = RequestMethod.GET)
		public String intro(Locale locale, Model model, HttpSession session) {
			

			int memberno = (Integer) session.getAttribute("memberno");

			AlbumMapper albumMapper = sqlSession.getMapper(AlbumMapper.class);
			ArrayList<Album> albumList = new ArrayList<Album>();
			albumList = albumMapper.getAlbumList(memberno);

			model.addAttribute("albumList", albumList);

			return "album/albumList";

		}
		
		@RequestMapping(value = "/createAlbum", method = RequestMethod.GET)
		public String createAlbum(Locale locale, Model model, HttpSession session) {
			

			return "album/createAlbum";

		}
		
	}
