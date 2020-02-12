package com.spring.mapper;

import com.spring.goodluxe.jj.MemberVO;

public interface MemberMapper {
	MemberVO selectMember1(String member_id);
	int insertMember(MemberVO membervo);
	int userCheckMember(String member_id);
	String pickNameMember(String member_id);
	String pickisadminMember(String member_id);
}
