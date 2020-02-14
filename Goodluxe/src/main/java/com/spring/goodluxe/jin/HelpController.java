package com.spring.goodluxe.jin;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.goodluxe.voes.InquireVO;

@Controller
public class HelpController {
	@Autowired
	private HelpServiceImpl gls;
	
	@RequestMapping(value = "scFAQ.do", method = RequestMethod.GET)
	public ModelAndView scFAQ() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sc_faq");
		return mav; 
	}
	@RequestMapping(value = "scQBoard.do", method = RequestMethod.GET)
	public ModelAndView scQBoard() {
		ModelAndView mav = new ModelAndView();
		try {
			ArrayList<InquireVO> qbList = gls.loadQBList();
			mav.addObject("qbList", qbList);
			
		} catch(Exception e) {
			System.out.println("ERROR(HelpController/scQBoard) : " + e.getMessage());
		}
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
	
	// Question Board Writing Post
	@RequestMapping(value = "scWrite.do", method = RequestMethod.GET)
	public ModelAndView scWrite(HttpSession session, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		try {
			if(session.getAttribute("member_id") == null) {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.write("<script>alert('로그인 후 이용해주세요.');" + "location.href=history.go(-1);</script>");
				return null;
			}
			mav.setViewName("sc_qboard_write");
		} catch(Exception e) {
			System.out.println("ERROR(HeplController/scWrite) : " + e.getMessage());
			mav.setViewName("redirect:SC.do");
		}
		return mav; 
	}
	// Insert Question Board Post Data
	@RequestMapping(value = "inquireInsert.do", method = RequestMethod.GET)
	public ModelAndView inquireInsert(InquireVO inVO, HttpSession session, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		try {
			if(session.getAttribute("member_id") == null) {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.write("<script>alert('로그인 후 이용해주세요.');" + "location.href=history.go(-1);</script>");
				return null;
			}
			inVO.setMember_id((String)session.getAttribute("member_id"));
			gls.inquireInsert(inVO);
		} catch(Exception e) {
			System.out.println("ERROR(HeplController/inquireInsert) : " + e.getMessage());
		}
		mav.setViewName("redirect:SC.do");
		return mav; 
	}
	// Show Question Board Post
	@RequestMapping(value = "scQBoardDetail.do", method = RequestMethod.GET)
	public ModelAndView scQBoardDetail(@RequestParam(value = "inquire_number", required = false, defaultValue = "0")int inquire_number) {
		ModelAndView mav = new ModelAndView();
		try {
			if(inquire_number == 0) {
				mav.setViewName("redirect:SC.do");
			}
			InquireVO qPost = gls.loadQPost(inquire_number);
			if(qPost == null) {
				mav.setViewName("redirect:SC.do");
			} else {
				mav.addObject("qPost", qPost);
				mav.setViewName("sc_qboard_detail");
			}
		} catch(Exception e) {
			System.out.println("ERROR(HeplController/scQBoardDetail) : " + e.getMessage());
			mav.setViewName("redirect:SC.do");
		}
		return mav; 
	}
	
}
