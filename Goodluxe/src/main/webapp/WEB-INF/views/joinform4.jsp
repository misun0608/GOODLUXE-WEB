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
                <div class="jointstep_image">
                        <img src="${pageContext.request.contextPath}/resources/img/icon_join/icon_join_3.png" alt="가입단계">
                </div>

                <br /><br /><br />

                <h1>회원가입을 축하드립니다!</h1><br /><br />

                <p class="join_welcome">
                    가입 시 입력한 이메일 주소로 인증 메일이 발송되었습니다.<br />
                    이메일 인증이 이루어지면 회원가입이 완료됩니다 :)<br />
                    GOODLUXE 와 함께 즐거운 쇼핑 하시길 바랍니다!<br />
                </p>

                <br />
                <br />

                <input type="button" class="join_btn join_btn1" value="메인화면">
                <input type="button" class="join_btn join_btn2" value="로그인">

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