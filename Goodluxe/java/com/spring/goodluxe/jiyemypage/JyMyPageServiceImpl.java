package com.spring.goodluxe.jiyemypage;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.MemberVO;
import com.spring.mapper.JyMyPageMapper;

@Service("jyMyPageService")
public class JyMyPageServiceImpl implements JyMyPageService {
	@Autowired
	private SqlSession sqlSession;

	public MemberVO getMemberInfo(String member_id) throws Exception{
		
		JyMyPageMapper jymypageMapper = sqlSession.getMapper(JyMyPageMapper.class);

		MemberVO memberVO = new MemberVO();
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("member_id", member_id);
		
		memberVO = jymypageMapper.getMemberInfo(map);
		System.out.println("서비스"+memberVO);
		return memberVO;
	}
	
	
	public int myInfoAction(MemberVO memberVO)throws Exception{
		
		JyMyPageMapper jymypageMapper = sqlSession.getMapper(JyMyPageMapper.class);
		
		int res = jymypageMapper.myInfoAction(memberVO);
		
		return 0;
		
	}
	
	
	
	public ArrayList<HashMap<String, Object>> myLikedGoods(String member_id)throws Exception{
		JyMyPageMapper jymypageMapper = sqlSession.getMapper(JyMyPageMapper.class);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		ArrayList<HashMap<String,String>> likedList = new ArrayList<HashMap<String,String>>();
		ArrayList<HashMap<String,Object>> likedProductList = new ArrayList<HashMap<String,Object>>();
		
		map.put("member_id",member_id);
		
		likedList = jymypageMapper.SearchlikedList(map);
		
		for(int i = 0; i<likedList.size(); i++) {
			
			likedProductList.set(i,jymypageMapper.getLikedProduct(likedList.get(i).get("entity_number")));
			
		}

		
		return likedProductList;
		
		
	}
	
}
