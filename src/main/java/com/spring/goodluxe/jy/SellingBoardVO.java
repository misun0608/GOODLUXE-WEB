package com.spring.goodluxe.jy;

import java.util.Date;

/*
 * create table gl_SellingBoard(
    pb_number number primary key,
    pb_division varchar2(20),
    pb_md_name varchar2(100),
    pb_date timestamp,
    pb_sale_status varchar2(10),
    pb_post_status varchar2(10),
    pb_detail varchar2(3000),
    pb_main_img_original varchar2(1000),
    pb_main_img_stored varchar2(1000),
    pb_detail_img_original varchar2(1000),
    pb_detail_img_stored varchar2(1000),
    pb_view_count number,
    pb_like number,
    entity_number varchar(30)
);
  
create sequence sellingBoard_seq
    start with 1
    increment by 1
    maxvalue 10000000;
 */

public class SellingBoardVO { 
	private String pb_number;				//글번호 (시퀀스)
	private String pb_division; 			//게시글 분류
	private String pb_md_name;   			//제품이름
	private Date pb_date;   				//상품개체번호
	private String pb_sale_status;  		//판매상태
	private String pb_post_status;  		//게시상태
	private String pb_detail;    			//상품 상세설명
	private String pb_main_img_original;   	//메인 사진
	private String pb_main_img_stored;   
	private String pb_detail_img_original;  //디테일 사진
	private String pb_detail_img_stored;  
	private int pb_view_count;  			//조회수
	private int pb_like;  					//좋아요
	private String entity_number;   
	
	
	public String getPb_number() {
		return pb_number;
	}
	public void setPb_number(String pb_number) {
		this.pb_number = pb_number;
	}
	public String getPb_division() {
		return pb_division;
	}
	public void setPb_division(String pb_division) {
		this.pb_division = pb_division;
	}
	public String getPb_md_name() {
		return pb_md_name;
	}
	public void setPb_md_name(String pb_md_name) {
		this.pb_md_name = pb_md_name;
	}
	public Date getPb_date() {
		return pb_date;
	}
	public void setPb_date(Date pb_date) {
		this.pb_date = pb_date;
	}
	public String getPb_sale_status() {
		return pb_sale_status;
	}
	public void setPb_sale_status(String pb_sale_status) {
		this.pb_sale_status = pb_sale_status;
	}
	public String getPb_post_status() {
		return pb_post_status;
	}
	public void setPb_post_status(String pb_post_status) {
		this.pb_post_status = pb_post_status;
	}
	public String getPb_detail() {
		return pb_detail;
	}
	public void setPb_detail(String pb_detail) {
		this.pb_detail = pb_detail;
	}
	public String getPb_main_img_original() {
		return pb_main_img_original;
	}
	public void setPb_main_img_original(String pb_main_img_original) {
		this.pb_main_img_original = pb_main_img_original;
	}
	public String getPb_main_img_stored() {
		return pb_main_img_stored;
	}
	public void setPb_main_img_stored(String pb_main_img_stored) {
		this.pb_main_img_stored = pb_main_img_stored;
	}
	public String getPb_detail_img_original() {
		return pb_detail_img_original;
	}
	public void setPb_detail_img_original(String pb_detail_img_original) {
		this.pb_detail_img_original = pb_detail_img_original;
	}
	public String getPb_detail_img_stored() {
		return pb_detail_img_stored;
	}
	public void setPb_detail_img_stored(String pb_detail_img_stored) {
		this.pb_detail_img_stored = pb_detail_img_stored;
	}
	public int getPb_view_count() {
		return pb_view_count;
	}
	public void setPb_view_count(int pb_view_count) {
		this.pb_view_count = pb_view_count;
	}
	public int getPb_like() {
		return pb_like;
	}
	public void setPb_like(int pb_like) {
		this.pb_like = pb_like;
	}
	public String getEntity_number() {
		return entity_number;
	}
	public void setEntity_number(String entity_number) {
		this.entity_number = entity_number;
	}


	
}
