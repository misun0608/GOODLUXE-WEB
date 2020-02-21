package com.spring.goodluxe.mj;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.spring.goodluxe.voes.MemberVO;
      
public interface MemberService{
	int insertMember(MemberVO memberVO) throws Exception;
	MemberVO getUserInfo(MemberVO memberVO) throws Exception; // 로그인 시 유저 체크
	int emailAddr_chk(MemberVO memberVO) throws Exception; // 
	String userClassChk(MemberVO memberVO) throws Exception; //
	int idCheck(MemberVO memberVO) throws Exception; // 가입 시 아이디 중복체크
//	int emailCheck(MemberVO memberVO) throws Exception; // 가입 시 이메일 중복체크 < 꼭 필요한가 - sns 가입시 이메일로 회원 체크할 것 같으니., 필요함
	int verifyEmail(MemberVO memberVO); // 메일 인증 관련
	int insertSnsMember(MemberVO memberVO); // SNS 간편 가입(DB)
	ArrayList<MemberVO> getMemberlist() throws Exception;
//	String userSnsChk(MemberVO memberVO) throws Exception; // SNS  
	String findMemberId(MemberVO memberVO) throws Exception; // 아이디 찾기 - 이름, 이메일 주소 비교
	int findMemberPw(MemberVO memberVO) throws Exception; // 비밀번호 찾기 - 아이디, 이메일 주소 비교
	int updateMemberPw(MemberVO memberVO) throws Exception; // 비밀번호 변경
}