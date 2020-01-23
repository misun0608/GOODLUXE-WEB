package com.spring.goodluxe.jy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface ProductlistService {


	int registerProduct(PurchaseProductVO purcVO) throws Exception; // ���� ��ǰ ���
	int registerProduct(ConsignProductVO consVO) throws Exception;  //��Ź ��ǰ ���
	int uploadProductBoard(SellingBoardVO sellboVO) throws Exception; // �Խù� ���
	int getSellingBoardCount() throws Exception; // �Խù� ���� Ȯ��
	ArrayList<HashMap<String, Object>> getSellingBoardProduct(int startRow, int endRow) throws Exception;//�Խ����� ������ ����Ʈ(����, �̸�)
	
	
}
