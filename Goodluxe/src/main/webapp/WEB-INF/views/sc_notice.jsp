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
		
		$(".scmt").load("scMenu.do", function(){
			$('.scmt').children('a').eq(4).addClass('current');
		});

	});
</script>

<!-- order_and_shipping -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/service_center.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/how_to.css" />
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
                    <p style="text-align: left; margin: 18px 0 16px 14px;font-size: 24px;font-weight:none;">| 고객센터</p>

                    <!--고객센터 메뉴 탭-->
                    <ul class="service_center_menu_tabs scmt"></ul>
                    <hr id="center_tab-line" class="center_tab-line">

                    <div id="center_tab-5" class="center_tab-content current">
                    	<table>
						    <tr style="width: 100%;">
						        <td>
						            <div>
						                <select name="" id="board_search" style="height: 27px; margin:0px 0 9px 0px">
						                    <option value="#search_title">제목</option>
						                    <option value="#search_content">내용</option>
						                    <option value="#search_id">아이디</option>
						                </select>
						                <form action="" id="service_notice_search_form" style="display:inline-block">
						                    <input type="text" placeholder="게시판 내 검색"
						                        style="height: 21px; padding: 0.03em;">
						                    <button class="center_search_btn"
						                        style="width: 50px; height: 25px;">검색</button>
						                </form>
						            </div>
						        </td>
						    </tr>
						</table>
						
						<!-- 공지사항 테이블-->
						<table class="service_center_table">
						    <tr class="service_center_top_tr">
						        <!-- 여기 bold 넣는게 좋은지 빼는게 좋은지 컬러 따로 줘서 안넣어도 구분 가능해보임-->
						        <td style="width: 110px;">번호</td>
						        <td>제목</td>
						        <td style="width: 190px;">게시일</td>
						    </tr>
						    <tr class="service_center_middle_tr">
						        <td>2</td>
						        <td><a href="zNotice2.do">나눔클릭 캠페인 기부금 전달 공지</a></td>
						        <td>2019.12.30</td>
						    </tr>
						    <tr class="service_center_middle_tr">
						        <td>1</td>
						        <td><a href=#>위탁 판매 수수료 변경 안내</a></td>
						        <td>2019.08.11</td>
						    </tr>
						</table>
						<!-- 공지사항 테이블 끝 -->
						<br>
						<p style="text-align: center; margin-bottom: 2em;">◁ 1 ▷</p>
                    </div>

                <br/><br/><br/>
                </div>
            </section>
        </div>
    </section>

	<footer id="footer"></footer>
</body>

</html>