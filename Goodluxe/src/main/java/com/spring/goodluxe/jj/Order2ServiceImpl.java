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
			System.out.println("占쌍뱄옙 占쏙옙載ｏ옙占�");
			
			
			res=orderMapper.insertorder(ordervo);
			
			System.out.println("占쌍뱄옙 占쏙옙載э옙占�.");
			
		}catch(Exception e) {
			throw new Exception("占쌍뱄옙 占쌩곤옙 占쏙옙占쏙옙"+e.getMessage());
		}
		
		
		return res; 
	}
	
	@Override
	public int selectordercount(int auction_post_number)throws Exception{
		int res=0;
		
		try {
			Order2Mapper orderMapper = sqlSession.getMapper(Order2Mapper.class);
			res = orderMapper.selectordercount(auction_post_number);
		}catch(Exception e) {
			System.out.println("count ? "+e.getMessage());
		}
		return res;
	}
}
