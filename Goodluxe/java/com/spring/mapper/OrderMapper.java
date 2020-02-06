package com.spring.mapper;

import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.ProductBoardVO;
import com.spring.goodluxe.voes.ProductVO;

public interface OrderMapper {
	String loadImg(String entity_number);
	ProductVO selectProduct(String entity_number); // 정상 동작시 삭제
	
	// 주문 데이터 넣기
	int insertOrder(OrderVO orderVO);
	OrderVO selectOrder(OrderVO vo);
	int insertKakaoOrder(OrderVO orderVO);
}
