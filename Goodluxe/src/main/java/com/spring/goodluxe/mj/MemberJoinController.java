package com.spring.goodluxe.mj;

import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.goodluxe.voes.MemberVO;

@Controller
public class MemberJoinController {

	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
	@Autowired
	private MemberService gls;

	@Autowired
	private JavaMailSender mailSender;
	
    @Autowired(required = false)
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
   //로그인 첫 화면 요청 메소드
   @RequestMapping(value = "/joinform.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView joinform(Model model, HttpSession session) {
      ModelAndView mav = new ModelAndView();
      /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
       String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
       model.addAttribute("naver_url", naverAuthUrl);
      
       //카카오 인증 url을 view로 전달
       String kakaoUrI = KakaoController.getAuthorizationUri(session);
       model.addAttribute("kakao_url", kakaoUrI);

        //네이버 
		mav.setViewName("joinform");
        
        
      return mav;
   }

	@RequestMapping(value = "/joinform2.do")
	public String joinform2() {
		return "joinform2";
	}
	
	@RequestMapping(value = "/joinform3.do")
	public String joinform3() {
		return "joinform3";
	}

	@RequestMapping(value = "/joinform3_2.do", method = {RequestMethod.GET, RequestMethod.POST})
//   @RequestMapping(value = "/joinform3_2.do", method = RequestMethod.GET)	   
    public String joinform3(MemberVO membervo, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirect) throws Exception {
		
		int res = gls.insertMember(membervo);
//		System.out.println("res : " + res);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
//		System.out.println("1");
		PrintWriter writer;
		try {
//			System.out.println("2");
			writer = response.getWriter();
			if(res == 1) {
//				System.out.println("2-0");
				redirect.addAttribute("member_email", request.getParameter("member_email")); 
				redirect.addAttribute("member_id", request.getParameter("member_id"));
	           
//				writer.write("<script>alert('회원 가입 성공'); location.href='./mailSending.do';</script>");
//				System.out.println("2-1"); 
				return "redirect:/mailSendingJoin.do";
			} else {
				writer.write("<script>alert('회원 가입 실패'); location.href='./joinform3.do';</script>");
//				System.out.println("2-2");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
//		System.out.println("3");
		return null;
	}
	
	/* mailSending 코드 */
	@RequestMapping(value = "/mailSendingJoin.do")
	public String mailSendingJoin(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("member_email") String member_email, @RequestParam("member_id") String member_id) throws Exception {

		String setfrom = "bit.goodluxe@gmail.com"; // host 메일 주소
//      String member_email  = request.getParameter("email");     // 받는 사람 이메일
		String title = "GOODLUXE 인증메일입니다"; // 제목
		String content = "http://localhost:8080/goodluxe/verifyEmail.do?member_id="+member_id; // 메일 내용

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는 사람 생략하면 정상작동 안함
			messageHelper.setTo(member_email); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일 제목은 생략 가능
			messageHelper.setText(content); // 메일 내용
			
			mailSender.send(message);

			return "redirect:/joinform4.do";
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

	/* 메일 인증 url */
	@RequestMapping(value = "/verifyEmail.do", method = RequestMethod.GET)
	public String verifyEmail(HttpServletRequest request, HttpServletResponse response, MemberVO memberVO) {
		memberVO.setMember_id(request.getParameter("member_id"));
		System.out.println(request.getParameter("member_id"));
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer;
		int res = gls.verifyEmail(memberVO);
		System.out.println(res);

		try {

			writer = response.getWriter();

			if (res == 1) {
//				writer.write("<script>alert('회원 가입 성공!!'); location.href='login_page.do';</script>");
				
				return "redirect:/mainPage.do"; // 여기서 페이지 하나 더 만들어서 인증이 완료되었습니다 웅앵 하기
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

//	@RequestMapping(value = "/join_agreement.do", method = RequestMethod.POST)
//	public String join_agreement() {
////		model.addAttribute("membervo", membervo.getMember_email_receive());
//		
//		return "joinform4";
//	}

	@RequestMapping(value = "/joinform4.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String joinform4(MemberVO membervo, Model model) { // 회원가입 완료 페이지. 이 때 이메일 발송해줘야
		model.addAttribute("membervo", membervo.getMember_email());
//		model.addAttribute("membervo", membervo.getMember_email_receive());

		return "joinform4";
	}
}
