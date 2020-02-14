package com.spring.goodluxe.voes;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Member2VO {
	 private String member_id;
	 private String member_pw;
	 private String member_name; 
	 private String member_zipcode; 
	 private String member_addr1; 
	 private String member_addr2; 
	 private String member_phone; 
	 private String member_email; 
	 private String member_email_receive; 
	 private String member_like_brand; 
  	 private String member_like_category; 
  	 private Date member_join_date; 
  	 private String member_class; 
  	 private int member_point;
  	 private String member_isadmin;
  	 
  	 
	public String getMember_id() {
		return member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public String getMember_zipcode() {
		return member_zipcode;
	}
	public String getMember_addr1() {
		return member_addr1;
	}
	public String getMember_addr2() {
		return member_addr2;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public String getMember_email_receive() {
		return member_email_receive;
	}
	public String getMember_like_brand() {
		return member_like_brand;
	}
	public String getMember_like_category() {
		return member_like_category;
	}
	public Date getMember_join_date() {
		return member_join_date;
	}
	public String getMember_class() {
		return member_class;
	}
	public int getMember_point() {
		return member_point;
	}
	public String getMember_isadmin() {
		return member_isadmin;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}
	public void setMember_addr1(String member_addr1) {
		this.member_addr1 = member_addr1;
	}
	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public void setMember_email_receive(String member_email_receive) {
		this.member_email_receive = member_email_receive;
	}
	public void setMember_like_brand(String member_like_brand) {
		this.member_like_brand = member_like_brand;
	}
	public void setMember_like_category(String member_like_category) {
		this.member_like_category = member_like_category;
	}
	public void setMember_join_date(Date member_join_date) {
		this.member_join_date = member_join_date;
	}
	public void setMember_class(String member_class) {
		this.member_class = member_class;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	public void setMember_isadmin(String member_isadmin) {
		this.member_isadmin = member_isadmin;
	}
  	 
  	 
  	 
	
  	 
  	 
  	 
}
