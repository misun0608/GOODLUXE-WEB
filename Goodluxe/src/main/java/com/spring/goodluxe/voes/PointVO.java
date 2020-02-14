package com.spring.goodluxe.voes;

import java.sql.Timestamp;

public class PointVO {
	private int point_number;
	private Timestamp point_date;
	private String point_status;
	private int point_amount;
	private String member_id;
	private String order_number;
	
	public int getPoint_number() {
		return point_number;
	}
	public void setPoint_number(int point_number) {
		this.point_number = point_number;
	}
	public Timestamp getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}
	public String getPoint_status() {
		return point_status;
	}
	public void setPoint_status(String point_status) {
		this.point_status = point_status;
	}
	public int getPoint_amount() {
		return point_amount;
	}
	public void setPoint_amount(int point_amount) {
		this.point_amount = point_amount;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getOrder_number() {
		return order_number;
	}
	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}

}
