package com.spring.goodluxe.jiyemypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("jyMyPageService")
public class JyMyPageServiceImpl implements JyMyPageService {
	@Autowired
	private SqlSession sqlSession;
	
	
	
}
