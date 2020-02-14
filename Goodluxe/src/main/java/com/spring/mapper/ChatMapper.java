package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import com.spring.goodluxe.voes.ChatVO;

public interface ChatMapper {

	
	ArrayList<ChatVO> SelectChatList();
	
	public ChatVO checkRoom(String chat_name);

	public int createChatRoom(ChatVO chatvo);

	public List<ChatVO> getRoomList();

	public int updateChatCountInc(ChatVO chatvo);

	public int updateChatCountDec(ChatVO chatvo);

	public int deleteChat();

	public List<ChatVO> searchRoomList(String chat_name);

}
