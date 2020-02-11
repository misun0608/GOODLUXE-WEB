package com.spring.mapper;

import java.util.HashMap;

import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.PointVO;

public interface MemberMapper {
	MemberVO userChk(MemberVO membervo);
	MemberVO selectMemberPoint(PointVO pvo);
	int updateMemberPoint(HashMap<String,Object> map);
}
