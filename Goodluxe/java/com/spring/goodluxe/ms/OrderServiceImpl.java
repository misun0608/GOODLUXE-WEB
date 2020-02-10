package com.spring.goodluxe.ms;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.ApplyVO;
import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.PointVO;
import com.spring.goodluxe.voes.ProductBoardVO;
import com.spring.goodluxe.voes.ProductVO;
import com.spring.mapper.ApplyMapper;
import com.spring.mapper.CouponMapper;
import com.spring.mapper.MemberMapper;
import com.spring.mapper.MypageMapper;
import com.spring.mapper.OrderMapper;
import com.spring.mapper.PointMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private SqlSession sqlSession;
	
	// Get Member Information
	@Override
	public MemberVO selectMember(String member_id) throws Exception{
		MemberVO mvo = null;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			mvo = memberMapper.selectMember(member_id);
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/selectMember) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/selectMember)", e);
		}
		return mvo;
	}
	
	// Get Product Information
	@Override
	public ProductVO selectProduct(String entity_number) throws Exception{
		ProductVO pvo = null;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			pvo = orderMapper.selectProduct(entity_number);
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/selectProduct) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/selectProduct)", e);
		}
		return pvo;
	}
	
	// Get ProductBoard Information
	@Override
	public ProductBoardVO selectPB(String entity_number) throws Exception{
		ProductBoardVO pbvo = null;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			pbvo = orderMapper.selectPB(entity_number);
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/selectPB) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/selectPB)", e);
		}
		return pbvo;
	}
	
	// Coupon List
	@Override
	public ArrayList<CouponVO> selectCoupon(String member_id) throws Exception{
		ArrayList<CouponVO> coupon_list = null;
		try {
			CouponMapper couponMapper = sqlSession.getMapper(CouponMapper.class);
			coupon_list = couponMapper.selectCoupon(member_id);
			
			if(coupon_list != null) return coupon_list;
			
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/selectCoupon) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/selectCoupon)", e);
		}
		return null;
	}
	
	// Insert Order Information
	@Override
	public int insertOrder(OrderVO orderVO) throws Exception {
		int res = 0;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			res = orderMapper.insertOrder(orderVO);
			
			if(res == 1) {
				MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
				mypageMapper.updatePBStatus(orderVO.getOrder_number(), "거래진행중");
			}
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/insertOrder) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/insertOrder)", e);
		}
		return res;
	}	
	
	// Insert Order Information(KAKAO)
	@Override
	public int insertKakaoOrder(OrderVO orderVO) throws Exception{
		int res = 0;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			res = orderMapper.insertKakaoOrder(orderVO);
			
			if(res == 1) {
				MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
				mypageMapper.updatePBStatus(orderVO.getOrder_number(), "거래진행중");
			}
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/insertKakaoOrder) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/insertKakaoOrder)", e);
		}
		return res;
	}
	
	// Order_done 페이지에 띄울 정보
	@Override
	public OrderVO selectOrder(OrderVO vo) throws Exception{
		OrderVO ovo = null;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			ovo = orderMapper.selectOrder(vo);
		}catch(Exception e) {
			throw new Exception("주문정보 검색 실패.", e);
		}
		return ovo;
	}

	// Apply Used Point
	@Override
	public void updateMemberpoint(MemberVO memberVO) throws Exception{
		int cnt = 0;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			cnt = memberMapper.updateMemberpoint(memberVO);
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/updateMemberpoint) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/updateMemberpoint)", e);
		}
		if(cnt == 0) {
			System.out.println("WARNING> 포인트 사용 내역 반영 실패(현재 포인트 : " + memberVO.getMember_point() + ")");
		}
	}
	
	// 쿠폰 사용 주문시 쿠폰 상태 사용으로 변경
	@Override
	public void updateCouponstatus(CouponVO couponVO) throws Exception{
		try {
			CouponMapper couponMapper = sqlSession.getMapper(CouponMapper.class);
			couponMapper.updateCouponstatus(couponVO);
		}catch(Exception e) {
			throw new Exception("쿠폰상태변경 실패. ", e);
		}
	}
	
	// 포인트 사용시 히스토리 추가
	@Override
	public void insertPointHistory(PointVO pointVO) throws Exception{
		try {
			PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
			pointMapper.insertPointHistory(pointVO);
		}catch(Exception e) {
			throw new Exception("포인트 히스토리 추가 실패.", e);
		}
	}
	
	// 포인트 리스트 가져오기
	@Override
	public ArrayList<PointVO> getPointList(String member_id, int startRow, int endRow) throws Exception{
		ArrayList<PointVO> point_list = null;
		try {
			HashMap<String, Object> pvo = new HashMap<String, Object>();
			pvo.put("member_id", member_id);
			pvo.put("startRow", startRow);
			pvo.put("endRow", endRow);
			
			PointMapper pointMapper =sqlSession.getMapper(PointMapper.class);
			point_list = pointMapper.getPointList(pvo);
			
			if(point_list != null) {
				return point_list;
			}else {
				return null;
			}
		}catch(Exception e) {
			throw new Exception("포인트 리스트 불러오기 실패.", e);
		}
	}
	
	// 포인트 리스트 개수
	@Override
	public int getListCount(String member_id) throws Exception{
		int count = 0;
		PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
		try {
			count = pointMapper.getListCount(member_id);
		}
		catch (Exception e) { 
			System.out.println("포인트 리스트 카운트 실패." + e.getMessage());
		}
		return count;
	}
	
	// 쿠폰 리스트 가져오기
	@Override
	public ArrayList<CouponVO> getCouponList(String member_id, int startRow, int endRow) throws Exception{
		ArrayList<CouponVO> coupon_list = null;
		try {
			HashMap<String, Object> cvo = new HashMap<String, Object>();
			cvo.put("member_id", member_id);
			cvo.put("startRow", startRow);
			cvo.put("endRow", endRow);
			
			CouponMapper couponMapper =sqlSession.getMapper(CouponMapper.class);
			coupon_list = couponMapper.getCouponList(cvo);
			
			if(coupon_list != null) {
				return coupon_list;
			}else {
				return null;
			}
		}catch(Exception e) {
			throw new Exception("쿠폰 리스트 불러오기 실패.", e);
		}
	}
	
	// 쿠폰리스트 개수
	@Override
	public int getCouponListCount(String member_id) throws Exception{
		int count = 0;
		CouponMapper couponMapper = sqlSession.getMapper(CouponMapper.class);
		try {
			count = couponMapper.getCouponListCount(member_id);
		}
		catch (Exception e) { 
			System.out.println("쿠폰 리스트 카운트 실패." + e.getMessage());
		}
		return count;
	}
	
	// 기간만료시 쿠폰상태 변경
	@Override
	public void updateCouponExstatus(CouponVO couponVO) throws Exception{
		try {
			CouponMapper couponMapper = sqlSession.getMapper(CouponMapper.class);
			couponMapper.updateCouponExstatus(couponVO);
		}catch(Exception e) {
			throw new Exception("쿠폰 기간만료 상태변경 실패. ", e);
		}
	}
	
	// 구매제한 페이지에 띄울 order리스트 불러오기
	@Override
	public ArrayList<HashMap<String, Object>> getOrderList(String member_id) throws Exception{
		ArrayList<HashMap<String,Object>> order_list = null;
		try {
			// 주문상태 파라미터로 가져가야
			
			OrderMapper orderMapper =sqlSession.getMapper(OrderMapper.class);
			order_list = orderMapper.getOrderList(member_id);
			
			if(order_list != null) {
				return order_list;
			}else {
				return null;
			}
		}catch(Exception e) {
			throw new Exception("주문 리스트 불러오기 실패.", e);
		}
	}
	
	// 매입 위탁 데이터 입력
	@Override
	public void insertApplyGoods(ApplyVO applyVO) throws Exception{
		try {
			ApplyMapper applyMapper = sqlSession.getMapper(ApplyMapper.class);
			applyMapper.insertApplyGoods(applyVO);
				
		}catch(Exception e) {
			throw new Exception("매입 위탁판매 등록 실패. ", e);
		}
	}
	
	// 위탁상품 등록전 상품 리스트 가져오기
	@Override
	public ArrayList<ApplyVO> getApplyList(String member_id) throws Exception{
		ArrayList<ApplyVO> apply_list = null;
		try {
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("member_id", member_id);
			map.put("ap_smethod", "위탁판매");
			
			
			ApplyMapper applyMapper =sqlSession.getMapper(ApplyMapper.class);
			apply_list = applyMapper.getApplyList(map);
			
			if(apply_list != null) {
				return apply_list;
			}else {
				return null;
			}
		}catch(Exception e) {
			throw new Exception("등록전 위탁상품 리스트 불러오기 실패.", e);
		}
	}
	// 판매조회 판매중 리스트
		public ArrayList<HashMap<String,Object>> getSellingList(String member_id) throws Exception{
			ArrayList<HashMap<String,Object>> sellingList = null;
			try {
				
				ApplyMapper applyMapper =sqlSession.getMapper(ApplyMapper.class);
				sellingList = applyMapper.getSellingList(member_id);
				
				if(sellingList != null) {
					return sellingList;
				}else {
					return null;
				}
				
			}catch(Exception e) {
				throw new Exception("판매중 위탁상품 리스트 불러오기 실패.", e);
			}
		}
	// 판매조회 거래진행중 리스트
		public ArrayList<HashMap<String,Object>> getTradingList(String member_id) throws Exception{
			ArrayList<HashMap<String,Object>> tradingList = null;
			try {
				
				ApplyMapper applyMapper =sqlSession.getMapper(ApplyMapper.class);
				tradingList = applyMapper.getTradingList(member_id);
				
				if(tradingList != null) {
					return tradingList;
				}else {
					return null;
				}
				
			}catch(Exception e) {
				throw new Exception("거래진행중 위탁상품 리스트 불러오기 실패.", e);
			}
		}
	// 판매조회 판매완료 리스트
		public ArrayList<HashMap<String,Object>> getFinishList(String member_id) throws Exception{
			ArrayList<HashMap<String,Object>> finishList = null;
			try {
				ApplyMapper applyMapper =sqlSession.getMapper(ApplyMapper.class);
				finishList = applyMapper.getFinishList(member_id);
				
				if(finishList != null) {
					return finishList;
				}else {
					return null;
				}
				
			}catch(Exception e) {
				throw new Exception("판매완료 위탁상품 리스트 불러오기 실패.", e);
			}
		}
	
	// 판매조회 매입상품 리스트
		public ArrayList<HashMap<String,Object>> getPurchasingList(String member_id) throws Exception{
			ArrayList<HashMap<String,Object>> purchasingList = null;
			try {
				ApplyMapper applyMapper =sqlSession.getMapper(ApplyMapper.class);
				purchasingList = applyMapper.getPurchasingList(member_id);
				
				if(purchasingList != null) {
					return purchasingList;
				}else {
					return null;
				}
			}catch(Exception e) {
				throw new Exception("매입상품 리스트 불러오기 실패.", e);
			}
		}
}
