package com.spring.goodluxe.jj;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.ChatMemberVO;
import com.spring.mapper.ChatMapper;
import com.spring.mapper.ChatMemberMapper;
import com.spring.mapper.Chat_recordMapper;


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
			System.out.println("占쏙옙 占쏙옙占� 占쌩곤옙 占쏙옙占쏙옙 +"+e.getMessage());
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
			System.out.println("占승몌옙占� 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙+"+e.getMessage());
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
			System.out.println("占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙트 占싱아울옙占쏙옙 占쏙옙占쏙옙+"+e.getMessage());
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
			System.out.println("占쏙옙 占쏙옙占� 占쏙옙占쏙옙占쏙옙트 占쏙옙占쏙옙 +"+e.getMessage());
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
			System.out.println("占쏙옙 占쏙옙占� 占쏙옙占쏙옙 占쏙옙占쏙옙 +"+e.getMessage());
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
			System.out.println("占쏙옙占쏙옙트 占싱깍옙 占쏙옙占쏙옙+"+e.getMessage());
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
			System.out.println("count 占쏙옙占쏙옙+"+e.getMessage());
		}
		return res;
	}
	
	@Override
	public List<ChatMemberVO> selectChatroomList(String member_id)throws Exception{
		ArrayList<ChatMemberVO> chatlist = new ArrayList<ChatMemberVO>();
		try {
		ChatMemberMapper chatmemberMapper = sqlSession.getMapper(ChatMemberMapper.class);
		chatlist = (ArrayList<ChatMemberVO>) chatmemberMapper.selectChatroomList(member_id);
		if(chatlist.equals(null)) {
			System.out.println("chatlist=null");
			chatlist=null;
		}
	}catch(Exception e) {
		System.out.println("리스트 뽑기 실패+"+e.getMessage());
	}
	return chatlist;
	}
	
	@Override
	public String whereisthechatroom(String member_id)throws Exception{
		String memid=null;
		try {
			ChatMemberMapper chatmemberMapper = sqlSession.getMapper(ChatMemberMapper.class);
			memid = chatmemberMapper.whereisthechatroom(member_id);
		}catch(Exception e) {
			System.out.println("whereisthechatroom+"+e.getMessage());
		}
		return memid;
	}
}
