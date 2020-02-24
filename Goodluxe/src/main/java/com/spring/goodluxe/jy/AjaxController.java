package com.spring.goodluxe.jy;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.goodluxe.voes.AuctionVO;
import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.NoticeVO;
import com.spring.goodluxe.voes.OrderVO;

@RestController 
public class AjaxController {
	
	@Autowired
	private AjaxService gls;

	// Check if someone pressed 'Like Button'
	// @RequestMapping(value = "/checkAlreadyLiked.do",  method = RequestMethod.POST ,produces="application/json;charset=UTF-8")
	public int checkAlreadyLiked(@RequestParam(value="entity_number")String entity_number, HttpSession session)throws Exception{
		int data = 0;
		String member_id = (String) session.getAttribute("member_id");
		if(member_id == null) return data;
		
		data = gls.isMemberLiked(member_id, entity_number);

		return data;
	}
	
	// When 'Like Button' is pressed
	// @RequestMapping(value = "/mdDetailLike.do", produces="application/json;charset=UTF-8")
	public int mdDetailLike(@RequestParam(value="entity_number")String entity_number, HttpSession session)throws Exception{
		String member_id = (String) session.getAttribute("member_id");
		if(member_id == null) { return -1; }

		int data = gls.setLike(member_id, entity_number);
		return data;
	}
	
