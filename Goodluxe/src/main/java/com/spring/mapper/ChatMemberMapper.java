package com.spring.mapper;

import java.util.List;

import com.spring.goodluxe.voes.ChatMemberVO;

public interface ChatMemberMapper {

	public int addRoomMember(ChatMemberVO chatmembervo) throws Exception;

	public ChatMemberVO getRoomMember(ChatMemberVO chatmembervo) throws Exception;

	public List<ChatMemberVO> sameRoomList(ChatMemberVO chatmembervo) throws Exception;

	public int updateRoomMember(ChatMemberVO chatmembervo) throws Exception;

	public int deleteRoomMember(ChatMemberVO chatmembervo) throws Exception;
	
	public List<ChatMemberVO> selectChatList()throws Exception;
	
	public int countRoomMember(String member_id)throws Exception;
	
	public List<ChatMemberVO> selectChatroomList(String member_id)throws Exception;
	
	public String whereisthechatroom(String member_id)throws Exception;
}
