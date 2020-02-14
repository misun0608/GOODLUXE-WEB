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
			System.out.println("찾아라"+entity_number);
		}catch(Exception e) {
			System.out.println("찾아라 매입띠+"+e.getMessage());
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
			System.out.println("체크하거라 엔티티!");
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
			System.out.println("리스트 못찾?"+e.getMessage());
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
			System.out.println("키워드 못찾?+"+e.getMessage());
		}
		return purchaselist;
		
	}
	
	
}
