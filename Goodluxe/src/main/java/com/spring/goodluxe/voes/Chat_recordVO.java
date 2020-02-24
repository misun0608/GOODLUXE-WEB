package com.spring.goodluxe.voes;

import java.sql.Timestamp;

public class Chat_recordVO {
	
	private String member_id;
    private String chat_message;
    private Timestamp chat_timestamp;
    private String chat_room;
    private int chat_count;
    
    
	public String getMember_id() {
		return member_id;
	}
	public String getChat_message() {
		return chat_message;
	}
	public Timestamp getChat_timestamp() {
		return chat_timestamp;
	}
	public String getChat_room() {
		return chat_room;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public void setChat_message(String chat_message) {
		this.chat_message = chat_message;
	}
	public void setChat_timestamp(Timestamp chat_timestamp) {
		this.chat_timestamp = chat_timestamp;
	}
	public void setChat_room(String chat_room) {
		this.chat_room = chat_room;
	}
	public int getChat_count() {
		return chat_count;
	}
	public void setChat_count(int chat_count) {
		this.chat_count = chat_count;
	}
    
    

}
