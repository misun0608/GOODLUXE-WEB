package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.ConsignProductVO;
import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.ProductBoardVO;
import com.spring.goodluxe.voes.PurchaseProductVO;

public interface ProductlistMapper {

	int insertPurcProduct(PurchaseProductVO purcVO);
	int insertConsProduct(ConsignProductVO consVO);
	int insertSellingBoard(ProductBoardVO sellboVO);
	void setPurcSaleStatus(ProductBoardVO sellboVO);
	void setConsSaleStatus(ProductBoardVO sellboVO);
	
	int getSellingBoardCount(HashMap<String,Object> map);
	ArrayList<HashMap<String, Object>> SellingBoardProduct(HashMap<String,Object> map);
	//(+���⼭ ���!!)ArrayList�� Ŀ��.

	ArrayList<HashMap<String, Object>> getMainPageItem(HashMap<String,Object> map);
	ArrayList<HashMap<String, Object>> getMainPageItemView(HashMap<String,Object> map);
	
	int getSearchBoardCount(HashMap<String,String> map);
	ArrayList<HashMap<String, Object>> getSearchBoardList(HashMap<String, Object> map);
	
	String findEnNum(int pb_number);
	HashMap<String,Object>getTheProduct(HashMap<String,String>map);
	int viewCountPlus(HashMap<String, String>map);
	HashMap<String, String> getRecommandtheme(HashMap<String,String> map);
	ArrayList<HashMap<String, Object>> getRecommandList(HashMap<String,String> map);
	
	
	//관리자
	int countOneMember(HashMap<String, String> map);
	MemberVO adminSearchId(HashMap<String, String> map);
	
	ArrayList<HashMap<String, String>> selectAllMember();
	int issueAllmemberCoupon(CouponVO couponVO);
	int issueOnememberCoupon(CouponVO couponVO);
	
	HashMap<String, String> getShippingInfo(String order_number);
	void preChgReadStatus(String alarm_number)throws Exception;
	
	
	
	
	
	
}
