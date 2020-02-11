package com.spring.goodluxe.ms;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import com.spring.goodluxe.voes.PointVO;

public interface AdminService {
	// 포인트 디폴트 리스트
	public ArrayList<PointVO> getAdminPointList() throws Exception;
	// 아이디 검색 포인트 리스트
	public ArrayList<PointVO> getSearchPointList(PointVO pvo) throws Exception;
	// 포인트 적립 입력
	public void insertPointStatus(PointVO pvo, HttpServletResponse response) throws Exception;
	// 포인트 회수 입력
	public void minusPointStatus(PointVO pvo, HttpServletResponse response) throws Exception;
}
