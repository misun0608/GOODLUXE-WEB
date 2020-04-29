package com.spring.mapper;

import com.spring.goodluxe.voes.Order2VO;

public interface Order2Mapper {
	int insertorder(Order2VO ordervo);
	int selectordercount(int auction_post_number)throws Exception;
}
