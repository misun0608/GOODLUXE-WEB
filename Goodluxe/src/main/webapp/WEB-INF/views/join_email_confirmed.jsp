<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<!--
        viewport meta 태그
        * user-scalable=no : 화면확대, 축소 불가능
        * width=device-width : 화면 너비=장치 너비
        * initial-scale=1.0 : 초기 확대 비율
	-->
<meta name="viewport" 
	content="user-scalable=no,width=device-width, initial-scale=1.0" />
<title>GOODLUXE :: 굿럭스</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet">
<!-- <link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/EBSHMJESaeronRA.woff" rel="stylesheet"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/joinstyle3.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/goodluxe-header.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/joinjs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/goodluxe-footer.js"></script>
<script>
		$(document).ready(function(){
			$("#header").load("header.do");
			$("#nav_bar").load("navBar.do");
			$("#login_box").load("loginBox.do");
			$("#footer").load("footer.do");
		});
</script>
</head>

<body class="">
    <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

    <section id="container">
        <br>
        <div id="main">
            <center>
                <br /><br />
                <div class="joinok_image">
                        <img src="${pageContext.request.contextPath}/resources/img/icons/check.png" class="joinok_image" alt="가입완료">
                </div>

                <br />

                <h1>이메일 인증</h1><br /><br />

                <p class="join_welcome">
                    정상적으로 이메일 인증이 완료되었습니다.<br />
                    로그인 후 GOODLUXE를 이용해 주세요 :)<br />
                </p>

                <br />
                <br />

                <input type="button" class="join_btn join_btn2" value="메인화면" onClick="location.href='mainPage.do';">

                <br />
                <br />
                <br />
            </center>
        </div>
    </section>

    <footer id="footer">
    </footer>
</body>

</html>