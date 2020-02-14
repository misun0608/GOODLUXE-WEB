package com.spring.goodluxe.jj;

import com.spring.goodluxe.voes.Member2VO;

public interface Member2Service {
	Member2VO selectMember1(String member_id)throws Exception;
	int insertMember(Member2VO membervo)throws Exception;
	int userCheckMember(String member_id)throws Exception;
	String pickNameMember(String member_id)throws Exception;
	String pickisadminMember(String member_id)throws Exception;
}
