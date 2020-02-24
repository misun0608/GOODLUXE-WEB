package com.spring.goodluxe.voes;

import java.sql.Timestamp;

public class Chat_recordcountVO {
	private String member_id;
    private String chat_message;
    private Timestamp chat_timestamp;
    private String chat_room;
    private int chat_room_rank;
    
    
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
	public int getChat_room_rank() {
		return chat_room_rank;
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
	public void setChat_room_rank(int chat_room_rank) {
		this.chat_room_rank = chat_room_rank;
	}
    
    
}
