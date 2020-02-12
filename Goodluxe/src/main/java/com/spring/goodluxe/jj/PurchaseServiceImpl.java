package com.spring.goodluxe.jj;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PurchaseMapper;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public PurchaseVO selectPurchase(String entity_number)throws Exception{
		PurchaseVO purchasevo = new PurchaseVO();
		
		try {
			PurchaseMapper purchaseMapper = sqlSession.getMapper(PurchaseMapper.class);
			purchasevo = purchaseMapper.selectPurchase(entity_number);
			purchasevo.getEntity_number();
			System.out.println("ã�ƶ�"+entity_number);
		}catch(Exception e) {
			System.out.println("ã�ƶ� ���Զ�+"+e.getMessage());
		}
		
		return purchasevo;
		
	}
	
	@Override
	public int entitycheck(String entity_number)throws Exception{
		int res=0;
		
		try {
			PurchaseMapper purchaseMapper = sqlSession.getMapper(PurchaseMapper.class);
		res = purchaseMapper.entitycheck(entity_number);
		if(res==1) {
			System.out.println("res="+res);
		}else {
			System.out.println("res="+res);
		}
		}catch(Exception e) {
			System.out.println("üũ�ϰŶ� ��ƼƼ!");
		}
		return res;
	}
	
	@Override
	public ArrayList<PurchaseVO> selectEntitySearchWord (String entity_number){
		
		ArrayList<PurchaseVO> purchaselist = null;
		
		try {
			PurchaseMapper purchaseMapper = sqlSession.getMapper(PurchaseMapper.class);
			purchaselist = purchaseMapper.selectEntitySearchWord(entity_number);
			
		}catch(Exception e) {
			System.out.println("����Ʈ ��ã?"+e.getMessage());
		}
		
		return purchaselist;

	}
	
	@Override
	public ArrayList<PurchaseVO> selectKeywordSearch(String entity_number){
		ArrayList<PurchaseVO> purchaselist = null;
		
		try {
			PurchaseMapper purchaseMapper = sqlSession.getMapper(PurchaseMapper.class);
			purchaselist = purchaseMapper.selectKeywordSearch(entity_number);
		}catch(Exception e) {
			System.out.println("Ű���� ��ã?+"+e.getMessage());
		}
		return purchaselist;
		
	}
	
	
}
