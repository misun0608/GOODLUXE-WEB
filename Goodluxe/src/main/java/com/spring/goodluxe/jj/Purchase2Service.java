package com.spring.goodluxe.jj;

import java.util.ArrayList;

public interface Purchase2Service {
	Purchase2VO selectPurchase(String entity_number)throws Exception;
	int entitycheck(String entity_number)throws Exception;
	ArrayList<Purchase2VO> selectEntitySearchWord (String entity_number)throws Exception;
	ArrayList<Purchase2VO> selectKeywordSearch(String entity_number)throws Exception;
}
