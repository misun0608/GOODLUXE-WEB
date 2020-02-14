package com.spring.mapper;

import java.util.ArrayList;

import com.spring.goodluxe.voes.Purchase2VO;

public interface Purchase2Mapper {
	Purchase2VO selectPurchase(String entity_number);
	int entitycheck(String entity_number);
	ArrayList<Purchase2VO> selectEntitySearchWord (String entity_number);
	ArrayList<Purchase2VO> selectKeywordSearch(String entity_number);
}
