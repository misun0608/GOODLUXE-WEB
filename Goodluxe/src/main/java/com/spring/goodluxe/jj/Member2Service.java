package com.spring.goodluxe.jj;

import com.spring.goodluxe.jj.MemberVO;

public interface MemberService {
	MemberVO selectMember1(String member_id)throws Exception;
	int insertMember(MemberVO membervo)throws Exception;
	int userCheckMember(String member_id)throws Exception;
	String pickNameMember(String member_id)throws Exception;
	String pickisadminMember(String member_id)throws Exception;
}
