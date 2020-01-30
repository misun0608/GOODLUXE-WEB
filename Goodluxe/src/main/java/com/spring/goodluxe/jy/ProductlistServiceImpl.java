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
				System.out.println("���Ի�ǰ �Է� ����");
			}
			else {
				System.out.println("���Ի�ǰ �Է� ����");
			}
			return res;
		}catch(Exception e) {
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("���Ի�ǰ �Է� ����");
		}
		
	}



	@Override
	public int registerProduct(ConsignProductVO consVO)  throws Exception{
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		
			int res = productlistMapper.insertConsProduct(consVO);
		
			if(res == 1) {
				System.out.println("��Ź��ǰ �Է� ����");
			}
			else {
				System.out.println("��Ź��ǰ �Է� ����");
			}
			return res;
		}catch(Exception e) {
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("��Ź��ǰ �Է� ����");
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
				System.out.println("�Խù� �Է� ����");
			}
			else {
				System.out.println("�Խù� �Է� ����");
			}
			return res;
		}catch(Exception e) {
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("�Խù� ��� ����");
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
	//�Ʒ��� ����Ʈ �κ�
	public ArrayList<HashMap<String, Object>> getMainPageItem() throws Exception{
		
		
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			ArrayList<HashMap<String, Object>> mainbolist = null;
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("startRow", 1); 
			map.put("endRow", 12); //���� �������� ���� ������ ������ �Է��ϼ���.
		
			mainbolist = productlistMapper.getMainPageItem(map);
			
			return mainbolist;
			
		}catch(Exception e){
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("���� ������ �ҷ����� ����");
		}	

		
	}
	//�ָ��� �Ÿ��� �κ�
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
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("���� �ָ��� ������ �ҷ����� ����");
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
			
			System.out.println("row�� ??"+ startRow + endRow);
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			map.put("content",search_content);
			map.put("orderbywhat", orderbywhat);
			
			searchbolist_view = productlistMapper.getSearchBoardList(map);
			
			System.out.println("��ġ����Ʈ"+ searchbolist_view);
		
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
