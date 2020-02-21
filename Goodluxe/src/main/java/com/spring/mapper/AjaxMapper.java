package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.AuctionVO;
import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.NoticeVO;
import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.PointVO;

public interface AjaxMapper {
	//좋아요
	int isAlreadyLiked(HashMap<String,String> map);
   	int insertLikedUser(HashMap<String, String> map);
   	int deleteLikedUser(HashMap<String, String> map);
   	int increaseLike(HashMap<String, String>map);
   	int decreaseLike(HashMap<String, String>map);
   	//쿠폰관리
   	ArrayList<CouponVO> defaultCouponList();
   	ArrayList<CouponVO> allmemberCouponList(CouponVO couponVO);
   	ArrayList<CouponVO> onememberCouponList(CouponVO couponVO);
   	void deleteCouponList(HashMap<String,String> map);
   	//회원관리
   	ArrayList<HashMap<String, String>> getAllMemberinfo();
   	HashMap<String,String> getAMemberinfo(HashMap<String, String> map);
   	String isBlack(HashMap<String, String> map);
   	int setBlackClass(HashMap<String, String> map);
   	int setWhiteClass(HashMap<String, String> map);
   	//오더관리
   	ArrayList<OrderVO> getAllOrderList();
   	ArrayList<OrderVO> getOrderListOrdernumber(HashMap<String, Object> map);
   	ArrayList<OrderVO> getOrderListCanceled(HashMap<String, Object> map);
   	ArrayList<OrderVO> getOrderList(HashMap<String, Object> map);
   
   	int orderChangeStatusStartShipping(String chekd);
   	int adminOrderSetStartShipping(HashMap<String, String> map);
   	int adminOrderSetEndShipping(String order_number);
   	int adminOrderMoneyGetShipping(String order_number);
	HashMap<String, Object> getPayedPrice(String order_number);
	int afterOrderGivePoint(HashMap<String, Object> map);
	int afterOrderGivePointonglPoint(HashMap<String, Object> map);
	

   //상품관리
   	ArrayList<HashMap<String, Object>> adminAllProductListPurchase();
   	ArrayList<HashMap<String, Object>> adminAllProductListConsign();
   	ArrayList<HashMap<String, Object>> adminProductListPurc(HashMap<String, String> map);
   	ArrayList<HashMap<String, Object>> adminProductListCons(HashMap<String, String> map);
   	ArrayList<HashMap<String, Object>> adminProductListPurcEnNo(HashMap<String, String> map);
   	ArrayList<HashMap<String, Object>> adminProductListConsEnNo(HashMap<String, String> map);
   	String checkNowPostStatus(String entity_number);
   	int changeOffBoard(String entity_number);
   	int changeOnBoard(String entity_number);
   	void postStatChange(String entity_number);
   	String checkNowSaleStatus(String entity_number);
   	void chgSaleStatOnsale(String entity_number);
   	void chgSaleStatOndeal(String entity_number);
   	void chgSaleStatSoldout(String entity_number);

   	String getDivision(HashMap<String, String> map);
   	int deletePurchaseInfo(HashMap<String, String> map);
   	int deleteConsignmentInfo(HashMap<String, String> map);
   	void deleteProductList(HashMap<String, String> map);
   

   //환불
   	ArrayList<OrderVO> getReturnList();
   	ArrayList<OrderVO> getDetailReturndList(String orderstatus);
   	void setReturnConfirm(String order_number);
   	PointVO getGivenPointInfo(String order_number);
   	int returnPointFromMember(PointVO pointVO);
   	int insertReturnPointInfo(PointVO pointVO);
   	
   	
   	
   	
   	void setReturnFinished(String order_number);
   	int setPostStatusBackToSale(String order_number);
	String getEntityNumberForLiked(String order_number);
	String getEntitysPdname(String likedEntity);
	ArrayList<HashMap<String, String>> getorderNumberLikedMember(String likedEntity);
	int setAlarmInfo(HashMap<String, String> map);
	
	//알람
	ArrayList<NoticeVO> getAlarmContent(String member_id);
	ArrayList<NoticeVO> getMoreAlarmContent(HashMap<String, Object> map);
	int afterLoginCheckAlarm(String member_id);
	ArrayList<AuctionVO> admingetAuctionInfo();
	ArrayList<AuctionVO> adminGetAutionDetail(int aUCTION_POST_NUMBER);
	AuctionVO adminAuctionFindStat(int aUCTION_POST_NUMBER);
	int adminAuctionStatChangeOFF(int aUCTION_POST_NUMBER);
	int adminAuctionStatChangeON(int aUCTION_POST_NUMBER);
	
	
	
	
	
	
	
	

	
	

   
   
   

   

   
   
   
}
     