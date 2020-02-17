package com.spring.goodluxe.jj;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.goodluxe.voes.Chat_recordVO;
import com.spring.mapper.Chat_recordMapper;

@Service("chat_recordService")
public class Chat_recordServiceImpl implements Chat_recordService{
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public ArrayList<Chat_recordVO> selectListchatRecord (String chat_room) throws Exception{
		ArrayList<Chat_recordVO> chatlist = null;
		try {
			Chat_recordMapper chat_recordMapper = sqlSession.getMapper(Chat_recordMapper.class);
			chatlist = chat_recordMapper.selectListchatRecord(chat_room);
		} catch (Exception e) {
			System.out.println("chatlist select fail+" + e.getMessage());
		}
		return chatlist;
	}
	
	
	@Override
	public int insertchatRecord(Chat_recordVO chatrecordvo)throws Exception{
		int res = 0;
		try {
			Chat_recordMapper chat_recordMapper = sqlSession.getMapper(Chat_recordMapper.class);
			res = chat_recordMapper.insertchatRecord(chatrecordvo);
		}catch(Exception e) {
			System.out.println("chatrecord add fail+"+e.getMessage());
		}
		return res;
	}
	
	@Override
	public ArrayList<Chat_recordVO> selectListchatRecordCount(String chat_room) throws Exception{
		ArrayList<Chat_recordVO> chatlistcount = null;
		try {
			Chat_recordMapper chat_recordMapper = sqlSession.getMapper(Chat_recordMapper.class);
			chatlistcount = chat_recordMapper.selectListchatRecordCount(chat_room);
		}catch(Exception e) {
			System.out.println("list count +"+e.getMessage());
		}
		return chatlistcount;
	}
}
