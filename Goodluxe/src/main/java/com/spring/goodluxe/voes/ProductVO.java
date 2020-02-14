package com.spring.goodluxe.voes;

/*
 * create sequence gl_product_seq
    start with 1
    increment by 1
    maxvalue 10000000;
 */
public class ProductVO {
	private String entity_number;
	private String pd_name;
	private String pd_brand;
	private String pd_category;
	private String quality_grade;
	private int sale_price;
	private String appraise_exist;
	private String pd_component;
	private String member_id;
	public String getEntity_number() {
		return entity_number;
	}
	public void setEntity_number(String entity_number) {
		this.entity_number = entity_number;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public String getPd_brand() {
		return pd_brand;
	}
	public void setPd_brand(String pd_brand) {
		this.pd_brand = pd_brand;
	}
	public String getPd_category() {
		return pd_category;
	}
	public void setPd_category(String pd_category) {
		this.pd_category = pd_category;
	}
	public String getQuality_grade() {
		return quality_grade;
	}
	public void setQuality_grade(String quality_grade) {
		this.quality_grade = quality_grade;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	public String getAppraise_exist() {
		return appraise_exist;
	}
	public void setAppraise_exist(String appraise_exist) {
		this.appraise_exist = appraise_exist;
	}
	public String getPd_component() {
		return pd_component;
	}
	public void setPd_component(String pd_component) {
		this.pd_component = pd_component;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
