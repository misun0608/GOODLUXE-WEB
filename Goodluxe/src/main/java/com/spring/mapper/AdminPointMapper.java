package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.PointVO;

public interface AdminPointMapper {
	ArrayList<PointVO> getAdminPointList();
	ArrayList<PointVO> getSearchPointList(PointVO pvo);
	int insertPointStatus(PointVO pvo);
	// 오늘 주문건수
	int getTodayOrderCount();
	// 오늘 주문매출액
	ArrayList<OrderVO> getTodayOrderSales();
	// 오늘 결제건수(배송준비중 배송중 배송완료)
	int getTodayPaidOrderCount();
	// 오늘 결제매출액
	ArrayList<OrderVO> getTodayPaidOrderSales();
	// 오늘 환불건수(환불신청/반품확인/환불완료 + 취소날짜 오늘)
	int getTodayRefundOrderCount();
	// 오늘 환불매출액
	ArrayList<OrderVO> getTodayRefundOrderSales();
	// 최근 한달 주문 현황 건수(결제전) 
	int getMonthlyPaidBeforeCount();
	// 최근 한달 주문 현황 건수(배송준비중)
	int getMonthlyPreparedCount();
	// 최근 한달 주문 현황 건수(배송중)
	int getMonthlyShippingCount();
	// 최근 한달 주문 현황 건수(배송완료)
	int getMonthlyDoneCount();
	// 최근 한달 취소 건수(취소완료 + 자동취소 + 환불신청)
	int getMonthlyCancelCount();
	// 최근 한달 반품 건수
	int getMonthlyItemBackCount();
	// 최근 한달 환불 건수
	int getMonthlyRefundCount();
	
	// 관리자 메인 데이터
	ArrayList<HashMap<String,Object>> getAdminDefaultData();
	// 7일간 환불 데이터 리스트
	ArrayList<HashMap<String, Object>> getRefundData();
	
	// 도넛 그래프 데이터들
	ArrayList<HashMap<String,Object>> getCateCnt();
	ArrayList<HashMap<String,Object>> getCateSales();
	ArrayList<HashMap<String,Object>> getBrandCnt();
	ArrayList<HashMap<String,Object>> getBrandSales();
}
