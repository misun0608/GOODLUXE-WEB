package com.spring.goodluxe.jj;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO selectMember1(String member_id)throws Exception{
		
		MemberVO membervo = null;
		try {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		System.out.println(member_id);
		membervo = memberMapper.selectMember1(member_id);
		if(membervo == null) {
			System.out.println("멤버 널~");
			
		}
		}catch(Exception e) {
			System.out.println("멤버 조회 실패+"+e.getMessage());
		}
		
		return membervo;
	}
	
	@Override
	public int insertMember(MemberVO membervo)throws Exception{
		int res=0;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			res= memberMapper.insertMember(membervo);
			if(res == 0) {
				System.out.println("추가 실패요");
			}
		}catch(Exception e) {
			System.out.println("멤버 추가 실패+"+e.getMessage());
		}
		return res;
		
	}
	
	@Override
	public int userCheckMember(String member_id)throws Exception{
		int count=0;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			count=memberMapper.userCheckMember(member_id);
			if(count==0) {
				System.out.println("체크 실패");
			}
			System.out.println("count="+count);
			
		}catch(Exception e) {
			System.out.println("멤버체크 실패+"+e.getMessage());
		}
		return count;
	}
	
	@Override
	public String pickNameMember(String member_id)throws Exception{
		String member_name = null;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			member_name=memberMapper.pickNameMember(member_id);
			
		}catch(Exception e) {
			System.out.println("멤버이름 픽+"+e.getMessage());
		}
		return member_name;
	}
	
	@Override
	public String pickisadminMember(String member_id)throws Exception{
		String member_isadmin = null;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			member_isadmin=memberMapper.pickisadminMember(member_id);
			
		}catch(Exception e) {
			System.out.println("멤버isadmin 픽+"+e.getMessage());
		}
		return member_isadmin;
	}
}
