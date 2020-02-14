<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.goodluxe.voes.MemberVO" %>
<%
	MemberVO vo = (MemberVO) request.getAttribute("MemberVO");
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
	<meta name="viewport" content="user-scalable=no,width=device-width, initial-scale=1.0" />
	<title>GOODLUXE :: 굿럭스</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet">
    <!-- <link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/EBSHMJESaeronRA.woff" rel="stylesheet"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/find_login_data.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/goodluxe-header.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member_find.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/goodluxe-footer.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> 
    <script>
		$(document).ready(function(){
			$("#header").load("header.do");
			$("#nav_bar").load("navBar.do");
			$("#login_box").load("loginBox.do");
			$("#footer").load("footer.do");
		});
		
		function find_id(){
			if ((find_id_name != null) && (find_id_email != null)){
				
			} else {
				alert("이름과 이메일 주소를 모두 입력하세요");
			}
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
    <!-- <section class="content"> -->
        <div class="find_content">
            <br />
            <p style="margin: 18px 0 16px 14px; font-size: 24px;">
                아이디/비밀번호 찾기
            </p>
        </div>
	<form name="find_id_form" action="" method="post" onsubmit="return find_id();">
    <table class="find_idpw_table">
        <tr>
            <td class="find_idpw_text1">아이디 찾기</td>
        </tr>
        <tr>
            <td>
                <input type="text" placeholder="이름" id="find_id_name" class="find_idpw_textbox"><br>
                <input type="text"  STYLE="ime-mode: disabled" placeholder="이메일 주소" id="find_id_email" class="find_idpw_textbox"><br>
                <p class="text2"> GOODLUXE 본인인증시 사용하였던 이메일 주소로 가입 시 등록했던 아이디를 보내드립니다.</p><br>
                <input type="submit" class="find_idpw_button" value="이메일 주소로 아이디 전송">
            </td>
        </tr>
    </table>
    </form>
    <br>
	<form name="find_pw_form" action="" method="post" onsubmit="return find_pw();">
    <table class="find_idpw_table">
        <tr>
            <td class="find_idpw_text1">비밀번호 찾기</td>
        </tr>
        <tr>
            <td>
                <input type="text"  STYLE="ime-mode: disabled" placeholder="아이디" id="find_pw_id" class="find_idpw_textbox"><br>
                <input type="text"  STYLE="ime-mode: disabled" placeholder="이메일 주소" id="find_pw_email" class="find_idpw_textbox"><br>
                <p class="text2"> GOODLUXE 가입 시 등록하였던 이메일 입력시, 비밀번호 변경 URL이 전송됩니다.</p><br>
                <input type="submit" class="find_idpw_button" value="비밀번호 변경 URL 전송">
            </td>
        </tr>
    </table>
    </form>
    <table class="find_login_join_table">
        <tr>
            <td style="text-align: left;" ><a class="find_login_join" href="#">로그인</a></td>
            <td style="text-align: right;"><a class="find_login_join" href="joinform.do">회원가입</a></td>
       </tr>
    </table>
    <br /><br /><br />
</div>
    </section>

    <footer id="footer">
    </footer>
</body>
</html>