package com.spring.mapper;

import java.util.ArrayList;

import com.spring.goodluxe.voes.PointVO;

public interface AdminPointMapper {
	ArrayList<PointVO> getAdminPointList();
	ArrayList<PointVO> getSearchPointList(PointVO pvo);
	int insertPointStatus(PointVO pvo);
}
