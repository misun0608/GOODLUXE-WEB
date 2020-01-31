package com.spring.goodluxe.jy;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.ConsignProductVO;
import com.spring.goodluxe.voes.ProductBoardVO;
import com.spring.goodluxe.voes.PurchaseProductVO;
import com.spring.mapper.ProductlistMapper;

@Service("productlistService")
public class ProductlistServiceImpl implements ProductlistService{
	
	@Autowired
	private SqlSession sqlSession;
	
	public int registerProduct(PurchaseProductVO purcVO) throws Exception {
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			int res = productlistMapper.insertPurcProduct(purcVO);
			
			return res;
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/registerProduct/purcVO) : " + e.getMessage());
			System.out.println("ERROR(ProductlistService/registerProduct/purcVO) : " + e.getStackTrace());
			throw new Exception("ERROR(ProductlistService/registerProduct/purcVO)");
		}
		
	}



	@Override
	public int registerProduct(ConsignProductVO consVO)  throws Exception{
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		
			int res = productlistMapper.insertConsProduct(consVO);
		
			return res;
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/registerProduct/consVO) : " + e.getMessage());
			System.out.println("ERROR(ProductlistService/registerProduct/consVO) : " + e.getStackTrace());
			throw new Exception("ERROR(ProductlistService/registerProduct/consVO)");
		}
		
	}


	@Override
	public int uploadProductBoard(ProductBoardVO sellboVO) throws Exception {
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		
			sellboVO.setPb_view_count(0);
			sellboVO.setPb_like(0);
			
			int res = productlistMapper.insertSellingBoard(sellboVO);
		
			return res;
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/uploadProductBoard) : " + e.getMessage());
			System.out.println("ERROR(ProductlistService/uploadProductBoard) : " + e.getStackTrace());
			throw new Exception("ERROR(ProductlistService/uploadProductBoard)");
		}
		
	}
	
	
	
	//�Խù� ���� Ȯ��
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
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("�� ���� Ȯ�� �Ұ�");
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
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("������ ������ �̸� �ҷ����� ����");
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
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("������ ������ �̸� �ҷ����� ����");
		}	
	}
	
	// Main Page Item List
	public ArrayList<HashMap<String, Object>> getMainPageItem() throws Exception{
		
		
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			ArrayList<HashMap<String, Object>> mainbolist = null;
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("startRow", 1); 
			map.put("endRow", 12);
		
			mainbolist = productlistMapper.getMainPageItem(map);
			
			return mainbolist;
			
		}catch(Exception e){
			System.out.println("ERROR(ProductlistService/getMainPageItem) : " + e.getMessage());
			System.out.println("ERROR(ProductlistService/getMainPageItem) : " + e.getStackTrace());
			throw new Exception("ERROR(ProductlistService/getMainPageItem)");
		}	

		
	}
	
	// Main Page Event Item List
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
			System.out.println("ERROR(ProductlistService/getMainPageItem_view) : " + e.getMessage());
			System.out.println("ERROR(ProductlistService/getMainPageItem_view) : " + e.getStackTrace());
			throw new Exception("ERROR(ProductlistService/getMainPageItem_view)");
		}	
		
	}

	public int getSearchBoardCount(String search_content, String orderbywhat)throws Exception {
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("content", search_content);
		
	
			int count = productlistMapper.getSearchBoardCount(map);
			System.out.println("��ġ�۰���"+count);
			return count;
		}catch(Exception e) {
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("�˻� ��� �� ���� Ȯ�� �Ұ�");
		}
	}



	public ArrayList<HashMap<String, Object>> getSearchBoardProduct(int startRow, int endRow, String search_content, String orderbywhat)throws Exception {
	
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			ArrayList<HashMap<String, Object>> searchbolist_view = null;
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			map.put("content",search_content);
			map.put("orderbywhat", orderbywhat);
			
			searchbolist_view = productlistMapper.getSearchBoardList(map);
			
		
			return searchbolist_view;
		
		
		}catch(Exception e) {
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("�˻� ��� ���� Ȯ�� �Ұ�");
		}
		
		
		
	}



	public HashMap<String, Object> getTheProduct(String entity_number)throws Exception {
		
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			HashMap<String, Object> theProduct =null;
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("entityNo", entity_number);			
			theProduct = productlistMapper.getTheProduct(map);
			productlistMapper.viewCountPlus(map);
			
			return theProduct;
			
		}catch(Exception e) {
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("�˻� ��� ���� Ȯ�� �Ұ�");
		}
		
	}



	public ArrayList<HashMap<String, Object>> getRecommand(String entity_number) throws Exception {
		
		try {
			
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		
			ArrayList<HashMap<String, Object>> recommandList = null;
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("entity", entity_number);	
			System.out.println("엔티티"+entity_number);
			HashMap<String, String> theme = null;
			System.out.println("serviceImpl 둘");
			theme = productlistMapper.getRecommandtheme(map);
			
//			String brand = "";
//			String category = "";
//			
//			brand = theme.get("pd_brand");
//			
//			category= theme.get("pd_category");
//			
			
			
			recommandList = productlistMapper.getRecommandList(theme);
			
			System.out.println("응???"+recommandList);
			
			return recommandList;
		}catch(Exception e) {
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("�˻� ��� ���� Ȯ�� �Ұ�");
		}
		
	
	}
	

	
	

}
