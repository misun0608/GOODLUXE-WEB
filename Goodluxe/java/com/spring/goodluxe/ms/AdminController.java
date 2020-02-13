package com.spring.goodluxe.ms;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.goodluxe.voes.PointVO;

@Controller
public class AdminController {

	@Autowired
	private AdminServiceImpl gls;

	@RequestMapping(value = "home.do")
	public String go_home() {
		return "home";
	}

	// 관리자 메인페이지
	@RequestMapping(value = "admin_main.do")
	public String MainView(Model model) throws Exception {
		System.out.println("관리자 메인 일반 컨트롤러");
		HashMap<String, Object> map = null;

		// 추가
		ArrayList<HashMap<String, Object>> data_list = null;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String order_date = null;
		Calendar cal = Calendar.getInstance();

		// 오늘날짜
		cal.setTime(new Date());

		String today[] = new String[7];

		// 오늘 품목수
		int cnt[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 판매액
		int sales[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 배송료
		int delivery[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 쿠폰
		int coupon[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 포인트
		int point[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 매입가격
		int buying_price[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 수수료이득
		int commission[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 순이익
		int real_sales[] = new int[7];

		try {
			map = gls.getTodayOrderCount();

			// 추가
			data_list = gls.getDefaultGraph();

			for (int i = 0; i < data_list.size(); i++) {
				HashMap<String, Object> map2 = (HashMap<String, Object>) data_list.get(i);
				today[i] = df.format(cal.getTime());

				order_date = df.format(map2.get("order_order_date"));

				if (order_date.equals(today[i])) {
					int ship_fee = (int) map2.get("order_ship_fee"); // HashMap은 한번밖에 못꺼내나?

					cnt[i] += 1;
					sales[i] += (int) map2.get("order_product_price");
					delivery[i] += ship_fee;
					point[i] += (int) map2.get("order_used_point");
					buying_price[i] += (int) map2.get("buying_price");
					commission[i] += (int) map2.get("commission");
					if (map.get("order_used_coupon") != null) {
						coupon[i] += ship_fee;
					}
					real_sales[i] = sales[i] - delivery[i] - point[i] - buying_price[i] - commission[i] - coupon[i];
				}
				model.addAttribute("today"+i, today[i]);
				model.addAttribute("cnt"+i, cnt[i]);
				model.addAttribute("sales"+i, sales[i]);
				model.addAttribute("delivery"+i, delivery[i]);
				model.addAttribute("point"+i, point[i]);
				model.addAttribute("buying_price"+i, buying_price[i]);
				model.addAttribute("commission"+i, commission[i]);
				model.addAttribute("coupon"+i, coupon[i]);
				model.addAttribute("real_sales"+i, real_sales[i]);
				
				cal.add(Calendar.DATE, -1); // 날짜 하루 빼주기
			}
			model.addAttribute("map", map);


		} catch (Exception e) {
			System.out.println("ERROR(AdminController/MainView) : " + e.getMessage());
		}
		return "admin_main";
	}

	// 포인트 관리자페이지로 이동
	@RequestMapping(value = "pointView.do")
	public String pointView() throws Exception {
		return "admin_point";
	}

	// 포인트 관리자 페이지 입력폼 띄우기
	@RequestMapping(value = "pointUpdateView.do")
	public String pointUpdateView() throws Exception {
		return "admin_point_update";
	}

	// 포인트 관리자에서 적립 입력했을 때
	@RequestMapping(value = "admin_point_insert.do")
	public String insertPointStatus(PointVO pvo, @RequestParam(value = "btn_value", required = false) String btn_value,
			HttpServletResponse response) throws Exception {
		System.out.println("버튼" + btn_value);
		try {
			if (btn_value.equals("적립")) {
				pvo.setPoint_status("관리자 적립");
				gls.insertPointStatus(pvo, response);

			} else if (btn_value.equals("회수")) {
				pvo.setPoint_status("관리자 회수");
				gls.minusPointStatus(pvo, response);
			}
		} catch (Exception e) {
			System.out.println("ERROR(AdminController/insertPointStatus) : " + e.getMessage());
		}
		return "admin_point";
	}
}
