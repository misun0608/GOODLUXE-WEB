package com.spring.goodluxe;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.MemberVO;

public interface GoodluxeService {
	public String userChk(MemberVO membervo) throws Exception;
	
	public ArrayList<HashMap<String, Object>> getOasData(String id);
	public ArrayList<HashMap<String, Object>> getCancelData(String id);
	public void orderCancel(String order_number);
	public void orderRefund(String order_number);
	
	public HashMap<String, Object> getOrderData(String id);
}
