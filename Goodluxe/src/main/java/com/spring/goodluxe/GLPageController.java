package com.spring.goodluxe;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.goodluxe.mj.KakaoController;
import com.spring.goodluxe.mj.NaverLoginBO;
import com.spring.goodluxe.voes.ApplyVO;
import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.PointVO;
import com.spring.goodluxe.voes.ProductBoardVO;
import com.spring.goodluxe.voes.ProductVO;
import com.spring.goodluxe.voes.RequestModel;

@Controller
public class GLPageController {
	
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
	
	@Autowired
	private GoodluxeService gls;
	
	@Autowired(required = false)
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "redirect:mainPage.do";
	}
	
	/* Page Components */
	@RequestMapping(value = "header.do", method = RequestMethod.GET)
	public ModelAndView header(HttpSession session, Model model) {
		ModelAndView mav = new ModelAndView();
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("naver_url", naverAuthUrl);
	      
		//카카오 인증 url을 view로 전달
		String kakaoUrI = KakaoController.getAuthorizationUri(session);
		model.addAttribute("kakao_url", kakaoUrI);
	       
		mav.setViewName("header");
		return mav; 
	}
	@RequestMapping(value = "loginBox.do", method = RequestMethod.GET)
	public ModelAndView loginBox(HttpSession session, Model model) {
		ModelAndView mav = new ModelAndView();
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
	       String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	       model.addAttribute("naver_url", naverAuthUrl);
	      
	       //카카오 인증 url을 view로 전달
	       String kakaoUrI = KakaoController.getAuthorizationUri(session);
	       model.addAttribute("kakao_url", kakaoUrI);
		
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
	public ModelAndView mypageMenu(HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		ModelAndView mav = new ModelAndView();
		mav.addObject("member_id", member_id);
		
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
	public ModelAndView mypageOAS(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String online_id = (String)session.getAttribute("member_id");
		
		if(online_id == null) {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		
		try {
			ArrayList<HashMap<String, Object>> oaslist = null;
			ArrayList<HashMap<String, Object>> cancellist = null;
			oaslist = gls.getOasData(online_id);
			cancellist = gls.getCancelData(online_id);
			mav.addObject("oaslist", oaslist);
			mav.addObject("cancellist", cancellist);
			mav.setViewName("order_and_shipping");
		} catch(Exception e) {
			System.out.println("ERROR(GLPageController/mypageOAS) : " + e.getMessage());
			mav.setViewName("redirect:/mainPage.do");
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
			int pageSize = 16;
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
			int pageSize = 12;
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
	
	@RequestMapping(value = "findEnNum.do")
	public String findEnNum(int pb_number) {
		String enNum = null;
		try {
			enNum = gls.findEnNum(pb_number);
		} catch(Exception e) {
			System.out.println("ERROR(GLPageController/findEnNum) : " + e.getMessage());
		}
		String url = "redirect:mdDetail.do?entity_number=" + enNum;
		return url;
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
	
	// Order Part
	// Move to Order Form
	@RequestMapping(value = "orderForm.do")
	public String orderForm(Model model, String entity_number, HttpServletResponse response, HttpSession session) throws Exception{
		String member_id = (String) session.getAttribute("member_id");
		if(member_id == null) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write("<script>alert('로그인 후 이용해주세요.');" + "location.href=history.go(-1);</script>");
			return null;
		}
		try {
			MemberVO mvo = gls.selectMember(member_id);
			ProductVO pvo = gls.selectProduct(entity_number);
			ProductBoardVO pbvo = gls.selectPB(entity_number);
			ArrayList<CouponVO> coupon_list = gls.selectCoupon(member_id);
			
			model.addAttribute("mvo", mvo);
			model.addAttribute("pvo", pvo);
			model.addAttribute("pbvo", pbvo);
			model.addAttribute("coupon_list", coupon_list);
		} catch(Exception e) {
			System.out.println("ERROR(OrderController/orderForm) : " + e.getMessage());
			return "redirect:/mainPage.do";
		}
		return "order_form";
	}
	// 무통장입금으로 주문했을 시
	@RequestMapping(value = "/insertOrder.do")
	public String insertOrder(HttpSession session, OrderVO vo, MemberVO memberVO, CouponVO couponVO, PointVO pointVO) throws Exception {
		try {
			vo.setOrder_status("입금전");
			String mem_id = (String)session.getAttribute("member_id");
			vo.setMember_id(mem_id);
			memberVO.setMember_id(mem_id);
			couponVO.setMember_id(mem_id);
			pointVO.setMember_id(mem_id);
			
			int res = gls.insertOrder(vo);
			
			if (res != 0) {
				// 포인트사용 반영
				int member_point = memberVO.getMember_point() - vo.getOrder_used_point();
				memberVO.setMember_point(member_point);
				gls.updateMemberpoint(memberVO);
				
				// 포인트 사용내역 저장
				if(vo.getOrder_used_point() != 0) {
					// order정보 받아오기(주문날짜 = 사용날짜 하기위해)
					vo = gls.selectOrder(vo);
					
					int point_amount = vo.getOrder_used_point();
					pointVO.setPoint_amount(point_amount);
					pointVO.setPoint_status("상품구매 사용");
					pointVO.setPoint_date(vo.getOrder_order_date());
					pointVO.setOrder_number(vo.getOrder_number());
					
					gls.insertPointHistory(pointVO);
				}
				
				// 쿠폰사용 반영
				String order_used_coupon = vo.getOrder_used_coupon();
				if(order_used_coupon != null) {
					couponVO.setCoupon_number(order_used_coupon);
					gls.updateCouponstatus(couponVO);
				}
				
			}
			
			String url = "insertOrderDone.do?order_number=" + vo.getOrder_number();
			return "redirect:" + url;
		} catch (Exception e) {
			System.out.println("ERROR(OrderContoller/insertOrder) : " + e.getMessage());
		}
		return "redirect:mainPage.do";
	}
	@RequestMapping(value = "/insertOrderDone.do")
	public String insertOrderDone(HttpSession session, OrderVO vo, MemberVO mvo, ProductVO pvo, PointVO pointVO, Model model) throws Exception {
		String member_id = (String)session.getAttribute("member_id");
		vo.setMember_id(member_id);
		mvo.setMember_id(member_id);
		pvo.setMember_id(member_id);
		pointVO.setMember_id(member_id);
		String entity_number = pvo.getEntity_number();
		
		OrderVO orderVO = gls.selectOrder(vo);
		
		// 카카오페이 결제 시 포인트 적립 및 히스토리 추가
		if(orderVO.getOrder_pay_system().equals("카카오페이")) {
			ProductVO productVO = gls.selectProduct(entity_number);
			MemberVO memberVO = gls.selectMember(member_id);
			int update_point = (memberVO.getMember_point() + (int)(productVO.getSale_price() * 0.001));
			
			// 추가 적립금
			int point_amount = (int)(productVO.getSale_price() * 0.001);
			pointVO.setPoint_amount(point_amount);
			pointVO.setPoint_status("상품구매 적립");
			pointVO.setPoint_date(orderVO.getOrder_order_date());
			pointVO.setOrder_number(orderVO.getOrder_number());
			
			gls.insertPointHistory(pointVO);
			
			mvo.setMember_point(update_point);
			gls.updateMemberpoint(mvo);
			model.addAttribute("pvo", productVO);
		}
		
		model.addAttribute("orderVO", orderVO);
		
		return "order_form_done";
	}
	
	// MyPage Part
	/////////////////////////// 마이페이지////////////////////////////////////
	// 포인트 히스토리 리스트 및 정보 가져오기
	@RequestMapping(value = "/get_point_view.do")
	public String get_point_view(HttpSession session, Model model,
			@RequestParam(value = "pageCount", required = false, defaultValue = "1") int pageCount,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum) throws Exception {
		String member_id = (String)session.getAttribute("member_id");
		ArrayList<PointVO> pointList = new ArrayList<PointVO>();

		// 페이징

		if (pageNum <= 0) {
			pageNum = 1;
		}
		if (pageNum > pageCount) {
			pageNum = pageCount;
		}

		int pageSize = 2;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = 0;
		int number = 0;

		count = gls.getListCount(member_id);

		if (count < startRow) {
			currentPage = currentPage - 1;
			startRow = (currentPage - 1) * pageSize + 1;
			endRow = startRow + pageSize - 1;
		}
		if (count > 0) {
			pointList = gls.getPointList(member_id, startRow, endRow);
			number = count - (currentPage - 1) * pageSize;
		}

		// 사용가능 적립금 = member_point 불러오기
		MemberVO memberVO = gls.selectMember(member_id);

		// 포인트 리스트 가져오기

		model.addAttribute("memberVO", memberVO);
		model.addAttribute("member_id", member_id);
		model.addAttribute("pointList", pointList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("count", count);
		model.addAttribute("number", number);
		model.addAttribute("pageSize", pageSize);

		return "mypage_point_view";
	}

	// 쿠폰 내역 조회
	@RequestMapping(value = "/get_coupon_view.do")
	public String get_coupon_view(HttpSession session, Model model,
			@RequestParam(value = "pageCount", required = false, defaultValue = "1") int pageCount,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum) throws Exception {
		String member_id = (String)session.getAttribute("member_id");
		ArrayList<CouponVO> couponList = new ArrayList<CouponVO>();

		// 페이징

		if (pageNum <= 0) {
			pageNum = 1;
		}
		if (pageNum > pageCount) {
			pageNum = pageCount;
		}

		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = 0;
		int number = 0;

		count = gls.getCouponListCount(member_id);

		if (count < startRow) {
			currentPage = currentPage - 1;
			startRow = (currentPage - 1) * pageSize + 1;
			endRow = startRow + pageSize - 1;
		}
		if (count > 0) {
			couponList = gls.getCouponList(member_id, startRow, endRow);
			number = count - (currentPage - 1) * pageSize;
		}

		// 시간 더하기 위해서
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String expire_date = null;

		// 오늘날짜
		Date date = new Date();
		Calendar todayDateCal = Calendar.getInstance();

		Date today = null;
		Date expire_day = null;

		// 기간만료시 DB에 Coupon_status 수정해줘야
		for (int i = 0; i < couponList.size(); i++) {
			CouponVO cvo = (CouponVO) couponList.get(i);
			cal.setTime(cvo.getCoupon_expire());
			cal.add(Calendar.DATE, +14);
			expire_date = format1.format(cal.getTime());

			expire_day = format1.parse(expire_date);
			today = format1.parse(format1.format(date));

			int result = today.compareTo(expire_day);
			// 결과 1이면 today > expire_day / 0이면 같으면 / -1이면 기간 안지난거

			if (result == 1) {
				cvo.setCoupon_status("기간만료");
				gls.updateCouponExstatus(cvo);
			}
		}

		model.addAttribute("member_id", member_id);
		model.addAttribute("couponList", couponList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("count", count);
		model.addAttribute("number", number);
		model.addAttribute("pageSize", pageSize);

		return "mypage_coupon_view";
	}

	// 구매제한 페이지
	@RequestMapping(value = "/get_restriction_view.do")
	public String get_restriction_view(HttpSession session, Model model) throws Exception {
		String member_id = (String)session.getAttribute("member_id");
		MemberVO memberVO = gls.selectMember(member_id);

		ArrayList<HashMap<String, Object>> order_list = gls.getOrderList(member_id);

		model.addAttribute("memberVO", memberVO);
		model.addAttribute("order_list", order_list);

		return "mypage_restriction_view";
	}

	// 판매신청 페이지
	@RequestMapping(value = "/get_apply_form.do")
	public String get_apply_form(HttpSession session, Model model) throws Exception {
		String member_id = (String)session.getAttribute("member_id");

		model.addAttribute("member_id", member_id);

		return "mypage_apply_form";
	}

	// 판매신청 눌렀을 때
	@RequestMapping(value = "/insertApply.do")
	public String insertApply(@RequestParam("ap_md_pictures") List<MultipartFile> ap_md_picturesList,
			MultipartHttpServletRequest request, RequestModel requestModel, ApplyVO avo, Model model) throws Exception {
		String str = "";
		String uploadPath = "C:\\Project138\\upload\\";
        File fileDir = new File(uploadPath); 
        if (!fileDir.exists()) { 
           fileDir.mkdirs(); 
        }
		long time = System.currentTimeMillis();

		try { // 파일생성
			for (MultipartFile mf : ap_md_picturesList) {
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				String saveFileName = String.format("%d_%s", time, originFileName);
				mf.transferTo(new File(uploadPath, saveFileName));
				str += saveFileName + ",";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (str.length() != 0) {
			str = str.substring(0, str.length() - 1);
		} else {
			str = "#";
		}
		avo.setAp_img_stored(str);
		avo.setAp_decision("결정전");
		
		// 현재 시스템 시간 구하기
//		long systemTime = System.currentTimeMillis();
		 
		// 출력 형태를 위한 formmater 
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		 
		// format에 맞게 출력하기 위한 문자열 변환
//		String dTime = formatter.format(systemTime);
//		System.out.println(dTime);
//		
//		avo.setAp_apply_date(dTime);

		gls.insertApplyGoods(avo);
		
		return "mypage_apply_done";
	}
	
	// 판매조회 페이지 이동
	@RequestMapping(value = "/get_salesinquiry_form.do")
	public String get_salesinquiry_form(HttpSession session, Model model) throws Exception {
		String member_id = (String)session.getAttribute("member_id");
		
		// 등록전
		ArrayList<ApplyVO> applyList = null;
		// 판매중
		ArrayList<HashMap<String,Object>> sellingList = null;
		// 거래진행중
		ArrayList<HashMap<String,Object>> tradingList = null;
		// 판매완료
		ArrayList<HashMap<String,Object>> finishList = null;
		// 매입상품
		ArrayList<HashMap<String,Object>> purchasingList = null;
		
		try {
			applyList = gls.getApplyList(member_id);
			sellingList = gls.getSellingList(member_id);
			tradingList = gls.getTradingList(member_id);
			finishList = gls.getFinishList(member_id);
			purchasingList = gls.getPurchasingList(member_id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("member_id", member_id);
		model.addAttribute("applyList", applyList);
		model.addAttribute("sellingList", sellingList);
		model.addAttribute("tradingList", tradingList);
		model.addAttribute("finishList", finishList);
		model.addAttribute("purchasingList", purchasingList);

		return "mypage_salesinquiry";
	}
	
	// 판매조회 페이지에서 삭제 눌렀을 경우 cancelApply
}
