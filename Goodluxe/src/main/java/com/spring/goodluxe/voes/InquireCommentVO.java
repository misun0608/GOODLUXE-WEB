package com.spring.goodluxe.voes;

import java.sql.Timestamp;

public class InquireCommentVO {
	private int comment_number;
	private int inquire_number;
	private String member_id;
	private String comment_content;
	private Timestamp comment_date;
	private int comment_ref;
	private int comment_ref_step;
	private int comment_ref_level;
	private String comment_ref_writer;
	public int getComment_number() {
		return comment_number;
	}
	public void setComment_number(int comment_number) {
		this.comment_number = comment_number;
	}
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
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Timestamp getComment_date() {
		return comment_date;
	}
	public void setComment_date(Timestamp comment_date) {
		this.comment_date = comment_date;
	}
	public int getComment_ref() {
		return comment_ref;
	}
	public void setComment_ref(int comment_ref) {
		this.comment_ref = comment_ref;
	}
	public int getComment_ref_step() {
		return comment_ref_step;
	}
	public void setComment_ref_step(int comment_ref_step) {
		this.comment_ref_step = comment_ref_step;
	}
	public int getComment_ref_level() {
		return comment_ref_level;
	}
	public void setComment_ref_level(int comment_ref_level) {
		this.comment_ref_level = comment_ref_level;
	}
	public String getComment_ref_writer() {
		return comment_ref_writer;
	}
	public void setComment_ref_writer(String comment_ref_writer) {
		this.comment_ref_writer = comment_ref_writer;
	}
}
