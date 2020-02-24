package com.spring.goodluxe.mj;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.goodluxe.voes.MemberVO;

@Controller
public class MemberLoginController {

	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
	@Autowired
	private MemberService gls;

//	@RequestMapping(value = "/login_page.do")
//	public String login_page() {
//		return "login_page";
//	}
//
//	@RequestMapping(value = "/logout.do")
//	public String logout(HttpSession session) {
//		session.removeAttribute("member_id");
//		session.removeAttribute("member_class");
//		session.removeAttribute("member_isadmin");
//		return "login_page";
//	}

//	//아이디 중복 체크
//	@RequestMapping(value = "/checkSignup", method = RequestMethod.POST)
//		public @ResponseBody String AjaxView(  
//			        @RequestParam("id") String id){
//			String str = "";
//			int idcheck = dbPro.idCheck(id);
//			if(idcheck==1){ //이미 존재하는 계정
//				str = "NO";	
//			}else{	//사용 가능한 계정
//				str = "YES";	
//			}
//			return str;
//		}

	//출처: https://xodgl2.tistory.com/22 [Beginning]
   
//   @PostMapping(value="/login.do", produces="application/json;charset=UTF-8")
//	// 앞에서는 requestMapping 사용하고 post를 따로 줌
//	// 이거는 RequestMapping에 POST인걸 결합한게 PostMapping임
//	// 그럼 GetMapping도 있곘지. Get 형태로 요청이 왔을 때 처리하는 것
//	// 해당 URL을 맵핑해주면서, POST 방식일 때만 ~ 해주는 것. 20191211 1번녹
//	public String userChk() {
//		
//		String res = memberService.userChk(memberVO);
//		System.out.println("res=" + res);
//		
//		return res; //●얘처럼 // list 객체 반환
//	}
   
//   @RequestMapping(value="/login.do")
//   public String userChk(MemberVO memberVO, HttpSession session, HttpServletResponse response) throws Exception{
//	   String res = memberService.userChk(memberVO);
//	   
//	   response.setCharacterEncoding("utf-8");
//	   response.setContentType("text/html; charset=utf-8");
//	   PrintWriter writer = response.getWriter();
//	   
//	   if(res == "Y") {
//		   session.setAttribute("id", memberVO.getMember_id());
//		   
//		   if(memberVO.getMember_isadmin().equals("Y")) {
//			   writer.write("<script>alert('어드민 로그인 성공'); location.href='./main_page.do';</script>");
//		   } else if(memberVO.getMember_class().equals("B")) {
//			   writer.write("<script>alert('블랙리스트 로그인 성공'); location.href='./main_page.do';</script>");
//		   } else {
//		   writer.write("<script>alert('일반회원 로그인 성공'); location.href='./main_page.do';</script>");
//		   }
//	   } else {
//		   writer.write("<script>alert('아이디/비밀번호가 일치하지 않거나 없는 회원입니다'); location.href='./main_page.do';</script>");
//	   }
//	return null;
//   }
    
    @Autowired(required = false)
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
   
   @Autowired(required=true)
   private JavaMailSender mailSender;
   
