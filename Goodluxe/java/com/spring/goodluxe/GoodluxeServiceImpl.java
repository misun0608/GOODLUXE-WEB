package com.spring.goodluxe;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.MemberVO;
import com.spring.mapper.MemberMapper;
import com.spring.mapper.MypageMapper;

@Service
public class GoodluxeServiceImpl implements GoodluxeService {
	@Autowired
	private SqlSession sqlSession;
	
	// Login Information
	@Override
	public String userChk(MemberVO membervo) throws Exception {
		MemberVO member_db;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			member_db = memberMapper.userChk(membervo);
			
			if(member_db == null)
				return "non-member";
			
			if(!member_db.getMember_pw().equals(membervo.getMember_pw()))
				return "wrong_pw";
			
			// 이렇게 하면 안 됨.
			// membervo = member_db;
			
			membervo.setMember_id(member_db.getMember_id());
			membervo.setMember_class(member_db.getMember_class());
			membervo.setMember_isadmin(member_db.getMember_isadmin());
			
		} catch (Exception e) {
			System.out.println("ERROR(GoodluxeService/userChk) : " + e.getMessage());
			return "error_accur";
		}
		return "ok";
	}
	
	
	/* MyPage */
	// mypageOAS
	@Override
	public ArrayList<HashMap<String, Object>> getOasData(String id) {
		ArrayList<HashMap<String, Object>> oaslist = null;
		try {			
			MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
			oaslist = mypageMapper.getOasData(id);
		} catch(Exception e) {
			System.out.println("Service ERROR(getOasData) : " + e.getMessage());
		}
		return oaslist;
	}
	// mypageOAS
	@Override
	public ArrayList<HashMap<String, Object>> getCancelData(String id) {
		ArrayList<HashMap<String, Object>> cancellist = null;
		try {			
			MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
			cancellist = mypageMapper.getCancelData(id);
		} catch(Exception e) {
			System.out.println("Service ERROR(getCancelData) : " + e.getMessage());
		}
		return cancellist;
	}
	// mypageOAS:cancel
	@Override
	public void orderCancel(String order_number) {
		try {			
			MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
			Calendar today = Calendar.getInstance();
			Timestamp ct = new Timestamp(today.getTimeInMillis());
			int num = mypageMapper.orderCancel(order_number, ct, "취소완료");
			mypageMapper.updatePBStatus(order_number, "판매중");
			if(num <= 0) {
				System.out.println("Service ERROR(orderCancel) : 주문 취소 실패");
				mypageMapper.updatePBStatus(order_number, "거래중");
			}
			
		} catch(Exception e) {
			System.out.println("Service ERROR(orderCancel) : " + e.getMessage());
		}
	}
	// mypageOAS:refund
	@Override
	public void orderRefund(String order_number) {
		try {			
			MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
			Calendar today = Calendar.getInstance();
			Timestamp ct = new Timestamp(today.getTimeInMillis());
			int num = mypageMapper.orderCancel(order_number, ct, "환불신청");
			if(num <= 0) {
				System.out.println("Service ERROR(orderRefund) : 환불 신청 실패");
			}
			
		} catch(Exception e) {
			System.out.println("Service ERROR(orderCancel) : " + e.getMessage());
		}
	}
	// mypageOAS:order_detail
	@Override
	public HashMap<String, Object> getOrderData(String order_number) {
		HashMap<String, Object> orderdata = null;
		try {			
			MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
			orderdata = mypageMapper.getOrderData(order_number);
		} catch(Exception e) {
			System.out.println("Service ERROR(getOrderData) : " + e.getMessage());
		}
		return orderdata;
	}
}
