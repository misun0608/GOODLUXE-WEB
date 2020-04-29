package com.spring.goodluxe.voes;

import java.sql.Timestamp;

/*
 create table gl_notice(
	alarm_number varchar2(20),
	member_id varchar2(30),
    alarm_date timestamp(6),
    alarm_read varchar2(5),
    alarm_content varchar2(1000),
    entity_number varchar2(20)
);

	//alarm_number에 들어가는 시퀀스
	create sequence gl_notice_seq
	start with 1
	increment by 1;


 */

//헤더에 붙어있는 알람 VO
public class NoticeVO {
	private String alarm_number;
	private String member_id;
	private Timestamp alarm_date;
	private String alarm_read;
	private String alarm_content;
	private String entity_number;
	public String getAlarm_number() {
		return alarm_number;
	}
	public void setAlarm_number(String alarm_number) {
		this.alarm_number = alarm_number;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Timestamp getAlarm_date() {
		return alarm_date;
	}
	public void setAlarm_date(Timestamp alarm_date) {
		this.alarm_date = alarm_date;
	}
	public String getAlarm_read() {
		return alarm_read;
	}
	public void setAlarm_read(String alarm_read) {
		this.alarm_read = alarm_read;
	}
	public String getAlarm_content() {
		return alarm_content;
	}
	public void setAlarm_content(String alarm_content) {
		this.alarm_content = alarm_content;
	}
	public String getEntity_number() {
		return entity_number;
	}
	public void setEntity_number(String entity_number) {
		this.entity_number = entity_number;
	}
	
}
