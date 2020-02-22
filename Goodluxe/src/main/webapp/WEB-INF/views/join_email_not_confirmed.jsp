<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.goodluxe.voes.*"%>
<% 
	MemberVO memberVO = (MemberVO)request.getAttribute("memberVO"); 
	String member_id = (String)request.getParameter("member_id"); 
%>
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
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean"
	rel="stylesheet">
<!-- <link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/EBSHMJESaeronRA.woff" rel="stylesheet"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/join_email_not_confirmed.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/goodluxe-header.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/joinjs2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/change_pw.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/goodluxe-footer.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
		var member_id = document.getElementById('member_id');
		
		$(document).ready(function(){
			$("#header").load("header.do");
			$("#nav_bar").load("navBar.do");
			$("#login_box").load("loginBox.do");
			$("#footer").load("footer.do");
		});
		
		function re_confirmed_email() {
			not_confirmed_form.submit();
		}
		
	</script>
</head>
<body>
	<header id="header"></header>

	<nav id="nav_bar"></nav>

	<div class="login_bg" id="login_box"></div>

	<section id="container">
		<br>
		<div id="main">
			<center>
				<br />
				<br />
				<div class="exclamation_image">
					<img src="${pageContext.request.contextPath}/resources/img/icons/email_exclamation.png" class="exclamation_image"
						alt="인증미완료">
				</div>

				<br />

				<h1>이메일 인증</h1>
				<br />
				<br />
 				<form id="not_confirmed_form" action="reconfirmedEmail.do" method="post">
<!--				<form id="not_confirmed_form" method="post"> -->
				
					<table class="not_confirmed_table">
						<tr>
							<td class="notConfirmedTitle">이메일 인증이 정상적으로 완료되지 않았습니다.<br />
								인증 메일이 오지 않은 경우 아래 버튼을 클릭해주세요.
							</td>
						</tr>
						<tr>
 							<td><input type="button" onclick="re_confirmed_email();"
							<%-- <td><input type="button" onclick="javascript:location.href='reConfirmedMail.do?member_id=<%=member_id%>'" --%>

								class="not_confirmed_button" value="인증 메일 재전송">
								<!-- <input type="hidden" id="member_email" name="member_email" value=""> -->
								<input type="hidden" id="member_id" name="member_id" value="<%=member_id%>">
								</td>
						</tr>

					</table>
					<div class="not_confirmed_table2">인증 메일 미전송시 스팸 메일함 확인 후
						고객센터로 문의 바랍니다.</div>
				</form>
				<br />
				<br />
				<br />
		</div>
	</section>

	<footer id="footer"> </footer>
</body>
</html>