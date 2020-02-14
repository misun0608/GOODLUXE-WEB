package com.spring.goodluxe.jj;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.ChatVO;
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
			System.out.println("ä�ù� ����Ʈ �̱� ����+" + e.getMessage());
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
			System.out.println("�� üũ ����+"+e.getMessage());
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
			System.out.println("�� ���� ����+"+e.getMessage());
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
			System.out.println("�� ����Ʈ �������� ���� +"+e.getMessage());
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
			System.out.println("�ο��� ���� ����+"+e.getMessage());
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
			System.out.println("�ο��� ���� ����+"+e.getMessage());
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
			System.out.println("ä�� delete+"+e.getMessage());
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
			System.out.println("�� ����Ʈ �������� ����+"+e.getMessage());
		}
		// TODO Auto-generated method stub
		return roomlist;
	}

	

}
