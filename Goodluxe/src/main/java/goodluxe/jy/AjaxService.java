package com.spring.goodluxe.jy;

public interface AjaxService {

	int isMemberLiked(String member_id, String entity_number)throws Exception ;
	int setLike(String member_id, String entity_number)throws Exception;
	
}
