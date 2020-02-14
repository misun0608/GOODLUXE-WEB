package com.spring.goodluxe.jin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.goodluxe.voes.InquireCommentVO;

@RestController
public class HelpAjaxController {
	@Autowired
	private HelpService gls;
	
	// Load Comment
	@PostMapping(value="loadComment.do", produces = "application/json;charset=UTF-8")
	public ArrayList<InquireCommentVO> loadComment(int inquire_number) throws Exception {
		ArrayList<InquireCommentVO> commList = new ArrayList<InquireCommentVO>();
		try {
			commList = gls.commList(inquire_number);
		} catch(Exception e) {
			System.out.println("ERROR(HelpAjaxController/loadComment) : " + e.getMessage());
		}
		return commList;
	}
	// Insert Comment
	@PostMapping(value="insertComment.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> insertComment(InquireCommentVO commVO) throws Exception {
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int res = 0;
			
			if(commVO.getComment_ref() == 0) {
				res = gls.insertComment(commVO);
			} else {
				
			}
			
			if(res != 0) { retVal.put("message", "덧글 등록 성공"); }
			else { retVal.put("message", "덧글 등록 실패"); }
		} catch(Exception e) {
			System.out.println("ERROR(HelpAjaxController/insertComment) : " + e.getMessage());
			retVal.put("message", "ERROR(HelpAjaxController/insertComment)");
		}
		return retVal;
	}

	
}
