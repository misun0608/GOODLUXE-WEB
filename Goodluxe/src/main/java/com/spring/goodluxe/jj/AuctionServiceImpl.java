package com.spring.goodluxe.jj;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.AuctionVO;
import com.spring.mapper.AuctionMapper;
@Service("auctionService")
public class AuctionServiceImpl implements AuctionService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertAuction(AuctionVO auctionvo)throws Exception{
		
		int res= 0;
		
		
		try {
			
			/* d */
			AuctionMapper auctionMapper = sqlSession.getMapper(AuctionMapper.class);
			res = auctionMapper.insertAuction(auctionvo);
			
		}catch(Exception e) {
			throw new Exception("��� �߰� ����",e);
		}
		return res;
	}
	
	
	@Override
	public AuctionVO selectAuction(AuctionVO auctionvo)throws Exception{
		/* BoardVO vo = null;
		try {
			
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			boardMapper.updateReadcount(boardvo);
			vo = boardMapper.selectBoard(boardvo);
		} 
		catch (Exception e) { 
			System.out.println("�˻� ����." + e.getMessage());
		} 

		return vo;
	} */
	
			
			AuctionMapper auctionMapper = sqlSession.getMapper(AuctionMapper.class);
			AuctionVO vo = auctionMapper.selectAuction(auctionvo);
	
			return vo;
	}
	
	@Override
	public AuctionVO selectAuction_PostNumber(int AUCTION_POST_NUMBER)throws Exception{
		
		AuctionMapper auctionMapper = sqlSession.getMapper(AuctionMapper.class);
		AuctionVO vo = auctionMapper.selectAuction_PostNumber(AUCTION_POST_NUMBER);
		
		return vo;
	}
	
	/*
	 * @Override public int updateAuction(AuctionVO auctionvo)throws Exception{
	 * return 0; }
	 * 
	 * @Override public int deleteAuction(AuctionVO auctionvo)throws Exception{
	 * return 0; }
	 */
	
}
