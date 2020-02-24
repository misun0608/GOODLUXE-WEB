package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.PointVO;

public interface MemberMapper {
	MemberVO userChk(MemberVO membervo);
	MemberVO selectMemberPoint(PointVO pvo);
	int updateMemberPoint(HashMap<String,Object> map);
	MemberVO selectMember(String member_id);
	String member_status_chk(MemberVO memberVO);
	String admin_status_chk(MemberVO memberVO);
//	MemberVO userSnsChk(MemberVO memberVO);
	int emailAddr_chk(MemberVO memberVO);
	String idChk(MemberVO memberVO);
	int insertMember(MemberVO memberVO);
	int insertSnsMember(MemberVO memberVO);
	int verifyEmail(MemberVO memberVO);
	ArrayList<MemberVO> getMemberList();
	String findMemberId(MemberVO memberVO);
	String findMemberPw(MemberVO memberVO);	    
	int updateMemberPw(MemberVO memberVO);
	
	// 주문시 적립금 차감
	int updateMemberpoint(MemberVO mvo);
}
