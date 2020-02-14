package com.spring.goodluxe.ms;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.goodluxe.voes.PointVO;

@RestController
public class AdminAjaxController {
	@Autowired
	private AdminServiceImpl gls;
	
	// 관리자 포인트페이지 처음 들어갔을때 뜨는 모든 포인트내역리스트
	@PostMapping(value="getDefaultPointList.do", produces="application/json;charset=UTF-8")
	ArrayList<PointVO> getDefaultPointList() throws Exception{
		System.out.println("컨트롤러1");
		ArrayList<PointVO> point_list = null;
		try {
			point_list = gls.getAdminPointList();
		}catch(Exception e){
			System.out.println("ERROR(AdminAjaxController/getDefaultPointList) : " + e.getMessage());
		}
		return point_list;
	}
	
	// 아이디 검색했을 때 나오는 포인트 리스트
	@PostMapping(value="searchPointList.do", produces="application/json;charset=UTF-8")
	ArrayList<PointVO> getSearchPointList(PointVO pvo) throws Exception{
		System.out.println("컨트롤러2");
		ArrayList<PointVO> point_list = null;
		try {
			point_list = gls.getSearchPointList(pvo);
		}catch(Exception e){
			System.out.println("ERROR(AdminAjaxController/searchPointList) : " + e.getMessage());
		}
		return point_list;
	}
	
	// 관리자 메인페이지 디폴트
	@PostMapping(value="getDefaultMainData.do", produces="application/json;charset=UTF-8")
	HashMap<String,Object> getDefaultMainData() throws Exception{
		HashMap<String,Object> map = null;
		System.out.println("관리자 메인 디폴트");
		try {
			
		}catch(Exception e) {
			System.out.println("ERROR(AdminAjaxController/getDefaultMainData) : " + e.getMessage());
		}
		return map;
	}
}
