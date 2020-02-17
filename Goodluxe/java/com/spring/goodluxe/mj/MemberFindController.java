package com.spring.goodluxe.mj;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberFindController {

	@Autowired
	private MemberService gls;
	
	@RequestMapping(value = "/find_data.do")
	public String find_data() {
		return "find_data";
	}
}