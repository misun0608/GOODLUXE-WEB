package com.spring.goodluxe.ms;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.PointVO;

//RestController는 뷰가 아닌 데이터값을 반환 
@RestController
public class OrderAjaxController {
	@Autowired
	private OrderService gls;

	// produces 속성을 이용해 Response의 Content-Type을 제어할 수 있다
//	@PostMapping(value = "/insertKakaoOrder.do", produces = "application/json;charset=UTF-8")
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
