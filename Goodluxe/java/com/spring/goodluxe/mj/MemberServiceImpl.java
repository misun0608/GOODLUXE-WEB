package com.spring.goodluxe.mj;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.MemberVO;
import com.spring.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public String userChk(MemberVO membervo) throws Exception {
		MemberVO member_db;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			member_db = memberMapper.userChk(membervo);
			
			if(member_db == null)
				return "non-member";
			
			if(!member_db.getMember_pw().equals(membervo.getMember_pw()))
				return "wrong_pw";
			
			// 이렇게 하면 안 됨.
			// membervo = member_db;
			
			membervo.setMember_id(member_db.getMember_id());
			membervo.setMember_class(member_db.getMember_class());
			membervo.setMember_isadmin(member_db.getMember_isadmin());
			
			
		} catch (Exception e) {
			System.out.println("ERROR(MemberService/userChk) : " + e.getMessage());
			return "error_accur";
		}

		return "ok";
	}

}
