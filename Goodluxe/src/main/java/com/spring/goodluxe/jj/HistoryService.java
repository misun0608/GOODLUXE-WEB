package com.spring.goodluxe.jj;

import java.util.ArrayList;

import com.spring.goodluxe.voes.Auction_HistoryVO;

public interface HistoryService {

	int insertHistory(Auction_HistoryVO historyvo)throws Exception;
	Auction_HistoryVO selectHistory(int AUCTION_POST_NUMBER)throws Exception;
	int selecthistorycount(int AUCTION_POST_NUMBER)throws Exception;
	ArrayList<Auction_HistoryVO> auctionhistoryselect(int auction_post_number)throws Exception;
	Auction_HistoryVO auctionhistoryselectone(int auction_post_number)throws Exception;
}
