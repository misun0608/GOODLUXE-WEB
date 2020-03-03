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
	});
</script>

<!-- order_and_shipping -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/event_page.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/event_page.js"></script>
</head>

<body class="">
	<header id="header"></header>

	<nav id="nav_bar"></nav>

	<div class="login_bg" id="login_box"></div>

    <section id="container">
        <br>
        <div id="main">
            <article class="ep_1st">
                <a href="#">
                    <div class="panel"></div>
                </a>
                <a href="#">
                    <div class="panel"></div>
                </a>
                <a href="#">
                    <div class="panel"></div>
                </a>
                <a href="#">
                    <div class="panel"></div>
                </a>
                <a href="#">
                    <div class="panel"></div>
                </a>
            </article>
        </div>
    </section>

	<footer id="footer"></footer>
</body>

</html>