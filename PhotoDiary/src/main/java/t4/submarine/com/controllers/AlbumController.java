package t4.submarine.com.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import t4.submarine.com.DAO.AlbumMapper;
import t4.submarine.com.VO.Album;

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
	
	 //Register form 불러오기 
	@RequestMapping(value = "/albumDetails", method = RequestMethod.GET)
	public String albumDetails() {

		
		return "album/albumDetails";
	}


	
	
}
