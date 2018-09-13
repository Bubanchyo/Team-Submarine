package journey.diary.test.controllers;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import journey.diary.test.VO.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	
	
	@RequestMapping(value = "/logIn", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		System.out.println("login???");
		
		return "member/logIn";
	}
	
	@RequestMapping(value = "/logIn", method = RequestMethod.POST)
	public String home(Locale locale, Model model, Member member) {
		
		System.out.println("logIn정보 from jsp:::" + member);
			
		return "member/logIn";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Locale locale, Model model) {
		
		System.out.println("register???");
		
		return "member/register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Locale locale, Model model, Member member) {
		
		System.out.println("register정보 from jsp:::" + member);
			
		return "member/register";
	}
	
	
}
