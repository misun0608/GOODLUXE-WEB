package com.spring.mapper;

import com.spring.goodluxe.voes.MemberVO;

public interface MemberMapper {
	MemberVO userChk(MemberVO membervo);
	MemberVO selectMember(String member_id);
	
	// 주문시 적립금 차감
	int updateMemberpoint(MemberVO mvo);
}