	//쿠폰관리-기본(모든쿠폰)
	@RequestMapping(value="/CoupondefaultList.do", produces= "application/json;charset=UTF-8")
	public String CoupondefaultList(HttpServletRequest request) throws Exception {
		
		ArrayList<CouponVO> couponList = null;
		
		couponList = gls.defaultCouponList();
		
		ObjectMapper mapper = new ObjectMapper();//JSON형식으로 데이터를 반환하기 위해 사용(pom.xml편집)
		String str ="";
		str= mapper.writeValueAsString(couponList); //이 메소드는 리스트를 제이슨 형식으로 바꿔주는 역활을 함.
		return str;
		
	}
	//쿠폰관리-필터링(선택쿠폰)
	@RequestMapping(value="/getCouponList.do", produces= "application/json;charset=UTF-8")
	public String getCouponList(CouponVO couponVO, HttpServletRequest request) throws Exception {
		String allSel = request.getParameter("allselect");
		
		ArrayList<CouponVO> couponList = null;
		
		if(allSel==null) {
			allSel="none";
		}
		if(allSel.equals("all_member")) {
			couponList = gls.allmemberCouponList(couponVO);
		}else {
			couponList= gls.onememberCouponList(couponVO);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String str ="";
		str= mapper.writeValueAsString(couponList);
		return str;
		
	}
	@RequestMapping(value="/deleteCouponList.do", produces= "application/json;charset=UTF-8")
	public void deleteCouponList(HttpServletRequest request,
			@RequestParam(value="delete_this")String[] deletethis) throws Exception {
		
		String result = "성공";		
		gls.deleteCouponList(deletethis);
		
	}
	
	//회원리스트
	@RequestMapping(value="/getAllMemberList.do", produces= "application/json;charset=UTF-8")
	public String getAllMemberList() throws Exception {
		
		ArrayList<HashMap<String, String>> memberList = null;
		memberList = gls.getAllMemberinfo();
		
		ObjectMapper mapper = new ObjectMapper();
		String str ="";
		str= mapper.writeValueAsString(memberList);
		System.out.println("str"+str);
		return str;
	}
	//회원리스트(블랙리스트 관리)
	@RequestMapping(value="/getMemberList.do", produces= "application/json;charset=UTF-8")
	public String getMemberList(HttpServletRequest request
			,@RequestParam(value="")String member_id) throws Exception {
		
		HashMap<String, String> memberHM = null;
		memberHM = gls.getMemberinfo(member_id);
		
		ObjectMapper mapper = new ObjectMapper();
		String str ="";
		str= mapper.writeValueAsString(memberHM);
		System.out.println("str"+str);
		return str;
	}
	
	//블랙리스트 설정(블랙리스트 관리)
	@RequestMapping(value="/setBlackClass.do", produces= "application/json;charset=UTF-8")
	public Map<String,Object> setBlackClass(@RequestParam(value="member_id")String member_id) throws Exception {
		Map<String,Object> retVal = new HashMap<String, Object>();
		
		String data = gls.setBlackClass( member_id );
		retVal.put("res",data);
		return retVal;
	}
	
	//주문관리
		@RequestMapping(value="/getAllOrderList.do", produces= "application/json;charset=UTF-8")
		public ArrayList<OrderVO> getAllOrderList() throws Exception {
			
			ArrayList<OrderVO> orderList = null; 
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			orderList = gls.getAllOrderList();
			return orderList;
		}
	//주문관리(필터링)
	@RequestMapping(value="/getOrderList.do", produces= "application/json;charset=UTF-8")
	public ArrayList<OrderVO> getOrderList(
			@RequestParam(value="order_number", required = false)String order_number,
			@RequestParam(value="period", required = false)String period,
			@RequestParam(value="start_date_text", required = false, defaultValue = "1900/00/00")String start_date_text,
			@RequestParam(value="end_date_text", required = false, defaultValue = "1900/00/00")String end_date_text,
			@RequestParam(value="check_order_status", required = false)String[] check_order_status,
			@RequestParam(value="is_canceled", required = false)String is_canceled,
			@RequestParam(value="is_payed", required = false)String is_payed) throws Exception {
		
		
		
		start_date_text += " 15:00:00.000000000";
		end_date_text += " 15:00:00.000000000";
		//yyyy-mm-dd hh:mm:ss.fffffffff
		System.out.println("====================================================");
		System.out.println(order_number);
		System.out.println("====================================================");
		System.out.println("period = "+period);
		System.out.println("start_date_text = "+start_date_text);
		System.out.println("end_date_text = "+end_date_text);
		System.out.println("check_order_status = "+ check_order_status[0]);
		System.out.println("is_canceled = "+is_canceled);
		System.out.println("is_payed = "+is_payed);
		System.out.println("====================================================");
		
		Timestamp date_start;
		Timestamp date_end;
		
		ArrayList<OrderVO> orderList = null; 
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		OrderVO orderNull = new OrderVO();
		orderNull.setOrder_number("orderNull");
		
		
		if(period.equals("write")){
			
			date_start = Timestamp.valueOf(start_date_text);
			date_end = Timestamp.valueOf(end_date_text);
		
			map.put("date_start",date_start );
			map.put("date_end",date_end );
		
		}
		
		map.put("is_canceled",is_canceled );
		
		if(!is_canceled.equals("cancelN")) {
			System.out.println("cancelN");
			map.put("order_number",order_number);
			map.put("period",period );
			map.put("check_order_status",check_order_status);
			map.put("is_canceled",is_canceled );
			map.put("is_payed", is_payed);
			
		}
		
		orderList = gls.getOrderList(map);
		if(orderList.isEmpty()) {
			System.out.println("리스트가 비었음.");
			orderList.add(orderNull);
		}
		return orderList;
	}
	
//	@RequestMapping(value="/orderChangeStatusStartShipping.do", produces= "application/json;charset=UTF-8")
//	public Map<String, Object> adminAllProductList(
//			@RequestParam(value="chked_change_me", required = false)String[] chked_change_me) throws Exception {
//		Map<String,Object> retVal = new HashMap<String, Object>();
//		
//		int count = gls.orderChangeStatusStartShipping(chked_change_me);
//		String result = count+"개입력성공";
//		if(count == 0) {
//			retVal.put("res", "입력 실패");
//		}else {
//			retVal.put("res", result);
//		}
//		return retVal;
//	}
	

	
	@RequestMapping(value="/adminOrderSetStartShipping.do", produces= "application/json;charset=UTF-8")
	public Map<String, Object> adminOrderSetStartShipping(
			@RequestParam(value="order_number", required = false)String order_number,
			@RequestParam(value="order_invoice_number", required = false)String order_invoice_number
			) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("order_number", order_number);
		map.put("order_invoice_number", order_invoice_number);
		
		Map<String,Object> retVal = new HashMap<String, Object>();
		
		String result = "변경실패";
		
		int res = gls.adminOrderSetStartShipping(map);
		
		if(res == 1) {
			result = "변경 성공";
		}
		retVal.put("res", result);
		return retVal;
	}
	@RequestMapping(value="/adminOrderSetEndShipping.do", produces= "application/json;charset=UTF-8")
	public Map<String, Object> adminOrderSetEndShipping(
			@RequestParam(value="order_number", required = false)String order_number) throws Exception {
		Map<String,Object> retVal = new HashMap<String, Object>();
		String result = "변경실패";
		int res = gls.adminOrderSetEndShipping(order_number);
		
		if(res == 1) {
			result = "변경 성공";
		}
		retVal.put("res", result);
		return retVal;
	}
	
