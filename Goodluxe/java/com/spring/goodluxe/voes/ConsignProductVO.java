package com.spring.goodluxe.voes;

import java.util.Date;

/*
 *create table gl_consignment(
    entity_number varchar2(30) primary key,
    pd_name varchar2(100) not null,
    pd_brand  varchar2(30),
    pd_category varchar2(30) not null,
    quality_grade varchar2(10) not null,
    sale_price number,
    commission number,
    start_date date,
    end_date date,
    sale_status varchar2(30) not null,
    appraise_exist varchar2(10),
    pd_component varchar2(200),
    member_id varchar2(20)
);
 */
public class ConsignProductVO extends ProductVO{
	private String entity_number;
	private String pd_name;
	private String pd_brand;
	private String pd_category;
	private String quality_grade;
	private int sale_price;
	private int commission;
	private Date start_date;
	private Date end_date;
	private String sale_status;
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
	public int getCommission() {
		return commission;
	}
	public void setCommission(int commission) {
		this.commission = commission;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getSale_status() {
		return sale_status;
	}
	public void setSale_status(String sale_status) {
		this.sale_status = sale_status;
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