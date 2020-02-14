package com.spring.goodluxe.voes;


public class ChatVO {
	private int chat_num;
	private String chat_name;
	private int chat_totalcount;
	private int chat_remaincount;
	private String chat_content;
	
	
	public int getChat_num() {
		return chat_num;
	}
	public String getChat_name() {
		return chat_name;
	}
	public int getChat_totalcount() {
		return chat_totalcount;
	}
	public int getChat_remaincount() {
		return chat_remaincount;
	}
	public String getChat_content() {
		return chat_content;
	}
	public void setChat_num(int chat_num) {
		this.chat_num = chat_num;
	}
	public void setChat_name(String chat_name) {
		this.chat_name = chat_name;
	}
	public void setChat_totalcount(int chat_totalcount) {
		this.chat_totalcount = chat_totalcount;
	}
	public void setChat_remaincount(int chat_remaincount) {
		this.chat_remaincount = chat_remaincount;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	
	
	
}
