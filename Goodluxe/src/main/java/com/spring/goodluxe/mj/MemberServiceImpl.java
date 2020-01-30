package com.spring.goodluxe.mj;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

//	private static final String Finally = null; // 이것이 무엇일까요~~~~~~~~~
	@Autowired
	private SqlSession sqlSession;

	@Override
	public String userChk(MemberVO membervo) throws Exception {
		MemberVO member_chk, admin_chk = null;
		String get_mapper_member_id, get_mapper_member_pass, get_mapper_member_class, get_mapper_member_isadmin = null;
		String id = null, pass = null, m_class, isadmin = null;
		String m_status_chk, a_status_chk = "";
		String result = ""; // 이메일 비번이 틀렸을 경우 결과값
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			member_chk = memberMapper.userChk(membervo);
			System.out.println("0-2. MemberServiceImpl 캐스트 오류:" + member_chk);

			get_mapper_member_id = member_chk.getMember_id();
			get_mapper_member_pass = member_chk.getMember_pw();
			
			id = membervo.getMember_id();
			pass = membervo.getMember_pw();
			m_class = member_chk.getMember_class();
			isadmin = member_chk.getMember_isadmin();
			
//			System.out.println("1. MemberServiceImpl" + id);
//			System.out.println("2. MemberServiceImpl" + pass);
//			System.out.println("3. MemberServiceImpl" + m_class);
//			System.out.println("4. MemberServiceImpl" + isadmin);
			


			// 아이디, 비밀번호 같을 경우
			if (get_mapper_member_id.equals(id) && get_mapper_member_pass.equals(pass)) {
				m_status_chk = memberMapper.member_status_chk(membervo);
				a_status_chk = memberMapper.admin_status_chk(membervo);

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
			}  else if (!(get_mapper_member_id.equals(id) && get_mapper_member_pass.equals(pass))) { // 아이디 비밀번호 틀릴 경우
				result = "IDPWN";
			}

			membervo.setMember_id(id);
			membervo.setMember_class(m_class);
			membervo.setMember_isadmin(isadmin);
			
		} catch (Exception e) {
			System.out.println("6. memberServiceImpl 로그인 실패" + e.getMessage());
		}
		System.out.println("7. memberServiceImpl:" + result);

		
		return result; // 결과값 "", EY, EN, B, ADMIN, IDPWN
	}

}
