package com.spring.goodluxe.ms;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

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
	@PostMapping(value = "/insertKakaoOrder.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> insertKakaoOrder(OrderVO vo, MemberVO memberVO, CouponVO couponVO, PointVO pointVO) {
		Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
		try {
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			vo.setOrder_order_date(timestamp);
			vo.setOrder_pay_date(timestamp);
			vo.setOrder_confirm("확정전");
			vo.setOrder_status("결제완료");
			
			// 값들어오는지 확인
//			System.out.println("ordernum " + vo.getOrder_number());
//			System.out.println("orderrecei " + vo.getOrder_receipt());
//			System.out.println("orderpaydate " + vo.getOrder_pay_date());
//			System.out.println("orderdate " + vo.getOrder_order_date());
//			System.out.println("orderconfirm " + vo.getOrder_confirm());
//			System.out.println("orderphone " + vo.getOrder_phone());
//			System.out.println("orderprice " + vo.getOrder_product_price());
//			System.out.println("orderpoint " + vo.getOrder_used_point());
//			System.out.println("orderusedcoupon " + vo.getOrder_used_coupon());
//			System.out.println("ordermessage " + vo.getOrder_message());
//			System.out.println("orderpayprice " + vo.getOrder_pay_price());
//			System.out.println("memberid " + vo.getMember_id());
			
			int res = gls.insertKakaoOrder(vo);
			retVal.put("res", "OK");
			
			System.out.println("controller res " + res);
			if (res != 0) {
				// 포인트사용 반영
				int member_point = memberVO.getMember_point() - vo.getOrder_used_point();
				memberVO.setMember_point(member_point);
				gls.updateMemberpoint(memberVO);
//				System.out.println("가용포인트 " + member_point);
				
				if(vo.getOrder_used_point() != 0) {
					System.out.println("컨트롤러 포인트 사용내역 추가 들어옴");
					
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
				
			}
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
			System.out.println("카카오 주문 에러 " + e.getMessage());
		}
		return retVal;
	}
}
