package com.spring.goodluxe.jin;

import java.util.ArrayList;

import com.spring.goodluxe.voes.InquireCommentVO;
import com.spring.goodluxe.voes.InquireVO;

public interface HelpService {
	public void inquireInsert(InquireVO inVO) throws Exception;
	public void inquireUpdate(InquireVO inVO) throws Exception;
	public void inquireDelete(int inquire_number) throws Exception;
	public ArrayList<InquireVO> loadQBList(int startRow, int endRow) throws Exception;
	public InquireVO loadQPost(int inquire_number) throws Exception;
	public ArrayList<InquireCommentVO> commList(int inquire_number) throws Exception;
	public int insertComment(InquireCommentVO commVO) throws Exception;
	public int insertReComment(InquireCommentVO commVO) throws Exception;
	public int updateComment(InquireCommentVO commVO) throws Exception;
	public int deleteComment(InquireCommentVO commVO) throws Exception;
	public int getQBoardCount(int startRow, int endRow) throws Exception;
}
