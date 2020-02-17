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
		
		
		function find_id_btn() {
			if ((document.getElementById("find_id_name").value == "") || (document.getElementById("find_id_email").value == "")){
				alert("이름과 이메일 주소를 모두 입력하세요");
			} else {
				document.getElementById('find_id_form').submit();
			}
		}
		
		function find_pw_btn() {
			if ((document.getElementById("find_pw_id").value == "") || (document.getElementById("find_pw_name").value == "") || (document.getElementById("find_pw_email").value == "")){
				alert("모든 정보를 입력하세요");
			} else {
				document.getElementById('find_pw_form').submit();
			}
		}
		
/* 		$('#find_id_btn').click(function(){
			if ((find_id_name == null) || (find_id_email == null)){
				alert("이름과 이메일 주소를 모두 입력하세요");
			} else {
				alert("됨");
				
			}
		}); */
// 		function find_pw(){
// 			if ((find_pw_id == null) || (find_pw_email == null)){
// 				alert("이름과 이메일 주소를 모두 입력하세요");
// 				return;
// 			} else {
// 				alert("됨");
// 				return;
// 			}
// 		};
		
// 		function frmchk(FormNum){

// 			if (FormNum==1){
// 			document.form1.action="./chk_ok.php"; //form1의 액션지정
// 			document.form1.submit();//폼1을 서브밋
// 			}

// 			else{
// 			document.form2.action="./chk2_ok.php";
// 			document.form2.submit();
// 			}
// 		}
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
	<form id="find_id_form" action="findMemberId.do" method="post">
    <table class="find_idpw_table">
        <tr>
            <td class="find_idpw_text1">아이디 찾기</td>
        </tr>
        <tr>
            <td>
                <input type="text" placeholder="이름" name="member_name" id="find_id_name" class="find_idpw_textbox"><br>
                <input type="text" name="member_email" STYLE="ime-mode: disabled" placeholder="이메일 주소" id="find_id_email" class="find_idpw_textbox"><br>
                <p class="text2"> GOODLUXE 본인인증시 사용하였던 이메일 주소로 가입 시 등록했던 아이디를 보내드립니다.</p><br>
                <input type="button" onclick="find_id_btn();" class="find_idpw_button" value="이메일 주소로 아이디 전송">
            </td>
        </tr>
    </table>
    </form>
    <br>
	<form id="find_pw_form" action="findMemberPw.do" method="post">
    <table class="find_idpw_table">
        <tr>
            <td class="find_idpw_text1">비밀번호 찾기</td>
        </tr>
        <tr>
            <td>
                <input type="text"  STYLE="ime-mode: disabled" placeholder="아이디" name="member_id" id="find_pw_id" class="find_idpw_textbox"><br>
                <input type="text"  placeholder="이름" id="find_pw_name" name="member_name" class="find_idpw_textbox"><br>
                <input type="text"  STYLE="ime-mode: disabled" name="member_email" placeholder="이메일 주소" id="find_pw_email" class="find_idpw_textbox"><br>
                <p class="text2"> GOODLUXE 가입 시 등록하였던 이메일 입력시, 비밀번호 변경 URL이 전송됩니다.</p><br>
                <input type="button" onclick="find_pw_btn();" class="find_idpw_button" value="비밀번호 변경 URL 전송">
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