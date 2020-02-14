package com.spring.mapper;

import com.spring.goodluxe.voes.Member2VO;

public interface Member2Mapper {
	Member2VO selectMember1(String member_id);
	int insertMember(Member2VO membervo);
	int userCheckMember(String member_id);
	String pickNameMember(String member_id);
	String pickisadminMember(String member_id);
}
