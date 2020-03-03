package com.spring.goodluxe.jj;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.Purchase2VO;
import com.spring.mapper.Purchase2Mapper;

@Service
public class Purchase2ServiceImpl implements Purchase2Service {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Purchase2VO selectPurchase(String entity_number)throws Exception{
		Purchase2VO purchasevo = new Purchase2VO();
		
		try {
			Purchase2Mapper purchaseMapper = sqlSession.getMapper(Purchase2Mapper.class);
			purchasevo = purchaseMapper.selectPurchase(entity_number);
			purchasevo.getEntity_number();
			System.out.println("entitynumber="+entity_number);
		}catch(Exception e) {
			System.out.println("entitynumber"+e.getMessage());
		}
		
		return purchasevo;
		
	}
	
	@Override
	public int entitycheck(String entity_number)throws Exception{
		int res=0;
		
		try {
			Purchase2Mapper purchaseMapper = sqlSession.getMapper(Purchase2Mapper.class);
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
	public ArrayList<Purchase2VO> selectEntitySearchWord (String entity_number){
		
		ArrayList<Purchase2VO> purchaselist = null;
		
		try {
			Purchase2Mapper purchaseMapper = sqlSession.getMapper(Purchase2Mapper.class);
			purchaselist = purchaseMapper.selectEntitySearchWord(entity_number);
			
		}catch(Exception e) {
			System.out.println("����Ʈ ��ã?"+e.getMessage());
		}
		
		return purchaselist;

	}
	
	@Override
	public ArrayList<Purchase2VO> selectKeywordSearch(String entity_number){
		ArrayList<Purchase2VO> purchaselist = null;
		
		try {
			Purchase2Mapper purchaseMapper = sqlSession.getMapper(Purchase2Mapper.class);
			purchaselist = purchaseMapper.selectKeywordSearch(entity_number);
		}catch(Exception e) {
			System.out.println("Ű���� ��ã?+"+e.getMessage());
		}
		return purchaselist;
		
	}
	
	
}
