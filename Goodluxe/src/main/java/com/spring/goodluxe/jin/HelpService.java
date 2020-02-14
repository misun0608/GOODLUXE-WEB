package com.spring.goodluxe.jin;

import java.util.ArrayList;

import com.spring.goodluxe.voes.InquireCommentVO;
import com.spring.goodluxe.voes.InquireVO;

public interface HelpService {
	public void inquireInsert(InquireVO inVO) throws Exception;
	public ArrayList<InquireVO> loadQBList() throws Exception;
	public InquireVO loadQPost(int inquire_number) throws Exception;
	public int insertComment(InquireCommentVO commVO) throws Exception;
	public ArrayList<InquireCommentVO> commList(int inquire_number) throws Exception;
}
