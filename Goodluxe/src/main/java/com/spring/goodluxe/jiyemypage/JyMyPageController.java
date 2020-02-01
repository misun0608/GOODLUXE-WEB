package com.spring.goodluxe.jiyemypage;

import java.util.StringTokenizer;

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
		
}
