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
			commVO.setComment_content(commVO.getComment_content().replace("\r\n", "<br/>"));
			if(commVO.getComment_ref() == 0) {
				res = gls.insertComment(commVO);
			} else {
				res = gls.insertReComment(commVO);
			}
			
			if(res != 0) { retVal.put("message", "덧글 등록 성공"); }
			else { retVal.put("message", "덧글 등록 실패"); }
		} catch(Exception e) {
			System.out.println("ERROR(HelpAjaxController/insertComment) : " + e.getMessage());
			retVal.put("message", "ERROR(HelpAjaxController/insertComment)");
		}
		return retVal;
	}
	// Update Comment
	@PostMapping(value="updateComment.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> updateComment(InquireCommentVO commVO, String updated_content) throws Exception {
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int res = 0;
			commVO.setComment_content(updated_content);
			
			res = gls.updateComment(commVO);
			
			if(res != 0) { retVal.put("message", "덧글 수정 성공"); }
			else { retVal.put("message", "덧글 수정 실패"); }
		} catch(Exception e) {
			System.out.println("ERROR(HelpAjaxController/updateComment) : " + e.getMessage());
			retVal.put("message", "ERROR(HelpAjaxController/updateComment)");
		}
		return retVal;
	}
	// Delete Comment
	@PostMapping(value="deleteComment.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> deleteComment(InquireCommentVO commVO) throws Exception {
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int res = 0;
			res = gls.deleteComment(commVO);
			if(res != 0) { retVal.put("message", "덧글 삭제 성공"); }
			else { retVal.put("message", "덧글 삭제 실패"); }
		} catch(Exception e) {
			System.out.println("ERROR(HelpAjaxController/deleteComment) : " + e.getMessage());
			retVal.put("message", "ERROR(HelpAjaxController/deleteComment)");
		}
		return retVal;
	}

	
	
}
