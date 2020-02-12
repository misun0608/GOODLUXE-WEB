package com.spring.goodluxe.jj;

import java.util.List;

public interface ChatMemberService {

	public void addRoomMember(ChatMemberVO chatmembervo) throws Exception;

	public ChatMemberVO getRoomMember(ChatMemberVO chatmembervo) throws Exception;

	public List<ChatMemberVO> sameRoomList(ChatMemberVO chatmembervo) throws Exception;

	public void updateRoomMember(ChatMemberVO chatmembervo) throws Exception;

	public void deleteRoomMember(ChatMemberVO chatmembervo) throws Exception;
}
