package com.spring.goodluxe.jj;

import com.spring.goodluxe.voes.AuctionVO;

public interface AuctionService {
	int insertAuction(AuctionVO auctionvo)throws Exception;
	AuctionVO selectAuction(AuctionVO auctionvo)throws Exception;
	AuctionVO selectAuction_PostNumber(int AUCTION_POST_NUMBER)throws Exception;
	/*
	 * int updateAuction(AuctionVO auctionvo)throws Exception; int
	 * deleteAuction(AuctionVO auctionvo)throws Exception;
	 */
	
}
