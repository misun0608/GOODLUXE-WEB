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
	public void inquireUpdate(InquireVO inVO) throws Exception {
		try {
			HelpMapper helpMapper = sqlSession.getMapper(HelpMapper.class);
			System.out.println("service : " + inVO.getInquire_number() + " " + inVO.getInquire_content());
			int res = helpMapper.inquireUpdate(inVO);
			
			if(res == 0) {
				System.out.println("ERROR(HelpService/inquireUpdate) : 게시글 수정 실패");
			}
		} catch(Exception e) {
			System.out.println("ERROR(HelpService/inquireUpdate) : " + e.getMessage());
			throw new Exception("ERROR(HelpService/inquireUpdate)", e);
		}
	}
	
	@Override
	public void inquireDelete(int inquire_number) throws Exception {
		try {
			HelpMapper helpMapper = sqlSession.getMapper(HelpMapper.class);
			int res = helpMapper.inquireDelete(inquire_number);
			
			if(res == 0) {
				System.out.println("ERROR(HelpService/inquireDelete) : 게시글 삭제 실패");
			} else {
				helpMapper.inquireCommentDelete(inquire_number);
			}
		} catch(Exception e) {
			System.out.println("ERROR(HelpService/inquireDelete) : " + e.getMessage());
			throw new Exception("ERROR(HelpService/inquireDelete)", e);
		}
	}

	@Override
	public ArrayList<InquireVO> loadQBList(int startRow, int endRow) throws Exception {
		ArrayList<InquireVO> qbList = null;
		try {
			HelpMapper helpMapper = sqlSession.getMapper(HelpMapper.class);
			qbList = helpMapper.loadQBList(startRow, endRow);
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

	@Override
	public int insertComment(InquireCommentVO commVO) throws Exception {
		int res = 0;
		try {
			HelpMapper helpMapper = sqlSession.getMapper(HelpMapper.class);
			int commNum = setCommNum();
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
	public int insertReComment(InquireCommentVO commVO) throws Exception {
		int res = 0;
		try {
			HelpMapper helpMapper = sqlSession.getMapper(HelpMapper.class);
			int ref = commVO.getComment_ref();
			int ref_step = commVO.getComment_ref_step();
			int ref_level = commVO.getComment_ref_level();
			int commNum = setCommNum();
			commVO.setComment_number(commNum);
			
			int num = helpMapper.countRefStep(ref, ref_step, ref_level);
			if(num == 0) {
				ref_step = helpMapper.maxRefStep(ref) + 1;
			} else {
				ref_step = helpMapper.calRefStep(ref, ref_step, ref_level);
				helpMapper.updateRefStep(ref, ref_step);
			}
			commVO.setComment_ref_step(ref_step);
			commVO.setComment_ref_level(ref_level + 1);
			
			res = helpMapper.insertComment(commVO);
			
			if(res != 0) { helpMapper.addCommentNum(commVO.getInquire_number()); }
			
		} catch(Exception e) {
			System.out.println("ERROR(HelpSerivce/insertComment) : " + e.getMessage());
			throw new Exception("ERROR(HelpSerivce/insertComment)", e);
		}
		return res;
	}
	
	private int setCommNum() {
		int commNum = 0;
		try {
			HelpMapper helpMapper = sqlSession.getMapper(HelpMapper.class);
			int cnt = helpMapper.countComment();
			if(cnt == 0) { commNum = 1; }
			else { commNum = helpMapper.maxCommentNumber() + 1; }
		} catch(Exception e) {
			System.out.println("ERROR(HelpSerivce/setCommNum) : " + e.getMessage());
		}
		return commNum;
	}

	@Override
	public int updateComment(InquireCommentVO commVO) throws Exception {
		int res = 0;
		try {
			HelpMapper helpMapper = sqlSession.getMapper(HelpMapper.class);
			res = helpMapper.updateComment(commVO);
		} catch(Exception e) {
			System.out.println("ERROR(HelpSerivce/updateComment) : " + e.getMessage());
			throw new Exception("ERROR(HelpSerivce/updateComment)", e);
		}
		return res;
	}

	@Override
	public int deleteComment(InquireCommentVO commVO) throws Exception {
		int res = 0;
		try {
			HelpMapper helpMapper = sqlSession.getMapper(HelpMapper.class);
			res = helpMapper.deleteComment(commVO.getComment_number());
			
			if(res != 0) { helpMapper.subCommentNum(commVO.getInquire_number()); }
		} catch(Exception e) {
			System.out.println("ERROR(HelpSerivce/deleteComment) : " + e.getMessage());
			throw new Exception("ERROR(HelpSerivce/deleteComment)", e);
		}
		return res;
	}

	// Pagination
	@Override
	public int getQBoardCount(int startRow, int endRow) throws Exception {
		int count = 0;
		
		try {
			HelpMapper helpMapper = sqlSession.getMapper(HelpMapper.class);
			count = helpMapper.getQBoardCount();
		} catch(Exception e) {
			System.out.println("ERROR(HelpSerivce/getQBoardCount) : " + e.getMessage());
			throw new Exception("ERROR(HelpSerivce/getQBoardCount)", e);
		}
		return count;
	}


	
	
}
