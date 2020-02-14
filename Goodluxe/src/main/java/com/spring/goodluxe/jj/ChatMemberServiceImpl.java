package com.spring.goodluxe.jj;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.ChatMemberVO;
import com.spring.mapper.ChatMapper;
import com.spring.mapper.ChatMemberMapper;


@Service("chatmemberService")
public class ChatMemberServiceImpl implements ChatMemberService {

	@Autowired
	private SqlSession sqlSession;
	
	
	
	@Override
	public int addRoomMember(ChatMemberVO chatmembervo) throws Exception {
		int res = 0;
		try {
			ChatMemberMapper chatmemberMapper = sqlSession.getMapper(ChatMemberMapper.class);
			res = chatmemberMapper.addRoomMember(chatmembervo);
		}catch(Exception e) {
			System.out.println("ï¿½ï¿½ ï¿½ï¿½ï¿½ ï¿½ß°ï¿½ ï¿½ï¿½ï¿½ï¿½ +"+e.getMessage());
		}return res;
		// TODO Auto-generated method stub
	}

	@Override
	public ChatMemberVO getRoomMember(ChatMemberVO chatmembervo) throws Exception {
		ChatMemberVO vo = new ChatMemberVO();
		try {
			ChatMemberMapper chatmemberMapper = sqlSession.getMapper(ChatMemberMapper.class);
			vo = chatmemberMapper.getRoomMember(chatmembervo);
			
		}catch(Exception e) {
			System.out.println("ï¿½Â¸ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½+"+e.getMessage());
		}
		// TODO Auto-generated method stub
		return vo;
	}

	@Override
	public List<ChatMemberVO> sameRoomList(ChatMemberVO chatmembervo) throws Exception {
		ArrayList<ChatMemberVO> roomlist = new ArrayList<ChatMemberVO>();
		try {
			ChatMemberMapper chatmemberMapper = sqlSession.getMapper(ChatMemberMapper.class);
			roomlist = (ArrayList<ChatMemberVO>) chatmemberMapper.sameRoomList(chatmembervo);
		}catch(Exception e) {
			System.out.println("ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Æ® ï¿½Ì¾Æ¿ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½+"+e.getMessage());
		}
		// TODO Auto-generated method stub
		return roomlist;
	}

	@Override
	public int updateRoomMember(ChatMemberVO chatmembervo) throws Exception {
		int res=0;
		try {
			ChatMemberMapper chatmemberMapper = sqlSession.getMapper(ChatMemberMapper.class);
			res = chatmemberMapper.updateRoomMember(chatmembervo);
		}catch(Exception e) {
			System.out.println("ï¿½ï¿½ ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Æ® ï¿½ï¿½ï¿½ï¿½ +"+e.getMessage());
		}
		return res;
		// TODO Auto-generated method stub

	}

	@Override
	public int deleteRoomMember(ChatMemberVO chatmembervo) throws Exception {
		int res=0;
		try {
			ChatMemberMapper chatmemberMapper = sqlSession.getMapper(ChatMemberMapper.class);
			res = chatmemberMapper.deleteRoomMember(chatmembervo);
		}catch(Exception e) {
			System.out.println("ï¿½ï¿½ ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ +"+e.getMessage());
		}return res;
		// TODO Auto-generated method stub

	}

	@Override
	public List<ChatMemberVO> selectChatList()throws Exception{
		ArrayList<ChatMemberVO> chatlist = new ArrayList<ChatMemberVO>();
		try {
			ChatMemberMapper chatmemberMapper = sqlSession.getMapper(ChatMemberMapper.class);
			chatlist = (ArrayList<ChatMemberVO>) chatmemberMapper.selectChatList();
			if(chatlist.equals(null)) {
				System.out.println("chatlist=null");
				chatlist=null;
			}
		}catch(Exception e) {
			System.out.println("ï¿½ï¿½ï¿½ï¿½Æ® ï¿½Ì±ï¿½ ï¿½ï¿½ï¿½ï¿½+"+e.getMessage());
		}
		return chatlist;
		
	}
	
	@Override
	public int countRoomMember(String member_id)throws Exception{
		int res=0;
		try {
			ChatMemberMapper chatmemberMapper = sqlSession.getMapper(ChatMemberMapper.class);
			res = chatmemberMapper.countRoomMember(member_id); 
		}catch(Exception e) {
			System.out.println("count ï¿½ï¿½ï¿½ï¿½+"+e.getMessage());
		}
		return res;
	}
	
	@Override
	public List<ChatMemberVO> selectChatroomList(String member_id)throws Exception{
		ArrayList<ChatMemberVO> chatlist = new ArrayList<ChatMemberVO>();
		try {
<<<<<<< HEAD
		ChatMemberMapper chatmemberMapper = sqlSession.getMapper(ChatMemberMapper.class);
		chatlist = (ArrayList<ChatMemberVO>) chatmemberMapper.selectChatroomList(member_id);
		if(chatlist.equals(null)) {
			System.out.println("chatlist=null");
			chatlist=null;
		}
	}catch(Exception e) {
		System.out.println("¸®½ºÆ® »Ì±â ½ÇÆÐ+"+e.getMessage());
	}
	return chatlist;
	}

=======
			ChatMemberMapper chatmemberMapper = sqlSession.getMapper(ChatMemberMapper.class);
			chatlist = (ArrayList<ChatMemberVO>) chatmemberMapper.selectChatroomList(member_id);
			if(chatlist.equals(null)) {
				System.out.println("chatlist=null");
				chatlist=null;
			}
		}catch(Exception e) {
			System.out.println("ï¿½ï¿½ï¿½ï¿½Æ® ï¿½Ì±ï¿½ ï¿½ï¿½ï¿½ï¿½+"+e.getMessage());
		}
		return chatlist;
	}
>>>>>>> origin/master
}
