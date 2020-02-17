package com.spring.goodluxe.jj;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.Order2VO;
import com.spring.mapper.Order2Mapper;

@Service
public class Order2ServiceImpl implements Order2Service{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertorder(Order2VO ordervo)throws Exception{
		int res=0;
		
		try {
			
			Order2Mapper orderMapper = sqlSession.getMapper(Order2Mapper.class);
			System.out.println("�ֹ� ����");
			
			
			res=orderMapper.insertorder(ordervo);
			
			System.out.println("�ֹ� ����.");
			
		}catch(Exception e) {
			throw new Exception("�ֹ� �߰� ����"+e.getMessage());
		}
		
		
		return res; 
	}
}
