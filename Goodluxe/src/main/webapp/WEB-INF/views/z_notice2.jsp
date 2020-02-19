<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="viewport" content="user-scalable=no,width=device-width, initial-scale=1.0" />
	
	<title>GOODLUXE :: 굿럭스</title>
	
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
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
	
	<!-- z_notice2 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board_notice.css" />
</head>

<body class="">
    <header id="header"></header>
    <nav id="nav_bar"></nav>
    <div class="login_bg" id="login_box"></div>
    
    <section id="container" class="board_container">
        <br />
        <div id="main">
            <p style="text-align: left; margin: 18px 0 16px 14px;font-size: 24px;font-weight:none;">| 고객센터</p>
            <h3 class="text_head">공지사항</h3>

            <section class="container2">
                <table class="center_notice_table">
                    <tbody style="text-align: left; border: 1px solid #d7d7d7;">
                        <tr class="center_notice_tr_title">
                            <td class="center_notice_td_title">제　목</td>
                            <td class="notice_table_content">나눔클릭 캠페인 기부금 전달 공지</td>
                        </tr>
                        <tr class="center_notice_tr_title">
                            <td class="center_notice_td_title">등록일</td>
                            <td class="notice_table_content" name="" id="" rows="1">2019.12.30</td>
                        </tr>
                        <tr class="center_notice_tr_title">
                            <td class="notice_table_content" colspan="2">GOODLUXE와 서울 사랑의열매에서는 2018년 12월 18일부터 이듬해 1월
                                31일까지 45일간 나눔클릭 캠페인이 공동 진행되었습니다.<br><br>
                                이 행사를 통해 발생한 기탁금 1,602,165원은 서울 사랑의열매에 전달하였습니다.<br><br>
                                앞으로도 GOODLUXE는 사회에 기여할 수 있도록 더욱 노력하겠습니다.<br>
                                감사합니다.</td>
                        </tr>
                    </tbody>
                </table>
            </section>
            <section class="container3" style="font-size: 13px;">
                <table class="center_notice_table">
                    <tr>
                        <!-- 글 관리 관리자 모드에서 하면 목록 버튼만 있으면 될 듯, 그거 아니면 목록/수정/삭제 버튼 모두 존재하고 관리자일 때만 수정/삭제 보이게-->
                        <td style="text-align: left;"><button class="btn" style="background-color: white;">목록</button>
                        </td>
                        <td style="text-align: right;"><button class="btn" style="background-color: white;">삭제</button>
                            <button class="btn" style="background-color: white;">수정</button></td>
                    </tr>
                </table>
            </section>
        </div>
    </section>


    <footer id="footer"></footer>
</body>

</html>