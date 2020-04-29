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
	private MypageServiceImpl gls;
	
	// order_and_shipping
//	@RequestMapping(value = "mypageOAS.do", method = RequestMethod.GET)
//	public ModelAndView mypageOAS(String member_id) {
//		ModelAndView mav = new ModelAndView();
//		try {
//			ArrayList<HashMap<String, Object>> oaslist = null;
//			ArrayList<HashMap<String, Object>> cancellist = null;
//			String online_id = member_id;
//			oaslist = gls.getOasData(online_id);
//			cancellist = gls.getCancelData(online_id);
//			mav.addObject("oaslist", oaslist);
//			mav.addObject("cancellist", cancellist);
//			mav.setViewName("order_and_shipping");
//		} catch(Exception e) {
//			System.out.println("Controller ERROR(mypageOAS) : " + e.getMessage());
//			mav.setViewName("redirect:/");
//		}
//		return mav;
//	}
	
	// order_and_shipping : �젣�뭹 援щℓ 痍⑥냼(寃곗젣 �쟾)
//	@RequestMapping(value = "orderCancel.do", method = RequestMethod.GET)
//	public ModelAndView orderCancel(String order_number) {
//		ModelAndView mav = new ModelAndView();
//		try {
//			gls.orderCancel(order_number);
//			mav.setViewName("redirect:mypageOAS.do");
//		} catch(Exception e) {
//			System.out.println("Controller ERROR(orderCancel) : " + e.getMessage());
//			mav.setViewName("redirect:/");
//		}
//		return mav;
//	}
	
	// order_and_shipping : �젣�뭹 �솚遺� �떊泥�(寃곗젣 �썑)
//	@RequestMapping(value = "orderRefund.do", method = RequestMethod.GET)
//	public ModelAndView orderRefund(String order_number) {
//		ModelAndView mav = new ModelAndView();
//		try {
//			gls.orderRefund(order_number);
//			mav.setViewName("redirect:mypageOAS.do");
//		} catch(Exception e) {
//			System.out.println("Controller ERROR(orderCancel) : " + e.getMessage());
//			mav.setViewName("redirect:/");
//		}
//		return mav;
//	}
	
	// order_detail : 二쇰Ц �긽�꽭
//	@RequestMapping(value = "orderDetail.do", method = RequestMethod.GET)
//	public ModelAndView orderDetail(String order_number) {
//		ModelAndView mav = new ModelAndView();
//		try {
//			HashMap<String, Object> orderdata = gls.getOrderData(order_number);
//			mav.addObject("orderdata", orderdata);
//			mav.setViewName("order_detail");
//		} catch(Exception e) {
//			System.out.println("Controller ERROR(orderDetail) : " + e.getMessage());
//			mav.setViewName("redirect:/");
//		}
//		return mav;
//	}
	
//	mypage_apply2
	@RequestMapping(value = "mypageApplyForm.do", method = RequestMethod.GET)
	public ModelAndView mypageApplyForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("mypage_apply_form");
		return mav; 
	}

}
