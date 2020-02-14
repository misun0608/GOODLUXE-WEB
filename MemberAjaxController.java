package com.spring.goodluxe.mj;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberAjaxController {
	@Autowired
	private MemberService memberService;

	@PostMapping(value = "/login.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> userChk(MemberVO memberVO, HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
		System.out.println("컨트롤러 userChk = " + memberVO.getMember_id() + memberVO.getMember_pw());
		
		
		
		try {
			String res = memberService.userChk(memberVO);

			if (res == "Y") { // 이메일 인증 완료
				//System.out.println("1");
				session.setAttribute("member_id", memberVO.getMember_id());
				session.setAttribute("member_pw", memberVO.getMember_pw());
//				session.setAttribute("member_class", memberVO.getMember_class());
//				session.setAttribute("member_isadmin", memberVO.getMember_isadmin());
				System.out.println(session.getAttribute("member_id"));
				System.out.println(session.getAttribute("member_pw"));
//				System.out.println(session.getAttribute("member_class"));
//				System.out.println(session.getAttribute("member_isadmin"));
				System.out.println("3");
				retVal.put("res", "login_success");
				
//			} else if (res == "B") { // 블랙리스트
//				session.setAttribute("member_id", memberVO.getMember_id());
//				session.setAttribute("member_pw", memberVO.getMember_pw());
//					retVal.put("res", "login_black");
			} else if (res == "N") { // 이메일 미인증
				retVal.put("res", "loginFail_confirm");
				//System.out.println("3");
			} else if (res == "null") { // 아이디, 비밀번호 안씀
				retVal.put("res", "loginFail_IdPw_NotFound");
//				System.out.println("4");
			} else { // 아이디, 비번 틀림
				retVal.put("res", "lobinFail_IdPw");
			}
		} catch (Exception e) {
//			System.out.println("5");
			retVal.put("res", "AjaxController 에러");
		}

		return retVal;
	};


	@PostMapping(value = "/idCheck.do", produces = "application/json;charset=UTF-8")
	   public Map<String, Object> idCheck(MemberVO memberVO) {
	      Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
	      System.out.println("컨트롤러 idCheck = " + memberVO.getMember_id());
	      try {

	         int res = memberService.idCheck(memberVO);

	         if (res == 0) { // db에 동일한 아이디 존재 
	            retVal.put("res", "Fail"); // 맵객체 "res"는 키 , "FAIL" 값 : 동일한 아이디 존재하니까 가입 FAIL이라는 뜻으로
	         } else if (res == 1) { // db에 동일한 아이디 존재 X
	            retVal.put("res", "OK"); // 맵객체 "res"는 키 , "OK" 값
	         }

	      } catch (Exception e) {
	         retVal.put("res", "OK");
	         retVal.put("message", "Failure");
	      }
	      return retVal;
	   }
};
//	@PostMapping(value = "/idCheck.do", produces = "application/json;charset=UTF-8")
//	   public int idCheck(MemberVO memberVO) {
//	      Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
//	      System.out.println("컨트롤러 idCheck = " + memberVO.getMember_id());
//	      try {
//
//	         MemberAjaxController memberService;
//			int res = memberService.idCheck(memberVO);
//
//	         if (res == 0) {	
//	            retVal.put("res", "OK"); // 맵객체 "res"는 키 , "OK" 값
//	         } else if (res == 1) {
//	            retVal.put("res", "FAIL"); // 맵객체 "res"는 키 , "OK" 값
//	         }
//
//	      } catch (Exception e) {
//	         retVal.put("res", "FAIL");
//	         retVal.put("message", "Failure");
//	      }
//	      return retVal;
//	}

//	Function id_Check(){
//        var _str1 = $("#member_id").val();
//           alert(_str1);
//           
//           jQuery.ajax({
//              url : '/NAGAGU/emailChk.su',
//              type : "post",
//              dataType : "json",
//              data : {
//                 member_email : $("#member_id").val()
//              },
//              contentType : 'application/x-www-form-urlencoded; charset=utf-8',
//
//              success : function(retVal) {
//                 if (retVal.res == "OK") {
//                   // $("#email_chk_btn").attr("value", "Y");
//                    alert("사용가능한 이메일입니다.");
//                 } else { // 실패했다면
//                    alert("중복된 이메일입니다.");
//                 }
//              },
//              error : function() {
//                 alert("ajax통신 실패!!!");
//              }
//
//           });   
//	}
//		})
//	})
//};