package com.spring.goodluxe.jy;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productlistService")
public class ProductlistServiceImpl implements ProductlistService{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	public int registerProduct(ProductVO productVO) {
		
		
		
		
		return 0;
		
	}
	

}
