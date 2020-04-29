package com.spring.mapper;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.goodluxe.voes.InquireCommentVO;
import com.spring.goodluxe.voes.InquireVO;

public interface HelpMapper {
	public int inquireInsert(InquireVO inVO);
	public int inquireUpdate(InquireVO inVO);
	public int inquireDelete(int inquire_number);
	public int inquireCommentDelete(int inquire_number);
	public ArrayList<InquireVO> loadQBList(@Param("startRow")int startRow, @Param("endRow")int endRow);
	public InquireVO loadQPost(int inquire_number);
	public int countComment();
	public int maxCommentNumber();
	public int insertComment(InquireCommentVO commVO);
	public void addCommentNum(int inquire_number);
	public void subCommentNum(int inquire_number);
	public ArrayList<InquireCommentVO> commList(int inquire_number);
	public int countRefStep(@Param("ref")int ref, @Param("ref_step")int ref_step, @Param("ref_level")int ref_level);
	public int maxRefStep(int ref);
	public int calRefStep(@Param("ref")int ref, @Param("ref_step")int ref_step, @Param("ref_level")int ref_level);
	public void updateRefStep(@Param("ref")int ref, @Param("ref_step")int ref_step);
	public int updateComment(InquireCommentVO commVO);
	public int deleteComment(int comment_nubmer);
	public int getQBoardCount();
}
