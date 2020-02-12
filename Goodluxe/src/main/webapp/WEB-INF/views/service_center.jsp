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
                    <p style="text-align: left; margin: 18px 0 16px 14px;font-size: 24px;font-weight:none;">| 고객센터</p>

                    <!--고객센터 메뉴 탭-->
                    <ul class="service_center_menu_tabs">
                        <li class="service_center_tab-link current" data-tab="center_tab-1">FAQ</li>
                        <li class="service_center_tab-link" data-tab="center_tab-2">문의게시판</li>
                        <li class="service_center_tab-link" data-tab="center_tab-3">채팅 문의</li>
                        <li class="service_center_tab-link" data-tab="center_tab-4">쇼핑 절차</li>
                        <li class="service_center_tab-link" data-tab="center_tab-5">공지사항</li>
                        <li class="service_center_tab-link" data-tab="center_tab-6">매장 위치</li>
                    </ul>
                    <hr id="center_tab-line" class="center_tab-line">

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
            </section>
        </div>
    </section>

	<footer id="footer"></footer>
</body>

</html>