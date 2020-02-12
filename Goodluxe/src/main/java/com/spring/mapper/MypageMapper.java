package com.spring.mapper;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface MypageMapper {
	public ArrayList<HashMap<String, Object>> getOasData(String id);
	public ArrayList<HashMap<String, Object>> getCancelData(String id);
	public int orderCancel(@Param("order_number") String order_number, @Param("order_cancel_date") Timestamp order_cancel_date, @Param("status") String status);
	public void updatePBStatus(@Param("order_number") String order_number, @Param("status") String status);
	public HashMap<String, Object> getOrderData(String order_number);
	public Integer test(String id);
}
