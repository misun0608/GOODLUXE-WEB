package com.spring.goodluxe.jj;

import java.util.ArrayList;
import java.util.List;

public interface ChatService {

	ArrayList<ChatVO> SelectChatList() throws Exception;

	public ChatVO checkRoom(String chat_name) throws Exception;

	public void createChatRoom(ChatVO chatvo) throws Exception;

	public List<ChatVO> getRoomList() throws Exception;

	public void updateChatCountInc(ChatVO chatvo) throws Exception;

	public void updateChatCountDec(ChatVO chatvo) throws Exception;

	public void deleteChat() throws Exception;

	public List<ChatVO> searchRoomList(String chat_name) throws Exception;

}