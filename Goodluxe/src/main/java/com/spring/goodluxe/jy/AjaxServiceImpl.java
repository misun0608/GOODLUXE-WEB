package com.spring.goodluxe.jy;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ajaxService")
public class AjaxServiceImpl implements AjaxService{

	@Autowired 
	private SqlSession slqSession;
}
