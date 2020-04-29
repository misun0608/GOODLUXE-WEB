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
			$('.scmt').children('a').eq(0).addClass('current');
		});

	});
</script>

<!-- order_and_shipping -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/service_center.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/sc_faq.js"></script>
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

                    <!--고객센터 탭 1번 F&Q-->
                    <div id="center_tab-1" class="center_tab-content current">
                    	<table class="service_center_table">
						    <tr class="service_center_top_tr">
						        <td style="width: 110px;">번호</td>
						        <td style="width: 120px;">카테고리</td>
						        <td>제목</td>
						        <td style="width: 190px;">게시일</td>
						    </tr>
						    <tr class="service_center_middle_tr">
						        <td>2</td>
						        <td>제품</td>
						        <td> <span class="glyphicon table-plus center_faq">제품 등급제란?</span>
						            <span class="glyphicon table-minus center_faq" style="display:none;">제품 등급제란?</span></td>
						        <td>2020.01.11</td>
						    </tr>
						    <tr class="center_faq_hidden_content">
						        <td></td>
						        <td></td>
						        <td class="center_faq_hidden_detail">제품등급은 상품을 육안으로 볼 수 없는 고객을 위해 가늠할 수 있는 상태를 표기하고 있습니다.<br>
						            더 자세한 사항은 상품별 설명과 이미지를 참고하시기 바랍니다.<br><br>
						            NS - 새상품 또는 새상품과 동일한 상태이나 개봉한 상태이며 부속품이 일부 없을 수 있음<br>
						            A - 외관상 자연스러운 사용감 있음, 전체적으로 상태가 양호한 상품<br>
						            B - 스크래치, 구김, 때 등 사용흔적 있는 편으로 외관상 확연한 중고느낌 있음<br>
						        <td></td>
						    </tr>
						    <tr class="service_center_middle_tr">
						        <td>1</td>
						        <td>회원가입</td>
						        <td> <span class="glyphicon table-plus center_faq">재가입은 어떻게 하나요?</span>
						            <span class="glyphicon table-minus center_faq" style="display:none">재가입은 어떻게 하나요?</span>
						        </td>
						        <td>2020.01.11</td>
						    </tr>
						    <tr class="center_faq_hidden_content">
						        <td></td>
						        <td></td>
						        <td class="center_faq_hidden_detail">재가입은 탈퇴후에도 즉시 하실 수 있습니다.<br><br>
						            단, 탈퇴처리 과정에 있는 아이디로는 동일하게 가입하실 수 없으니<br>
						            다른 아이디를 생성하셔야만 가능합니다.<br><br>
						            또한 동일한 아이디를 사용하기 위해서는 고객센터로 이전 아이디에 대한<br>
						            삭제요청을 하신후에 재가입이 가능합니다.<br>
						            하지만 이때 이전에 남아있던 포인트나 활동내역에 대해서는 복구 받으실 수 없습니다.</td>
						        <td></td>
						    </tr>
						</table>
                    </div>
                <br/><br/><br/>
                </div>
            </section>
        </div>
    </section>

	<footer id="footer"></footer>
</body>

</html>