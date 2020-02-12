package com.spring.goodluxe.jin;

import java.util.ArrayList;

import com.spring.goodluxe.voes.InquireVO;

public interface HelpService {
	public void inquireInsert(InquireVO inVO) throws Exception;
	public ArrayList<InquireVO> loadQBList() throws Exception;
	public InquireVO loadQPost(int inquire_number) throws Exception;
}
