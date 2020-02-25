package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.ApplyVO;
import com.spring.goodluxe.voes.ConsignProductVO;

public interface ApplyMapper {
	void insertApplyGoods(ApplyVO applyVO);
	ArrayList<ApplyVO> getApplyList(HashMap<String,String> map);
	// 위탁상품 판매중
	ArrayList<HashMap<String,Object>> getSellingList(String member_id);
	// 위탁상품 거래진행중
	HashMap<String,Object> getTradingList(String entity_number);
	// 위탁상품 거래진행중
	HashMap<String,Object> getFinishList(String entity_number);
	// 매입상품
	ArrayList<HashMap<String,Object>> getPurchasingList(String member_id);
	// 추가
	ArrayList<ConsignProductVO> getEntityNum(String member_id);
}
