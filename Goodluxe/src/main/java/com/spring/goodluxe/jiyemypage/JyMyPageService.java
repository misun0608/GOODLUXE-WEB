package com.spring.goodluxe.jiyemypage;

import com.spring.goodluxe.voes.MemberVO;

public interface JyMyPageService {
	MemberVO getMemberInfo(String member_id) throws Exception;
}
