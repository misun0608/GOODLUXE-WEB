package com.spring.goodluxe.jy;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController 
public class AjaxController {
	
	@Autowired
	private AjaxService gls;

	// Check if someone pressed 'Like Button'
	// @RequestMapping(value = "/checkAlreadyLiked.do",  method = RequestMethod.POST ,produces="application/json;charset=UTF-8")
	public int checkAlreadyLiked(@RequestParam(value="entity_number")String entity_number, HttpSession session)throws Exception{
		int data = 0;
		String member_id = (String) session.getAttribute("member_id");
		if(member_id == null) return data;
		
		data = gls.isMemberLiked(member_id, entity_number);

		return data;
	}
	
	// When 'Like Button' is pressed
	// @RequestMapping(value = "/mdDetailLike.do", produces="application/json;charset=UTF-8")
	public int mdDetailLike(@RequestParam(value="entity_number")String entity_number, HttpSession session)throws Exception{
		String member_id = (String) session.getAttribute("member_id");
		if(member_id == null) { return -1; }

		int data = gls.setLike(member_id, entity_number);
		return data;
	}
}
