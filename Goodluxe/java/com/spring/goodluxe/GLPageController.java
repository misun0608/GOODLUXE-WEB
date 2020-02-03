package com.spring.goodluxe;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView mypageOAS(String member_id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("member_id") == null) {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		
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
	public ModelAndView orderCancel(String order_number, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("member_id") == null) {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		
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
	public ModelAndView orderRefund(String order_number, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("member_id") == null) {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		
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
	public ModelAndView orderDetail(String order_number, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("member_id") == null) {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		
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
	
	
	
	/* Item List */
	// main page
	@RequestMapping(value = "mainPage.do")
	public String mainPage( Model model ) throws Exception {
		try {
			ArrayList<HashMap<String, Object>> productList = new ArrayList<HashMap<String, Object>>();
			ArrayList<HashMap<String, Object>> productList_view = new ArrayList<HashMap<String, Object>>();
			
			productList = gls.getMainPageItem();
			productList_view = gls.getMainPageItem_view();
			
			model.addAttribute("productList",productList);
			model.addAttribute("productList_view", productList_view);
		} catch(Exception e) {
			System.out.println("ERROR(GLPageController/mainPage) : " + e.getMessage());
		}
		return "main_page";
	}
	
	// Item List Page
	@RequestMapping(value = "itemList.do")
	public String itemList( Model model, HttpServletRequest request
			,@RequestParam(value = "pageCount", required = false, defaultValue = "1") int pageCount
			,@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum 
			,@RequestParam(value = "il_search_brand", required = false, defaultValue = "all") String il_search_brand
			,@RequestParam(value = "il_search_category", required = false, defaultValue = "all") String il_search_category
			,@RequestParam(value = "il_search_grade", required = false, defaultValue = "all") String il_search_grade
			,@RequestParam(value = "il_search_price", required = false, defaultValue = "all") String il_search_price
			)throws Exception {
		
		try {
			if(pageNum<=0) { pageNum = 1; }
			if(pageNum>pageCount) { pageNum = pageCount; }
			// int pageSize = 16;
			int pageSize = 4;
			int currentPage = pageNum;
			int startRow = (currentPage-1) * pageSize +1;
			int endRow = startRow + pageSize - 1;
			int count = 0;
			int number = 0;
			
			ArrayList<HashMap<String, Object>> productList = new ArrayList<HashMap<String, Object>>();
			
			count = gls.getSellingBoardCount(startRow, endRow,il_search_brand,il_search_category,il_search_grade, il_search_price);
			
			if (count < startRow) {
				currentPage = currentPage - 1;
				startRow = (currentPage - 1) * pageSize + 1;
				endRow = startRow + pageSize - 1;
			}
			if (count > 0) {
				productList = gls.getSellingBoardProduct(startRow, endRow,il_search_brand,il_search_category,il_search_grade, il_search_price);
				number = count - (currentPage - 1) * pageSize;
			}
			
			model.addAttribute("il_search_brand",il_search_brand);
			model.addAttribute("il_search_category",il_search_category);
			model.addAttribute("il_search_grade",il_search_grade);
			model.addAttribute("il_search_price",il_search_price);
			
			model.addAttribute("productList",productList);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("count", count);
			model.addAttribute("number", number);
			model.addAttribute("pageSize", pageSize);
		} catch(Exception e) {
			System.out.println("ERROR(GLPageController/mainPage) : " + e.getMessage());
			return "redirect:/mainPage.do";
		}
		return "item_list";
	}
	
	// Search Result
	@RequestMapping(value = "searchResult.do")
	public String searchResult(Model model, HttpServletRequest request
			,@RequestParam(value = "pageCount", required = false, defaultValue = "1") int pageCount
			,@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum 
			,@RequestParam(value = "search_content", required = false, defaultValue="") String search_content
			,@RequestParam(value = "orderbywhat", required = false, defaultValue = "recently") String orderbywhat
			)throws Exception {
		
		try {
			if(pageNum<=0) { pageNum = 1; }
			if(pageNum>pageCount) { pageNum = pageCount; }
			// int pageSize = 12;
			int pageSize = 3;
			int currentPage = pageNum;
			int startRow = (currentPage-1) * pageSize +1;
			int endRow = startRow + pageSize - 1;
			int count = 0;
			int number = 0;
			
			ArrayList<HashMap<String, Object>> productList = new ArrayList<HashMap<String, Object>>();
			search_content = search_content.replaceAll("\\s", "\\|");
			count = gls.getSearchBoardCount(search_content,orderbywhat);
			
			if (count < startRow) {
				currentPage = currentPage - 1;
				startRow = (currentPage - 1) * pageSize + 1;
				endRow = startRow + pageSize - 1;
			}
			if (count > 0) {
				productList = gls.getSearchBoardProduct(startRow, endRow, search_content, orderbywhat );
				number = count - (currentPage - 1) * pageSize;
			}
			
			search_content = search_content.replaceAll("\\|", " ");
			
			model.addAttribute("orderbywhat",orderbywhat);
			model.addAttribute("search_content",search_content);
			model.addAttribute("productList", productList);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("count", count);
			model.addAttribute("number", number);
			model.addAttribute("pageSize", pageSize);
		} catch(Exception e) {
			System.out.println("ERROR(GLPageController/mainPage) : " + e.getMessage());
			return "redirect:/mainPage.do";
		}
		return "search_result";
	}
	
	// MD Detail Information
	@RequestMapping(value = "mdDetail.do")
	public String mdDetail( Model model, String entity_number, HttpServletResponse response ) throws Exception {
		if(entity_number == null) { return "redirect:/"; }
		
		try {
			HashMap<String,Object>theProduct = new HashMap<String,Object>();
			ArrayList<HashMap<String, Object>> recommandList = new ArrayList<HashMap<String, Object>>();
			
			theProduct = gls.getTheProduct(entity_number);
			
			if(theProduct == null) {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.write("<script>alert('현재 판매중인 상품이 아닙니다.');" + "location.href='mainPage.do';</script>");
				return null; }
			
			recommandList = gls.getRecommand(entity_number); 
			
			model.addAttribute("recommandList",recommandList);
			model.addAttribute("theProduct",theProduct);
			
		} catch(Exception e) {
			System.out.println("ERROR(GLPageController/mdDetail) : " + e.getMessage());
		}
		return "md_detail";
	}
}
