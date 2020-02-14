package com.spring.goodluxe;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.PointVO;

@RestController
public class GLAjaxController {
	@Autowired
	private GoodluxeService gls;
	
	// Login
	@PostMapping(value = "/login.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> userChk(MemberVO memberVO, HttpSession session) throws Exception {
		Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
		try {
			String result = gls.userChk(memberVO);
			if(result.equals("error_accur")) { retVal.put("result", "error_accur"); }
			else if(result.equals("non-member")) { retVal.put("result", "non-member"); }
			else if(result.equals("wrong_pw")) { retVal.put("result", "wrong_pw"); }
			else if(memberVO.getMember_class().equals("N")) { retVal.put("result", "email_N"); }
			else if(result.equals("ok")) {
				session.setAttribute("member_id", memberVO.getMember_id());
				session.setAttribute("member_class", memberVO.getMember_class());
				session.setAttribute("member_isadmin", memberVO.getMember_isadmin());
				retVal.put("result", "ok");
			}
		} catch (Exception e) {
			System.out.println("ERROR(GLAjaxController/userChk) : " + e.getMessage());
			retVal.put("result", "error_accur");
		}
		return retVal;
	};
	
	// Check if someone pressed 'Like Button'
	@RequestMapping(value = "/checkAlreadyLiked.do",  method = RequestMethod.POST ,produces="application/json;charset=UTF-8")
	public int checkAlreadyLiked(@RequestParam(value="entity_number")String entity_number, HttpSession session)throws Exception{
		int data = 0;
		String member_id = (String) session.getAttribute("member_id");
		if(member_id == null) return data;
		
		data = gls.isMemberLiked(member_id, entity_number);

		return data;
	}
	
	// When 'Like Button' is pressed
	@RequestMapping(value = "/mdDetailLike.do", produces="application/json;charset=UTF-8")
	public int mdDetailLike(@RequestParam(value="entity_number")String entity_number, HttpSession session)throws Exception{
		String member_id = (String) session.getAttribute("member_id");
		if(member_id == null) { return -1; }

		int data = gls.setLike(member_id, entity_number);
		return data;
	}
	
	
	
	
	// Order Part
	@PostMapping(value = "/insertKakaoOrder.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> insertKakaoOrder(HttpSession session, OrderVO vo, MemberVO memberVO, CouponVO couponVO, PointVO pointVO) {
		Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
		try {
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			vo.setOrder_order_date(timestamp);
			vo.setOrder_pay_date(timestamp);
			vo.setOrder_status("배송준비중");
			String mem_id = (String)session.getAttribute("member_id");
			vo.setMember_id(mem_id);
			memberVO.setMember_id(mem_id);
			couponVO.setMember_id(mem_id);
			pointVO.setMember_id(mem_id);

			int res = gls.insertKakaoOrder(vo);
			
			if (res != 0) {
				// 포인트사용 반영
				int member_point = memberVO.getMember_point() - vo.getOrder_used_point();
				memberVO.setMember_point(member_point);
				gls.updateMemberpoint(memberVO);
				
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
				if (order_used_coupon != null) {
					couponVO.setCoupon_number(order_used_coupon);
					gls.updateCouponstatus(couponVO);
				}
				
			retVal.put("res", "OK");
				
			}
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
			System.out.println("카카오 주문 에러 " + e.getMessage());
		}
		return retVal;
	}
}
