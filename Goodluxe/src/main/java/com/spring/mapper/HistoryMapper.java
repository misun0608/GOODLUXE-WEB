package com.spring.mapper;

import java.util.ArrayList;

import com.spring.goodluxe.voes.Auction_HistoryVO;

public interface HistoryMapper {
	int insertHistory(Auction_HistoryVO historyvo);
	Auction_HistoryVO selectHistory(int AUCTION_POST_NUMBER);
	int selecthistorycount(int AUCTION_POST_NUMBER);
	ArrayList<Auction_HistoryVO> auctionhistoryselect(int auction_post_number);
	Auction_HistoryVO auctionhistoryselectone(int auction_post_number);
}
