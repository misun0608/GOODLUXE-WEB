package com.spring.goodluxe.mj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.goodluxe.voes.MemberVO;

@Controller
public class MemberFindController {

	@Autowired
	private MemberService gls;
	
	@RequestMapping(value = "/find_data.do")
	public String find_data() {
		return "find_data";
	}
	
//	@RequestMapping(value = "/find_data.do")
//	public String find_data() {
//		return "redirect:/find_data.do";
//	}	
	@RequestMapping(value = "/findMemberId.do", method = RequestMethod.GET)
	public String findMemberId(MemberVO memberVO) throws Exception {
		String find_member_id = gls.findMemberId(memberVO);
		System.out.println(find_member_id);
		return find_member_id;
	}
}