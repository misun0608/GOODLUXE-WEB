package com.spring.goodluxe;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.goodluxe.voes.MemberVO;

@RestController
public class GLAjaxController {
	@Autowired
	private GoodluxeService gls;
	
	// Login
	@PostMapping(value = "/login.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> userChk(MemberVO memberVO, HttpSession session) throws Exception {
		Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
		try {
			String result = gls.userChk(memberVO);
			if(result.equals("error_accur")) { retVal.put("result", "error_accur"); }
			else if(result.equals("non-member")) { retVal.put("result", "non-member"); }
			else if(result.equals("wrong_pw")) { retVal.put("result", "wrong_pw"); }
			else if(memberVO.getMember_class().equals("N")) { retVal.put("result", "email_N"); }
			else if(result.equals("ok")) {
				session.setAttribute("member_id", memberVO.getMember_id());
				session.setAttribute("member_class", memberVO.getMember_class());
				session.setAttribute("member_isadmin", memberVO.getMember_isadmin());
				retVal.put("result", "ok");
			}
		} catch (Exception e) {
			System.out.println("ERROR(MemberAjaxController/userChk) : " + e.getMessage());
			retVal.put("result", "error_accur");
		}
		return retVal;
	};
}
