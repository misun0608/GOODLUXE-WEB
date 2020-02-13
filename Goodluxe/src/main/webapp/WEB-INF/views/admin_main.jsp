<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%
	HashMap<String,Object> vo = (HashMap<String,Object>)request.getAttribute("map");
	
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

	for(int i=0; i<7; i++){
		today[i] = (String)request.getAttribute("today"+i);
		cnt[i] = (int)request.getAttribute("cnt"+i);
		sales[i] = (int)request.getAttribute("sales"+i);
		delivery[i] = (int)request.getAttribute("delivery"+i);
		point[i] = (int)request.getAttribute("point"+i);
		buying_price[i] = (int)request.getAttribute("buying_price"+i);
		commission[i] = (int)request.getAttribute("commission"+i);
		coupon[i] = (int)request.getAttribute("coupon"+i);
		real_sales[i] = (int)request.getAttribute("real_sales"+i);
	}

	// 컴마
	DecimalFormat df3 = new DecimalFormat("###,###");
	
	// 주문액
	String order_sales = df3.format(vo.get("order_sales")) + "원";
	// 결제액
	String paid_sales = df3.format(vo.get("paid_order_sales")) + "원";
	// 환불액
	String refund_sales = df3.format(vo.get("refund_order_sales")) + "원";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>관리자메인</title>

<script src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.menu.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- chart.js 사용 CDN -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_design_all.css">


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
$(document).ready(function(){
	
var ctx = document.getElementById('myChart');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [today[0], today[1], today[2], today[3], today[4], today[5], today[6]],
        datasets: [
        	{
            label: '매출액',
            yAxisID: 'A',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [	// 각 날짜의 맨앞! (매출액)
                'rgba(255, 99, 132, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(255, 99, 132, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(255, 99, 132, 1)'
            ],
            borderWidth: 1
        },
        {
            label: '순매출액',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)'
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)'
            ],
            borderWidth: 1
        },
        {
            label: '매출건',
            yAxisID: 'B',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(75, 192, 192, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(75, 192, 192, 0.2)'
            ],
            borderColor: [
                'rgba(75, 192, 192, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(75, 192, 192, 1)'
            ],
            borderWidth: 1
        }
        ]
    },
    options: {
        scales: {
            yAxes: [
            	{
            		id: 'A',
                    type: 'linear',
                    position: 'left',
                	ticks: {
                        beginAtZero: true
                    }

            	},
            	{
            		id: 'B',
                    type: 'linear',
                    position: 'right',
                	ticks: {
                	min: 0,
					max: 50
                }
            }]
        }
    }
});
});
</script>
</head>

