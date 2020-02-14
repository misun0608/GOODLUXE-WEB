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
    <meta name="viewport" content="user-scalable=no,width=device-width, initial-scale=1.0" />
    <title> 기본 페이지 </title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet">
    <!-- <link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/EBSHMJESaeronRA.woff" rel="stylesheet"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/joinstyle.css">
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/goodluxe-header.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/goodluxe-footer.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> 
      <script>
      $(document).ready(function(){
         $("#header").load("header.do");
         $("#nav_bar").load("navBar.do");
         $("#login_box").load("loginBox.do");
         $("#footer").load("footer.do");
      });
      
       Kakao.init('dc50a646222a7303868e2fc1557ba996');
       function loginWithKakao() {
         // 로그인 창을 띄웁니다.
         Kakao.Auth.login({
           success: function(authObj) {
             alert(JSON.stringify(authObj));
           },
           fail: function(err) {
             alert(JSON.stringify(err));
           }
         });
       }; 
     
    </script>

</head>
<body class="">
    <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

    <!-- <section style="height: 800px;"> -->
    <section id="container">
        <br>
        <div id="main">
            <center>
            <br /><br />
            <h1>회원가입</h1>
            <br /><br />
            <a href="login.do"><span class="joinbox"><img src="${pageContext.request.contextPath}/resources/img/icons/google.png" alt="google" width="20" height="20">&nbsp;&nbsp;구글로 가입</span></a><br />
<%--             <a href="javascript:loginWithKakao()"><span class="joinbox"><img src="${pageContext.request.contextPath}/resources/img/icons/kakao.png" alt="kakao" width="20" height="20">&nbsp;&nbsp;카카오로 가입</span></a><br /> --%>
            <a href="${kakao_url}"><span class="joinbox"><img src="${pageContext.request.contextPath}/resources/img/icons/kakao.png" alt="kakao" width="20" height="20">&nbsp;&nbsp;카카오로 가입</span></a><br />
            <a href="${naver_url}"><span class="joinbox"><img src="${pageContext.request.contextPath}/resources/img/icons/naver.png" alt="naver" width="20" height="20">&nbsp;&nbsp;네이버로 가입</span></a><br />
            <hr class="join_line">&nbsp;&nbsp;<span class="join_linefont">or</span>&nbsp;&nbsp;<hr class="join_line">
            <br />
            <a href="joinform2.do"><span class="joinbox" id="emailbox"><img src="${pageContext.request.contextPath}/resources/img/icons/email_icon.png" width="20" height="20">&nbsp;&nbsp;이메일로 가입</span></a><br />
            <br /> 
            <br />  
        </div>
    </section>

    <footer id="footer">
    </footer>
</body>
</html>