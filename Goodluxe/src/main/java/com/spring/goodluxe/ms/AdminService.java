package com.spring.goodluxe.ms;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.PointVO;

public interface AdminService {
	// 포인트 디폴트 리스트
	public ArrayList<PointVO> getAdminPointList() throws Exception;
	// 아이디 검색 포인트 리스트
	public ArrayList<PointVO> getSearchPointList(PointVO pvo) throws Exception;
	// 포인트 적립 입력
	public void insertPointStatus(PointVO pvo, HttpServletResponse response) throws Exception;
	// 포인트 회수 입력
	public void minusPointStatus(PointVO pvo, HttpServletResponse response) throws Exception;
	// 관리자페이지 현황부분 데이터
	public HashMap<String,Object> getTodayOrderCount() throws Exception;
	public ArrayList<HashMap<String,Object>> getAdminDefaultData() throws Exception;
	public ArrayList<HashMap<String,Object>> getRefundData() throws Exception;
	// 도넛그래프
	public ArrayList<HashMap<String,Object>> getCateCntData() throws Exception;
	public ArrayList<HashMap<String,Object>> getBrandCntData() throws Exception;
	public ArrayList<HashMap<String,Object>> getCateSalesData() throws Exception;
	public ArrayList<HashMap<String,Object>> getBrandSalesData() throws Exception;
	//관리자 아이디검사
	MemberVO adminSearchID(String string, String member_id) throws Exception;
	// 관리자 주문관리 주문디테일
	public HashMap<String,String> getShippingInfo(String order_number)throws Exception;
}
