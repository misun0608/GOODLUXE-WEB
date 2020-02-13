package com.spring.goodluxe.jj;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ChatMapper;

@Service("chatService")
public class ChatServiceImpl implements ChatService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<ChatVO> SelectChatList() throws Exception {
		ArrayList<ChatVO> chatlist = null;

		try {
			ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
			chatlist = chatMapper.SelectChatList();
		} catch (Exception e) {
			System.out.println("채팅방 리스트 뽑기 실패+" + e.getMessage());
		}
		return chatlist;
	}

	@Override
	public ChatVO checkRoom(String chat_name) throws Exception {
		ChatVO chatvo = new ChatVO();
		
		try {
			ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
			chatvo = chatMapper.checkRoom(chat_name);
		}catch(Exception e) {
			System.out.println("방 체크 실패+"+e.getMessage());
		}
		return chatvo;
		// TODO Auto-generated method stub
	}

	@Override
	public int createChatRoom(ChatVO chatvo) throws Exception {
		int res= 0;
		try {
			ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
			res= chatMapper.createChatRoom(chatvo);
			
		}catch(Exception e){
			System.out.println("방 생성 실패+"+e.getMessage());
		}
		return res;
		// TODO Auto-generated method stub
	}

	@Override
	public List<ChatVO> getRoomList() throws Exception {
		ArrayList<ChatVO> chatlist = new ArrayList<ChatVO>();
		
		try {
			ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
			chatlist = (ArrayList<ChatVO>) chatMapper.getRoomList();
		}catch(Exception e) {
			System.out.println("룸 리스트 가져오기 실패 +"+e.getMessage());
		}
		// TODO Auto-generated method stub
		return chatlist;
	}

	@Override
	public int updateChatCountInc(ChatVO chatvo) throws Exception {
		int res=0;
		try {
			ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
			res = chatMapper.updateChatCountInc(chatvo);
		}catch(Exception e) {
			System.out.println("인원수 증가 실패+"+e.getMessage());
		}
		return res;
		// TODO Auto-generated method stub

	}

	@Override
	public int updateChatCountDec(ChatVO chatvo) throws Exception {
		int res=0;
		try {
			ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
			res = chatMapper.updateChatCountDec(chatvo);
		}catch(Exception e) {
			System.out.println("인원수 감소 실패+"+e.getMessage());
		}
		return res;
		// TODO Auto-generated method stub
	}

	@Override
	public int deleteChat() throws Exception {
		int res = 0;
		try {
			ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
			res= chatMapper.deleteChat();
		}catch(Exception e) {
			System.out.println("채팅 delete+"+e.getMessage());
		}
		return res;
		// TODO Auto-generated method stub

	}

	@Override
	public List<ChatVO> searchRoomList(String chat_name) throws Exception {
		ArrayList<ChatVO> roomlist = new ArrayList<ChatVO>();
		
		try {
			ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
			roomlist = (ArrayList<ChatVO>) chatMapper.searchRoomList(chat_name);
		}catch(Exception e) {
			System.out.println("룸 리스트 가져오기 실패+"+e.getMessage());
		}
		// TODO Auto-generated method stub
		return roomlist;
	}

	

}
