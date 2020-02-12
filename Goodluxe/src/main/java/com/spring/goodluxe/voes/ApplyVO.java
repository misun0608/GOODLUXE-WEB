package com.spring.goodluxe.voes;

import java.util.Date;

public class ApplyVO {
	private String member_id;	// 멤버 아이디
	private String ap_selected_brand;	// 멤버 아이디
	private String ap_selected_category;	// 멤버 아이디
	private String ap_md_name;	// 상품명
	private int ap_hope_price;	// 판매 희망가
	private String ap_buy_year;	// 구매연도
	private int ap_buy_price;	// 구매가격
	private String ap_buy_store;	// 구매매장
	private String ap_img_stored;	// 사진
	private String ap_smethod;	// 판매방법
	private String ap_dmethod;	// 배송방법
	private Date ap_apply_date;		// 판매신청일
	private String ap_decision;		// 판매결정
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getAp_selected_brand() {
		return ap_selected_brand;
	}
	public void setAp_selected_brand(String ap_selected_brand) {
		this.ap_selected_brand = ap_selected_brand;
	}
	public String getAp_selected_category() {
		return ap_selected_category;
	}
	public void setAp_selected_category(String ap_selected_category) {
		this.ap_selected_category = ap_selected_category;
	}
	public String getAp_md_name() {
		return ap_md_name;
	}
	public void setAp_md_name(String ap_md_name) {
		this.ap_md_name = ap_md_name;
	}
	public int getAp_hope_price() {
		return ap_hope_price;
	}
	public void setAp_hope_price(int ap_hope_price) {
		this.ap_hope_price = ap_hope_price;
	}
	public String getAp_buy_year() {
		return ap_buy_year;
	}
	public void setAp_buy_year(String ap_buy_year) {
		this.ap_buy_year = ap_buy_year;
	}
	public int getAp_buy_price() {
		return ap_buy_price;
	}
	public void setAp_buy_price(int ap_buy_price) {
		this.ap_buy_price = ap_buy_price;
	}
	public String getAp_buy_store() {
		return ap_buy_store;
	}
	public void setAp_buy_store(String ap_buy_store) {
		this.ap_buy_store = ap_buy_store;
	}
	public String getAp_img_stored() {
		return ap_img_stored;
	}
	public void setAp_img_stored(String ap_img_stored) {
		this.ap_img_stored = ap_img_stored;
	}
	public String getAp_smethod() {
		return ap_smethod;
	}
	public void setAp_smethod(String ap_smethod) {
		this.ap_smethod = ap_smethod;
	}
	public String getAp_dmethod() {
		return ap_dmethod;
	}
	public void setAp_dmethod(String ap_dmethod) {
		this.ap_dmethod = ap_dmethod;
	}
	public Date getAp_apply_date() {
		return ap_apply_date;
	}
	public void setAp_apply_date(Date ap_apply_date) {
		this.ap_apply_date = ap_apply_date;
	}
	public String getAp_decision() {
		return ap_decision;
	}
	public void setAp_decision(String ap_decision) {
		this.ap_decision = ap_decision;
	}
}