<body>

	<header id="hd">
		<div id="hd_top">
			<button type="button" id="btn_gnb" class="btn_gnb_close btn_gnb_open"></button>
			<div id="logo">
				<a href="./adminMain.html"><img
					src="${pageContext.request.contextPath}/resources/img/logo.png"></a>
			</div>

			<div id="tnb">
				<ul>
					<li class="tnb_li"><a href="#" class="tnb_service"
						target="_blank";><img src="./img/home.png" width="25px"></a></li>
				</ul>
			</div>
		</div>
		<nav id="gnb" class="gnb_large gnb_small">

			<ul class="gnb_ul">
				<li class="gnb_li">
					<button type="button" class="btn_op menu-200 menu-order-2"
						title="회원관리">회원관리</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>회원관리</h3>
							<ul>
								<li><a href="./admincustomermanagement.html"
									class="gnb_2da">회원관리</a></li>
								<li><a href="./adminpointmanagement.html"
									class="gnb_2da  gnb_grp_div">적립금관리</a></li>
								<li><a href="./admincouponmanagement.html"
									class="gnb_2da  ">쿠폰관리</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="gnb_li">
					<button type="button" class="btn_op menu-900 menu-order-2"
						title="회원관리">상품관리</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>상품관리</h3>
							<ul>
								<li><a href="#" class="gnb_2da">매입 상품 등록</a></li>
								<li><a href="#" class="gnb_2da">위탁 상품 등록</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="gnb_li">
					<button type="button" class="btn_op menu-300 menu-order-3"
						title="게시판관리">게시판관리</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>게시판관리</h3>
							<ul>
								<li><a href="./adminpostmanagement.html" class="gnb_2da">게시판관리</a></li>
								<li><a href="./adminvksao.html" class="gnb_2da">게시판
										판매 등록</a></li>
								<li><a href="./adminrudao.html" class="gnb_2da">게시판
										경매 등록</a></li>
								<li><a href="#" class="gnb_2da  gnb_grp_div">Q&A관리</a></li>
								<li><a href="#" class="gnb_2da gnb_grp_style ">FAQ관리</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="gnb_li">
					<button type="button" class="btn_op menu-400 menu-order-4"
						title="쇼핑몰관리">몰관리</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>사이트 관리</h3>
							<ul>
								<li><a href="./adminorderproduct.html"
									clss="gnb_2da gnb_grp_style gnb_grp_div">주문목록</a></li>
								<li><a href="./adminorderproduct_cancel.html"
									clss="gnb_2da gnb_grp_style gnb_grp_div">주문취소</a></li>
								<li><a href="./adminorderproduct_refund.html"
									clss="gnb_2da gnb_grp_style gnb_grp_div">주문 반품</a></li>
								<li><a href="./adminorderproduct_return.html"
									clss="gnb_2da gnb_grp_style gnb_grp_div">주문 환불</a></li>
								<li><a href="./adminorderproduct_customermanagement.html"
									class="gnb_2da gnb_grp_style ">주문 고객 관리</a></li>
								<li><a href="./adminproductregister.html" class="gnb_2da  ">상품등록</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="gnb_li">
					<button type="button" class="btn_op menu-500 menu-order-5"
						title="쇼핑몰현황/기타">쇼핑몰현황/기타</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>쇼핑몰현황/기타</h3>
							<ul>
								<li><a href="./adminMain.html" class="gnb_2da  ">매출현황</a></li>
								<li><a href="./admindelivermanagement.html"
									class="gnb_2da ">배송관리</a></li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</nav>

	</header>


	<div id="wrapper">

		<div id="container" class="container-small">

			<h1 id="container_title">관리자메인</h1>
			<div class="container_wr">
				<section>

					<br>
					<div class="local_desc02 local_desc">최근 차트</div>
					<table border=1;>
						<tr class="tr1" id="calselect">
							<td class="td4">
								<div class="tab">
									<select id="calendarc" class="search" onChange="select_click()">
										<option value="sectiontimes">기간</option>
										<option value="day">일별</option>
										<option value="week">주별</option>
										<option value="month">월별</option>
									</select>
								</div>
							</td>
							<td id="day" class="cal">&nbsp;
								<button type="button" class="btn24">
									오늘<br>
								</button>
								<button type="button" class="btn24">
									어제<br>
								</button>
								<button type="button" class="btn24">
									7일<br>
								</button>
								<button type="button" class="btn24">
									1개월<br>
								</button> <input type="text" id="datepicker">~ <input type="text"
								id="datepicker2">

							</td>
							<td id="week" class="cal">최근 <select class="search">
									<option value="weekend">1</option>
									<option value="weekend">2</option>
									<option value="weekend">3</option>
									<option value="weekend">4</option>
									<option value="weekend">5</option>
							</select> 주

							</td>
							<td id="month" class="cal">
							<input type="text" id="datepicker3">~ <input type="text" id="datepicker4">
							</td>
						</tr>
					</table>
				</section>

				<Br>
				<div align="center">
					<button type="button" class="btn1">
						검색<br>
					</button>
				</div>
				<br> <br>
				<div class ="grapharea">
					<canvas id="myChart" width="350" height="150"></canvas>
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
							<td>품목 수</td>
							<td>상품금액</td>
							<td>배송비</td>
							<td>할인</td>
							<td>쿠폰</td>
							<td>매입 금액</td>
							<td>수수료 수익</td>
						</tr>
						<tr>
							<td>2019.12.24</td>
							<td>1</td>
							<td>10,000,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>2,000,000</td>
							<td>-</td>
							<td>-</td>
							<td>1,000,000</td>
						</tr>
						<tr>
							<td>2019.12.24</td>
							<td>1</td>
							<td>10,000,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>2,000,000</td>
							<td>-</td>
							<td>-</td>
							<td>1,000,000</td>
						</tr>
						<tr>
							<td>2019.12.24</td>
							<td>1</td>
							<td>10,000,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>2,000,000</td>
							<td>-</td>
							<td>-</td>
							<td>1,000,000</td>
						</tr>
					</table>

					<tbody>

						<section>
							<H2>현황</H2>

							<h2>오늘 매출 현황</h2>
							<button type="button" class="btn00_1">
								<span class="wkrdma">주문(<%=vo.get("order_count") %>건)</span><br>
								<b><span class="zma"><%=order_sales %></span></b>
							</button>
							<button type="button" class="btn00_1">
								<span class="wkrdma">결제(<%=vo.get("paid_order_count") %>건)</span><br>
								<b><span class="zma"><%=paid_sales %></spqn></b>
							</button>
							<button type="button" class="btn00_1">
								<span class="wkrdma">환불(<%=vo.get("refund_order_count") %>건)</span><br>
								<b><span class="zma"><%=refund_sales %></span></b>
							</button>

							<h2>주문 현황 (최근 1개월(30일) 기준)</h2>
							<button type="button" class="btn00_2">
								<span class="wkrdma">결제전</span><br>
								<b><span class="zma"><%=vo.get("paid_before_count") %></span class="zma"></b>
							</button>
							<button type="button" class="btn00_2">
								<span class="wkrdma">배송준비중</span><br>
								<b><span class="zma"><%=vo.get("prepared_count") %></span class="zma"></b>
							</button>
							<button type="button" class="btn00_2">
								<span class="wkrdma">배송중</span><br>
								<span class="zma"><b><%=vo.get("shipping_count") %></b></span class="zma">
							</button>
							<button type="button" class="btn00_2">
								<span class="wkrdma">배송완료</span><br>
								<span class="zma"><b><%=vo.get("done_count") %></b></span class="zma">
							</button>

							<h2>취소 / 반품 / 환불 현황 (최근 1개월(30일) 기준)</h2>
							<button type="button" class="btn00_1">
								<span class="wkrdma">취소</span><br>
								<b><span class="zma"><%=vo.get("cancel_count") %></span class="zma"></b>
							</button>
							<button type="button" class="btn00_1">
								<span class="wkrdma">반품</span><br>
								<b><span class="zma"><%=vo.get("item_back_count") %></span class="zma"></b>
							</button>
							<button type="button" class="btn00_1">
								<span class="wkrdma">환불</span><br>
								<b><span class="zma"><%=vo.get("refund_count") %></span class="zma"></b>
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

					</tbody>

				</div>

				</section>
			</div>



			<footer id="ft">
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