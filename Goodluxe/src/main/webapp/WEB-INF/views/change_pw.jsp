<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.goodluxe.voes.*"%>
<% MemberVO memberVO = (MemberVO)request.getAttribute("memberVO"); %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/change_pw.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/goodluxe-header.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/joinjs2.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/change_pw.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/goodluxe-footer.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> 
    <script>

		$(document).ready(function(){
			$("#header").load("header.do");
			$("#nav_bar").load("navBar.do");
			$("#login_box").load("loginBox.do");
			$("#footer").load("footer.do");
		});
		
		function change_pw_btn() {
			if ((document.getElementById("change_pw1").value == "") || (document.getElementById("change_pw2").value == "")){
				alert("모두 입력하였는지 확인해주세요");
			} else if(document.getElementById("change_pw1").value.length < 10){
				alert("10자리 이상 입력하십시오");
			} else if((document.getElementById("change_pw1").value)!=(document.getElementById("change_pw2").value)){
				alert("동일한 비밀번호를 입력하십시오");
			} else {
				document.getElementById('change_pw_form').submit();
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
				비밀번호 변경
            </p>
        </div>
	<form id="change_pw_form" action="changeMemberPw.do" method="post">
    <table class="change_pw_table">
<!--         <tr> -->
<!--             <td class="find_idpw_text1">비밀번호 찾기</td> -->
<!--         </tr> -->
								<tr class="jointablerow">
									<td class="jttitle" style="padding-top:15px;">비밀번호</td>
									<td class="change_pw_td"><input type="password"
										class="change_pw_textbox passwd" id="change_pw1" maxlength="16"
										name="member_pw" placeholder="10~16자 이내로 입력해주세요"></td>
								</tr>
								<tr class="jointablerow">
									<td class="jttitle" style="padding-top:15px;">비밀번호 확인</td>
									<td class="change_pw_td"><input type="password"
										class="change_pw_textbox passwd" id="change_pw2" maxlength="16"
										placeholder="비밀번호를 다시 입력해주세요">
										<input type="hidden" id="member_id" name="member_id" value="<%=memberVO.getMember_id() %>">
									</td>
								<tr>
<!-- 									<td class="alert alert-pw2" id="alert-pw"></td> -->
									<td class="alert alert-success_pw2" id="alert-success_pw"
										style="font-size: 12px; color: #0084c9; padding: 4px 0 0 5px" colspan="2">비밀번호가
										일치합니다.</td>
									<td class="alert alert-danger_pw" id="alert-danger_pw"
										style="font-size: 12px; color: #f9341a; padding: 4px 0 0 5px" colspan="2">비밀번호가
										일치하지 않습니다.</td>
									<td class="alert alert-danger_pw1" id="alert-danger_pw1"
										style="font-size: 12px; color: #f9341a; padding: 4px 0 0 5px" colspan="2">비밀번호는
										10자 이상 입력해주세요.</td>
								</tr>
								<tr class="jointablerow">
									<td colspan="2" style="margin-bottom:15px">
									<input type="button" onclick="change_pw_btn();" class="change_pw_button" value="비밀번호 변경">
									</td>
								</tr>
    </table>
    </form>
<!--     <table class="find_login_join_table"> -->
<!--         <tr> -->
<!--             <td style="text-align: left;" ><a class="find_login_join" href="#">로그인</a></td> -->
<!--             <td style="text-align: right;"><a class="find_login_join" href="joinform.do">회원가입</a></td> -->
<!--        </tr> -->
<!--     </table> -->
    <br /><br /><br />
</div>
    </section>

    <footer id="footer">
    </footer>
</body>
</html>