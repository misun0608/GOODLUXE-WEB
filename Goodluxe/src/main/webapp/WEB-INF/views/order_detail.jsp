<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.DecimalFormat,java.sql.Timestamp,com.spring.goodluxe.*" %>
<% HashMap<String,Object> orderdata = (HashMap<String, Object>)request.getAttribute("orderdata");%>
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
	
	<!-- order_detail -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order_detail.css" />
	
</head>
<body>
    <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

    <section id="container">
        <br>
        <div id="main">
            <article id = "arti_order_info">
                <br/><br/><br/>
                <h2 class = "order_and_shipping_title">| 주문상세</h2>
                <div class = "order_info_box">
                    <div><h3 class = "info_title">주문정보</h3></div>
                    <div>
                        <form>
                            <table class = "info_table_left" >
                                <tr>
                                    <th>주문번호</th>
                                    <td><%=orderdata.get("order_number") %></td>
                                </tr>
                                <tr>
                                    <th>주문일자</th>
                                    <%	String order_date = orderdata.get("order_order_date").toString();
                            			order_date = order_date.split(" ")[0]; %>
                                    <td><%=order_date %></td>
                                </tr>
                                <tr>
                                    <th>이름</th>
                                    <td><%=orderdata.get("member_name") %></td>
                                </tr>
                                <tr>
                                    <th>주문처리상태</th>
                                    <td><%=orderdata.get("order_status") %></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </article>

            <article id="arti_payinfo">
                <div class = "pay_info_box">
                    <div><h3 class = "info_title">결제정보</h3></div>
                    <div>
                    	<%
                    	DecimalFormat df3 = new DecimalFormat(",###");
                		int md_price = Integer.parseInt(orderdata.get("order_product_price").toString());
                		int used_point = Integer.parseInt(orderdata.get("order_used_point").toString());
                		int delivery_fee = Integer.parseInt(orderdata.get("order_ship_fee").toString());
                		int payment_price = md_price - used_point + delivery_fee;
                		String st_md_price = df3.format(md_price) + "원";
                		String st_used_point = df3.format(used_point) + " P";
                		String st_delivery_fee = df3.format(delivery_fee) + "원";
                		String st_payment_price = df3.format(payment_price) + "원";
                    	%>
                        <table class = "info_table_left">
                            <tr>
                                <th>총 주문 금액</th>
                                <td><%=st_md_price %></td>
                            </tr>
                            <tr>
                                <th>사용 적립금</th>
                                <td><%=st_used_point %></td>
                            </tr>
                            <tr>
                                <th>배송비</th>
                                <td><%=st_delivery_fee %></td>
                            </tr>
                            <tr>
                                <th>총 결제금액</th>
                                <td><%=st_payment_price %></td>
                            </tr>
                            <tr>
                                <th>결제수단</th>
                                <td><%=orderdata.get("order_pay_system") %>
                                <%
                                if(orderdata.get("order_pay_system").equals("무통장입금")) {
                                %>
                                 <br/> 입금자명 : <%=orderdata.get("member_name") %> <br/> 입금 계좌 : 3520470538233 농협 (주)GOODLUXE
                                <%} %>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </article>
            <article id="arti_pay_info">
                <div class = "product_info_box">
                    <div> <h3 class = "info_title">주문상품 정보</h3></div>
                    <div style="overflow-x:auto;"   >
                        <table class = "info_table_top">
                            <thead>
                                <tr>
                                    <th width ="100px" class = "mobile_hidden">이미지</th>
                                    <th width ="200px" >상품명</th>
                                    <th width ="100px" class = "mobile_hidden">가격</th>
                                    <th width ="100px" class = "mobile_hidden">주문처리상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class = "mobile_row1" ><div class = "img_size_div"><img src = "${pageContext.request.contextPath}/resources/<%=orderdata.get("pb_photo1") %>" class = "product_img"></div></td>
                                    <td class = "mobile_row2" data-title = "상품정보" ><%=orderdata.get("pb_md_name") %></td>
                                    <td class = "mobile_row3" data-title = "판매가"><%=st_md_price %></td>
                                    <td class = "mobile_row4" data-title = "주문 처리상태"><%=orderdata.get("order_status") %></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr >
                                    <td colspan = "5" >
                                        상품 금액 <%=st_md_price %> - 사용 포인트 <%=st_used_point %> + 배송비 <%=st_delivery_fee %> <br/> = <b>합계 <%=st_payment_price %></b><br/>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </article>
            <article class= "arti_shipping_info">
                <div class="shipping_info_box">
                    <div><h3 class = "info_title">배송지 정보</h3></div>
                    <form>
                        <div>
                            <table class = "info_table_left">
                                <tr>
                                    <th>받으시는 분</th>
                                    <td><%=orderdata.get("order_receipt") %></td>
                                </tr>
                                <tr>
                                    <th>우편번호</th>
                                    <td><%=orderdata.get("order_zipcode") %></td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td><%=orderdata.get("order_addr1") %> <%=orderdata.get("order_addr2") %></td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td><%=orderdata.get("order_phone") %></td>
                                </tr>
                                <tr class = "lasttr">
                                    <th>배송메세지</th>
                                    <td>
                                    <%if(orderdata.get("order_message") == null) { %>
                                    
                                    <% } else { %>
                                    <%=orderdata.get("order_message") %>
                                    <% } %>
                                    </td>
                                </tr>
                            </table>
                            <div class = "table_button_div">
                                <button class = "table_button_right" onClick='location.href="mypageOAS.do"; return false;'>주문목록보기</button>
                            </div> 
                        </div>
                    </form> 
                </div>
            </article>
        </div>
    </section>

    <footer id="footer">
    </footer>
</body>
</html>