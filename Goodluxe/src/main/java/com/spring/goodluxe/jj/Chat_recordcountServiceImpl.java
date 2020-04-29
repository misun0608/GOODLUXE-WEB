package com.spring.goodluxe.jj;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.Chat_recordcountVO;
import com.spring.mapper.Chat_recordcountMapper;

@Service("chat_recordcountService")
public class Chat_recordcountServiceImpl implements Chat_recordcountService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<Chat_recordcountVO> selectListChatRecordcountdown()throws Exception{
		ArrayList<Chat_recordcountVO> chatrecordcountlist = new ArrayList<Chat_recordcountVO>();
		
		try {
			Chat_recordcountMapper chat_recordcountMapper = sqlSession.getMapper(Chat_recordcountMapper.class);
			chatrecordcountlist = chat_recordcountMapper.selectListChatRecordcountdown();
			
		}catch(Exception e) {
			System.out.println("chat recordcount list +"+e.getMessage());
		}
		return chatrecordcountlist;
	}
}
