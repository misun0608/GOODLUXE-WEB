package com.spring.mapper;

import java.util.ArrayList;

import com.spring.goodluxe.voes.MemberVO;

public interface MemberMapper {
	MemberVO userChk(MemberVO membervo); // 로그인시 유저 체크
	MemberVO selectMember(String member_id); 
	String member_status_chk(MemberVO memberVO); // 멤버 등급 체크
	String admin_status_chk(MemberVO memberVO); // admin인지 아닌지 체크
	MemberVO userSnsChk(MemberVO memberVO); // Sns 회원 체크
	String emailLink_chk(MemberVO memberVO); // email 링크 체크(
	String idChk(MemberVO memberVO); // id 중복체크
	int insertMember(MemberVO memberVO); // 일반 회원가입
	int insertSnsMember(MemberVO memberVO); // Sns 간편 회원가입
	int verifyEmail(MemberVO memberVO);
	ArrayList<MemberVO> getMemberList();
	
	// 주문시 적립금 차감
	int updateMemberpoint(MemberVO mvo);
}
