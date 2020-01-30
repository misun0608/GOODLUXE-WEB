package com.spring.mapper;

import java.util.HashMap;

public interface AjaxMapper {
	int isAlreadyLiked(HashMap<String,String> map);

	int insertLikedUser(HashMap<String, String> map);

	int deleteLikedUser(HashMap<String, String> map);
}
     