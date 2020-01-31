package com.spring.mapper;

import com.spring.goodluxe.voes.MemberVO;

public interface MemberMapper {
	MemberVO userChk(MemberVO membervo);
	String member_status_chk(MemberVO membervo);
	String admin_status_chk(MemberVO membervo);
}
