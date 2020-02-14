package com.spring.goodluxe.jj;

import java.util.ArrayList;

public interface PurchaseService {
	PurchaseVO selectPurchase(String entity_number)throws Exception;
	int entitycheck(String entity_number)throws Exception;
	ArrayList<PurchaseVO> selectEntitySearchWord (String entity_number)throws Exception;
	ArrayList<PurchaseVO> selectKeywordSearch(String entity_number)throws Exception;
}
