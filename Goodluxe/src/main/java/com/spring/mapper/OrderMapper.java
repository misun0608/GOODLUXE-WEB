package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.ProductBoardVO;
import com.spring.goodluxe.voes.ProductVO;

public interface OrderMapper {
	ProductVO selectProduct(String entity_number);
	ProductBoardVO selectPB(String entity_number);
	int insertOrder(OrderVO orderVO);
	OrderVO selectOrder(OrderVO vo);
	int insertKakaoOrder(OrderVO orderVO);
	ArrayList<HashMap<String,Object>> getOrderList(String member_id);
}
