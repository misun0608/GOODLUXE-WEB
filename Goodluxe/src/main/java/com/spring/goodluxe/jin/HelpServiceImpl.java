package com.spring.goodluxe.jin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HelpServiceImpl {
	@Autowired
	private SqlSession sqlSession;
	
	
}
