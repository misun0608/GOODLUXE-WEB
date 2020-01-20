package com.spring.goodluxe.jy;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ProductlistMapper;

@Service("productlistService")
public class ProductlistServiceImpl implements ProductlistService{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	public int registerProduct(PurchaseProductVO purcVO) {
		
		ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		
		int res = productlistMapper.insertPurcProduct(purcVO);
		if(res == 1) {
			System.out.println("���Ի�ǰ �Է� ����");
			return 1;
		}
		else {
			System.out.println("�ş��ǰ �Է� ����");
			return 0;
		}
	}
	

}
