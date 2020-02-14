package com.spring.goodluxe.jin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelpController {
	@Autowired
	private MypageServiceImpl gls;
	
	@RequestMapping(value = "scFAQ.do", method = RequestMethod.GET)
	public ModelAndView scFAQ() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sc_faq");
		return mav; 
	}
	@RequestMapping(value = "scQBoard.do", method = RequestMethod.GET)
	public ModelAndView scQBoard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sc_qboard");
		return mav; 
	}
	@RequestMapping(value = "scChat.do", method = RequestMethod.GET)
	public ModelAndView scChat() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sc_chat");
		return mav; 
	}
	@RequestMapping(value = "scMethod.do", method = RequestMethod.GET)
	public ModelAndView scMethod() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sc_method");
		return mav; 
	}
	@RequestMapping(value = "scNotice.do", method = RequestMethod.GET)
	public ModelAndView scNotice() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sc_notice");
		return mav; 
	}
	
	@RequestMapping(value = "scLocation.do", method = RequestMethod.GET)
	public ModelAndView scLocation() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sc_location");
		return mav; 
	}
	
	@RequestMapping(value="SC.do")
	public String sc() {
		return "service_center";
	}
}
