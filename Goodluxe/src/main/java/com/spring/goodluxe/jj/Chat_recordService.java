package com.spring.goodluxe.jj;

import java.util.ArrayList;

import com.spring.goodluxe.voes.Chat_recordVO;

public interface Chat_recordService {
	public ArrayList<Chat_recordVO> selectListchatRecord (String chat_room) throws Exception;
	public ArrayList<Chat_recordVO> selectListchatRecordCount (String chat_room) throws Exception;
	public int insertchatRecord(Chat_recordVO chatrecordvo)throws Exception;
}