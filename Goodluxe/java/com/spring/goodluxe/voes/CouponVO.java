package com.spring.goodluxe.voes;

import java.sql.Timestamp;

public class CouponVO {
	private String coupon_number;	// 쿠폰번호
	private String coupon_type;		// 쿠폰종류
	private Timestamp coupon_expire;	// 쿠폰기한
	private String coupon_status;	// 쿠폰 상태
	private String member_id;
	
	public String getCoupon_number() {
		return coupon_number;
	}
	public void setCoupon_number(String coupon_number) {
		this.coupon_number = coupon_number;
	}
	public String getCoupon_type() {
		return coupon_type;
	}
	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}
	public Timestamp getCoupon_expire() {
		return coupon_expire;
	}
	public void setCoupon_expire(Timestamp coupon_expire) {
		this.coupon_expire = coupon_expire;
	}
	public String getCoupon_status() {
		return coupon_status;
	}
	public void setCoupon_status(String coupon_status) {
		this.coupon_status = coupon_status;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}		
	
}
