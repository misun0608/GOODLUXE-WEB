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
	public String userChk(MemberVO memberVO) throws Exception {
		MemberVO member_chk, admin_chk = null;
		String get_mapper_member_id, get_mapper_member_pass, get_mapper_member_class, get_mapper_member_isadmin = null;
		String id = null, pass = null, m_class, isadmin = null;
		String m_status_chk, a_status_chk = "";
		String result = ""; // 이메일 비번이 틀렸을 경우 결과값

		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			member_chk = memberMapper.userChk(memberVO);
			System.out.println("0-2. MemberServiceImpl 캐스트 오류:" + member_chk);

			get_mapper_member_id = member_chk.getMember_id();
			get_mapper_member_pass = member_chk.getMember_pw();

			id = memberVO.getMember_id();
			pass = memberVO.getMember_pw();
			m_class = member_chk.getMember_class();
			isadmin = member_chk.getMember_isadmin();

//			System.out.println("1. MemberServiceImpl" + id);
//			System.out.println("2. MemberServiceImpl" + pass);
//			System.out.println("3. MemberServiceImpl" + m_class);
//			System.out.println("4. MemberServiceImpl" + isadmin);

			// 아이디, 비밀번호 같을 경우
			if (get_mapper_member_id.equals(id) && get_mapper_member_pass.equals(pass)) {
				m_status_chk = memberMapper.member_status_chk(memberVO);
				a_status_chk = memberMapper.admin_status_chk(memberVO);

				System.out.println("5. memberServiceImpl 상태정보: " + m_status_chk);
				System.out.println("5. memberServiceImpl 상태정보: " + a_status_chk);

				if (m_status_chk.equals("Y")) { // 이메일 인증(완료)
					if (a_status_chk.equals("Y")) {
						result = "ADMIN";
					} else {
						result = "EY";
					}
//					System.out.println("5-1. memberServiceImpl" + result);
				} else if (m_status_chk.equals("N")) { // 이메일, 비번 맞지만 이메일 미인증
					result = "EN";
				} else if (m_status_chk.equals("B")) { // 블랙리스트일 경우
					result = "B";
				} else if (a_status_chk.equals("Y")) { // 어드민일 경우
					result = "ADMIN";
				}
			} else if (!(get_mapper_member_id.equals(id) && get_mapper_member_pass.equals(pass))) { // 아이디 비밀번호 틀릴 경우
				result = "IDPWN";
			}

			memberVO.setMember_id(id);
			memberVO.setMember_class(m_class);
			memberVO.setMember_isadmin(isadmin);

		} catch (Exception e) {
			System.out.println("6. memberServiceImpl 로그인 실패" + e.getMessage());
		}
		System.out.println("7. memberServiceImpl:" + result);

		return result; // 결과값 "", EY, EN, B, ADMIN, IDPWN
	}

	@Override
	public String userSnsChk(MemberVO memberVO) throws Exception {
		MemberVO member_chk, admin_chk = null;
		String get_mapper_member_id, get_mapper_member_pass, get_mapper_member_class, get_mapper_member_isadmin = null;
		String id = null, pass = null, m_class = null, isadmin = null;
		String m_status_chk, a_status_chk = "";
		String result = ""; // 이메일 비번이 틀렸을 경우 결과값

		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			member_chk = memberMapper.userSnsChk(memberVO);
			System.out.println("0-3. MemberServiceImpl 캐스트 오류:" + member_chk);

			get_mapper_member_id = member_chk.getMember_id();
			id = memberVO.getMember_id();

//			System.out.println("1. MemberServiceImpl" + id);
//			System.out.println("2. MemberServiceImpl" + pass);
//			System.out.println("3. MemberServiceImpl" + m_class);
//			System.out.println("4. MemberServiceImpl" + isadmin);

			// 동일한 아이디 있을 경우
			if (get_mapper_member_id.equals(id)) {
				result = "Y";
			} else { // 아이디 없을 경우
				result = "N";
			}

			memberVO.setMember_id(id);
			memberVO.setMember_class(m_class);
			memberVO.setMember_isadmin(isadmin);

		} catch (Exception e) {
			System.out.println("6. memberServiceImpl 로그인 실패" + e.getMessage());
		}
		System.out.println("7. memberServiceImpl:" + result);

		return result; // 결과값 Null, "Y", "N"
	}

//	@Override // 이메일 수신 여부,,? 이메일 중복 체크..?
//	public String emailChk(MemberVO membervo) throws Exception {
//		String dbemailchk = "";
//		String res = "N"; // 이메일 미인증
//		
//		try {
//			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
//			
////			String vo = member.userClassChk(membervo);
//
//			dbemailchk = memberMapper.userChk(membervo);
//			System.out.println("mapper 값 : " + dbemailchk);
//			if (vo != null) {
//
//				if (dbemailchk.equals(membervo.getMember_email_receive()))
//					res = "Y"; // 이메일 인증
//			}
//
//			return res;
//
//		} catch (Exception e) {
//			throw new Exception("이메일 인증 실패", e);
//		}
//	}

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
	public int emailChk(MemberVO memberVO) throws Exception {
		String dbemail = "";
		int res = -1;

		try {
			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
			dbemail = membermapper.emailLink_chk(memberVO);

			if (dbemail.equals(memberVO.getMember_email())) {
				System.out.println(dbemail);
				System.out.println(memberVO.getMember_email());
				res = 0; // db에 동일한 이메일 존재
			} else {
				res = 1; // 존재 X
			}
		} catch (Exception e) {
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
	@Override
	public int emailCheck(MemberVO memberVO) throws Exception {
		String dbemail = "";
		int res = -1;

		try {
			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
			dbemail = membermapper.emailLink_chk(memberVO);

			if (dbemail.equals(memberVO.getMember_email())) {
				System.out.println(dbemail);
				System.out.println(memberVO.getMember_email());
				res = 0; // db에 동일한 이메일 존재
			} else {
				res = 1; // 존재 X
			}
		} catch (Exception e) {
		}
		return res;
	}

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
			System.out.println("2 sns res = " + res);
		} catch (Exception e) {
			e.getStackTrace();
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

	// .p,ride
	public String findMemberId(MemberVO memberVO) throws Exception {
		String findId = null;

		try {
			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
			findId = membermapper.findMemberId(memberVO);

			System.out.println(findId);
			System.out.println(memberVO.getMember_email());
			System.out.println(memberVO.getMember_name());

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
	
	// 이름, 이메일 주소 비교
	@Override
	public int findMemberPw(MemberVO memberVO) throws Exception {
		int res = 0;
		String dbid = null;
		try {
			MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
			dbid = membermapper.findMemberId(memberVO);

			if(dbid != null) {
			System.out.println(dbid);
			System.out.println(memberVO.getMember_email());
			System.out.println(memberVO.getMember_name());
			res = 1;
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return res;
	}
}
