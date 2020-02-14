package com.spring.mapper;

import java.util.ArrayList;

import com.spring.goodluxe.jj.PurchaseVO;

public interface PurchaseMapper {
	PurchaseVO selectPurchase(String entity_number);
	int entitycheck(String entity_number);
	ArrayList<PurchaseVO> selectEntitySearchWord (String entity_number);
	ArrayList<PurchaseVO> selectKeywordSearch(String entity_number);
}
