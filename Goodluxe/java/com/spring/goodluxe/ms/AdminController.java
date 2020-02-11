package com.spring.goodluxe.ms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.goodluxe.voes.PointVO;

@Controller
public class AdminController {

	@Autowired
	private AdminServiceImpl gls;
	
	@RequestMapping(value="home.do")
	public String go_home() {
		return "home";
	}
	
	// 포인트 관리자페이지로 이동
	@RequestMapping(value="pointView.do")
	public String pointView() throws Exception{
		return "admin_point";
	}
	
	// 포인트 관리자 페이지 입력폼 띄우기
	@RequestMapping(value="pointUpdateView.do")
	public String pointUpdateView() throws Exception{
		return "admin_point_update";
	}
	
	// 포인트 관리자에서 적립 입력했을 때
	@RequestMapping(value="admin_point_insert.do")
	public String insertPointStatus(PointVO pvo, @RequestParam(value="btn_value", required = false)String btn_value, HttpServletResponse response) throws Exception{
		System.out.println("버튼" + btn_value);
		try {
			if(btn_value.equals("적립")) {
				pvo.setPoint_status("관리자 적립");
				gls.insertPointStatus(pvo, response);
				
			}else if(btn_value.equals("회수")) {
				pvo.setPoint_status("관리자 회수");
				gls.minusPointStatus(pvo, response);
			}
		}catch(Exception e) {
			System.out.println("ERROR(AdminController/insertPointStatus) : " + e.getMessage());
		}
		return "admin_point";
	}
}
