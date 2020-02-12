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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createChatRoom(ChatVO chatvo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ChatVO> getRoomList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateChatCountInc(ChatVO chatvo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateChatCountDec(ChatVO chatvo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteChat() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ChatVO> searchRoomList(String chat_name) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}

	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

}
