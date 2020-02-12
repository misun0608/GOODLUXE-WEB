package com.spring.goodluxe.jiyemypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class JyMyPageController {

		@Autowired
		private JyMyPageServiceImpl jyMyPageService;
		
		@RequestMapping(value = "myInfo.do")
		public String my_info(){                   
			
			//Model model, @RequestParam(value = "member_id", required = false, defaultValue = "1") String member_id
			//throws Exception 
			
			return "my_info";
		}
		
}
