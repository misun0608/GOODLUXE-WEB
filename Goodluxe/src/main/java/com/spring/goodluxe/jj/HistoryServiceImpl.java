package com.spring.goodluxe.jj;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.HistoryMapper;

@Service("historyService")
public class HistoryServiceImpl implements HistoryService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertHistory(Auction_HistoryVO historyvo) throws Exception {
		int res = 0;

		try {
			/* d */
			HistoryMapper historyMapper = sqlSession.getMapper(HistoryMapper.class);
			res = historyMapper.insertHistory(historyvo);

		} catch (Exception e) {
			throw new Exception("베팅 추가 실패", e);
		}
		return res;
	}

	@Override
	public Auction_HistoryVO selectHistory(int AUCTION_POST_NUMBER) throws Exception {
		Auction_HistoryVO vo = null;
		try {
		HistoryMapper historyMapper = sqlSession.getMapper(HistoryMapper.class);
		 vo = historyMapper.selectHistory(AUCTION_POST_NUMBER);
		}catch(Exception e) {
			System.out.println("히스토리 조회 실패+"+e.getMessage());
		}
		return vo;

	}

	@Override
	public int selecthistorycount(int AUCTION_POST_NUMBER) throws Exception {
		

		int count = 0;
		try {
		HistoryMapper historyMapper = sqlSession.getMapper(HistoryMapper.class);
		count = historyMapper.selecthistorycount(AUCTION_POST_NUMBER);

		}catch(Exception e) {
			System.out.println("카운트 실패"+e.getMessage());
		}
		return count;

	}
	@Override
	public ArrayList<Auction_HistoryVO> auctionhistoryselect(int auction_post_number)throws Exception{
		ArrayList<Auction_HistoryVO> list = null;
		try {
			HistoryMapper historyMapper = sqlSession.getMapper(HistoryMapper.class);
			
			list = historyMapper.auctionhistoryselect(auction_post_number);
			
					
		}catch(Exception e) {
			System.out.println("리스트 뽑기 실패+"+e.getMessage());
		}
		
		return list;
	}
	
	@Override
	public Auction_HistoryVO auctionhistoryselectone(int auction_post_number)throws Exception{
		Auction_HistoryVO auctionvo = new Auction_HistoryVO();
		try{
			HistoryMapper historyMapper = sqlSession.getMapper(HistoryMapper.class);
		
		
			auctionvo = historyMapper.auctionhistoryselectone(auction_post_number);
		}catch(Exception e) {
			System.out.println("한명을 찾아라 실패+"+e.getMessage());
		}
		
		return auctionvo;
	}
}
