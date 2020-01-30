package com.spring.goodluxe.mj;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberAjaxController {
	@Autowired
	private MemberService memberService;

	@PostMapping(value = "/login.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> userChk(Model model, MemberVO memberVO, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
		Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
		System.out.println("0-1. Ajax 컨트롤러 userChk = " + memberVO.getMember_id() + memberVO.getMember_pw());
		
		try {
			String result = memberService.userChk(memberVO);
			
//			System.out.println("7. MemberAjaxController:" + result);
//			System.out.println("8. MemberAjaxController:" + memberVO.getMember_isadmin());
			
			if (result.equals("EY")) { // 이메일 인증 완료
				//System.out.println("1");
				session.setAttribute("member_id", memberVO.getMember_id());
				session.setAttribute("member_class", memberVO.getMember_class());
				session.setAttribute("member_isadmin", memberVO.getMember_isadmin());

//				System.out.println(session.getAttribute("member_id"));
//				System.out.println(session.getAttribute("member_class")); 
//				System.out.println(session.getAttribute("member_isadmin")); 
//				System.out.println("3");
				retVal.put("result", "login_success");
				
			} else if (result.equals("B")) { // 블랙리스트
				session.setAttribute("member_id", memberVO.getMember_id());
				session.setAttribute("member_class", memberVO.getMember_class());
				session.setAttribute("member_isadmin", memberVO.getMember_isadmin());
				retVal.put("result", "login_black");
				
			} else if (result.equals("ADMIN")) { // 관리자
				session.setAttribute("member_id", memberVO.getMember_id());
				session.setAttribute("member_class", memberVO.getMember_class());
				session.setAttribute("member_isadmin", memberVO.getMember_isadmin());
				retVal.put("result", "login_admin");
				
			} else if (result.equals("EN")) { // 이메일 미인증
				retVal.put("result", "loginFail_confirm");
				//System.out.println("3");
			} else if (result.equals("IDPWN")) { // 아이디, 비번 틀리거나 안씀
				retVal.put("result", "lobinFail_IdPw");
			}
		} catch (Exception e) {
//			System.out.println("4");
			retVal.put("result", "AjaxController 에러");
		}
		
		return retVal;
	};
};