package com.spring.goodluxe;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.MemberVO;

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

	public HashMap<String, Object> getTheProduct(String entity_number) throws Exception;
	public ArrayList<HashMap<String, Object>> getRecommand(String entity_number)throws Exception;
}