	@RequestMapping(value="/adminOrderMoneyGetShipping.do", produces= "application/json;charset=UTF-8")
	public Map<String, Object> adminOrderMoneyGetShipping(
			@RequestParam(value="order_number", required = false)String order_number) throws Exception {
		Map<String,Object> retVal = new HashMap<String, Object>();
		String result = "변경실패";
		int res = gls.adminOrderMoneyGetShipping(order_number);
		
		if(res == 1) {
			result = "변경 성공";
		}
		retVal.put("res", result);
		return retVal;
	}
	
	
	
	//상품관리
		@RequestMapping(value="/adminAllProductList.do", produces= "application/json;charset=UTF-8")
		public ArrayList<HashMap<String,Object>> adminAllProductList(
				@RequestParam(value="pb_division", required = false)String pb_division) throws Exception {
			ArrayList<HashMap<String,Object>> productList = null; 

			productList = gls.adminAllProductList(pb_division);
			
			System.out.println("member_ID : "+productList.get(0).get("member_id"));
		
			return productList;
		}
		@RequestMapping(value="/adminProductList.do", produces= "application/json;charset=UTF-8")
		public ArrayList<HashMap<String,Object>> adminProductList(
				@RequestParam(value="pb_division", required = false)String pb_division,
				@RequestParam(value="pb_post_status", required = false)String pb_post_status,
				@RequestParam(value="pb_sale_status", required = false)String pb_sale_status,
				@RequestParam(value="entity_number", required = false)String entity_number
				) throws Exception {
			
			ArrayList<HashMap<String,Object>> productList = null; 
			HashMap<String,String> map = new HashMap<String, String>();
			map.put("pb_division", pb_division);
			map.put("pb_post_status",pb_post_status );
			map.put("pb_sale_status",pb_sale_status );
			map.put("entity_number",entity_number );
			
			productList = gls.adminProductList(map);
		
			return productList;
		}
		
//		@RequestMapping(value="/adminProductSetPostStatus.do", produces= "application/json;charset=UTF-8")
//		public HashMap<String,Integer> adminProductSetPostStatus(
//				@RequestParam(value="chked_post_status", required = false)String[] chked_post_status) throws Exception {
//			HashMap<String, Integer>result = new HashMap<String, Integer>();
//			String msg ;
//			System.out.println("[0]"+chked_post_status[0]);
//			int res = gls.adminProductSetPostStatus(chked_post_status);
//			
//			
//			result.put("res", res);
//			
//			return result;
//		}
	
		@RequestMapping(value="/postStatChange.do", produces= "application/json;charset=UTF-8")
		public void postStatChange(
				@RequestParam(value="entity_number", required = false)String entity_number) throws Exception {
			
			gls.postStatChange(entity_number);
			
		}
	
		@RequestMapping(value="/saleStatChange.do", produces= "application/json;charset=UTF-8")
		public void saleStatChange(
				@RequestParam(value="entity_number", required = false)String entity_number) throws Exception {
			
			gls.saleStatChange(entity_number);
			
		}
		
		@RequestMapping(value="/deleteProductList.do", produces= "application/json;charset=UTF-8")
		public void deleteProductList(
				@RequestParam(value="delete_this", required = false)String[] delete_this) throws Exception {
			
			gls.deleteProductList(delete_this);
			
		}
		@RequestMapping(value="/getReturnList.do", produces= "application/json;charset=UTF-8")
		public ArrayList<OrderVO> getReturnList() throws Exception {
			
			ArrayList<OrderVO> returnList = null;
			
			returnList = gls.getReturnList();
			return returnList;
		}
	
		@RequestMapping(value="/getDetailReturndList.do", produces= "application/json;charset=UTF-8")
		public ArrayList<OrderVO> getDetailReturndList(
				@RequestParam(value="orderstatus", required = false)String orderstatus,
				@RequestParam(value="order_number",required = false)String order_number)throws Exception {
			
			ArrayList<OrderVO> returnList = null;
			
			if(orderstatus.equals("all")) {
				returnList = gls.getReturnList();
			}else {
				returnList = gls.getDetailReturndList(orderstatus);
			}
			
			return returnList;
		}
	
