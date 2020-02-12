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
			System.out.println("주문 들어간다");
			
			
			res=orderMapper.insertorder(ordervo);
			
			System.out.println("주문 들어갔다.");
			
		}catch(Exception e) {
			throw new Exception("주문 추가 실패"+e.getMessage());
		}
		
		
		return res; 
	}
}
