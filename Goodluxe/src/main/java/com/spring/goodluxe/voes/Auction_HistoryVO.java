package com.spring.goodluxe.voes;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Auction_HistoryVO {
	
	private int AUCTION_POST_NUMBER;
    private int AUHIS_NUMBER ;
    private String MEMBER_ID;
    private Timestamp AUHIS_BID_TIME;
    private int AUHIS_BETTING_PRICE;
    
    
	public int getAUCTION_POST_NUMBER() {
		return AUCTION_POST_NUMBER;
	}
	public void setAUCTION_POST_NUMBER(int aUCTION_POST_NUMBER) {
		AUCTION_POST_NUMBER = aUCTION_POST_NUMBER;
	}
	public int getAUHIS_NUMBER() {
		return AUHIS_NUMBER;
	}
	public void setAUHIS_NUMBER(int aUHIS_NUMBER) {
		AUHIS_NUMBER = aUHIS_NUMBER;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public Timestamp getAUHIS_BID_TIME() {
		return AUHIS_BID_TIME;
	}
	public void setAUHIS_BID_TIME(Timestamp aUHIS_BID_TIME) {
		AUHIS_BID_TIME = aUHIS_BID_TIME;
	}
	public int getAUHIS_BETTING_PRICE() {
		return AUHIS_BETTING_PRICE;
	}
	public void setAUHIS_BETTING_PRICE(int aUHIS_BETTING_PRICE) {
		AUHIS_BETTING_PRICE = aUHIS_BETTING_PRICE;
	}
    
    

    
	
    
}
