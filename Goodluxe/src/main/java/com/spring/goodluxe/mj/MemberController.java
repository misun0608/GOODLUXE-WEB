package com.spring.goodluxe.mj;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	   @Autowired
	   private MemberService memberService;
	      
	@RequestMapping(value = "/home.do")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/login_page.do")
	public String login_page() {
		return "login_page";
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("member_id");
		session.removeAttribute("member_class");
		session.removeAttribute("member_isadmin");
		return "login_page";
	}
}
