package com.spring.goodluxe.voes;

import java.sql.Timestamp;

public class InquireVO {
	private int inquire_number;
	private String member_id;
	private String inquire_title;
	private String inquire_content;
	private Timestamp inquire_date;
	private int inquire_comment;
	private String inquire_public;
	
	public int getInquire_number() {
		return inquire_number;
	}
	public void setInquire_number(int inquire_number) {
		this.inquire_number = inquire_number;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getInquire_title() {
		return inquire_title;
	}
	public void setInquire_title(String inquire_title) {
		this.inquire_title = inquire_title;
	}
	public String getInquire_content() {
		return inquire_content;
	}
	public void setInquire_content(String inquire_content) {
		this.inquire_content = inquire_content;
	}
	public Timestamp getInquire_date() {
		return inquire_date;
	}
	public void setInquire_date(Timestamp inquire_date) {
		this.inquire_date = inquire_date;
	}
	public int getInquire_comment() {
		return inquire_comment;
	}
	public void setInquire_comment(int inquire_comment) {
		this.inquire_comment = inquire_comment;
	}
	public String getInquire_public() {
		return inquire_public;
	}
	public void setInquire_public(String inquire_public) {
		this.inquire_public = inquire_public;
	}
}
