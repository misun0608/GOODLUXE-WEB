package com.spring.mapper;

import java.util.List;

import com.spring.goodluxe.jj.ChatMemberVO;

public interface ChatMemberMapper {

	public void addRoomMember(ChatMemberVO chatmembervo) throws Exception;

	public ChatMemberVO getRoomMember(ChatMemberVO chatmembervo) throws Exception;

	public List<ChatMemberVO> sameRoomList(ChatMemberVO chatmembervo) throws Exception;

	public void updateRoomMember(ChatMemberVO chatmembervo) throws Exception;

	public void deleteRoomMember(ChatMemberVO chatmembervo) throws Exception;

}
