package com.spring.goodluxe.jj;

import java.util.ArrayList;
import java.util.List;

import com.spring.goodluxe.voes.ChatVO;

public interface ChatService {

	ArrayList<ChatVO> SelectChatList() throws Exception;

	public ChatVO checkRoom(String chat_name) throws Exception;

	public int createChatRoom(ChatVO chatvo) throws Exception;

	public List<ChatVO> getRoomList() throws Exception;

	public int updateChatCountInc(ChatVO chatvo) throws Exception;

	public int updateChatCountDec(ChatVO chatvo) throws Exception;

	public int deleteChat() throws Exception;

	public List<ChatVO> searchRoomList(String chat_name) throws Exception;

}