<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="viewport"
	content="user-scalable=no,width=device-width, initial-scale=1.0" />

<title>GOODLUXE :: 굿럭스</title>

<%
	String member_isadmin = (String)session.getAttribute("member_isadmin()");

%>

<script type="text/javascript">
	//alert('${member_isadmin}')
</script>
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
			$('.scmt').children('a').eq(2).addClass('current');
		});
	});
</script>

<!-- order_and_shipping -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/service_center.css" />
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

                    <div id="center_tab-3" class="center_tab-content current">
                    	<div class="center_chat_img">
						    <img src="${pageContext.request.contextPath}/resources/img/icons/chat_available.png" style="width: 100px; height: 100px;">
						</div>
						<div class="center_chat_content">
						    1:1 채팅 상담 가능 시간은<br/><span style="font-weight: 600;">평일 AM 10:00 ~ PM 6:00</span> 입니다.<br/>
						   <button onclick="popup()" class="center_chat_btn" >1:1 상담 시작</button>
						     <script type="text/javascript">
	
									function popup(){
 
									var url = "chat.do";
 
									var name = "chat";
 									
									if('${member_isadmin}'=='Y'){
									window.open(url,name,"width=792,height=740,toolbar=no,status=no,location=no,scrollbars=no,menubar=no,resizable=no,left=50,right=50");
									}else{
										window.open(url,name,"width=393,height=703,toolbar=no,status=no,location=no,scrollbars=no,menubar=no,resizable=no,left=50,right=50");	
									}
									}
									</script>
						</div>
                    </div>
                <br/><br/><br/>
                </div>
            </section>
        </div>
    </section>

	<footer id="footer"></footer>
</body>

</html>