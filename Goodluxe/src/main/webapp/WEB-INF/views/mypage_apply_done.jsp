<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String member_id = (String)request.getParameter("member_id");
%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="content-type" content="text/html;charset=utf-8" />
   <meta name="viewport" content="user-scalable=no,width=device-width, initial-scale=1.0" />
   
   <title>GOODLUXE :: 굿럭스</title>
   
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order_form_done.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css" />
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
   <script>
      $(document).ready(function(){
         $("#header").load("header.do");
         $("#nav_bar").load("navBar.do");
         $("#login_box").load("loginBox.do");
         $("#footer").load("footer.do");
      });
   </script>
   
   <!-- mypage_apply2 / 마이페이지 > 판매신청 -->
   <script>
      $(document).ready(function(){
         $("#mypage_menu").load("mypageMenu.do", function(){
            $('.menu_container').children('a').eq(1).children().children('.icon').addClass('selected_menu');
         });
      });
   </script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage_onlymenu.css" />
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage_apply_form.css" />
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage_apply_form.js"></script>

</head>

<body class="">
    <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

    <section id="container">
        <br>
        <center>
            <div id="main">
                <div class="apply_done_cover">
                    <div class="apply_done">
                        <img src="${pageContext.request.contextPath}/resources/img/icons/check.png" alt="check" width="100px"><br /><br />
                        <h3>신청이 완료되었습니다.</h3><br />
                        <p>
                            고객님의 연락처로 검토후 3일 이내로 연락드리겠습니다.
                        </p>
                        <br />
                        <button class="apply_addbtn apply_mainbtn">메인화면으로</button>
                    </div>
                </div>
            </div>
        </center>
    </section>

    <footer id="footer"></footer>

</body>

</html>