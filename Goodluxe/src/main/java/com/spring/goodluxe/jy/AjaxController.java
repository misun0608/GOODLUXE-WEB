package com.spring.goodluxe.jy;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController 
public class AjaxController {
	
	@Autowired
	private AjaxService ajaxService;

	@RequestMapping(value = "/mdDetailLike.do", produces="application/json;charset=UTF-8")
	public Map<String,String> mdDetailLike(@RequestParam(value="entity_number")String entity_number){
		
		System.out.println("엔티티넘버 " + entity_number);
		
		
		
		return null;
		
	}
}
