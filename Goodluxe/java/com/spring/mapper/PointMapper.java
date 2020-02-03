package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.PointVO;

public interface PointMapper {
	// 포인트 사용내역 입력
	int insertPointHistory(PointVO pointVO);
	ArrayList<PointVO> getPointList(HashMap<String, Object> pvo);
	int getListCount(String member_id);
}
