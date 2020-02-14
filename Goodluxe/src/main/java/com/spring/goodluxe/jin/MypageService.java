package com.spring.goodluxe.jin;

import java.util.ArrayList;
import java.util.HashMap;

public interface MypageService {
	public ArrayList<HashMap<String, Object>> getOasData(String id);
	public ArrayList<HashMap<String, Object>> getCancelData(String id);
	public void orderCancel(String order_number);
	public void orderRefund(String order_number);
	public HashMap<String, Object> getOrderData(String id);
}
