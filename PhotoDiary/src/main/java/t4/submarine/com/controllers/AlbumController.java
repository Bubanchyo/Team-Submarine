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
import t4.submarine.com.DAO.MemberMapper;
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
	/***
	 * 3번 	
	 */
	
		
		return "album/albumDetails";
	}
	
	 //createAlbum 불러오기 
	@RequestMapping(value = "/createAlbum", method = RequestMethod.GET)
	public String createAlbum(Model model) {
			
		return "album/createAlbum";
	}

	 //createAlbum  
	@RequestMapping(value = "/createAlbum", method = RequestMethod.POST)
	public String createAlbum(Album album, Model model, HttpSession session) {
		int memberno = (int) session.getAttribute("memberno");
			
		album.setMemberno(memberno); //memberno from HttpSession 
			System.out.println("createAlbum.jsp로부터 받아온 데이터 :::" + album);
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int result = memberMapper.createAlbum(album);
			System.out.println(result);
		if(result == 1) {
			model.addAttribute("message", "successfully created");
		}else {
			model.addAttribute("message", "failed");
		}
	
		
		
		return "album/createAlbum";
	}
	
	
}
