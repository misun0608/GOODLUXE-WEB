package com.spring.goodluxe.mj;

import java.util.ArrayList;

import com.spring.goodluxe.voes.MemberVO;
      
public interface MemberService{
	int insertMember(MemberVO memberVO) throws Exception;
	String userChk(MemberVO memberVO) throws Exception;
	int emailChk(MemberVO memberVO) throws Exception;
	String userClassChk(MemberVO memberVO) throws Exception;
	int idCheck(MemberVO memberVO) throws Exception;
	int emailCheck(MemberVO memberVO) throws Exception;
	int verifyEmail(MemberVO memberVO);
	int insertSnsMember(MemberVO memberVO);
	ArrayList<MemberVO> getMemberlist() throws Exception;
	String userSnsChk(MemberVO memberVO) throws Exception;
}
	