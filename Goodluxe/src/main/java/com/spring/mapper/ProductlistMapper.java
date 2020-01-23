package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.jy.ConsignProductVO;
import com.spring.goodluxe.jy.PurchaseProductVO;
import com.spring.goodluxe.jy.SellingBoardVO;

public interface ProductlistMapper {

	int insertPurcProduct(PurchaseProductVO purcVO);
	int insertConsProduct(ConsignProductVO consVO);
	int insertSellingBoard(SellingBoardVO sellboVO);
	
	int getSellingBoardCount();
	ArrayList<HashMap<String, Object>> SellingBoardProduct(HashMap<String,Integer> map);
	//(+¿©±â¼­ Àá±ñ!!)ArrayList´Â Ä¿Áü.

	
	
}
