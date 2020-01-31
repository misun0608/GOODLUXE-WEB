package com.spring.goodluxe.jin;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {
	
	@Autowired
	private MypageServiceImpl mypageService;
	
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
	
	// order_and_shipping
	@RequestMapping(value = "mypageOAS.do", method = RequestMethod.GET)
	public ModelAndView mypageOAS(String member_id) {
		ModelAndView mav = new ModelAndView();
		try {
			ArrayList<HashMap<String, Object>> oaslist = null;
			ArrayList<HashMap<String, Object>> cancellist = null;
			String online_id = member_id;
			oaslist = mypageService.getOasData(online_id);
			cancellist = mypageService.getCancelData(online_id);
			mav.addObject("oaslist", oaslist);
			mav.addObject("cancellist", cancellist);
			mav.setViewName("order_and_shipping");
		} catch(Exception e) {
			System.out.println("Controller ERROR(mypageOAS) : " + e.getMessage());
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	// order_and_shipping : �젣�뭹 援щℓ 痍⑥냼(寃곗젣 �쟾)
	@RequestMapping(value = "orderCancel.do", method = RequestMethod.GET)
	public ModelAndView orderCancel(String order_number) {
		ModelAndView mav = new ModelAndView();
		try {
			mypageService.orderCancel(order_number);
			mav.setViewName("redirect:mypageOAS.do");
		} catch(Exception e) {
			System.out.println("Controller ERROR(orderCancel) : " + e.getMessage());
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	// order_and_shipping : �젣�뭹 �솚遺� �떊泥�(寃곗젣 �썑)
	@RequestMapping(value = "orderRefund.do", method = RequestMethod.GET)
	public ModelAndView orderRefund(String order_number) {
		ModelAndView mav = new ModelAndView();
		try {
			mypageService.orderRefund(order_number);
			mav.setViewName("redirect:mypageOAS.do");
		} catch(Exception e) {
			System.out.println("Controller ERROR(orderCancel) : " + e.getMessage());
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
//	// md_detail
//	@RequestMapping(value = "mdDetail.do", method = RequestMethod.GET)
//	public ModelAndView mdDetail() {
//		ModelAndView mav = new ModelAndView();
//		try {
//			mav.setViewName("md_detail");
//		} catch(Exception e) {
//			System.out.println("Controller ERROR(mdDetail) : " + e.getMessage());
//			mav.setViewName("redirect:/");
//		}
//		return mav;
//	}
	
	// order_detail : 二쇰Ц �긽�꽭
	@RequestMapping(value = "orderDetail.do", method = RequestMethod.GET)
	public ModelAndView orderDetail(String order_number) {
		ModelAndView mav = new ModelAndView();
		try {
			HashMap<String, Object> orderdata = mypageService.getOrderData(order_number);
			mav.addObject("orderdata", orderdata);
			mav.setViewName("order_detail");
		} catch(Exception e) {
			System.out.println("Controller ERROR(orderDetail) : " + e.getMessage());
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
//	mypage_apply2
	@RequestMapping(value = "mypageApplyForm.do", method = RequestMethod.GET)
	public ModelAndView mypageApplyForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("mypage_apply_form");
		return mav; 
	}

}
