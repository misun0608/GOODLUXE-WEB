package com.spring.goodluxe.jy;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.AjaxMapper;

@Service("ajaxService")
public class AjaxServiceImpl implements AjaxService{

	@Autowired 
	private SqlSession sqlSession;
	
	public int isMemberLiked(String member_id, String entity_number)throws Exception {
		
		int res = 0;
		try {
			
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			
			HashMap<String,String>map = new HashMap<String,String>();
			map.put("id", member_id);
			map.put("entity",entity_number);
			
			System.out.println("klj;l"+map.get("id")+member_id+map.get("entity")+ entity_number);
			
			res = ajaxMapper.isAlreadyLiked(map);
			//0
			System.out.println("data가 될 res값=" + res);
		
			
			
		}catch(Exception e) {
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택트레이스" + e.getStackTrace());
			throw new Exception("멤버라이크 익셉션");
		}
		return res;
		
	}
	public int setLike(String member_id, String entity_number)throws Exception {
	
		int result, data = 0;
		
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			
			HashMap<String,String>map = new HashMap<String,String>();
			map.put("id", member_id);
			map.put("entity",entity_number);
			
			
			
			int res = ajaxMapper.isAlreadyLiked(map);
			
			
			System.out.println("res");
			if(res==0) {
				//좋아요 추가
				
				result =  ajaxMapper.insertLikedUser(map);
				System.out.println("좋아요추가"+ result);
				data=1;
				int val1 = ajaxMapper.increaseLike(map);
				System.out.println("test value1 : " + val1);
				
			}
			else {
				//좋아요 삭제
				
				result = ajaxMapper.deleteLikedUser(map);
				System.out.println("좋아요삭제"+ result);
				data=0;
				ajaxMapper.decreaseLike(map);
				
			}
			System.out.println("??");
		
		}catch(Exception e) {
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택트레이스" + e.getStackTrace());
			throw new Exception("셋라이크 익셉션");
		}
		return data;
	}
	
	
	
	
	
	
	
	

	
}