   //네이버 로그인 성공시 callback호출 메소드
   @RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
   public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request)
           throws IOException, ParseException {
      
      int email_check = 0;
      int result = 0;
      MemberVO memberVO = new MemberVO();
      
      //정보동의 취소시 이전페이지로 이동
      if(code.equals("0")) {
         return "redirect:/mainPage.do";
      }
       
       OAuth2AccessToken oauthToken;
       oauthToken = naverLoginBO.getAccessToken(session, code, state);
       //로그인 사용자 정보를 읽어온다.
       apiResult = naverLoginBO.getUserProfile(oauthToken);
       
       model.addAttribute("result", apiResult);
       /* 네이버 로그인 성공 페이지 View 호출 */
       
       //2. String형식인 apiResult를 json형태로 바꿈
       JSONParser parser = new JSONParser();
       Object obj = parser.parse(apiResult);
       JSONObject jsonObj = (JSONObject) obj;
       
     // 3. 데이터 파싱
     // Top레벨 단계 _response 파싱
     JSONObject response_obj = (JSONObject) jsonObj.get("response");
     String email = (String) response_obj.get("email");
     String name = (String) response_obj.get("name");
     String id = (String) response_obj.get("id");
     
     System.out.println("3. 데이터 파싱");
     System.out.println(email+" "+name);
     
     try {
        memberVO.setMember_email(email);
        email_check = gls.emailAddr_chk(memberVO);
        
        if(email_check == 0 ) {   // 신규 회원 가입

			memberVO.setMember_id(id);
			memberVO.setMember_name(name);
			memberVO.setMember_class("Y");
			memberVO.setMember_isadmin("N");
			result = gls.insertSnsMember(memberVO);

			if(result == 0) {
				System.out.println("ERROR(MemberLoginController/callback) : 간편 로그인 회원 등록 실패(네이버)");
			}
        }
     } catch(Exception e) {
        System.out.println("ERROR(MemberLoginController/callback) : " + e.getMessage());
     }   
     	String url = "redirect:/sLogin.do?member_id=" + id;
       return url;
   }
   
	// Social Media Login
	@RequestMapping(value = "/sLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sLogin(MemberVO memberVO, HttpSession session) throws Exception {
		try {
			MemberVO member_db =  gls.getUserInfo(memberVO);
			
        	if(member_db != null) {
        		session.setAttribute("member_id", member_db.getMember_id());
        		session.setAttribute("member_class", member_db.getMember_class());
        		session.setAttribute("member_isadmin", member_db.getMember_isadmin());        		
        	}
        	
		} catch (Exception e) {
			System.out.println("ERROR(GLAjaxController/userChk) : " + e.getMessage());
		}
		return "redirect:/mainPage.do";
	};

   
   //카카오 로그인 성공
   @RequestMapping(value = "/kakaologin.do", method = { RequestMethod.GET, RequestMethod.POST })
   public String kakaoLogin(Model model, @RequestParam String code, HttpSession session, HttpServletRequest request)
           throws Exception {
      int email_check = 0;
      int result = 0;
      MemberVO memberVO = new MemberVO();
      //결과값을 node에 담아줌
      JsonNode node = KakaoController.getAccessToken(code);
      //accessToken에 사용자의 로그인한 모든 정보가 들어있음
      JsonNode accessToken = node.get("access_token");
      //사용자의 정보
      JsonNode userInfo = KakaoController.getKaKaoUserInfo(accessToken);
      
      String id = null;
      String email = null;
      String name = null;
      
      //유저정보 카카오에서 가져오기 Get properties
      JsonNode properties = userInfo.path("properties");
     JsonNode kakao_account = userInfo.path("kakao_account");
     
     System.out.println("Controller : " + kakao_account);
     
     email = kakao_account.path("email").asText();
     id = email.split("@")[0];
     id = "kakao_" + id;
     
     JsonNode profile = kakao_account.path("profile");
     name = profile.path("nickname").asText();
     
     try {
        memberVO.setMember_email(email);
        email_check = gls.emailAddr_chk(memberVO);
        
        if(email_check == 0) {   // 신규 회원 가입


			memberVO.setMember_id(id);
			memberVO.setMember_name(name);
           memberVO.setMember_class("Y");
           memberVO.setMember_isadmin("N");

           result = gls.insertSnsMember(memberVO);
           
           if(result == 0) {
				System.out.println("ERROR(MemberLoginController/kakaoLogin) : 간편 로그인 회원 등록 실패(카카오)");
			}

        }
        
     } catch(Exception e) {
    	 System.out.println("ERROR(MemberLoginController/kakaoLogin) : " + e.getMessage());
     }
     
     String url = "redirect:/sLogin.do?member_id=" + id;
     return url;
  }
}