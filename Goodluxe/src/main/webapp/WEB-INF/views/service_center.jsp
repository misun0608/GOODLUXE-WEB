<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="viewport"
	content="user-scalable=no,width=device-width, initial-scale=1.0" />

<title>GOODLUXE :: 굿럭스</title>

<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script>
	$(document).ready(function() {
		$("#header").load("header.do");
		$("#nav_bar").load("navBar.do");
		$("#login_box").load("loginBox.do");
		$("#footer").load("footer.do");
		
		$("#center_tab-1").load("scFAQ.do");
		$("#center_tab-2").load("scQBoard.do");
		$("#center_tab-3").load("scChat.do");
		$("#center_tab-4").load("scMethod.do");
		$("#center_tab-5").load("scNotice.do");
		$("#center_tab-6").load("scLocation.do");
	});
</script>

<!-- order_and_shipping -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/service_center.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/how_to.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/service_center.js"></script>
</head>

<body class="">
	<header id="header"></header>

	<nav id="nav_bar"></nav>

	<div class="login_bg" id="login_box"></div>

	<section id="container">
		<br />
		<div id="main">
			<section class="service_center_container">
				<div class="service_center_main">
					<p
						style="text-align: left; margin: 18px 0 16px 14px; font-size: 24px; font-weight: none;">|
						고객센터</p>

					<!--고객센터 메뉴 탭-->
					<ul class="service_center_menu_tabs">
						<li class="service_center_tab-link current"
							data-tab="center_tab-1">FAQ</li>
						<li class="service_center_tab-link" data-tab="center_tab-2">문의게시판</li>
						<li class="service_center_tab-link" data-tab="center_tab-3">채팅
							문의</li>
						<li class="service_center_tab-link" data-tab="center_tab-4">쇼핑
							절차</li>
						<li class="service_center_tab-link" data-tab="center_tab-5">공지사항</li>
						<li class="service_center_tab-link" data-tab="center_tab-6">매장
							위치</li>
					</ul>
					<hr id="center_tab-line" class="center_tab-line">
					</hr>

					<!--고객센터 탭 1번 F&Q-->
					<div id="center_tab-1" class="center_tab-content current">
					</div>
					<!--고객센터 탭 2번 문의 게시판-->
					<div id="center_tab-2" class="center_tab-content">
					</div>
					<!--고객센터 탭 3번 채팅 문의-->
					<div id="center_tab-3" class="center_tab-content">
					</div>
					<!--고객센터 탭 4번 쇼핑 절차-->
					<br />
					<div id="center_tab-4" class="center_tab-content">
					</div>
					<!--고객센터 탭 5번 공지사항-->
					<div id="center_tab-5" class="center_tab-content">
					</div>
					<!--고객센터 탭 6번 매장 위치-->
					<div id="center_tab-6" class="center_tab-content">
					</div>
				</div>
		</div>

		<!-- 모바일 버전 -->
		<div class="service_center_sm_select">
			<select name="" id="tabmenu">
				<option value="#tab01">FAQ</option>
				<option value="#tab02">문의게시판</option>
				<option value="#tab03">채팅 문의</option>
				<option value="#tab04">쇼핑 절차</option>
				<option value="#tab05">공지사항</option>
				<option value="#tab06">매장 위치</option>
			</select>
		</div>
		</div>
		<br>
		<div id="tab01" class="selects select-content">
			<!--FAQ 테이블-->
			<table class="service_center_table_mobile">
				<tr class="service_center_top_tr">
					<td style="width: 30px;">번호</td>
					<td style="width: 80px;">카테고리</td>
					<td>제목</td>
					<td style="width: 110px;">게시일</td>
				</tr>
				<tr class="service_center_middle_tr">
					<td>2</td>
					<td>제품</td>
					<td><span class="glyphicon table-plus faq">제품 등급제란?</span> <span
						class="glyphicon table-minus faq" style="display: none;">제품
							등급제란?</span></td>
					<td>2020.01.11</td>
				</tr>
				<tr class="center_faq_hidden_content">
					<td colspan="4" ; class="center_faq_hidden_detail">제품등급은 상품을
						육안으로 볼 수 없는 고객을 위해 가늠할 수 있는 상태를 표기하고 있습니다.<br> 더 자세한 사항은 상품별
						설명과 이미지를 참고하시기 바랍니다.<br>
					<br> NS - 새상품 또는 새상품과 동일한 상태이나 개봉한 상태이며 부속품이 일부 없을 수 있음<br>
						A+ - 사용횟수 적은편으로 새상품에 가까운 상태, 중고 등급 중 최상<br> A - 외관상 자연스러운 사용감
						있음, 전체적으로 상태가 양호한 상품<br> B+ - 중고 느낌 있는편으로 스크래치, 때 등 사용흔적 있음<br>
						B - 스크래치, 구김, 때 등 사용흔적 있는 편으로 외관상 확연한 중고느낌 있음<br> USED - 등급을
						판단할 수 없는 상품
					</td>
				</tr>
				<tr class="service_center_middle_tr">
					<td>1</td>
					<td>회원가입</td>
					<td><span class="glyphicon table-plus faq">재가입은 어떻게
							하나요?</span> <span class="glyphicon table-minus faq"
						style="display: none">재가입은 어떻게 하나요?</span></td>
					<td>2020.01.11</td>
				</tr>
				<tr class="center_faq_hidden_content">
					<td colspan="4" ; class="center_faq_hidden_detail">재가입은 탈퇴후에도
						즉시 하실 수 있습니다.<br>
					<br> 단, 탈퇴처리 과정에 있는 아이디로는 동일하게 가입하실 수 없으니<br> 다른 아이디를
						생성하셔야만 가능합니다.<br>
					<br> 또한 동일한 아이디를 사용하기 위해서는 고객센터로 이전 아이디에 대한<br> 삭제요청을
						하신후에 재가입이 가능합니다.<br> 하지만 이때 이전에 남아있던 포인트나 활동내역에 대해서는 복구 받으실 수
						없습니다.
					</td>
				</tr>
				<tr>
					<td colspan="2"><br>
						<p style="font-size: 19px; text-align: center;">◁ 1 ▷</p> <br>
					</td>
				</tr>
			</table>
			<!-- FAQ 테이블 끝 -->
		</div>
		<div id="tab02" class="selects select-content">
			<!-- 문의 게시판 테이블 시작 -->
			<table class="service_center_table">
				<tr class="service_center_top_tr">
					<td style="width: 30px;">번호</td>
					<td>제목</td>
					<td style="width: 80px;">작성자</td>
					<td style="width: 110px;">게시일</td>
				</tr>
				<tr class="service_center_middle_tr">
					<td>2</td>
					<td><a href=#>어제 주문했는데 배송 언제 오나요? [2]</a></td>
					<td>Jiye123</td>
					<td>2020.01.11</td>
				</tr>
				<tr class="service_center_middle_tr">
					<td>1</td>
					<td><a href=#>쿠폰 사용 관련 문의 [3]</a></td>
					<td>MJx2</td>
					<td>2020.01.11</td>
				</tr>
				<tr>
					<td colspan="2"><br>
						<p style="font-size: 19px; text-align: center;">◁ 1 ▷</p> <br>
					</td>
				</tr>
			</table>
		</div>
		<div id="tab03" class="selects select-content">
			<h2>실시간 채팅 문의</h2>
		</div>
		<div id="tab04" class="selects select-content">
			<!-- 지예님의 쇼핑 절차 들어갈 위치 -->
			<h2>쇼핑 절차</h2>
		</div>
		<div id="tab05" class="select-content">
			<!-- 공지사항 테이블 시작 -->
			<table class="service_center_table">
				<tr class="service_center_top_tr">
					<td style="width: 30px;">번호</td>
					<td>제목</td>
					<td style="width: 110px;">게시일</td>
				</tr>
				<tr class="service_center_middle_tr">
					<td>2</td>
					<td><a href=#>감사제 이벤트 당첨자 발표</a></td>
					<td>2020.01.11</td>
				</tr>
				<tr class="service_center_middle_tr">
					<td>1</td>
					<td><a href=#>위탁 판매 수수료 변경 안내</a></td>
					<td>2020.01.11</td>
				</tr>
				<tr>
					<td colspan="2"><br>
						<p style="font-size: 19px; text-align: center;">◁ 1 ▷</p> <br>
					</td>
				</tr>
			</table>

		</div>
		<div id="tab06" class="select-content">
			<table class="center_store_table" style="margin-top: 4px;">
				<tr class="store_tr">
					<td style="width: 90px; height: 45px; border: 1px solid darkgray;">주소</td>
					<td>서울특별시 서초구 강남대로 459<br>(백암빌딩, 구관)
					</td>
				</tr>
				<tr class="store_tr">
					<td style="height: 30px; border: 1px solid darkgray;">전화번호</td>
					<td>02-3486-9600</td>
				</tr>
				<tr class="store_tr">
					<td style="height: 63px; border: 1px solid darkgray;">영업시간</td>
					<td>월∼토: 오전11시~오후8시<br> 공휴일: 오후12시~오후8시<br> ※ 일요일은
						휴무입니다
					</td>
				</tr>
				<tr class="store_tr">
					<td style="height: 30px; border: 1px solid darkgray;">주차정보</td>
					<td>발렛파킹(주차대행) 이용</td>
				</tr>
			</table>
			<p style="text-align: center; margin: 1em 0 2em 0;">API</p>
		</div>
		</div>
	</section>

	<footer id="footer"></footer>
</body>

</html>