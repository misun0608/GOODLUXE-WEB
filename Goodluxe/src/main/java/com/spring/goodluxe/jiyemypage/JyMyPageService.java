package com.spring.goodluxe.jiyemypage;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.MemberVO;

public interface JyMyPageService {
	MemberVO getMemberInfo(String member_id) throws Exception;
	void myInfoAction(MemberVO memberVO)throws Exception;
	ArrayList<HashMap<String, Object>> myLikedGoods(int startRow, int endRow,String member_id)throws Exception;
	int myLikedGoodsCount(int startRow, int endRow,String member_id)throws Exception;
	void deleteLikedGoods(String entity_number, String member_id)throws Exception;
	void deleteCheckedGoods(String[] checked, String member_id)throws Exception;
}
