package com.spring.goodluxe.jj;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("chatmemberService")
public class ChatMemberServiceImpl implements ChatMemberService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void addRoomMember(ChatMemberVO chatmembervo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public ChatMemberVO getRoomMember(ChatMemberVO chatmembervo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatMemberVO> sameRoomList(ChatMemberVO chatmembervo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateRoomMember(ChatMemberVO chatmembervo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteRoomMember(ChatMemberVO chatmembervo) throws Exception {
		// TODO Auto-generated method stub

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
