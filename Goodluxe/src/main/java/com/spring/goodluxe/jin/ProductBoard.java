package com.spring.goodluxe.jin;

import java.sql.Timestamp;

/*
CREATE TABLE GL_PRODUCTBOARD(
  PB_NUMBER NUMBER PRIMARY KEY,
  PB_DIVISION VARCHAR2(20),
  PB_MD_NAME VARCHAR2(60) NOT NULL,
  PB_DATE TIMESTAMP NOT NULL,
  PB_PHOTO1 VARCHAR2(100),
  PB_PHOTO2 VARCHAR2(400),
  PB_DETAIL VARCHAR2(2000),
  PB_SALE_STATUS VARCHAR2(10),
  PB_POST_STATUS VARCHAR2(10),
  PB_VIEW_COUNT NUMBER,
  PB_LIKE NUMBER,
  ENTITY_NUMBER
);
 */
public class ProductBoard {
	private int pb_number; // 게시글 번호
	private String pb_division; // 게시글 분류
	private String pb_md_name; // 제품 이름
	private Timestamp pb_date; // 게시일
	private String pb_photo1; // 대표 이미지
	private String pb_photo2; // 상세 이미지
	private String pb_detail; // 제품 상세 설명
	private String pb_sale_status; // 판매 상태(판매중, 거래중, 판매완료)
	private String pb_post_status; // 게시 상태(게시중, 게시 안 함)
	private int pb_view_count; // 조회수
	private int pb_like; // 좋아요 수
	private String entity_number; // 상품 개체번호(FK)
	public int getPb_number() {
		return pb_number;
	}
	public void setPb_number(int pb_number) {
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
	public Timestamp getPb_date() {
		return pb_date;
	}
	public void setPb_date(Timestamp pb_date) {
		this.pb_date = pb_date;
	}
	public String getPb_photo1() {
		return pb_photo1;
	}
	public void setPb_photo1(String pb_photo1) {
		this.pb_photo1 = pb_photo1;
	}
	public String getPb_photo2() {
		return pb_photo2;
	}
	public void setPb_photo2(String pb_photo2) {
		this.pb_photo2 = pb_photo2;
	}
	public String getPb_detail() {
		return pb_detail;
	}
	public void setPb_detail(String pb_detail) {
		this.pb_detail = pb_detail;
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
