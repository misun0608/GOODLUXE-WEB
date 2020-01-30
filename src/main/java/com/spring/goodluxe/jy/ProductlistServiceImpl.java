package com.spring.goodluxe.jy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ProductlistMapper;

@Service("productlistService")
public class ProductlistServiceImpl implements ProductlistService{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	public int registerProduct(PurchaseProductVO purcVO) throws Exception {
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			int res = productlistMapper.insertPurcProduct(purcVO);
			if(res == 1) {
				System.out.println("매입상품 입력 성공");
			}
			else {
				System.out.println("매입상품 입력 실패");
			}
			return res;
		}catch(Exception e) {
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택" + e.getStackTrace());
			throw new Exception("매입상품 입력 실패");
		}
		
	}



	@Override
	public int registerProduct(ConsignProductVO consVO)  throws Exception{
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		
			int res = productlistMapper.insertConsProduct(consVO);
		
			if(res == 1) {
				System.out.println("위탁상품 입력 성공");
			}
			else {
				System.out.println("위탁상품 입력 실패");
			}
			return res;
		}catch(Exception e) {
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택" + e.getStackTrace());
			throw new Exception("위탁상품 입력 실패");
		}
		
	}


	@Override
	public int uploadProductBoard(SellingBoardVO sellboVO) throws Exception {
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		
			sellboVO.setPb_view_count(0);
			sellboVO.setPb_like(0);
			
			int res = productlistMapper.insertSellingBoard(sellboVO);
			if(res == 1) {
				System.out.println("게시물 입력 성공");
			}
			else {
				System.out.println("게시물 입력 실패");
			}
			return res;
		}catch(Exception e) {
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택" + e.getStackTrace());
			throw new Exception("게시물 등록 실패");
		}
		
	}
	
	public int getSellingBoardCount() throws Exception{
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			int count = productlistMapper.getSellingBoardCount();
			
			System.out.println("count = "+count);
			
			return count;
		}catch(Exception e) {
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택" + e.getStackTrace());
			throw new Exception("글 갯수 확인 불가");
		}
	}



	public List getSellingBoardProduct(int startRow, int endRow) throws Exception{
		
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);

			ArrayList<SellingBoardVO> sellbo_list = null;
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			
			sellbo_list = productlistMapper.SellingBoardProduct(map);
			
			return sellbo_list;
			
		}catch(Exception e){
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택" + e.getStackTrace());
			throw new Exception("아이템 사진과 이름 불러오기 실패");
		}	
	}



	
	
	
	
	

}
