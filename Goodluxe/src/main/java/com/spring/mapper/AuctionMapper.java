package com.spring.mapper;

import com.spring.goodluxe.voes.AuctionVO;

public interface AuctionMapper {
	
	int insertAuction(AuctionVO auctionvo);
	AuctionVO selectAuction(AuctionVO auctionvo);
	AuctionVO selectAuction_PostNumber(int AUCTION_POST_NUMBER);
	/*
	 * int updateAuction(AuctionVO auctionvo); 
	 * int deleteAuction(AuctionVO auctionvo);
	 */
	
}
