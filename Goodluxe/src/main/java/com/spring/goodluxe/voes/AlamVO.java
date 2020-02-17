package com.spring.goodluxe.voes;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class AlamVO {
	
	private int alam_number;
	private String member_id;
	private Date alam_date;
	private String alam_read;
	private String alam_linkpage;
	public int getAlam_number() {
		return alam_number;
	}
	public void setAlam_number(int alam_number) {
		this.alam_number = alam_number;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getAlam_date() {
		return alam_date;
	}
	public void setAlam_date(Date alam_date) {
		this.alam_date = alam_date;
	}
	public String getAlam_read() {
		return alam_read;
	}
	public void setAlam_read(String alam_read) {
		this.alam_read = alam_read;
	}
	public String getAlam_linkpage() {
		return alam_linkpage;
	}
	public void setAlam_linkpage(String alam_linkpage) {
		this.alam_linkpage = alam_linkpage;
	}

	
}
