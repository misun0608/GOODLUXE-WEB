package com.spring.goodluxe.jiyemypage;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.goodluxe.voes.MemberVO;

@Controller
public class JyMyPageController {

		@Autowired
		private JyMyPageServiceImpl jyMyPageService;
		
		@RequestMapping(value = "myInfo.do")
		public String my_info(Model model, @RequestParam(value = "member_id", required = false) String member_id)throws Exception {                   
			//Model model, @RequestParam(value = "member_id", required = false, defaultValue = "1") String member_id
			//throws Exception 
			
			MemberVO memberVO = null;
			
			String session_id = "mjmj" ;
			 
			if(member_id.equals(session_id)) {
				memberVO=jyMyPageService.getMemberInfo(member_id);
			}
		
			model.addAttribute("memberVO",memberVO);
			
			return "my_info";
		}
		
		@RequestMapping(value = "myInfoAction.do")
		public String myInfoAction(Model model, MemberVO memberVO, HttpServletRequest request )throws Exception {                   
			
			String member_phone=(String)request.getParameter("tel1")+"-"+(String)request.getParameter("tel2")+"-"+(String)request.getParameter("tel3");
			memberVO.setMember_phone(member_phone);
			
			String member_email = (String)request.getParameter("email1") + "@" + (String)request.getParameter("email_select");
			memberVO.setMember_email(member_email);
			
			String cate[] = request.getParameterValues("prefer_category");
			String member_like_category = "";
			member_like_category += cate[0];
			for(int i = 1; i<cate.length; i++) {
				member_like_category += ",";
				member_like_category += cate[i];
			}
			System.out.println(member_like_category);
			memberVO.setMember_like_category(member_like_category);
			
			String brand[] = request.getParameterValues("prefer_brand");
			String member_like_brand = "";
			member_like_brand += brand[0];
			for(int j = 1; j<brand.length; j++ ) {
				member_like_brand += ",";
				member_like_brand += brand[j];
			}
			memberVO.setMember_like_brand(member_like_brand);
			
			jyMyPageService.myInfoAction(memberVO);
			
			// return "my_info";
			return "redirect:myInfo.do?member_id=mjmj";
		}
		@RequestMapping(value = "myLikedGoods.do")
		public String likedGoods(Model model, MemberVO memberVO, HttpServletRequest request )throws Exception {                   
			
			String member_id = "mjmj"; //session
			
			ArrayList<HashMap<String,Object>> list = null; 
			
			list = jyMyPageService.myLikedGoods(member_id);
			
			
			return "mypage_liked_goods";
		}
		
}
