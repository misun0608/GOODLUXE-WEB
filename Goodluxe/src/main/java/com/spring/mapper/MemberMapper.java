package com.spring.mapper;

import java.util.ArrayList;

import com.spring.goodluxe.voes.MemberVO;

public interface MemberMapper {
	MemberVO userChk(MemberVO membervo);
	MemberVO selectMember(String member_id);
	String member_status_chk(MemberVO memberVO);
	String admin_status_chk(MemberVO memberVO);
	MemberVO userSnsChk(MemberVO memberVO);
	String emailLink_chk(MemberVO memberVO);
	String idChk(MemberVO memberVO);
	int insertMember(MemberVO memberVO);
	int insertSnsMember(MemberVO memberVO);
	int verifyEmail(MemberVO memberVO);
	ArrayList<MemberVO> getMemberList();
	
	// 주문시 적립금 차감
	int updateMemberpoint(MemberVO mvo);
}
