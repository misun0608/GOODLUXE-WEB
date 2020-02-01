package com.spring.goodluxe.jiyemypage;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.MemberVO;
import com.spring.mapper.JyMyPageMapper;

@Service("jyMyPageService")
public class JyMyPageServiceImpl implements JyMyPageService {
	@Autowired
	private SqlSession sqlSession;

	public MemberVO getMemberInfo(String member_id) throws Exception{
		
		JyMyPageMapper jymypageMapper = sqlSession.getMapper(JyMyPageMapper.class);

		MemberVO memberVO = new MemberVO();
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("member_id", member_id);
		
		memberVO = jymypageMapper.getMemberInfo(map);
		System.out.println("서비스"+memberVO);
		return memberVO;
	}
	
	
	
}
