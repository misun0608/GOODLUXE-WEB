package com.spring.mapper;

import java.util.ArrayList;

import com.spring.goodluxe.voes.InquireVO;

public interface HelpMapper {
	public int inquireInsert(InquireVO inVO);
	public ArrayList<InquireVO> loadQBList();
	public InquireVO loadQPost(int inquire_number);
}
