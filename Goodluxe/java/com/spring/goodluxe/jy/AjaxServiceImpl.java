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
			
			res = ajaxMapper.isAlreadyLiked(map);
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/isMemberLiked) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/isMemberLiked)");
		}
		return res;
		
	}
	public int setLike(String member_id, String entity_number)throws Exception {
		int data = 0;
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			HashMap<String,String>map = new HashMap<String,String>();
			map.put("id", member_id);
			map.put("entity",entity_number);
			
			int res = ajaxMapper.isAlreadyLiked(map);
			
			if(res==0) {
				//좋아요 추가
				ajaxMapper.insertLikedUser(map);
				ajaxMapper.increaseLike(map);
				data=1;
			}
			else {
				//좋아요 삭제
				ajaxMapper.deleteLikedUser(map);
				ajaxMapper.decreaseLike(map);
				data=0;
			}
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/setLike) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/setLike)");
		}
		return data;
	}
	
	
	
	
	
	
	
	

	
}
