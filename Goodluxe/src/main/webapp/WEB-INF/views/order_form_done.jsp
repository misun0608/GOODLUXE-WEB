<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.util.Date" %>
<%@page import="com.spring.goodluxe.voes.*" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.SimpleDateFormat"%>

<%
	OrderVO ovo = (OrderVO)request.getAttribute("orderVO");
	
	// 결제수단
	String pay_method = ovo.getOrder_pay_system();
	System.out.println("결제수단 : " + pay_method);
	DecimalFormat df3 = new DecimalFormat(",###");
	
	// 결제금액
	String order_pay_price = df3.format(ovo.getOrder_pay_price()) + "원";
	
	SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	// 주문일자
	String order_date = format2.format(ovo.getOrder_order_date());
	
	String order_pay_date = "";
	
	String accumulated_point_format = "";
	
	// 결제일자
	if(pay_method.equals("카카오페이")){
	order_pay_date = format2.format(ovo.getOrder_pay_date());
	
	// 적립금
	ProductVO pvo = (ProductVO)request.getAttribute("pvo");
	int accumulated_point = (int)(pvo.getSale_price() * 0.001);
	accumulated_point_format = df3.format(accumulated_point);
	}
	

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order_form_done.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/goodluxe-header.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script>
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

<body>
    <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

    <!-- <section style="height: 800px;"> -->
    <section id="container">
        <br>
        <center>
            <div id="main">
                <div class="order_done_cover">
                    <div class="order_done">
                        <img src="${pageContext.request.contextPath}/resources/img/icons/cart.png" alt="cart" width="100px"><br /><br />
                        <%
                        	if(ovo.getOrder_pay_system().equals("무통장입금")){
                        %>
                        <h3>주문이 완료되었습니다.</h3><br /><br />
                        <%
                        	}else{
                        %>
                        <h3>결제가 완료되었습니다.</h3><br /><br />
                        <%
                        	}
                        %>
                        <p>
                            주문내역 및 배송에 대한 상세안내는 <a href="mypageOAS.do">주문조회</a> 를 통하여 확인 가능합니다</p><br />
                            <p class="order_num_p">주문번호: <%=ovo.getOrder_number() %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            주문일자: <%=order_date %><br />
                        </p>
                        <br /><br />
                        <div>
                            <h4>결제 정보 확인</h4><br />
                        <table class="payment_info_table">
                        <%
                           if(ovo.getOrder_pay_system().equals("무통장입금")){
                        %>
                                <tr>
                                    <td class="order_done_title_td">결제 방법</td>
                                    <td class="order_done_td"><%=ovo.getOrder_pay_system() %></td>
                                    <td class="order_done_title_td">주문일자</td>
                                    <td class="order_done_td"><%=order_date %></td>
                                </tr>
                                <tr>
                                    <td class="order_done_title_td">입금 계좌</td>
                                    <td class="order_done_td">
                                        국민 98786174945 예금주: 굿럭스
                                    </td>
                                    <td class="order_done_title_td">결제금액</td>
                                    <td class="order_done_td">
                                        <p><%=order_pay_price %></p>
                                    </td>
                                </tr>

                                <%
                                	}else if(ovo.getOrder_pay_system().equals("카카오페이")){
                                %>
                                <tr>
                                    <td class="order_done_title_td">결제방법</td>
                                    <td class="order_done_td"><%=ovo.getOrder_pay_system() %></td>
                                    <td class="order_done_title_td">결제일자</td>
                                    <td class="order_done_td"><%=order_pay_date %></td>
                                </tr>
                                <tr>
                                    <td class="order_done_title_td">적립 포인트</td>
                                    <td class="order_done_td">
                                    	<%=accumulated_point_format %>P
                                    </td>
                                    <td class="order_done_title_td">결제금액</td>
                                    <td class="order_done_td">
                                        <p><%=order_pay_price %></p>
                                    </td>
                                </tr>
                                <%
                                	}
                                %>
                              </table>
                        </div>
                        <br />
                        <button class="apply_addbtn apply_mainbtn" onClick="location.href='mainPage.do'; return false;">메인화면으로</button>
                    </div>
                </div>
            </div>

    </section>

    <footer id="footer">
    </footer>
</body>

</html>