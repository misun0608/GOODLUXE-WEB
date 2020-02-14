package com.spring.mapper;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.goodluxe.voes.InquireCommentVO;
import com.spring.goodluxe.voes.InquireVO;

public interface HelpMapper {
	public int inquireInsert(InquireVO inVO);
	public ArrayList<InquireVO> loadQBList();
	public InquireVO loadQPost(int inquire_number);
	public int countComment();
	public int maxCommentNumber();
	public int insertComment(InquireCommentVO commVO);
	public void addCommentNum(int inquire_number);
	public void subCommentNum(int inquire_number);
	public ArrayList<InquireCommentVO> commList(int inquire_number);
	public int calRefLev(@Param("ref")int ref, @Param("ref_level")int ref_level);
	public void updateRefStep(int ref_step);
	
}
