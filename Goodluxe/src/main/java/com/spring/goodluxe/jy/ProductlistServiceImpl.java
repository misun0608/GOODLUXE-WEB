package com.spring.goodluxe.jy;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.mapper.ProductlistMapper;

@Service("productlistService")
public class ProductlistServiceImpl implements ProductlistService{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	public int registerProduct(PurchaseProductVO purcVO) {
		
		ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		
		int res = productlistMapper.insertPurcProduct(purcVO);
		if(res == 1) {
			System.out.println("매입상품 입력 성공");
			return 1;
		}
		else {
			System.out.println("매입상품 입력 실패");
			return 0;
		}
	}



	@Override
	public int registerProduct(ConsignProductVO consVO) {
		ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		
		int res = productlistMapper.insertConsProduct(consVO);
		
		if(res == 1) {
			System.out.println("위탁상품 입력 성공");
			return 1;
		}
		else {
			System.out.println("위탁상품 입력 실패");
			return 0;
		}
	}


	@Override
	public int uploadProductBoard(SellingBoardVO sellboVO) {
		ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		System.out.println("뭐하는....4");
		sellboVO.setPb_view_count(0);
		sellboVO.setPb_like(0);
		
		int res = productlistMapper.insertSellingBoard(sellboVO);
		System.out.println("뭐하는....5");
		if(res == 1) {
			System.out.println("게시물 입력 성공");
			return 1;
		}
		else {
			System.out.println("게시물 입력 실패");
			return 0;
		}
	}
	

}
