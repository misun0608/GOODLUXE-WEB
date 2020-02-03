package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.MemberVO;

public interface JyMyPageMapper {

	MemberVO getMemberInfo(HashMap<String,String>map);
	
	ArrayList<HashMap<String, String>> SearchlikedList(HashMap<String, String> map);

	HashMap<String,Object> getLikedProduct(String string);

	int myInfoAction(MemberVO memberVO);
}
