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
			System.out.println("���Ի�ǰ �Է� ����");
			return 1;
		}
		else {
			System.out.println("���Ի�ǰ �Է� ����");
			return 0;
		}
	}



	@Override
	public int registerProduct(ConsignProductVO consVO) {
		ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		
		int res = productlistMapper.insertConsProduct(consVO);
		
		if(res == 1) {
			System.out.println("��Ź��ǰ �Է� ����");
			return 1;
		}
		else {
			System.out.println("��Ź��ǰ �Է� ����");
			return 0;
		}
	}


	@Override
	public int uploadProductBoard(SellingBoardVO sellboVO) {
		ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		System.out.println("���ϴ�....4");
		sellboVO.setPb_view_count(0);
		sellboVO.setPb_like(0);
		
		int res = productlistMapper.insertSellingBoard(sellboVO);
		System.out.println("���ϴ�....5");
		if(res == 1) {
			System.out.println("�Խù� �Է� ����");
			return 1;
		}
		else {
			System.out.println("�Խù� �Է� ����");
			return 0;
		}
	}
	

}
