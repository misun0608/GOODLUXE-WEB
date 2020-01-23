package com.spring.goodluxe.jy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface ProductlistService {


	int registerProduct(PurchaseProductVO purcVO) throws Exception; // 매입 상품 등록
	int registerProduct(ConsignProductVO consVO) throws Exception;  //위탁 상품 등록
	int uploadProductBoard(SellingBoardVO sellboVO) throws Exception; // 게시물 등록
	int getSellingBoardCount() throws Exception; // 게시물 갯수 확인
	ArrayList<HashMap<String, Object>> getSellingBoardProduct(int startRow, int endRow) throws Exception;//게시중인 아이템 리스트(사진, 이름)
	
	
}
