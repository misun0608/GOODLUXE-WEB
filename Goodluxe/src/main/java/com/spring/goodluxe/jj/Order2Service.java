package com.spring.goodluxe.jj;

import com.spring.goodluxe.voes.Order2VO;

public interface Order2Service {
	int insertorder(Order2VO ordervo)throws Exception;
	int selectordercount(int auction_post_number)throws Exception;
}
