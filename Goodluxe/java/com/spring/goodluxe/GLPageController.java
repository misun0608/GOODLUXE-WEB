package com.spring.goodluxe;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GLPageController {
	
	@Autowired
	private GoodluxeService gls;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:mainPage.do";
	}
	
	/* Page Components */
	@RequestMapping(value = "header.do", method = RequestMethod.GET)
	public ModelAndView header() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("header");
		return mav; 
	}
	@RequestMapping(value = "loginBox.do", method = RequestMethod.GET)
	public ModelAndView loginBox() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login_box");
		return mav; 
	}
	@RequestMapping(value = "navBar.do", method = RequestMethod.GET)
	public ModelAndView navBar() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("nav_bar");
		return mav; 
	}
	@RequestMapping(value = "mypageMenu.do", method = RequestMethod.GET)
	public ModelAndView mypageMenu() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage_menu");
		return mav; 
	}
	@RequestMapping(value = "footer.do", method = RequestMethod.GET)
	public ModelAndView footer() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("footer");
		return mav; 
	}
	
	
	/* Logout */
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("member_id");
		session.removeAttribute("member_class");
		session.removeAttribute("member_isadmin");
		return "redirect:mainPage.do";
	}
	
	
	/* MyPage */
	// order_and_shipping
	@RequestMapping(value = "mypageOAS.do", method = RequestMethod.GET)
	public ModelAndView mypageOAS(String member_id) {
		ModelAndView mav = new ModelAndView();
		try {
			ArrayList<HashMap<String, Object>> oaslist = null;
			ArrayList<HashMap<String, Object>> cancellist = null;
			String online_id = member_id;
			oaslist = gls.getOasData(online_id);
			cancellist = gls.getCancelData(online_id);
			mav.addObject("oaslist", oaslist);
			mav.addObject("cancellist", cancellist);
			mav.setViewName("order_and_shipping");
		} catch(Exception e) {
			System.out.println("ERROR(GLPageController/mypageOAS) : " + e.getMessage());
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	// order_and_shipping : cancel
	@RequestMapping(value = "orderCancel.do", method = RequestMethod.GET)
	public ModelAndView orderCancel(String order_number) {
		ModelAndView mav = new ModelAndView();
		try {
			gls.orderCancel(order_number);
			mav.setViewName("redirect:mypageOAS.do");
		} catch(Exception e) {
			System.out.println("ERROR(GLPageController/orderCancel) : " + e.getMessage());
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	// order_and_shipping : refund
	@RequestMapping(value = "orderRefund.do", method = RequestMethod.GET)
	public ModelAndView orderRefund(String order_number) {
		ModelAndView mav = new ModelAndView();
		try {
			gls.orderRefund(order_number);
			mav.setViewName("redirect:mypageOAS.do");
		} catch(Exception e) {
			System.out.println("ERROR(GLPageController/orderRefund) : " + e.getMessage());
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	// order_detail
	@RequestMapping(value = "orderDetail.do", method = RequestMethod.GET)
	public ModelAndView orderDetail(String order_number) {
		ModelAndView mav = new ModelAndView();
		try {
			HashMap<String, Object> orderdata = gls.getOrderData(order_number);
			mav.addObject("orderdata", orderdata);
			mav.setViewName("order_detail");
		} catch(Exception e) {
			System.out.println("ERROR(GLPageController/orderDetail) : " + e.getMessage());
			mav.setViewName("redirect:/");
		}
		return mav;
	}

}
