<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%
	HashMap<String, Object> vo = (HashMap<String, Object>) request.getAttribute("map");

	String today[] = new String[7];

	// 컴마
	DecimalFormat df3 = new DecimalFormat("###,###");

	// 주문액
	String order_sales = df3.format(vo.get("order_sales")) + "원";
	// 결제액
	String paid_sales = df3.format(vo.get("paid_order_sales")) + "원";
	// 환불액
	String refund_sales = df3.format(vo.get("refund_order_sales")) + "원";

	// 오늘 품목수
	int cnt[] = {0, 0, 0, 0, 0, 0, 0};
	// 위탁 품목수
	int con_cnt[] = {0, 0, 0, 0, 0, 0, 0};
	// 매입 품목수
	int pur_cnt[] = {0, 0, 0, 0, 0, 0, 0};
	// 판매액
	int sales[] = {0, 0, 0, 0, 0, 0, 0};
	// 배송료
	int delivery[] = {0, 0, 0, 0, 0, 0, 0};
	// 쿠폰
	int coupon[] = {0, 0, 0, 0, 0, 0, 0};
	// 포인트
	int point[] = {0, 0, 0, 0, 0, 0, 0};
	// 매입가격
	int buying_price[] = {0, 0, 0, 0, 0, 0, 0};
	// 수수료이득
	int commission[] = {0, 0, 0, 0, 0, 0, 0};
	// 환불
	int refund[] = {0, 0, 0, 0, 0, 0, 0};
	// 순이익
	int real_sales[] = new int[7];

	// 총계
	int tot_cnt = 0;
	int tot_con_cnt = 0;
	int tot_pur_cnt = 0;
	int tot_sales = 0;
	int tot_delivery = 0;
	int tot_coupon = 0;
	int tot_point = 0;
	int tot_buying_price = 0;
	int tot_commission = 0;
	int tot_refund = 0;
	int tot_real_sales = 0;

	// 컴마 작업...
	String format_sales[] = new String[7];
	String format_delivery[] = new String[7];
	String format_point[] = new String[7];
	String format_buying_price[] = new String[7];
	String format_commission[] = new String[7];
	String format_coupon[] = new String[7];
	String format_refund[] = new String[7];
	String format_real_sales[] = new String[7];
	String format_tot_sales = null;
	String format_tot_delivery = null;
	String format_tot_coupon = null;
	String format_tot_point = null;
	String format_tot_buying_price = null;
	String format_tot_commission = null;
	String format_tot_refund = null;
	String format_tot_real_sales = null;

	for (int i = 0; i < 7; i++) {
		today[i] = (String) request.getAttribute("today" + i);
		System.out.println("오늘" + today[i]);
		cnt[i] = (int) request.getAttribute("cnt" + i);
		con_cnt[i] = (int) request.getAttribute("con_cnt" + i);
		pur_cnt[i] = (int) request.getAttribute("pur_cnt" + i);
		sales[i] = (int) request.getAttribute("sales" + i);
		delivery[i] = (int) request.getAttribute("delivery" + i);
		point[i] = (int) request.getAttribute("point" + i);
		buying_price[i] = (int) request.getAttribute("buying_price" + i);
		commission[i] = (int) request.getAttribute("commission" + i);
		coupon[i] = (int) request.getAttribute("coupon" + i);
		refund[i] = (int) request.getAttribute("refund" + i);
		real_sales[i] = (int) request.getAttribute("real_sales" + i);

		tot_cnt += cnt[i];
		tot_con_cnt += con_cnt[i];
		tot_pur_cnt += pur_cnt[i];
		tot_sales += sales[i];
		tot_delivery += delivery[i];
		tot_coupon += coupon[i];
		tot_point += point[i];
		tot_buying_price += buying_price[i];
		tot_commission += commission[i];
		tot_refund += refund[i];
		tot_real_sales += real_sales[i];
	}

	for (int i = 0; i < 7; i++) {
		format_sales[i] = df3.format(sales[i]);
		format_delivery[i] = df3.format(delivery[i]);
		format_point[i] = df3.format(point[i]);
		format_buying_price[i] = df3.format(buying_price[i]);
		format_commission[i] = df3.format(commission[i]);
		format_coupon[i] = df3.format(coupon[i]);
		format_refund[i] = df3.format(refund[i]);
		format_real_sales[i] = df3.format(real_sales[i]);

		// 총계
		format_tot_sales = df3.format(tot_sales);
		format_tot_delivery = df3.format(tot_delivery);
		format_tot_coupon = df3.format(tot_coupon);
		format_tot_point = df3.format(tot_point);
		format_tot_buying_price = df3.format(tot_buying_price);
		format_tot_commission = df3.format(tot_commission);
		format_tot_refund = df3.format(tot_refund);
		format_tot_real_sales = df3.format(tot_real_sales);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>관리자메인</title>

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.menu.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- chart.js 사용 CDN -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin_design_all.css">


<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger {
	cursor: pointer;
}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker {
	cursor: pointer;
}
</style>

<script>
	$(document).ready(function() {
		$("#hd").load("admin_header.do");
	});
</script>

<script>
	$(document).ready(
			function() {
				/* 최근 7일 주문 상태  */
				var today = new Date();
				var yesterday = new Date(Date.parse(today) - 1 * 1000 * 60 * 60
						* 24);
				var dayago2 = new Date(Date.parse(today) - 2 * 1000 * 60 * 60
						* 24);
				var dayago3 = new Date(Date.parse(today) - 3 * 1000 * 60 * 60
						* 24);
				var dayago4 = new Date(Date.parse(today) - 4 * 1000 * 60 * 60
						* 24);
				var dayago5 = new Date(Date.parse(today) - 5 * 1000 * 60 * 60
						* 24);
				var dayago6 = new Date(Date.parse(today) - 6 * 1000 * 60 * 60
						* 24);

				//Date 개체를 입력받아 yyyy-MM-dd 형식으로 반환
				function timeSt(dt) {
					var d = new Date(dt);
					var MM = d.getMonth() + 1;
					var dd = d.getDate();

					return (addzero(MM) + '-' + addzero(dd));
				}

				//10보다 작으면 앞에 0을 붙임
				function addzero(n) {
					return n < 10 ? "0" + n : n;
				}

				//Date 개체를 입력받아 yy-MM-dd 형식으로 반환
				function timeSt2(dt) {
					var d = new Date(dt);
					var yy = d.getFullYear().toString().substring(2, 4);
					var MM = d.getMonth() + 1;
					var dd = d.getDate();

					return (yy + '-' + addzero(MM) + '-' + addzero(dd));
				}

				// 막대그래프
				var ctx = document.getElementById('myChart');
				var myChart = new Chart(ctx, {
					type : 'bar',
					data : {
						labels : [ timeSt2(today), timeSt2(yesterday),
								timeSt2(dayago2), timeSt2(dayago3),
								timeSt2(dayago4), timeSt2(dayago5),
								timeSt2(dayago6) ],
						datasets : [
								{
									label : '매출액',
									yAxisID : 'A',
									data : [
										<%=sales[0]%>
											,
										<%=sales[1]%>
											,
										<%=sales[2]%>
											,
										<%=sales[3]%>
											,
										<%=sales[4]%>
											,
										<%=sales[5]%>
											,
										<%=sales[6]%>
											],
									backgroundColor : [ // 각 날짜의 맨앞! (매출액)
									'rgba(255, 99, 132, 0.2)',
											'rgba(255, 99, 132, 0.2)',
											'rgba(255, 99, 132, 0.2)',
											'rgba(255, 99, 132, 0.2)',
											'rgba(255, 99, 132, 0.2)',
											'rgba(255, 99, 132, 0.2)',
											'rgba(255, 99, 132, 0.2)' ],
									borderColor : [ 'rgba(255, 99, 132, 1)',
											'rgba(255, 99, 132, 1)',
											'rgba(255, 99, 132, 1)',
											'rgba(255, 99, 132, 1)',
											'rgba(255, 99, 132, 1)',
											'rgba(255, 99, 132, 1)',
											'rgba(255, 99, 132, 1)' ],
									borderWidth : 1
								},
								{
									label : '순매출액',
									data : [
										<%=real_sales[0]%>
											,
										<%=real_sales[1]%>
											,
										<%=real_sales[2]%>
											,
										<%=real_sales[3]%>
											,
										<%=real_sales[4]%>
											,
										<%=real_sales[5]%>
											,
										<%=real_sales[6]%>
											],
									backgroundColor : [
											'rgba(54, 162, 235, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(54, 162, 235, 0.2)' ],
									borderColor : [ 'rgba(54, 162, 235, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(54, 162, 235, 1)' ],
									borderWidth : 1
								},
								{
									label : '매출건',
									yAxisID : 'B',
									data : [
											<%=cnt[0]%>
												,
											<%=cnt[1]%>
												,
											<%=cnt[2]%>
												,
											<%=cnt[3]%>
												,
											<%=cnt[4]%>
												,
											<%=cnt[5]%>
												,
											<%=cnt[6]%>
												],
									backgroundColor : [
											'rgba(75, 192, 192, 0.2)',
											'rgba(75, 192, 192, 0.2)',
											'rgba(75, 192, 192, 0.2)',
											'rgba(75, 192, 192, 0.2)',
											'rgba(75, 192, 192, 0.2)',
											'rgba(75, 192, 192, 0.2)',
											'rgba(75, 192, 192, 0.2)' ],
									borderColor : [ 'rgba(75, 192, 192, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(75, 192, 192, 1)' ],
									borderWidth : 1
								} ]
					},
					options : {
						//responsive: false,
						maintainAspectRatio : false,
						scales : {
							yAxes : [ {
								id : 'A',
								type : 'linear',
								position : 'left',
								ticks : {
									beginAtZero : true
								}

							}, {
								id : 'B',
								type : 'linear',
								position : 'right',
								ticks : {
									beginAtZero : true
								//min: 0,
								//max: 50
								}
							} ]
						}
					}
				});

				// 원형그래프
				var ctx2 = document.getElementById('myChart2');
				var myChart2 = new Chart(ctx, {
					type : 'doughnut',
					data : {
						datasets : [ {
							data : [ 10, 20, 30, 20, 10 ],
							backgroundColor : [
							'rgba(190, 190, 190, 1)',
							'rgba(241, 196, 15, 1)',
							'rgba(244, 7, 7, 1)',
							'rgba(52, 152, 219, 1)',
							'rgba(46, 204, 113, 1)'
							],
						} ],
						labels : [ '미지정', '다음주 이후', '이번주 까지', '완료', '기한 만료' ]
					},
					options : {
						maintainAspectRatio : false,
						//responsive: false,
						cutoutPercentage : 50,
						legend : {
							display : true,
							position : 'left',
							labels : {
								fontSize : 12,
								fontFamily : '나눔고딕',
								fontColor : '#000000'
								// fontStyle : 'bold'
							}
						}
					}
				});
			});
</script>
</head>

<body>

	<header id="hd"></header>


	<div id="wrapper">

		<div id="container" class="container-small">

			<h1 id="container_title">관리자메인</h1>
			<div class="container_wr">
				<section>

					<br>
					<div class="local_desc02 local_desc">최근 차트</div>

				</section>

				<div class="grapharea">
					<canvas id="myChart" width="700" height="500"></canvas>
				</div>
				<div class="grapharea2">
					<canvas id="myChart2" width="700" height="500"></canvas>
				</div>
				
				<div class="tbl_head01 tbl_wrap">
					<table border=1>
						<tr>
							<td rowspan="2">일자</td>
							<td colspan="7">결제 완료 주문</td>
							<td rowspan="2">환불 합계</td>
							<td rowspan="2">순매출</td>
						</tr>
						<tr>
							<td>품목수(매입/위탁)</td>
							<td>상품금액</td>
							<td>배송비</td>
							<td>포인트</td>
							<td>쿠폰</td>
							<td>매입 금액</td>
							<td>수수료 수익</td>
						</tr>
						<%
							for (int i = 0; i < 7; i++) {
						%>
						<tr>
							<td><%=today[i]%></td>
							<td><%=cnt[i]%>(<%=pur_cnt[i]%>/<%=con_cnt[i]%>)</td>
							<td><%=format_sales[i]%></td>
							<td><%=format_delivery[i]%></td>
							<td><%=format_point[i]%></td>
							<td><%=format_coupon[i]%></td>
							<td><%=format_buying_price[i]%></td>
							<td><%=format_commission[i]%></td>
							<td><%=format_refund[i]%></td>
							<td><%=format_real_sales[i]%></td>
						</tr>
						<%
							}
						%>
						<tr>
							<td>총계</td>
							<td><%=tot_cnt%>(<%=tot_con_cnt%>/<%=tot_pur_cnt%>)</td>
							<td><%=format_tot_sales%></td>
							<td><%=format_tot_delivery%></td>
							<td><%=format_tot_coupon%></td>
							<td><%=format_tot_point%></td>
							<td><%=format_tot_buying_price%></td>
							<td><%=format_tot_commission%></td>
							<td><%=format_tot_refund%></td>
							<td><%=format_tot_real_sales%></td>
						</tr>
					</table>


					<section>
						<H2>현황</H2>

						<h2>오늘 매출 현황</h2>
						<button type="button" class="btn00_1">
							<span class="wkrdma">주문(<%=vo.get("order_count")%>건)
							</span><br> <b><span class="zma"><%=order_sales%></span></b>
						</button>
						<button type="button" class="btn00_1">
							<span class="wkrdma">결제(<%=vo.get("paid_order_count")%>건)
							</span><br> <b><span class="zma"><%=paid_sales%></spqn></b>
						</button>
						<button type="button" class="btn00_1">
							<span class="wkrdma">환불(<%=vo.get("refund_order_count")%>건)
							</span><br> <b><span class="zma"><%=refund_sales%></span></b>
						</button>

						<h2>주문 현황 (최근 1개월(30일) 기준)</h2>
						<button type="button" class="btn00_2">
							<span class="wkrdma">결제전</span><br> <b><span class="zma"><%=vo.get("paid_before_count")%></span class="zma"></b>
						</button>
						<button type="button" class="btn00_2">
							<span class="wkrdma">배송준비중</span><br> <b><span
								class="zma"><%=vo.get("prepared_count")%></span class="zma"></b>
						</button>
						<button type="button" class="btn00_2">
							<span class="wkrdma">배송중</span><br> <span class="zma"><b><%=vo.get("shipping_count")%></b></span class="zma">
						</button>
						<button type="button" class="btn00_2">
							<span class="wkrdma">배송완료</span><br> <span class="zma"><b><%=vo.get("done_count")%></b></span class="zma">
						</button>

						<h2>취소 / 반품 / 환불 현황 (최근 1개월(30일) 기준)</h2>
						<button type="button" class="btn00_1">
							<span class="wkrdma">취소</span><br> <b><span class="zma"><%=vo.get("cancel_count")%></span class="zma"></b>
						</button>
						<button type="button" class="btn00_1">
							<span class="wkrdma">반품</span><br> <b><span class="zma"><%=vo.get("item_back_count")%></span class="zma"></b>
						</button>
						<button type="button" class="btn00_1">
							<span class="wkrdma">환불</span><br> <b><span class="zma"><%=vo.get("refund_count")%></span class="zma"></b>
						</button>


					</section>



					<section>
						<h2>최근게시물</h2>

						<div class="tbl_head01 tbl_wrap">
							<table>
								<caption>최근게시물</caption>
								<thead>
									<tr>
										<th scope="col">그룹</th>
										<th scope="col">게시판</th>
										<th scope="col">제목</th>
										<th scope="col">이름</th>
										<th scope="col">일시</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td colspan="5" class="empty_table">자료가 없습니다.</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="btn_list03 btn_list">
							<a href="#">최근게시물 더보기</a>
						</div>
					</section>
				</div>
			</div>



			<footer id="ft" class="container-fluid">
				<p>
					Copyright &copy; watches.zak.kr. All rights reserved. YoungCart
					Version 5.3.2.9.1<br>
					<button type="button" class="scroll_top">
						<span class="top_img"></span><span class="top_txt">TOP</span>
					</button>
				</p>
			</footer>
		</div>

	</div>
</body>
</html>