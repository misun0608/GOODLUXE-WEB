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
	public int uploadProductBoard(ProductBoardVO sellboVO) throws Exception {
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
	
	
	
	//게시물 갯수 확인
	public int getSellingBoardCount(int startRow, int endRow ,String il_search_brand 
			,String il_search_category ,String il_search_grade ,String il_search_price) throws Exception{
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			map.put("il_search_brand",il_search_brand);
			map.put("il_search_category",il_search_category);
			map.put("il_search_grade",il_search_grade);
			map.put("il_search_price",il_search_price);
			
			int count = productlistMapper.getSellingBoardCount(map);
			
			return count;
		}catch(Exception e) {
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택" + e.getStackTrace());
			throw new Exception("글 갯수 확인 불가");
		}
	}



	public ArrayList<HashMap<String, Object>> getSellingBoardProduct(int startRow, int endRow ,String il_search_brand 
			,String il_search_category ,String il_search_grade ,String il_search_price) throws Exception{
		
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);

			ArrayList<HashMap<String, Object>> sellbo_list = null;
			//HashMap<String, Object> sellbo_list = null;
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			map.put("il_search_brand",il_search_brand);
			map.put("il_search_category",il_search_category);
			map.put("il_search_grade",il_search_grade);
			map.put("il_search_price",il_search_price);
			
			sellbo_list = productlistMapper.SellingBoardProduct(map);
			
			return sellbo_list;
			
		}catch(Exception e){
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택" + e.getStackTrace());
			throw new Exception("아이템 사진과 이름 불러오기 실패");
		}	
	}


	public ArrayList<HashMap<String, Object>> getMainPageProduct(int startRow, int endRow ,String il_search_brand 
			,String il_search_category ,String il_search_grade ,String il_search_price) throws Exception{
		
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);

			ArrayList<HashMap<String, Object>> sellbo_list = null;
			//HashMap<String, Object> sellbo_list = null;
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			map.put("il_search_brand",il_search_brand);
			map.put("il_search_category",il_search_category);
			map.put("il_search_grade",il_search_grade);
			map.put("il_search_price",il_search_price);
			
			sellbo_list = productlistMapper.SellingBoardProduct(map);
		
			return sellbo_list;
			
		}catch(Exception e){
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택" + e.getStackTrace());
			throw new Exception("아이템 사진과 이름 불러오기 실패");
		}	
	}
	//아래에 리스트 부분
	public ArrayList<HashMap<String, Object>> getMainPageItem() throws Exception{
		
		
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			ArrayList<HashMap<String, Object>> mainbolist = null;
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("startRow", 1); 
			map.put("endRow", 12); //메인 페이지에 넣을 아이템 갯수를 입력하세요.
		
			mainbolist = productlistMapper.getMainPageItem(map);
			
			return mainbolist;
			
		}catch(Exception e){
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택" + e.getStackTrace());
			throw new Exception("메인 아이템 불러오기 실패");
		}	

		
	}
	//휘리릭 거리는 부분
	public ArrayList<HashMap<String, Object>> getMainPageItem_view() throws Exception{
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			ArrayList<HashMap<String, Object>> mainbolist_view = null;
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("startRow", 1); 
			map.put("endRow", 8); 
			
			mainbolist_view = productlistMapper.getMainPageItemView(map);
			
			return mainbolist_view;
			
		}catch(Exception e){
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택" + e.getStackTrace());
			throw new Exception("메인 휘리릭 아이템 불러오기 실패");
		}	
		
	}

	public int getSearchBoardCount(String search_content, String orderbywhat)throws Exception {
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("content", search_content);
		
	
			int count = productlistMapper.getSearchBoardCount(map);
			System.out.println("서치글갯수"+count);
			return count;
		}catch(Exception e) {
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택" + e.getStackTrace());
			throw new Exception("검색 결과 글 갯수 확인 불가");
		}
	}



	public ArrayList<HashMap<String, Object>> getSearchBoardProduct(int startRow, int endRow, String search_content, String orderbywhat)throws Exception {
	
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			ArrayList<HashMap<String, Object>> searchbolist_view = null;
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			System.out.println("row는 ??"+ startRow + endRow);
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			map.put("content",search_content);
			map.put("orderbywhat", orderbywhat);
			
			searchbolist_view = productlistMapper.getSearchBoardList(map);
			
			System.out.println("서치리스트"+ searchbolist_view);
		
			return searchbolist_view;
		
		
		}catch(Exception e) {
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택" + e.getStackTrace());
			throw new Exception("검색 결과 내용 확인 불가");
		}
		
		
		
	}



	public HashMap<String, Object> getTheProduct(String entity_number)throws Exception {
		
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			HashMap<String, Object> theProduct =null;
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("entityNo", entity_number);			
			theProduct = productlistMapper.getTheProduct(map);
			
			return theProduct;
			
		}catch(Exception e) {
			System.out.println("메세지" + e.getMessage());
			System.out.println("스택" + e.getStackTrace());
			throw new Exception("검색 결과 내용 확인 불가");
		}
		
	}
	

	
	

}
