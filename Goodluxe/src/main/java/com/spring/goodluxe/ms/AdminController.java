package com.spring.goodluxe.ms;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.PointVO;

@Controller
public class AdminController {

	@Autowired
	private AdminServiceImpl gls;

	/* Page Components */
	@RequestMapping(value = "admin_header.do", method = RequestMethod.GET)
	public ModelAndView admin_header() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_header");
		return mav; 
	}
	
	@RequestMapping(value = "admin_footer.do", method = RequestMethod.GET)
	public ModelAndView admin_footer() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_footer");
		return mav; 
	}
	
	@RequestMapping(value = "home.do")
	public String go_home() {
		return "home";
	}

	// 관리자 메인페이지
	@RequestMapping(value = "admin_main.do")
	public String MainView(Model model, HttpSession session) throws Exception {
		System.out.println("관리자 메인 일반 컨트롤러");
		
		if(session.getAttribute("member_id") == null) {
			return "redirect:/mainPage.do";
		}
		
		HashMap<String, Object> map = null;
		
		// 도넛 그래프
		ArrayList<HashMap<String, Object>> cate_cnt_list = null;
		ArrayList<HashMap<String, Object>> brand_cnt_list = null;
		ArrayList<HashMap<String, Object>> cate_sales_list = null;
		ArrayList<HashMap<String, Object>> brand_sales_list = null;

		// 추가
		ArrayList<HashMap<String, Object>> data_list = null;
		ArrayList<HashMap<String, Object>> refund_list = null;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();

		// 오늘날짜
		cal.setTime(new Date());
		cal2.setTime(new Date());

		String re_today[] = new String[7];
		String today[] = new String[7];

		// 오늘 품목수
		int cnt[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 오늘 위탁수
		int con_cnt[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 오늘 매입수
		int pur_cnt[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 상품금액
		int sales[] = { 0, 0, 0, 0, 0, 0, 0 };
		int con_sales[] = { 0, 0, 0, 0, 0, 0, 0 };
		int pur_sales[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 배송료
		int delivery[] = { 0, 0, 0, 0, 0, 0, 0 };
		int con_delivery[] = { 0, 0, 0, 0, 0, 0, 0 };
		int pur_delivery[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 쿠폰
		int coupon[] = { 0, 0, 0, 0, 0, 0, 0 };
		int con_coupon[] = { 0, 0, 0, 0, 0, 0, 0 };
		int pur_coupon[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 포인트
		int point[] = { 0, 0, 0, 0, 0, 0, 0 };
		int con_point[] = { 0, 0, 0, 0, 0, 0, 0 };
		int pur_point[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 매입가격
		int buying_price[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 수수료이득
		int commission[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 환불합계
		int refund[] = { 0, 0, 0, 0, 0, 0, 0 };

		// 위탁순이익
		int con_real_sales[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 매입순이익
		int pur_real_sales[] = { 0, 0, 0, 0, 0, 0, 0 };
		// 순이익
		int real_sales[] = { 0, 0, 0, 0, 0, 0, 0 };

		try {
			map = gls.getTodayOrderCount();

			// 추가
			data_list = gls.getAdminDefaultData();
			refund_list = gls.getRefundData();

			String order_date[] = new String[data_list.size()];

			String cancel_date[] = new String[refund_list.size()];

			// 환불 데이터
			for (int j = 0; j < 7; j++) {
				re_today[j] = df.format(cal2.getTime());
//				System.out.println("기준날짜" + re_today[j]);
				// 여기까진 잘됨
				for (int i = 0; i < refund_list.size(); i++) {
					HashMap<String, Object> map2 = (HashMap<String, Object>) refund_list.get(i);

					Object obj = map2.get("order_cancel_date");
					java.sql.Timestamp ts = Timestamp.valueOf(obj.toString());

					cancel_date[i] = df.format(ts);
					if (cancel_date[i].equals(re_today[j])) {
						refund[j] += Integer.parseInt(String.valueOf(map2.get("order_pay_price")));
					}
				}
				model.addAttribute("refund" + j, refund[j]);
				cal2.add(Calendar.DATE, -1); // 날짜 하루 빼주기
			}

			// 그외 데이터
			for (int j = 0; j < 7; j++) {
				today[j] = df.format(cal.getTime());
				for (int i = 0; i < data_list.size(); i++) {
					HashMap<String, Object> map2 = (HashMap<String, Object>) data_list.get(i);
					
					// Object -> timestmap 변환위해서
					Object obj = map2.get("order_order_date");
					java.sql.Timestamp ts = Timestamp.valueOf(obj.toString());

					// 여기에서 오류
					order_date[i] = df.format(ts);
//					order_date = df.format(map2.get("order_order_date"));

//					System.out.println("비교기준날짜" + today[j]);
//					System.out.println("order날짜포맷" + order_date[i]);

					if (order_date[i].equals(today[j])) {
						Object nullchk = map2.get("buying_price");
						if(nullchk == null) {	// 위탁상품
							buying_price[j] += 0;
							commission[j] += Integer.parseInt(String.valueOf(map2.get("commission")));
							con_cnt[j] += 1;
							int ship_fee = Integer.parseInt(String.valueOf(map2.get("order_ship_fee"))); // HashMap은 한번밖에 못꺼내나?
							con_sales[j] += Integer.parseInt(String.valueOf(map2.get("order_product_price")));
							con_delivery[j] += ship_fee;
							con_point[j] += Integer.parseInt(String.valueOf(map2.get("order_used_point")));
							if(map2.get("order_used_coupon") == null) {
								con_coupon[j] += 0;
							}else {
								con_coupon[j] += ship_fee;
							}
							// 위탁상품판매면 수수료수익 = 순매출
							con_real_sales[j] = commission[j];
						}else {	// 매입상품
							commission[j] += 0;
							buying_price[j] += Integer.parseInt(String.valueOf(nullchk));
							pur_cnt[j] += 1;
							int ship_fee = Integer.parseInt(String.valueOf(map2.get("order_ship_fee"))); // HashMap은 한번밖에 못꺼내나?
							pur_sales[j] += Integer.parseInt(String.valueOf(map2.get("order_product_price")));
							pur_delivery[j] += ship_fee;
							pur_point[j] += Integer.parseInt(String.valueOf(map2.get("order_used_point")));
							if(map2.get("order_used_coupon") == null) {
								pur_coupon[j] += 0;
							}else {
								pur_coupon[j] += ship_fee;
							}
							// 매입상품일때 순매출 계산
							pur_real_sales[j] = pur_sales[j] - pur_delivery[j] - pur_point[j] - buying_price[j] - pur_coupon[j];
							System.out.println("매입 순매출 " + pur_real_sales[j]);
						}
//						System.out.println("구매가격" + buying_price[j]);
					}
					// 위탁 매입 합치는 작업들
					cnt[j] = pur_cnt[j] + con_cnt[j];
					sales[j] = pur_sales[j] + con_sales[j];
					delivery[j] = pur_delivery[j] + con_delivery[j];
					point[j] = pur_point[j] + con_point[j];
					coupon[j] = pur_coupon[j] + con_coupon[j];
					real_sales[j] = pur_real_sales[j] + con_real_sales[j];	// 순매출 = 위탁상품순매출 + 매입상품순매출
				}
				model.addAttribute("today" + j, today[j]);
				model.addAttribute("cnt" + j, cnt[j]);
				model.addAttribute("con_cnt" + j, con_cnt[j]);
				model.addAttribute("pur_cnt" + j, pur_cnt[j]);
				model.addAttribute("sales" + j, sales[j]);
				model.addAttribute("delivery" + j, delivery[j]);
				model.addAttribute("point" + j, point[j]);
				model.addAttribute("buying_price" + j, buying_price[j]);
				model.addAttribute("commission" + j, commission[j]);
				model.addAttribute("coupon" + j, coupon[j]);
				model.addAttribute("real_sales" + j, real_sales[j]);
				cal.add(Calendar.DATE, -1); // 날짜 하루 빼주기
			}
			
			// 도넛 그래프 데이터
			// 카테고리별 주문수
			cate_cnt_list = gls.getCateCntData();
			// 브랜드별 주문수
			brand_cnt_list = gls.getBrandCntData();
			// 카테고리별 매출액
			cate_sales_list = gls.getCateSalesData();
			// 브랜드별 매출액
			brand_sales_list = gls.getBrandSalesData();
			
//			System.out.println(cate_cnt_list);
//			System.out.println(brand_cnt_list);
//			System.out.println(cate_sales_list);
//			System.out.println(brand_sales_list);
			
			model.addAttribute("map", map);
			model.addAttribute("cate_cnt_list", cate_cnt_list);
			model.addAttribute("brand_cnt_list", brand_cnt_list);
			model.addAttribute("cate_sales_list", cate_sales_list);
			model.addAttribute("brand_sales_list", brand_sales_list);

		} catch (Exception e) {
			System.out.println("ERROR(AdminController/MainView) : " + e.getMessage());
		}
		return "admin_main";
	}

	// 포인트 관리자페이지로 이동
	@RequestMapping(value = "pointView.do")
	public String pointView(HttpSession session) throws Exception {
		if(session.getAttribute("member_id") == null) {
			return "redirect:/mainPage.do";
		}
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
//		System.out.println("관리자 포인트 입력 컨트롤러");
//		System.out.println("버튼" + btn_value);
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
	
	// 포인트 관리자 페이지 입력폼 띄우기(모달 test)
//	@RequestMapping(value = "pointUpdateModal.do")
//	public String pointUpdateModal() throws Exception {
//
//		return "admin_point_modal";
//	}
	
}
