package com.spring.goodluxe.voes;

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
    pb_detail_img1_original varchar2(1000),
    pb_detail_img1_stored varchar2(1000),
    pb_detail_img2_original varchar2(1000),
    pb_detail_img2_stored varchar2(1000),
    pb_detail_img3_original varchar2(1000),
    pb_detail_img3_stored varchar2(1000),
    pb_view_count number,
    pb_like number,
    entity_number varchar(30)
);
  
create sequence sellingBoard_seq
    start with 1
    increment by 1
    maxvalue 10000000;
 */

public class ProductBoardVO { 
	private String pb_number;				//�۹�ȣ (������)
	private String pb_division; 			//�Խñ� �з�
	private String pb_md_name;   			//��ǰ�̸�
	private Date pb_date;   				//��ǰ��ü��ȣ
	private String pb_sale_status;  		//�ǸŻ���
	private String pb_post_status;  		//�Խû���
	private String pb_detail;    			//��ǰ �󼼼���
	private String pb_main_img_original;   	//���� ����
	private String pb_main_img_stored;   
	private String pb_detail_img1_original;  //������ ����1
	private String pb_detail_img1_stored;  
	private String pb_detail_img2_original;  //������ ����2
	private String pb_detail_img2_stored;  
	private String pb_detail_img3_original;  //������ ����3
	private String pb_detail_img3_stored;  
	private int pb_view_count;  			//��ȸ��
	private int pb_like;  					//���ƿ�
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
	public String getPb_detail_img1_original() {
		return pb_detail_img1_original;
	}
	public void setPb_detail_img1_original(String pb_detail_img1_original) {
		this.pb_detail_img1_original = pb_detail_img1_original;
	}
	public String getPb_detail_img1_stored() {
		return pb_detail_img1_stored;
	}
	public void setPb_detail_img1_stored(String pb_detail_img1_stored) {
		this.pb_detail_img1_stored = pb_detail_img1_stored;
	}
	public String getPb_detail_img2_original() {
		return pb_detail_img2_original;
	}
	public void setPb_detail_img2_original(String pb_detail_img2_original) {
		this.pb_detail_img2_original = pb_detail_img2_original;
	}
	public String getPb_detail_img2_stored() {
		return pb_detail_img2_stored;
	}
	public void setPb_detail_img2_stored(String pb_detail_img2_stored) {
		this.pb_detail_img2_stored = pb_detail_img2_stored;
	}
	public String getPb_detail_img3_original() {
		return pb_detail_img3_original;
	}
	public void setPb_detail_img3_original(String pb_detail_img3_original) {
		this.pb_detail_img3_original = pb_detail_img3_original;
	}
	public String getPb_detail_img3_stored() {
		return pb_detail_img3_stored;
	}
	public void setPb_detail_img3_stored(String pb_detail_img3_stored) {
		this.pb_detail_img3_stored = pb_detail_img3_stored;
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
