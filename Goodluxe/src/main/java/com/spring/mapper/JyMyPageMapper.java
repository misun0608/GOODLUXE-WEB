package com.spring.mapper;

import java.util.HashMap;

import com.spring.goodluxe.voes.MemberVO;

public interface JyMyPageMapper {

	MemberVO getMemberInfo(HashMap<String,String>map);
	
}
