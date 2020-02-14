package com.spring.goodluxe.jj;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.Member2VO;
import com.spring.mapper.Member2Mapper;

@Service
public class Member2ServiceImpl implements Member2Service {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public Member2VO selectMember1(String member_id)throws Exception{
		
		Member2VO membervo = null;
		try {
		Member2Mapper memberMapper = sqlSession.getMapper(Member2Mapper.class);
		System.out.println(member_id);
		membervo = memberMapper.selectMember1(member_id);
		if(membervo == null) {
			System.out.println("��� ��~");
			
		}
		}catch(Exception e) {
			System.out.println("��� ��ȸ ����+"+e.getMessage());
		}
		
		return membervo;
	}
	
	@Override
	public int insertMember(Member2VO membervo)throws Exception{
		int res=0;
		try {
			Member2Mapper memberMapper = sqlSession.getMapper(Member2Mapper.class);
			res= memberMapper.insertMember(membervo);
			if(res == 0) {
				System.out.println("�߰� ���п�");
			}
		}catch(Exception e) {
			System.out.println("��� �߰� ����+"+e.getMessage());
		}
		return res;
		
	}
	
	@Override
	public int userCheckMember(String member_id)throws Exception{
		int count=0;
		try {
			Member2Mapper memberMapper = sqlSession.getMapper(Member2Mapper.class);
			count=memberMapper.userCheckMember(member_id);
			if(count==0) {
				System.out.println("üũ ����");
			}
			System.out.println("count="+count);
			
		}catch(Exception e) {
			System.out.println("���üũ ����+"+e.getMessage());
		}
		return count;
	}
	
	@Override
	public String pickNameMember(String member_id)throws Exception{
		String member_name = null;
		try {
			Member2Mapper memberMapper = sqlSession.getMapper(Member2Mapper.class);
			member_name=memberMapper.pickNameMember(member_id);
			
		}catch(Exception e) {
			System.out.println("����̸� ��+"+e.getMessage());
		}
		return member_name;
	}
	
	@Override
	public String pickisadminMember(String member_id)throws Exception{
		String member_isadmin = null;
		try {
			Member2Mapper memberMapper = sqlSession.getMapper(Member2Mapper.class);
			member_isadmin=memberMapper.pickisadminMember(member_id);
			
		}catch(Exception e) {
			System.out.println("���isadmin ��+"+e.getMessage());
		}
		return member_isadmin;
	}
}
