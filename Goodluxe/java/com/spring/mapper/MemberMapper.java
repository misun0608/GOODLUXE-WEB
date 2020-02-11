package com.spring.mapper;

import java.util.HashMap;

import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.PointVO;

public interface MemberMapper {
	MemberVO userChk(MemberVO membervo);
<<<<<<< HEAD
	MemberVO selectMemberPoint(PointVO pvo);
	int updateMemberPoint(HashMap<String,Object> map);
=======
	MemberVO selectMember(String member_id);
	
	// 주문시 적립금 차감
	int updateMemberpoint(MemberVO mvo);
>>>>>>> origin/master
}
