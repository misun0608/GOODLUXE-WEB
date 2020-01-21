package com.spring.goodluxe.jy;

public interface ProductlistService {


	int registerProduct(PurchaseProductVO purcVO);
	int registerProduct(ConsignProductVO consVO);
	int uploadProductBoard(SellingBoardVO sellboVO);
}
