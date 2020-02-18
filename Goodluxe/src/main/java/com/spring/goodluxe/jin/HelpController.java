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
	
	@RequestMapping(value = "scMenu.do", method = RequestMethod.GET)
	public ModelAndView scMenu() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sc_menu");
		return mav; 
	}
	@RequestMapping(value = "scFAQ.do", method = RequestMethod.GET)
	public ModelAndView scFAQ() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sc_faq");
		return mav; 
	}
	@RequestMapping(value = "scQBoard.do", method = RequestMethod.GET)
	public ModelAndView scQBoard(@RequestParam(value = "pageCount", required = false, defaultValue = "1") int pageCount
								,@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum ) {
		ModelAndView mav = new ModelAndView();
		ArrayList<InquireVO> qbList = null;
		
		if(pageNum<=0) { pageNum = 1; }
		if(pageNum>pageCount) { pageNum = pageCount; }
		int pageSize = 10;
//		int pageSize = 5;
		int currentPage = pageNum;
		int startRow = (currentPage-1) * pageSize +1;
		int endRow = startRow + pageSize - 1;
		int count = 0;
		int number = 0;
		
		try {
			count = gls.getQBoardCount(startRow, endRow);
			while (count < startRow) {
				currentPage = currentPage - 1;
				startRow = (currentPage - 1) * pageSize + 1;
				endRow = startRow + pageSize - 1;
			}
			if (count > 0) {
				qbList = gls.loadQBList(startRow, endRow);
				number = count - (currentPage - 1) * pageSize;
			}		
			mav.addObject("qbList", qbList);
			mav.addObject("currentPage", currentPage);
			mav.addObject("count", count);
			mav.addObject("number", number);
			mav.addObject("pageSize", pageSize);
			
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
			mav.setViewName("redirect:scQBoard.do");
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
			inVO.setInquire_content(inVO.getInquire_content().replace("\r\n", "<br/>"));
			inVO.setMember_id((String)session.getAttribute("member_id"));
			gls.inquireInsert(inVO);
		} catch(Exception e) {
			System.out.println("ERROR(HeplController/inquireInsert) : " + e.getMessage());
		}
		mav.setViewName("redirect:scQBoard.do");
		return mav; 
	}
	// Show Question Board Post
	@RequestMapping(value = "scQBoardDetail.do", method = RequestMethod.GET)
	public ModelAndView scQBoardDetail(@RequestParam(value = "inquire_number", required = false, defaultValue = "0")int inquire_number) {
		ModelAndView mav = new ModelAndView();
		try {
			if(inquire_number == 0) {
				mav.setViewName("redirect:scQBoard.do");
			}
			InquireVO qPost = gls.loadQPost(inquire_number);
			if(qPost == null) {
				mav.setViewName("redirect:scQBoard.do");
			} else {
				mav.addObject("qPost", qPost);
				mav.setViewName("sc_qboard_detail");
			}
		} catch(Exception e) {
			System.out.println("ERROR(HeplController/scQBoardDetail) : " + e.getMessage());
			mav.setViewName("redirect:scQBoard.do");
		}
		return mav; 
	}
	// Load Question Board Post Data for Update
	@RequestMapping(value = "inquireUpdateForm.do", method = RequestMethod.GET)
	public ModelAndView inquireUpdateForm(int inquire_number) {
		ModelAndView mav = new ModelAndView();
		try {
			InquireVO qPost = gls.loadQPost(inquire_number);
			if(qPost == null) {
				mav.setViewName("redirect:scQBoard.do");
			} else {
				qPost.setInquire_content(qPost.getInquire_content().replace("<br/>", "\r\n"));
				mav.addObject("qPost", qPost);
				mav.setViewName("sc_qboard_update");
			}
		} catch(Exception e) {
			System.out.println("ERROR(HeplController/inquireUpdateForm) : " + e.getMessage());
			mav.setViewName("redirect:scQBoard.do");
		}
		return mav; 
	}
	// Update Question Board Post Data
	@RequestMapping(value = "inquireUpdate.do", method = RequestMethod.GET)
	public ModelAndView inquireUpdate(InquireVO inVO) {
		ModelAndView mav = new ModelAndView();
		try {
			inVO.setInquire_content(inVO.getInquire_content().replace("\r\n", "<br/>"));
			gls.inquireUpdate(inVO);
		} catch(Exception e) {
			System.out.println("ERROR(HeplController/inquireUpdate) : " + e.getMessage());
		}
		String url = "redirect:scQBoardDetail.do?inquire_number=" + inVO.getInquire_number();
		mav.setViewName(url);
		return mav; 
	}
	// Delete Question Board Post Data
	@RequestMapping(value = "inquireDelete.do", method = RequestMethod.GET)
	public ModelAndView inquireDelete(int inquire_number) {
		ModelAndView mav = new ModelAndView();
		try {
			gls.inquireDelete(inquire_number);
		} catch(Exception e) {
			System.out.println("ERROR(HeplController/inquireDelete) : " + e.getMessage());
		}
		mav.setViewName("redirect:scQBoard.do");
		return mav; 
	}
	
	@RequestMapping(value = "zNotice2.do", method = RequestMethod.GET)
	public ModelAndView zNotice2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("z_notice2");
		return mav; 
	}
	
}
