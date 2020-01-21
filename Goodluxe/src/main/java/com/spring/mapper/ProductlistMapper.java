package com.spring.mapper;

import com.spring.goodluxe.jy.ConsignProductVO;
import com.spring.goodluxe.jy.PurchaseProductVO;
import com.spring.goodluxe.jy.SellingBoardVO;

public interface ProductlistMapper {

	int insertPurcProduct(PurchaseProductVO purcVO);
	int insertConsProduct(ConsignProductVO consVO);
	int insertSellingBoard(SellingBoardVO sellboVO);
}
