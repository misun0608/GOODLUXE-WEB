package com.spring.goodluxe.jj;

import java.util.List;

public interface ChatMemberService {

	public int addRoomMember(ChatMemberVO chatmembervo) throws Exception;

	public ChatMemberVO getRoomMember(ChatMemberVO chatmembervo) throws Exception;

	public List<ChatMemberVO> sameRoomList(ChatMemberVO chatmembervo) throws Exception;

	public int updateRoomMember(ChatMemberVO chatmembervo) throws Exception;

	public int deleteRoomMember(ChatMemberVO chatmembervo) throws Exception;
	
	public List<ChatMemberVO> selectChatList()throws Exception;
	
	public int countRoomMember(String member_id)throws Exception;
}
