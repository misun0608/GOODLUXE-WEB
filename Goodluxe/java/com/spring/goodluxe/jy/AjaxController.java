package com.spring.goodluxe.jy;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController 
public class AjaxController {
	
	@Autowired
	private AjaxService ajaxService;

	@RequestMapping(value = "/checkAlreadyLiked.do",  method = RequestMethod.POST ,produces="application/json;charset=UTF-8")
	public int checkAlreadyLiked(@RequestParam(value="entity_number")String entity_number)throws Exception{
		//세션 검사하여 아이디 받아오기
		String member_id = "jiye";
		int data = 0;
		data = ajaxService.isMemberLiked(member_id, entity_number);
		if(data==1)System.out.println("1");
		else System.out.println("0");
			
		return data;//0
		
	}
	
	
	@RequestMapping(value = "/mdDetailLike.do", produces="application/json;charset=UTF-8")
	public int mdDetailLike(@RequestParam(value="entity_number")String entity_number)throws Exception{
		System.out.println("Controller why.........");
		/* 
		 * 1.세션에서 아이디 가져오기
		 * 2.해당 아이디가 gl_liked에서 좋아요를 눌렀는지 확인 O
		 * 	2-1.document ready시에 좋아요 버튼 색깔 확인 O
		 * 3. 누른적이 없다면 
		 * 	3-1.gl_liked테이블 행 추가 O
		 * 	3-2.ProductBoard테이블의 liked칼럼에 +1
		 * 	3-3.좋아요버튼 색 활성화 O
		 * 4.누른적이 있다면
		 * 	4-1.gl_liked행 삭제 O
		 * 	4-2.ProductBoard테이블의 liked칼럼에 -1
		 * 	4-3.좋아요버튼 색 비활성화 O
		 */
		
		String member_id = "jiye";

		int data = ajaxService.setLike(member_id, entity_number);
	
		System.out.println("Controller test");
	
		return data;
	
	}
}
