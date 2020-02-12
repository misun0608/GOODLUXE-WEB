package com.spring.goodluxe.jj;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.AlamMapper;

@Service("alamService")
public class AlamServiceImpl implements AlamService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertAlam(AlamVO alamvo)throws Exception{
		int res=0;
		try {
			/* d */
			AlamMapper alamMapper = sqlSession.getMapper(AlamMapper.class);
			res = alamMapper.insertAlam(alamvo);
			
		}catch(Exception e) {
			throw new Exception("알람 추가 실패다 유재진"+e.getMessage());
		}
		return res;
		
	}
}
