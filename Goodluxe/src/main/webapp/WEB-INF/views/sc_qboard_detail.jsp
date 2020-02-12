<%@page import="com.spring.goodluxe.voes.InquireVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.Timestamp,com.spring.goodluxe.*" %>
<%
	InquireVO qPost = (InquireVO) request.getAttribute("qPost");
	
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
	
	<!-- sc_qboard_write -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board_detail.css" />
    
</head>

<body class="">
    <header id="header"></header>
    <nav id="nav_bar"></nav>
    <div class="login_bg" id="login_box"></div>
    
    <section id="container">
        <br />
        <div id="main">
            <section class="center_detail_container">
                <div class="center_detail_main">
            <p style="text-align: left; margin: 18px 0 16px 14px;font-size: 24px;font-weight:none;">| 고객센터</p>
            <h3 class="center_detail_text_head">문의 글 상세보기</h3>

            <!-- 문의글 테이블 -->
            <section class="center_detail_container2">
                <table class="center_detail_table">
                    <tbody style="text-align: left; border: 1px solid #d7d7d7;">
                        <tr style="border: 1px solid #d7d7d7;">
                            <td class="center_detail_td_title">제　목</td>
                            <td class="detail_table_content">반품 문의입니다</td>
                        </tr>
                        <tr style="border: 1px solid #d7d7d7;">
                            <td class="center_detail_td_title">작성자</td>
                            <td class="detail_table_content">MJx2</td>
                        </tr>
                        <tr style="border: 1px solid #d7d7d7;">
                            <td class="center_detail_td_title">등록일</td>
                            <td class="detail_table_content" name="" id="" rows="1">2019.12.30</td>
                        </tr>
                        <tr style="border: 1px solid #d7d7d7;">
                            <td class="detail_table_content" colspan="2">저기요..<br>반품하고 싶습니다만....<br>배가 고픕니다..<br></td>
                        </tr>
                    </tbody>
                </table>
            </section>

            <!-- 문의글 아래 버튼 -->
            <section class="center_detail_container3" style="font-size: 13px;">
                <table class="center_detail_table">
                    <tr>
                        <!-- 작성자가 당사자일 경우, 목록/수정/삭제 버튼 모두 보임. 당사자가 아닐 경우 목록만 보임. admin일 경우 목록/삭제 보임(삭제도 보여도 되나?)-->
                        <td style="text-align: left;"><button class="center_detail_btn" style="background-color: white;">목록</button>
                        </td>
                        <td style="text-align: right;"><button class="center_detail_btn" style="background-color: white;">삭제</button>
                            <button class="center_detail_btn" style="background-color: white;">수정</button></td>
                    </tr>
                </table>
            </section>

            <!-- 댓글 달기 부분 -->
            <section class="center_detail_table">
                <input type="text" class="detail_comment_text">&nbsp;<button class="detail_comment_btn">댓글 달기</button>
            </section>

            <!-- 달려 있는 댓글/답글 부분 -->
            <section class="center_detail_container2">
                <table class="detail_comment_table" style="border: 1px solid #d7d7d7;">
                    <tr>
                        <td class="detail_comment_td_id">Admin</td>
                        <td class="detail_comment_td_btn" rowspan="2">
                            <!--admin : 수정 필요없을 듯, 댓글 당사자 : 수정/삭제(답댓 없어도 되지 않을까), 다른 고객 : 답댓글만-->
                            <button class="detail_re_comment_btn">답글</button><br>
                            <button class="detail_re_comment_btn">수정</button><br>
                            <button class="detail_re_comment_btn">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="detail_comment_td_content">안녕하세요^^ 고객님<br>
                            반품을 원하시는 경우<br>
                            상품 받아보신 날짜 7일이내로(주말/공휴일제외) 보내주시면됩니다
                        </td>
                    </tr>
                </table>
                <!--댓글에 대한 답글 달릴 경우-->
                <table class="detail_comment_table">
                    <tr>
                        <td class="detail_re_comment_td_icon"><img src="${pageContext.request.contextPath}/resources/img/icons/re_comment.png" style="width: 10px;"></td>
                        <td class="detail_re_comment_td_id">&nbsp;MJx2</td>
                        <td class="detail_re_comment_td_btn" rowspan="2">
                            <button class="detail_re_comment_btn">수정</button><br>
                            <button class="detail_re_comment_btn">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="detail_re_comment_td_icon"></td>
                        <td class="detail_re_comment_td_content">아하<br />그렇군요
                        </td>
                    </tr>
                </table>


                <table class="detail_comment_table">
                    <tr>
                        <td class="detail_re_comment_td_icon"><img src="${pageContext.request.contextPath}/resources/img/icons/re_comment.png" style="width: 10px;"></td>
                        <td class="detail_re_comment_td_id">&nbsp;Admin&nbsp;<span class="detail_re_re_comment">@MJx2님에 대한 답글</span>
                        </td>
                        <td class="detail_re_comment_td_btn" rowspan="2">
                            <!--admin : 수정 필요없을 듯, 댓글 당사자 : 수정/삭제(답댓 없어도 되지 않을까), 다른 고객 : 답글만-->
                            <button class="detail_re_comment_btn">수정</button><br>
                            <button class="detail_re_comment_btn">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="detail_re_comment_td_icon"></td>
                        <td class="detail_re_comment_td_content">아하<br />그렇군요
                        </td>
                    </tr>
                </table>

                <table class="detail_comment_table">
                    <tr>
                        <td class="detail_re_comment_td_icon"><img src="${pageContext.request.contextPath}/resources/img/icons/re_comment.png" style="width: 10px;"></td>
                        <td class="detail_re_comment_td_id">&nbsp;2xjm</td>
                        <td class="detail_re_comment_td_btn" rowspan="2">
                            <button class="detail_re_comment_btn">답글</button><br>
                            <button class="detail_re_comment_btn">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="detail_re_comment_td_icon"></td>
                        <td class="detail_re_comment_td_content">오 반품도 가능하군요<br />신기하네요
                        </td>
                    </tr>
                </table>
                <table class="detail_comment_table" style="border: 1px solid #d7d7d7;">
                    <tr>
                        <td class="detail_comment_td_id">2xjm</td>
                        <td class="detail_comment_td_btn" rowspan="2">
                            <button class="detail_re_comment_btn">답글</button><br>
                            <button class="detail_re_comment_btn">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="detail_comment_td_content">곧 학원 가야하네요<br>
                            아악!!
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            </section>
        </div>
    </section>

	<footer id="footer"></footer>
</body>

</html>