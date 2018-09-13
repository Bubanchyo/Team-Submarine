package journey.diary.test.controllers;

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

import journey.diary.test.DAO.MemberMapper;
import journey.diary.test.VO.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	
	@Autowired
	SqlSession sqlSession;
	
	 //Register form 불러오기 
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm() {

		
		return "member/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Member member, String confirmUserpassword, Model model) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		int result = 0;
		result = memberMapper.registerMember(member);
		
		if(result == 1) {
			model.addAttribute("message", "Thanks for registering.");
		}
		else {
			model.addAttribute("message", "Sorry for that the registration failed.");
		}
		
		return "index";
	}

	
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	public @ResponseBody String checkEmail(@RequestParam("useremail") String useremail, HttpServletResponse response) throws Exception{
			System.out.println("ajax data useremail???" + useremail);
			
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			int result = 0;
			result = memberMapper.checkEmail(useremail);
			System.out.println("email check result: " + result);
			
			if(result == 1) return "1";
			else return "0";

	}
	
	 //log In form 불러오기 
	@RequestMapping(value = "/logIn", method = RequestMethod.GET)
	public String logInForm() {

		
		return "member/logIn";
	}
	
	 //log In
		@RequestMapping(value = "/logIn", method = RequestMethod.POST)
		public String logIn(String useremail, String userpassword, HttpSession session, Model model) {
			
			System.out.println("login 정보???" + useremail + "&&&" + userpassword);
			Member member = new Member();
			member.setUseremail(useremail);
			member.setUserpassword(userpassword);
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			Member m = memberMapper.selectOne(member);
			
			System.out.println("member DB에서 받아옴??" + m);
			
			if(m != null) {
				session.setAttribute("useremail", m.getUseremail());
				session.setAttribute("username", m.getUsername());
				session.setAttribute("memberno", m.getMemberno());
				return "redirect:/";
				
			}else {
				model.addAttribute("message", "해당 아이디나 비밀번호가 없습니다.");
				return "index";
			}
			
		}
		
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			session.invalidate();
			
			return "redirect:/";
		}
		

		@RequestMapping(value = "/intro", method = RequestMethod.GET)
		public String intro(Locale locale, Model model) {
			
			System.out.println("intro???");
			
			return "intro";
		}
}
