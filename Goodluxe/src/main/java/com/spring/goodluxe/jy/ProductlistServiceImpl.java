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
	public int uploadProductBoard(SellingBoardVO sellboVO) throws Exception {
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
	
	public int getSellingBoardCount() throws Exception{
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			int count = productlistMapper.getSellingBoardCount();
			
			System.out.println("count = "+count);
			
			return count;
		}catch(Exception e) {
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("�� ���� Ȯ�� �Ұ�");
		}
	}



	public ArrayList<HashMap<String, Object>> getSellingBoardProduct(int startRow, int endRow) throws Exception{
		
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);

			ArrayList<HashMap<String, Object>> sellbo_list = null;
			//HashMap<String, Object> sellbo_list = null;
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			
			sellbo_list = productlistMapper.SellingBoardProduct(map);
			System.out.println("����Ʈ" + sellbo_list);
			
			
			
			
			
			return sellbo_list;
			
		}catch(Exception e){
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("������ ������ �̸� �ҷ����� ����");
		}	
	}



	
	
	
	
	

}
