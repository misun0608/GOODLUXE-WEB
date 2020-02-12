package com.spring.goodluxe.jin;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.InquireVO;
import com.spring.mapper.HelpMapper;

@Service
public class HelpServiceImpl implements HelpService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void inquireInsert(InquireVO inVO) throws Exception {
		try {
			HelpMapper helpMapper = sqlSession.getMapper(HelpMapper.class);
			int res = helpMapper.inquireInsert(inVO);
			
			if(res == 0) {
				System.out.println("ERROR(HelpService/inquireInsert) : 게시글 등록 실패");
			}
		} catch(Exception e) {
			System.out.println("ERROR(HelpService/inquireInsert) : " + e.getMessage());
			throw new Exception("ERROR(HelpService/inquireInsert)", e);
		}
	}

	@Override
	public ArrayList<InquireVO> loadQBList() throws Exception {
		ArrayList<InquireVO> qbList = null;
		try {
			HelpMapper helpMapper = sqlSession.getMapper(HelpMapper.class);
			qbList = helpMapper.loadQBList();
		} catch(Exception e) {
			System.out.println("ERROR(HelpService/loadQBList) : " + e.getMessage());
			throw new Exception("ERROR(HelpService/loadQBList)", e);
		}
		return qbList;
	}

	@Override
	public InquireVO loadQPost(int inquire_number) throws Exception {
		InquireVO qPost = null;
		try {
			HelpMapper helpMapper = sqlSession.getMapper(HelpMapper.class);
			qPost = helpMapper.loadQPost(inquire_number);
		} catch(Exception e) {
			System.out.println("ERROR(HelpService/loadQPost) : " + e.getMessage());
			throw new Exception("ERROR(HelpService/loadQPost)", e);
		}
		return qPost;
	}
	
	
}
