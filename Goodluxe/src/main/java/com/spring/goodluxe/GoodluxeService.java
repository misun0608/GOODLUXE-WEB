package com.spring.goodluxe;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.ApplyVO;
import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.PointVO;
import com.spring.goodluxe.voes.ProductBoardVO;
import com.spring.goodluxe.voes.ProductVO;

public interface GoodluxeService {
	public String userChk(MemberVO membervo) throws Exception;
	public int isMemberLiked(String member_id, String entity_number)throws Exception ;
	public int setLike(String member_id, String entity_number)throws Exception;

	
	public ArrayList<HashMap<String, Object>> getOasData(String id);
	public ArrayList<HashMap<String, Object>> getCancelData(String id);
	public void orderCancel(String order_number);
	public void orderRefund(String order_number);
	
	public HashMap<String, Object> getOrderData(String id);
	
	public ArrayList<HashMap<String, Object>> getMainPageItem() throws Exception;
	public ArrayList<HashMap<String, Object>> getMainPageItem_view() throws Exception;
	public int getSellingBoardCount(int startRow, int endRow ,String il_search_brand 
			,String il_search_category ,String il_search_grade ,String il_search_price) throws Exception;
	public ArrayList<HashMap<String, Object>> getSellingBoardProduct(int startRow, int endRow ,String il_search_brand 
			,String il_search_category ,String il_search_grade ,String il_search_price) throws Exception;
	public int getSearchBoardCount(String search_content,String orderbywhat)throws Exception;
	public ArrayList<HashMap<String, Object>> getSearchBoardProduct(int startRow, int endRow, String search_content ,String orderbywhat)throws Exception;

	public String findEnNum(int pb_number) throws Exception;
	public HashMap<String, Object> getTheProduct(String entity_number) throws Exception;
	public ArrayList<HashMap<String, Object>> getRecommand(String entity_number)throws Exception;
	
	// Order Service
	public MemberVO selectMember(String member_id) throws Exception;
	public ProductVO selectProduct(String entity_number) throws Exception;
	public ProductBoardVO selectPB(String entity_number) throws Exception;
	public ArrayList<CouponVO> selectCoupon(String member_id) throws Exception;
	public int insertOrder(OrderVO orderVO) throws Exception;
	public OrderVO selectOrder(OrderVO vo) throws Exception;
	public int insertKakaoOrder(OrderVO orderVO) throws Exception;
	public void updateMemberpoint(MemberVO memberVO) throws Exception;
	public void updateCouponstatus(CouponVO couponVO) throws Exception;
	public void insertPointHistory(PointVO pointVO) throws Exception;
	public ArrayList<PointVO> getPointList(String member_id, int startRow, int endRow) throws Exception;
	public int getListCount(String member_id) throws Exception;
	public ArrayList<CouponVO> getCouponList(String member_id, int startRow, int endRow) throws Exception;
	public int getCouponListCount(String member_id) throws Exception;
	public void updateCouponExstatus(CouponVO couponVO) throws Exception;
	public ArrayList<HashMap<String,Object>> getOrderList(String member_id) throws Exception;
	public void insertApplyGoods(ApplyVO applyVO) throws Exception;
	public ArrayList<ApplyVO> getApplyList(String member_id) throws Exception;
	public ArrayList<HashMap<String,Object>> getSellingList(String member_id) throws Exception;
	public ArrayList<HashMap<String,Object>> getTradingList(String member_id) throws Exception;
	public ArrayList<HashMap<String,Object>> getFinishList(String member_id) throws Exception;
	public ArrayList<HashMap<String,Object>> getPurchasingList(String member_id) throws Exception;
}
