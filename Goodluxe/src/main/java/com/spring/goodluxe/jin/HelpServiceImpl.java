package com.spring.goodluxe.jin;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.InquireCommentVO;
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

	@Override
	public int insertComment(InquireCommentVO commVO) throws Exception {
		int res = 0;
		try {
			HelpMapper helpMapper = sqlSession.getMapper(HelpMapper.class);
			int cnt = helpMapper.countComment();
			int commNum = 0;
			if(cnt == 0) {
				commNum = 1;
			} else {
				commNum = helpMapper.maxCommentNumber() + 1;
			}
			commVO.setComment_number(commNum);
			commVO.setComment_ref(commNum);
			commVO.setComment_ref_step(0);
			commVO.setComment_ref_level(0);
			
			res = helpMapper.insertComment(commVO);
			
			if(res != 0) {
				helpMapper.addCommentNum(commVO.getInquire_number());
			}
			
		} catch(Exception e) {
			System.out.println("ERROR(HelpSerivce/insertComment) : " + e.getMessage());
			throw new Exception("ERROR(HelpSerivce/insertComment)", e);
		}
		return res;
	}

	@Override
	public ArrayList<InquireCommentVO> commList(int inquire_number) throws Exception {
		ArrayList<InquireCommentVO> commList = null;
		try {
			HelpMapper helpMapper = sqlSession.getMapper(HelpMapper.class);
			commList = helpMapper.commList(inquire_number);
		} catch(Exception e) {
			System.out.println("ERROR(HelpService/commList) : " + e.getMessage());
			throw new Exception("ERROR(HelpService/commList)", e);
		}
		return commList;
	}
	
	
}
