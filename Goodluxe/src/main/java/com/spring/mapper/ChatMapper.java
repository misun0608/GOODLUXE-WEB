package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import com.spring.goodluxe.jj.ChatVO;

public interface ChatMapper {

	
	ArrayList<ChatVO> SelectChatList();
	
	public ChatVO checkRoom(String chat_name);

	public void createChatRoom(ChatVO chatvo);

	public List<ChatVO> getRoomList();

	public void updateChatCountInc(ChatVO chatvo);

	public void updateChatCountDec(ChatVO chatvo);

	public void deleteChat();

	public List<ChatVO> searchRoomList(String chat_name);

}
