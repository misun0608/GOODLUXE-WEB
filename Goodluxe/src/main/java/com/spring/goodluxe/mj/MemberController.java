package com.spring.goodluxe.mj;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.goodluxe.voes.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService gls;
 
	@RequestMapping(value = "/MJtest.do")
	public String home() {
		return "home";
	}
	
}
