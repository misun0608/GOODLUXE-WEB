package com.spring.goodluxe.jiyemypage;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
	
	
	public void myInfoAction(MemberVO memberVO)throws Exception{
		
		JyMyPageMapper jymypageMapper = sqlSession.getMapper(JyMyPageMapper.class);
		
		jymypageMapper.myInfoAction(memberVO);
		
		return;
		
	}
	
	
	
	public ArrayList<HashMap<String, Object>> myLikedGoods(int startRow, int endRow,String member_id)throws Exception{
		JyMyPageMapper jymypageMapper = sqlSession.getMapper(JyMyPageMapper.class);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//ArrayList<HashMap<String,String>> likedList = new ArrayList<HashMap<String,String>>();
		ArrayList<HashMap<String, Object>> likedProductList = new ArrayList<HashMap<String,Object>>();
		
		map.put("member_id",member_id);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
//		likedList = jymypageMapper.SearchlikedList(map);
//		
//		for(int i = 0; i<likedList.size(); i++) {
//			
//			likedProductList.set(i,jymypageMapper.getLikedProduct(likedList.get(i).get("entity_number")));
//			
//		}
		
		likedProductList = jymypageMapper.getLikedProduct(map);

		
		return likedProductList;
		
		
	}
	public int myLikedGoodsCount(int startRow, int endRow,String member_id)throws Exception{
		JyMyPageMapper jymypageMapper = sqlSession.getMapper(JyMyPageMapper.class);
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id",member_id);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		int count = jymypageMapper.getLikedProductCount(map);
		System.out.println("count"+ count);
		return count;
	}
	
	public void deleteLikedGoods(String entity_number, String member_id)throws Exception {
		JyMyPageMapper jymypageMapper = sqlSession.getMapper(JyMyPageMapper.class);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("entity_number", entity_number);
		map.put("member_id",member_id);
		
		int res = jymypageMapper.deleteLikedGoods(map);
		System.out.println("result = "+res);
		return ;
	}


	public void deleteCheckedGoods(String[] checked, String member_id) {
		JyMyPageMapper jymypageMapper = sqlSession.getMapper(JyMyPageMapper.class);
		System.out.println("서비스 : "+ member_id);
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("member_id", member_id);
		for(int i=0; i<checked.length;i++) {
			System.out.println(checked[i]);
			map.put("entity_number",checked[i]);
			jymypageMapper.deleteLikedGoods(map);
		}
		return ;
	}



	
}
