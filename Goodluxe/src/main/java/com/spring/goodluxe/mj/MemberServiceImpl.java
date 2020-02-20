package com.spring.goodluxe.mj;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.goodluxe.voes.MemberVO;
import com.spring.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

//	private static final String Finally = null; // 이것이 무엇일까요~~~~~~~~~
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO getUserInfo(MemberVO membervo) throws Exception {
		MemberVO member_db = null;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			member_db = memberMapper.userChk(membervo);
		} catch (Exception e) {
			System.out.println("ERROR(GoodluxeService/userChk) : " + e.getMessage());
		}
		return member_db;
	}

	@Override // 이메일 인증으로 회원 등급 조정
	public String userClassChk(MemberVO memberVO) throws Exception {

		String res = "N";

		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			System.out.println(memberVO.getMember_email());

			res = memberMapper.member_status_chk(memberVO);
			System.out.println(res);
		} catch (Exception e) {
			System.out.println("회원 상태 업데이트 실패 : " + e.getMessage());
		}
		return res;
	}

	// 이메일 중복 체크
	@Override
	public int emailAddr_chk(MemberVO memberVO) throws Exception {
		int res = -1;

		try {
			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
			res = membermapper.emailAddr_chk(memberVO);
		} catch (Exception e) {
			System.out.println("ERROR(MemberService/emailChk) : " + e.getMessage());
		}
		return res;
	}

	// 아이디 중복 체크
	@Override
	public int idCheck(MemberVO memberVO) throws Exception {
		String dbid = "";
		int res = -1;

		try {
			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
			dbid = membermapper.idChk(memberVO);

			if (dbid.equals(memberVO.getMember_id())) {
				System.out.println(dbid);
				System.out.println(memberVO.getMember_id());
				res = 0; // db에 동일한 아이디 존재
			} else {
				res = 1; // 존재 X
			}

			return res;
		} catch (Exception e) {
			throw new Exception("회원 확인 실패", e);
		}
	}

	// 이메일 중복 체크
//	@Override
//	public int emailCheck(MemberVO memberVO) throws Exception {
//		String dbemail = "";
//		int res = -1;
//
//		try {
//			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
//			dbemail = membermapper.emailLink_chk(memberVO);
//
//			if (dbemail.equals(memberVO.getMember_email())) {
//				System.out.println(dbemail);
//				System.out.println(memberVO.getMember_email());
//				res = 0; // db에 동일한 이메일 존재
//			} else {
//				res = 1; // 존재 X
//			}
//		} catch (Exception e) {
//		}
//		return res;
//	}

	// 회원 가입
	@Override
	public int insertMember(MemberVO memberVO) {
		int res = 0;
		try {
			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
			res = membermapper.insertMember(memberVO);
			System.out.println("1 res = " + res);

			return res;
		} catch (Exception e) {
			e.getStackTrace();
		}
		return res;
	}

	@Override
	public int verifyEmail(MemberVO memberVO) {
		int res = 0;
		try {
			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
			res = membermapper.verifyEmail(memberVO);
			System.out.println("2 res = " + res);

			return res;
		} catch (Exception e) {
			e.getStackTrace();
		}
		return res;
	}

	@Override
	public int insertSnsMember(MemberVO memberVO) {
		int res = 0;
		try {
			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
			res = membermapper.insertSnsMember(memberVO);
		} catch (Exception e) {
			System.out.println("ERROR(MemberService/insertSnsMemeber : )" + e.getMessage());
		}
		return res;
	}

	@Override
	public ArrayList<MemberVO> getMemberlist() throws Exception {
		try {
			ArrayList<MemberVO> member_list = new ArrayList<MemberVO>();
			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
			member_list = membermapper.getMemberList();

			return member_list;
		} catch (Exception e) {
			throw new Exception("회원 리스트 검색 실패", e);
		}
	}

	// 아이디 찾기
	@Override
	public String findMemberId(MemberVO memberVO) throws Exception {
		String findId = null;

		try {
			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
			findId = membermapper.findMemberId(memberVO);
			System.out.println("2 MemberServiceImpl 아이디 찾기 :" + findId);
			
			if(findId != null) {
				System.out.println(findId);
				System.out.println(memberVO.getMember_email());
				System.out.println(memberVO.getMember_name());
				return findId;
			} else {
				System.out.println("아이디 없음");
				System.out.println(findId);
				System.out.println(memberVO.getMember_email());
				System.out.println(memberVO.getMember_name());
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return findId;
	}

//	// 이름, 이메일 주소 비교
//	@Override
//	public Model findMemberPw(MemberVO memberVO) throws Exception {
//		Model findPw = null;
//		String dbemail = "";
//		String dbid = "";
//
//			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
//			dbemail = membermapper.emailLink_chk(memberVO);
//			dbid = membermapper.findMemberPw(memberVO);
//
//				System.out.println(dbemail);
//				System.out.println(dbid);
//				System.out.println(memberVO.getMember_email());
//				System.out.println(memberVO.getMember_id());
//		return findPw;
//	}
	
	// 아이디, 이름, 이메일 주소 비교
	@Override
	public int findMemberPw(MemberVO memberVO) throws Exception {
		int res = 0;
		String dbid = null;
		try {
			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
			dbid = membermapper.findMemberPw(memberVO);
			System.out.println("2 MemberServiceImpl 비밀번호 찾기 :" + dbid);

			if(dbid != null) {
//				System.out.println(dbid);
//				System.out.println(memberVO.getMember_email());
//				System.out.println(memberVO.getMember_name());
				res = 1;
			} else {
//				System.out.println("아이디 없음");
				res = -1;
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return res;
	}

	@Override
	public int updateMemberPw(MemberVO memberVO) throws Exception{
		int res = 0;
		try {
			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
			System.out.println("1231");
			res = membermapper.updateMemberPw(memberVO);
			System.out.println("2 MemberServiceImpl 비밀번호 변경 :" + res);
			return res;
		} catch (Exception e) {
			e.getStackTrace();
		}
		return res;
	}
}
