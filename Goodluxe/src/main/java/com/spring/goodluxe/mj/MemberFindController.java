package com.spring.goodluxe.mj;

import java.io.PrintWriter;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.goodluxe.voes.MemberVO;

@Controller
public class MemberFindController {

	@Autowired
	private MemberService gls;

	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/find_data.do")
	public String find_data() {
		return "find_data";
	}
	
	@RequestMapping(value = "/changePw.do", method = RequestMethod.GET)
	public ModelAndView change_pw(@RequestParam("member_id") String member_id ) {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id(member_id);
		mav.addObject("memberVO", memberVO);
		mav.setViewName("change_pw");
		return mav;
	}
	
//	@RequestMapping(value = "/find_data.do")
//	public String find_data() {
//		return "redirect:/find_data.do";
//	}	
	
	// 아이디 찾기
	@RequestMapping(value = "/findMemberId.do", method = RequestMethod.POST)
	public String findMemberId(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirect) throws Exception {
		String find_member_id = null;
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			System.out.println("MemeberFindController findMemberId.do 1 : "+memberVO.getMember_name());
			find_member_id = gls.findMemberId(memberVO);
			if(find_member_id != null) {
				System.out.println(find_member_id);
				
				redirect.addAttribute("member_email", request.getParameter("member_email")); 
				redirect.addAttribute("member_id", find_member_id);
				redirect.addAttribute("member_name", request.getParameter("member_name"));
	           
				return "redirect:/mailSendingFindId.do";
			} else {
				out.println("<script>");
				out.println("alert('입력하신 정보로 가입 된 회원 아이디는 존재하지 않습니다.');");
				out.println("location.href='./find_data.do';");
				out.println("</script>");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return find_member_id;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/findMemberPw.do", method = RequestMethod.POST)
	public String findMemberPw(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirect) throws Exception {
		int find_member_pw = 0;
		String find_member_id = null;
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			find_member_id = gls.findMemberId(memberVO);
			find_member_pw = gls.findMemberPw(memberVO);
			System.out.println("MemberFindController 1 FIND_ID :" + find_member_id);
			System.out.println("MemberFindController 1 FIND_PW :" + find_member_pw);
			
			if(find_member_pw != 0) {
				System.out.println(find_member_pw);
				
				redirect.addAttribute("member_email", request.getParameter("member_email")); 
				redirect.addAttribute("member_id", find_member_id);
				redirect.addAttribute("member_name", request.getParameter("member_name"));
				
				return "redirect:/mailSendingFindPw.do";
			} else if (find_member_id == null){
				out.println("<script>");
				out.println("alert('입력하신 아이디로 가입 된 회원은 존재하지 않습니다.');");
				out.println("location.href='./find_data.do';");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('입력하신 정보로 가입 된 회원은 존재하지 않습니다.');");
				out.println("location.href='./find_data.do';");
				out.println("</script>");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/* 아이디찾기 mailSending 코드 */
	@RequestMapping(value = "/mailSendingFindId.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String mailSendingFindId(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("member_email") String member_email, @RequestParam("member_id") String member_id, @RequestParam("member_name") String member_name) throws Exception {

		String setfrom = "bit.goodluxe@gmail.com"; // host 메일 주소
//      String member_email  = request.getParameter("email"); // 받는 사람 이메일
		String title = "GOODLUXE 아이디 찾기 메일입니다"; // 제목
		String content = member_name + "님의 아이디는 " + member_id + "입니다."; // 메일 내용

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

			return "redirect:/find_data.do";
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}
	
	/* 비밀번호찾기 mailSending 코드 */
	@RequestMapping(value = "/mailSendingFindPw.do")
	public String mailSendingFindPw(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("member_email") String member_email, @RequestParam("member_id") String member_id, @RequestParam("member_name") String member_name) throws Exception {
		
		String setfrom = "bit.goodluxe@gmail.com"; // host 메일 주소
//      String member_email  = request.getParameter("email"); // 받는 사람 이메일
		String title = "GOODLUXE 비밀번호 찾기 메일입니다"; // 제목
		String content = member_name + "님의 비밀번호 찾기 URL입니다.\n" + "http://localhost:8080/goodluxe/changePw.do?member_id="+member_id; // 메일 내용
		
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
			
			return "redirect:/find_data.do";
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	// 비밀번호 변경
	@RequestMapping(value = "/changeMemberPw.do", method = RequestMethod.POST)
	public String updateMemberPw(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirect
			) throws Exception {
		int change_member_pw = 0;
		
		System.out.println(memberVO.getMember_id());
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			change_member_pw = gls.updateMemberPw(memberVO);
			System.out.println("MemberFindController 1 CHANGE_MEMBER_PW :" + change_member_pw);
			
			if(change_member_pw != 0) {
				System.out.println(change_member_pw);
				
				out.println("<script>");
				out.println("location.href='./mainPage.do';");
				out.println("alert('비밀번호가 변경되었습니다. 로그인 후 이용해주세요.');");
				out.println("</script>");
				return "redirect:/mainPage.do";
			} else {
				out.println("<script>");
				out.println("alert('비밀번호가 변경되지 않았습니다. 다시 시도해주세요.');");
				out.println("redirect:/changePw.do;");
				out.println("</script>");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

//	/* 메일 인증 url */
//	@RequestMapping(value = "/verifyEmail.do", method = RequestMethod.GET)
//	public String verifyEmail(HttpServletRequest request, HttpServletResponse response, MemberVO memberVO) {
//		memberVO.setMember_id(request.getParameter("member_id"));
//		System.out.println(request.getParameter("member_id"));
//		
//		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/html; charset=utf-8");
//		PrintWriter writer;
//		int res = gls.verifyEmail(memberVO);
//		System.out.println(res);
//
//		try {
//
//			writer = response.getWriter();
//
//			if (res == 1) {
////				writer.write("<script>alert('회원 가입 성공!!'); location.href='login_page.do';</script>");
//				
//				return "redirect:/mainPage.do";
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return null;
//	}
}