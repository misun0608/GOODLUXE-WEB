package com.spring.mapper;

import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.ProductVO;

public interface OrderMapper {
	ProductVO selectProduct(String entity_number);
	
	// 주문 데이터 넣기
	int insertOrder(OrderVO orderVO);
	OrderVO selectOrder(OrderVO vo);
	int insertKakaoOrder(OrderVO orderVO);
}