		@RequestMapping(value="/setReturnConfirm.do", produces= "application/json;charset=UTF-8")
		public void setReturnConfirm(
				@RequestParam(value="order_number", required = false)String order_number) throws Exception {
			
			ArrayList<OrderVO> returnList = null;
			gls.setReturnConfirm(order_number);
		}
		@RequestMapping(value="/setReturnFinished.do", produces= "application/json;charset=UTF-8")
		public ArrayList<HashMap<String,String>> setReturnFinished(
				@RequestParam(value="order_number", required = false)String order_number) throws Exception {
			
			ArrayList<OrderVO> returnList = null;
			ArrayList<HashMap<String,String>> likedMember = null;
			
			likedMember = gls.setReturnFinished(order_number);
			
			return likedMember;
		}
	
		@RequestMapping(value="/getAlarmContent.do", produces= "application/json;charset=UTF-8")
		public ArrayList<NoticeVO> getAlarmContent(HttpSession session) throws Exception {
			System.out.println("왔니???getAlarmContent");
			
			String member_id = (String) session.getAttribute("member_id");
			ArrayList<NoticeVO> noticeList = null;
			
			noticeList = gls.getAlarmContent(member_id);
			
			if(noticeList.isEmpty()) {
				System.out.println("isNULL");
				NoticeVO noticeVO = new NoticeVO();
				noticeVO.setAlarm_number("isNULL");
				noticeList.add(noticeVO);
			}
			return noticeList;
		}
	
		@RequestMapping(value="/getMoreAlarmContent.do", produces= "application/json;charset=UTF-8")
		public ArrayList<NoticeVO> getMoreAlarmContent(HttpSession session,
				@RequestParam(value="count", required = false) int count) throws Exception {
			
			System.out.println("파라미터가 ㅇ문제인건가???");
			String member_id = (String) session.getAttribute("member_id");
			ArrayList<NoticeVO> noticeList = null;
			HashMap<String,Object>map = new HashMap<String,Object>();
			
			int start = 5*(count-1)+1;
			int end = 5*count;
			
			map.put("member_id", member_id);
			map.put("start",start);
			map.put("end",end);
			
			noticeList = gls.getMoreAlarmContent(map);
			
			if(noticeList.isEmpty()) {
				System.out.println("isNULL");
				NoticeVO noticeVO = new NoticeVO();
				noticeVO.setAlarm_number("isNULL");
				noticeList.add(noticeVO);
			}
			return noticeList;
		}
		
		@RequestMapping(value="/afterLoginCheckAlarm.do", produces= "application/json;charset=UTF-8")
		public HashMap<String,String> afterLoginCheckAlarm(HttpSession session) throws Exception {
			String member_id = (String) session.getAttribute("member_id");
			HashMap<String,String> data = new HashMap<String,String>();
			
			int res = gls.afterLoginCheckAlarm(member_id);
			
			if(res != 0 ) {
				data.put("result", "notzero");
			}else {
				data.put("result", "iszero");
			}
			return data;
		}
		
		//경매감독
		@RequestMapping(value="/admingetAuctionInfo.do", produces= "application/json;charset=UTF-8")
		public ArrayList<AuctionVO> admingetAuctionInfo() throws Exception {
			
			ArrayList<AuctionVO> AuctionList = new ArrayList<AuctionVO>();
			
			AuctionList = gls.admingetAuctionInfo();
			
			return AuctionList;
		}
	
		
		//경매감독
		@RequestMapping(value="/adminGetAutionDetail.do", produces= "application/json;charset=UTF-8")
		public ArrayList<AuctionVO> adminGetAutionDetail(
				@RequestParam(value="AUCTION_POST_NUMBER", required = false)int AUCTION_POST_NUMBER
				) throws Exception {
			
			ArrayList<AuctionVO> AucHisList = new ArrayList<AuctionVO>();
			
			AucHisList = gls.adminGetAutionDetail(AUCTION_POST_NUMBER);
			
			return AucHisList;
		}
		//경매감독
		
		@RequestMapping(value="/adminAuctionStatChange.do", produces= "application/json;charset=UTF-8")
		public void adminAuctionStatChange(
				@RequestParam(value="AUCTION_POST_NUMBER", required = false)int AUCTION_POST_NUMBER
				) throws Exception {
			gls.adminAuctionStatChange(AUCTION_POST_NUMBER);
		}	
		
		
	
	
	
	
	
	
	
	
	
}
