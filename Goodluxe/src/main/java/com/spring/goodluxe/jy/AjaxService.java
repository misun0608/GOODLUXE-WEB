package com.spring.goodluxe.jy;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.AuctionVO;
import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.NoticeVO;
import com.spring.goodluxe.voes.OrderVO;

public interface AjaxService {

	int isMemberLiked(String member_id, String entity_number)throws Exception ;
	int setLike(String member_id, String entity_number)throws Exception;
	
	ArrayList<CouponVO> defaultCouponList()throws Exception;
	ArrayList<CouponVO> allmemberCouponList(CouponVO couponVO)throws Exception;
	ArrayList<CouponVO> onememberCouponList(CouponVO couponVO)throws Exception;
	void deleteCouponList(String[] deletethis) throws Exception;
	
	ArrayList<HashMap<String, String>> getAllMemberinfo()throws Exception;
	HashMap<String, String> getMemberinfo(String member_id) throws Exception;
	String setBlackClass(String member_id) throws Exception;
	
	ArrayList<OrderVO> getAllOrderList() throws Exception;
	ArrayList<OrderVO> getOrderList(HashMap<String, Object> map)throws Exception;
	int orderChangeStatusStartShipping(String[] chked_change_me)throws Exception;
	int adminOrderSetStartShipping(HashMap<String, String> map)throws Exception;
	int adminOrderSetEndShipping(String order_number)throws Exception;
	int adminOrderMoneyGetShipping(String order_number)throws Exception;
	
	ArrayList<HashMap<String, Object>> adminAllProductList(String pb_division)throws Exception;
	ArrayList<HashMap<String, Object>> adminProductList(HashMap<String, String> map)throws Exception;
	int adminProductSetPostStatus(String[] chked_post_status)throws Exception;
	void postStatChange(String entity_number)throws Exception;
	void saleStatChange(String entity_number)throws Exception;
	void deleteProductList(String[] delete_this)throws Exception;
	ArrayList<OrderVO> getReturnList()throws Exception;
	ArrayList<OrderVO> getDetailReturndList(String orderstatus)throws Exception;
	void setReturnConfirm(String order_number)throws Exception;
	ArrayList<HashMap<String,String>> setReturnFinished(String order_number)throws Exception;
	ArrayList<NoticeVO> getAlarmContent(String member_id) throws Exception;
	ArrayList<NoticeVO> getMoreAlarmContent(HashMap<String, Object> map)throws Exception;
	int afterLoginCheckAlarm(String member_id)throws Exception;
	ArrayList<AuctionVO> admingetAuctionInfo()throws Exception;
	ArrayList<AuctionVO> adminGetAutionDetail(int aUCTION_POST_NUMBER)throws Exception;
	int adminAuctionStatChange(int aUCTION_POST_NUMBER)throws Exception;
	
	

	
	
	

	
}
