package com.spring.goodluxe.jy;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.ConsignProductVO;
import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.ProductBoardVO;
import com.spring.goodluxe.voes.PurchaseProductVO;

import com.spring.goodluxe.voes.ConsignProductVO;
import com.spring.goodluxe.voes.ProductBoardVO;
import com.spring.goodluxe.voes.PurchaseProductVO;

public interface ProductlistService {


	int registerProduct(PurchaseProductVO purcVO) throws Exception; // ���� ��ǰ ���
	int registerProduct(ConsignProductVO consVO) throws Exception;  //��Ź ��ǰ ���
	int uploadProductBoard(ProductBoardVO sellboVO) throws Exception; // �Խù� ���
	
	
	int getSellingBoardCount(int startRow, int endRow ,String il_search_brand 
			,String il_search_category ,String il_search_grade ,String il_search_price) throws Exception; // �Խù� ���� Ȯ��
	ArrayList<HashMap<String, Object>> getSellingBoardProduct(int startRow, int endRow ,String il_search_brand 
			,String il_search_category ,String il_search_grade ,String il_search_price) throws Exception;//�Խ����� ������ ����Ʈ(����, �̸�)
	
	
	
	ArrayList<HashMap<String, Object>> getMainPageItem() throws Exception;
	ArrayList<HashMap<String, Object>> getMainPageItem_view() throws Exception;
	
	
	int getSearchBoardCount(String search_content,String orderbywhat)throws Exception;
	ArrayList<HashMap<String, Object>> getSearchBoardProduct(int startRow, int endRow, String search_content ,String orderbywhat)throws Exception;

	HashMap<String, Object> getTheProduct(String entity_number) throws Exception;
	ArrayList<HashMap<String, Object>> getRecommand(String entity_number)throws Exception;
	
	
	//관리자 
	MemberVO adminSearchID(String string, String member_id) throws Exception;
	int issueAllmemberCoupon(CouponVO couponVO) throws Exception;
	int issueOnememberCoupon(CouponVO couponVO) throws Exception;
	
}
