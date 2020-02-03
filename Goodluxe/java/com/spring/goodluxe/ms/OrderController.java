package com.spring.goodluxe.ms;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.PointVO;
import com.spring.goodluxe.voes.ProductVO;

@Controller
public class OrderController {

	@Autowired
	private OrderService gls;
	
	// 주문서 작성 페이지 이동
	@RequestMapping(value = "orderForm.do")
	public String orderForm(String entity_nuber, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		String entity_number = request.getParameter("entity_number");
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
			ArrayList<CouponVO> coupon_list = gls.selectCoupon(member_id);
			
			model.addAttribute("mvo", mvo);
			model.addAttribute("pvo", pvo);
			model.addAttribute("coupon_list", coupon_list);
		} catch(Exception e) {
			
		}
		return "order_form";
	}
	
	// 무통장입금으로 주문했을 시
	@RequestMapping(value = "/insertOrder.do")
	public String insertOrder(OrderVO vo, MemberVO memberVO, CouponVO couponVO, PointVO pointVO, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		try {
			// 주문번호 만들기
			// 6자리 난수 생성
			Random rand = new Random();
			String numStr = "";	// 난수가 저장될 변수
			
			for(int i = 0; i<6; i++) {	// 6자리 난수 생성
				// 0~9까지 난수 생성
				String ran = Integer.toString(rand.nextInt(10));
				numStr += ran;
			}
			
			// 주문일자 일까지 구하기
			SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
			Date time = new Date();
			
			// 주문번호: 주문일자 + 난수 6자리
			String order_date = format1.format(time);
			String order_number = order_date + numStr;
			
			vo.setOrder_number(order_number);
			vo.setOrder_confirm("확정전");
			vo.setOrder_status("주문완료");
			
			int res = gls.insertOrder(vo);
			
			if (res != 0) {
				// 포인트사용 반영
				int member_point = memberVO.getMember_point() - vo.getOrder_used_point();
				memberVO.setMember_point(member_point);
				gls.updateMemberpoint(memberVO);
				
				// 포인트 사용내역 저장
				if(vo.getOrder_used_point() != 0) {
					System.out.println("컨트롤러 포인트 사용내역 추가 들어옴");
					
					// order정보 받아오기(주문날짜 = 사용날짜 하기위해)
					vo = gls.selectOrder(vo);
					
					int point_amount = vo.getOrder_used_point();
					pointVO.setPoint_amount(point_amount);
					pointVO.setPoint_status("상품구매 사용");
					pointVO.setPoint_date(vo.getOrder_order_date());
					pointVO.setOrder_number(order_number);
					
					gls.insertPointHistory(pointVO);
				}
				
				// 쿠폰사용 반영
				String order_used_coupon = vo.getOrder_used_coupon();
				System.out.println("사용쿠폰 " + order_used_coupon);
				
				if(order_used_coupon != null) {
					couponVO.setCoupon_number(order_used_coupon);
					gls.updateCouponstatus(couponVO);
				}
				
				writer.write("<script>alert('무통장 주문 성공');location.href='./insertOrderDone.do?order_number="+vo.getOrder_number()+"';</script>");
			} else {
				writer.write("<script>alert('무통장 주문 실패');" + "location.href='./insertOrderDone.do';</script>");
			}
			
		} catch (Exception e) {
			System.out.println("주문 에러 " + e.getMessage());
		}
		return null;
	}
	
	@RequestMapping(value = "/insertOrderDone.do")
	public String insertOrderDone(OrderVO vo, MemberVO mvo, ProductVO pvo, PointVO pointVO, Model model) throws Exception {
//		System.out.println("insertOrderDone 컨트롤러 들어옴");
//		System.out.println("멤버아이디" + mvo.getMember_id());
//		System.out.println("오더넘버" + vo.getOrder_number());
//		System.out.println("멤버 적립금 " + mvo.getMember_point());
//		System.out.println("엔터티 " + pvo.getEntity_number());
//		System.out.println("적립예정 " + pvo.getSale_price());
		
		String member_id = mvo.getMember_id();
		String entity_number = pvo.getEntity_number();
		
		OrderVO orderVO = gls.selectOrder(vo);
		
		// 카카오페이 결제 시 포인트 적립 및 히스토리 추가
		if(orderVO.getOrder_pay_system().equals("카카오페이")) {
			System.out.println("카카오페이 포인트 적립 들어옴");
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
	
	///////////////////////////마이페이지////////////////////////////////////
	// 포인트 히스토리 리스트 및 정보 가져오기
	@RequestMapping(value = "/get_point_view.do")
	public String get_point_view(HttpServletRequest request, Model model, @RequestParam(value = "pageCount", required = false, defaultValue = "1") int pageCount
            ,@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum) throws Exception {
		String member_id = request.getParameter("member_id");
		ArrayList<PointVO> pointList = new ArrayList<PointVO>();
		
		// 페이징
		
        if(pageNum<=0) {
            pageNum = 1;
         }
         if(pageNum>pageCount) {
            pageNum = pageCount;
         }
         
         int pageSize = 3;
         int currentPage = pageNum;
         int startRow = (currentPage-1) * pageSize +1;
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
	public String get_coupon_view(HttpServletRequest request, Model model, @RequestParam(value = "pageCount", required = false, defaultValue = "1") int pageCount
            ,@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum) throws Exception{
		String member_id = request.getParameter("member_id");
		ArrayList<CouponVO> couponList = new ArrayList<CouponVO>();
		
		// 페이징
		
        if(pageNum<=0) {
            pageNum = 1;
         }
         if(pageNum>pageCount) {
            pageNum = pageCount;
         }
         
         int pageSize = 3;
         int currentPage = pageNum;
         int startRow = (currentPage-1) * pageSize +1;
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
         for(int i=0; i<couponList.size(); i++) {
        	CouponVO cvo = (CouponVO)couponList.get(i);
         	cal.setTime(cvo.getCoupon_expire());
         	cal.add(Calendar.DATE, +14);
         	expire_date = format1.format(cal.getTime());
         	
			expire_day = format1.parse(expire_date);
			today = format1.parse(format1.format(date));
        	
			int result = today.compareTo(expire_day);
			// 결과 1이면 today > expire_day / 0이면 같으면 / -1이면 기간 안지난거
			
			if(result == 1){
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
}
