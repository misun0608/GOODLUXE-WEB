package com.spring.goodluxe.jiyemypage;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.MemberVO;

public interface JyMyPageService {
	MemberVO getMemberInfo(String member_id) throws Exception;
	ArrayList<HashMap<String, Object>> myLikedGoods(String member_id)throws Exception;
}
