package com.spring.goodluxe.jy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface ProductlistService {


	int registerProduct(PurchaseProductVO purcVO) throws Exception; // 매입 상품 등록
	int registerProduct(ConsignProductVO consVO) throws Exception;  //위탁 상품 등록
	int uploadProductBoard(ProductBoardVO sellboVO) throws Exception; // 게시물 등록
	
	//아이템리스트
	int getSellingBoardCount(int startRow, int endRow ,String il_search_brand 
			,String il_search_category ,String il_search_grade ,String il_search_price) throws Exception; // 게시물 갯수 확인
	ArrayList<HashMap<String, Object>> getSellingBoardProduct(int startRow, int endRow ,String il_search_brand 
			,String il_search_category ,String il_search_grade ,String il_search_price) throws Exception;//게시중인 아이템 리스트(사진, 이름)
	
	
	//메인페이지 아이템
	ArrayList<HashMap<String, Object>> getMainPageItem() throws Exception;
	ArrayList<HashMap<String, Object>> getMainPageItem_view() throws Exception;
	
	//검색결과
	int getSearchBoardCount(String search_content,String orderbywhat)throws Exception;
	ArrayList<HashMap<String, Object>> getSearchBoardProduct(int startRow, int endRow, String search_content ,String orderbywhat)throws Exception;

	HashMap<String, Object> getTheProduct(String entity_number) throws Exception;

}
