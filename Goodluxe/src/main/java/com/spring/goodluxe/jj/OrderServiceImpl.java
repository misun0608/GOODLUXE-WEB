package com.spring.goodluxe.jj;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.OrderMapper;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertorder(OrderVO ordervo)throws Exception{
		int res=0;
		
		try {
			
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			System.out.println("�ֹ� ����");
			
			
			res=orderMapper.insertorder(ordervo);
			
			System.out.println("�ֹ� ����.");
			
		}catch(Exception e) {
			throw new Exception("�ֹ� �߰� ����"+e.getMessage());
		}
		
		
		return res; 
	}
}
