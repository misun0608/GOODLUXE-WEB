package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.jy.ConsignProductVO;
import com.spring.goodluxe.jy.PurchaseProductVO;
import com.spring.goodluxe.jy.ProductBoardVO;

public interface ProductlistMapper {

	int insertPurcProduct(PurchaseProductVO purcVO);
	int insertConsProduct(ConsignProductVO consVO);
	int insertSellingBoard(ProductBoardVO sellboVO);
	
	int getSellingBoardCount(HashMap<String,Object> map);
	ArrayList<HashMap<String, Object>> SellingBoardProduct(HashMap<String,Object> map);
	//(+���⼭ ���!!)ArrayList�� Ŀ��.

	ArrayList<HashMap<String, Object>> getMainPageItem(HashMap<String,Object> map);
	ArrayList<HashMap<String, Object>> getMainPageItemView(HashMap<String,Object> map);
	
	int getSearchBoardCount(HashMap<String,String> map);
	ArrayList<HashMap<String, Object>> getSearchBoardList(HashMap<String, Object> map);
	
	HashMap<String,Object>getTheProduct(HashMap<String,String>map);
	int viewCountPlus(HashMap<String, String>map);
	HashMap<String, String> getRecommandtheme(HashMap<String,String> map);
	ArrayList<HashMap<String, Object>> getRecommandList(HashMap<String,String> map);
	
}
