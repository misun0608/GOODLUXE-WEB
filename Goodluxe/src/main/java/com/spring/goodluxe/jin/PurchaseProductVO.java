package com.spring.goodluxe.jin;

import java.sql.Date;

/*
create table gl_purchase(
    entity_number varchar2(30) primary key,
    pd_name varchar2(100) not null,
    brand_number varchar2(30),
    category varchar2(30) not null,
    quality_grade varchar2(10) not null,
    sale_price number,
    buying_price number not null,
    purc_date date,
    appraise_exist varchar2(10),
    pd_component varchar2(200),
    member_id varchar2(20)
);
 */
public class PurchaseProductVO {
	private String entity_number;
	private String pd_name;
	private String brand_number;
	private String category;
	private String quality_grade;
	private int sale_price;
	private int buying_price;
	private Date purc_date;
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
	public String getBrand_number() {
		return brand_number;
	}
	public void setBrand_number(String brand_number) {
		this.brand_number = brand_number;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public int getBuying_price() {
		return buying_price;
	}
	public void setBuying_price(int buying_price) {
		this.buying_price = buying_price;
	}
	public Date getPurc_date() {
		return purc_date;
	}
	public void setPurc_date(Date purc_date) {
		this.purc_date = purc_date;
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
