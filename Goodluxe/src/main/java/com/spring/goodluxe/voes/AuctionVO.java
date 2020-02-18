package com.spring.goodluxe.voes;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class AuctionVO {
	
	private int AUCTION_POST_NUMBER; /* 경매게시글번호 */
	private String AUCTION_MD_NAME; /* 제품이름 */
	private int AUCTION_START_PRICE;/* 시작가 */
	private int AUCTION_NOW_PRICE; /* 현재가 */
	private Timestamp AUCTION_PRICE_TIME; /* 최고가sysdate yy-mm-dd hh:mm */
	private int AUCTION_BID_PRICE;/* 제품낙찰가 */
	private Date AUCTION_POST_DATE;  /* 게시일 */
	private Timestamp AUCTION_START_TIME; /* 경매시작시간 */
	private Timestamp AUCTION_END_TIME; /* 경매마감시간 */
	private String AUCTION_PHOTO1_STORED;
	private String AUCTION_PHOTO2_STORED;
	private String AUCTION_PHOTO3_STORED;
	private String AUCTION_PHOTO4_STORED;
	private String AUCTION_PHOTO5_STORED;
	private String AUCTION_DETAIL; /* 제품설명상세 */
	private int AUCTION_LIKE; /* 좋아용 */
	private String AUCTION_POST_STATUS; /* 게시상태 */
	private String ENTITY_NUMBER;/* 상품개체번호 */
	public int getAUCTION_POST_NUMBER() {
		return AUCTION_POST_NUMBER;
	}
	public String getAUCTION_MD_NAME() {
		return AUCTION_MD_NAME;
	}
	public int getAUCTION_START_PRICE() {
		return AUCTION_START_PRICE;
	}
	public int getAUCTION_NOW_PRICE() {
		return AUCTION_NOW_PRICE;
	}
	public Timestamp getAUCTION_PRICE_TIME() {
		return AUCTION_PRICE_TIME;
	}
	public int getAUCTION_BID_PRICE() {
		return AUCTION_BID_PRICE;
	}
	public Date getAUCTION_POST_DATE() {
		return AUCTION_POST_DATE;
	}
	public Timestamp getAUCTION_START_TIME() {
		return AUCTION_START_TIME;
	}
	public Timestamp getAUCTION_END_TIME() {
		return AUCTION_END_TIME;
	}
	public String getAUCTION_PHOTO1_STORED() {
		return AUCTION_PHOTO1_STORED;
	}
	public String getAUCTION_PHOTO2_STORED() {
		return AUCTION_PHOTO2_STORED;
	}
	public String getAUCTION_PHOTO3_STORED() {
		return AUCTION_PHOTO3_STORED;
	}
	public String getAUCTION_PHOTO4_STORED() {
		return AUCTION_PHOTO4_STORED;
	}
	public String getAUCTION_PHOTO5_STORED() {
		return AUCTION_PHOTO5_STORED;
	}
	public String getAUCTION_DETAIL() {
		return AUCTION_DETAIL;
	}
	public int getAUCTION_LIKE() {
		return AUCTION_LIKE;
	}
	public String getAUCTION_POST_STATUS() {
		return AUCTION_POST_STATUS;
	}
	public String getENTITY_NUMBER() {
		return ENTITY_NUMBER;
	}
	public void setAUCTION_POST_NUMBER(int aUCTION_POST_NUMBER) {
		AUCTION_POST_NUMBER = aUCTION_POST_NUMBER;
	}
	public void setAUCTION_MD_NAME(String aUCTION_MD_NAME) {
		AUCTION_MD_NAME = aUCTION_MD_NAME;
	}
	public void setAUCTION_START_PRICE(int aUCTION_START_PRICE) {
		AUCTION_START_PRICE = aUCTION_START_PRICE;
	}
	public void setAUCTION_NOW_PRICE(int aUCTION_NOW_PRICE) {
		AUCTION_NOW_PRICE = aUCTION_NOW_PRICE;
	}
	public void setAUCTION_PRICE_TIME(Timestamp aUCTION_PRICE_TIME) {
		AUCTION_PRICE_TIME = aUCTION_PRICE_TIME;
	}
	public void setAUCTION_BID_PRICE(int aUCTION_BID_PRICE) {
		AUCTION_BID_PRICE = aUCTION_BID_PRICE;
	}
	public void setAUCTION_POST_DATE(Date aUCTION_POST_DATE) {
		AUCTION_POST_DATE = aUCTION_POST_DATE;
	}
	public void setAUCTION_START_TIME(Timestamp aUCTION_START_TIME) {
		AUCTION_START_TIME = aUCTION_START_TIME;
	}
	public void setAUCTION_END_TIME(Timestamp aUCTION_END_TIME) {
		AUCTION_END_TIME = aUCTION_END_TIME;
	}
	public void setAUCTION_PHOTO1_STORED(String aUCTION_PHOTO1_STORED) {
		AUCTION_PHOTO1_STORED = aUCTION_PHOTO1_STORED;
	}
	public void setAUCTION_PHOTO2_STORED(String aUCTION_PHOTO2_STORED) {
		AUCTION_PHOTO2_STORED = aUCTION_PHOTO2_STORED;
	}
	public void setAUCTION_PHOTO3_STORED(String aUCTION_PHOTO3_STORED) {
		AUCTION_PHOTO3_STORED = aUCTION_PHOTO3_STORED;
	}
	public void setAUCTION_PHOTO4_STORED(String aUCTION_PHOTO4_STORED) {
		AUCTION_PHOTO4_STORED = aUCTION_PHOTO4_STORED;
	}
	public void setAUCTION_PHOTO5_STORED(String aUCTION_PHOTO5_STORED) {
		AUCTION_PHOTO5_STORED = aUCTION_PHOTO5_STORED;
	}
	public void setAUCTION_DETAIL(String aUCTION_DETAIL) {
		AUCTION_DETAIL = aUCTION_DETAIL;
	}
	public void setAUCTION_LIKE(int aUCTION_LIKE) {
		AUCTION_LIKE = aUCTION_LIKE;
	}
	public void setAUCTION_POST_STATUS(String aUCTION_POST_STATUS) {
		AUCTION_POST_STATUS = aUCTION_POST_STATUS;
	}
	public void setENTITY_NUMBER(String eNTITY_NUMBER) {
		ENTITY_NUMBER = eNTITY_NUMBER;
	}
	
	
	
	
	
	
	
	
	
	
}
