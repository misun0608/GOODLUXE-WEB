package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.MemberVO;

public interface JyMyPageMapper {

	MemberVO getMemberInfo(HashMap<String,String>map);
	int myInfoAction(MemberVO memberVO);

	ArrayList<HashMap<String, Object>> getLikedProduct(HashMap<String, Object> map);
	int getLikedProductCount(HashMap<String, Object> map);
	int deleteLikedGoods(HashMap<String, String> map);


	
}
