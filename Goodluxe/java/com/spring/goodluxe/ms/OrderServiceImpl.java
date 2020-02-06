package com.spring.goodluxe.ms;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.PointVO;
import com.spring.goodluxe.voes.ProductVO;
import com.spring.mapper.CouponMapper;
import com.spring.mapper.MemberMapper;
import com.spring.mapper.OrderMapper;
import com.spring.mapper.PointMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private SqlSession sqlSession;
	
	// Member Information for delivery
	@Override
	public MemberVO selectMember(String member_id) throws Exception{
		MemberVO vo = null;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			vo = memberMapper.selectMember(member_id);
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/selectMember) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/selectMember)", e);
		}
		return vo;
	}
	
	// Order MD Information
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
	// Order MD Image
	@Override
	public String loadImg(String entity_number) throws Exception{
		String img_path = null;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			img_path = orderMapper.loadImg(entity_number);
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/selectProduct) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/selectProduct)", e);
		}
		return img_path;
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
	
	// 주문정보 입력
	@Override
	public int insertOrder(OrderVO orderVO) throws Exception {
		int res = 0;
		try {
			System.out.println("서비스 들어옴");
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			System.out.println("서비스 매퍼 전");
			res = orderMapper.insertOrder(orderVO);
			System.out.println("서비스 나옴");
			return res;
		}catch(Exception e) {
			throw new Exception("주문 등록 실패. ", e);
		}
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
	
	// 카카오 주문 결제 정보 insert
	@Override
	public int insertKakaoOrder(OrderVO orderVO) throws Exception{
		int res;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			res = orderMapper.insertKakaoOrder(orderVO);
		}catch(Exception e) {
			throw new Exception("주문 등록 실패. ", e);
		}
		return res;
	}
	
	// 포인트 사용 주문시 포인트 차감
	@Override
	public void updateMemberpoint(MemberVO memberVO) throws Exception{
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			memberMapper.updateMemberpoint(memberVO);
		}catch(Exception e) {
			throw new Exception("포인트 반영 실패. ", e);
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
			System.out.println("서비스 포인트 서비스 들어옴");
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
}
