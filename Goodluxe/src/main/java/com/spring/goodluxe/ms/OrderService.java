package com.spring.goodluxe.ms;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.*;

public interface OrderService {

	// order_form에서 memberVO 정보 받아올 때
	public MemberVO selectMember(String member_id) throws Exception;
	public ProductVO selectProduct(String entity_number) throws Exception;
	public ProductBoardVO selectPB(String entity_number) throws Exception;
	public ArrayList<CouponVO> selectCoupon(String member_id) throws Exception;
	public int insertOrder(OrderVO orderVO) throws Exception;
	public OrderVO selectOrder(OrderVO vo) throws Exception;
	// kakao 결제 정보 입력
	public int insertKakaoOrder(OrderVO orderVO) throws Exception;
	// 포인트 사용시 포인트 차감
	public void updateMemberpoint(MemberVO memberVO) throws Exception;
	// 쿠폰 사용시 쿠폰상태 변경
	public void updateCouponstatus(CouponVO couponVO) throws Exception;
	// 포인트 사용시 히스토리 추가
	public void insertPointHistory(PointVO pointVO) throws Exception;
	// 포인트 리스트
	public ArrayList<PointVO> getPointList(String member_id, int startRow, int endRow) throws Exception;
	// 포인트 리스트 개수
	public int getListCount(String member_id) throws Exception;
	// 쿠폰 리스트
	public ArrayList<CouponVO> getCouponList(String member_id, int startRow, int endRow) throws Exception;
	// 쿠폰 리스트 개수
	public int getCouponListCount(String member_id) throws Exception;
	// 기간만료시 쿠폰상태 변경
	public void updateCouponExstatus(CouponVO couponVO) throws Exception;
	// 허수구매율때 필요한 구매내역 불러오기
	public ArrayList<HashMap<String,Object>> getOrderList(String member_id) throws Exception;
	// 매입/위탁 신청 페이지 데이터 입력
	public void insertApplyGoods(ApplyVO applyVO) throws Exception;
	// 판매조회 등록전 위탁상품 리스트
	public ArrayList<ApplyVO> getApplyList(String member_id) throws Exception;
	// 판매조회 판매중 리스트
	public ArrayList<HashMap<String,Object>> getSellingList(String member_id) throws Exception;
	// 판매조회 거래진행중 리스트
	public ArrayList<HashMap<String,Object>> getTradingList(String member_id) throws Exception;
	// 판매조회 판매완료 리스트
	public ArrayList<HashMap<String,Object>> getFinishList(String member_id) throws Exception;
	// 판매조회 매입상품 리스트
	public ArrayList<HashMap<String,Object>> getPurchasingList(String member_id) throws Exception;
}
