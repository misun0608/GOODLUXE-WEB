<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.DecimalFormat,java.sql.Timestamp,com.spring.goodluxe.*" %>
<%
	ArrayList<HashMap<String,Object>> oaslist = null;
	ArrayList<HashMap<String,Object>> cancellist = null;
	oaslist = (ArrayList<HashMap<String,Object>>)request.getAttribute("oaslist");
	cancellist = (ArrayList<HashMap<String,Object>>)request.getAttribute("cancellist");
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
	
	<!-- order_and_shipping -->
	<script>
		$(document).ready(function(){
			$("#mypage_menu").load("mypageMenu.do", function(){
				$('.menu_container').children('a').eq(0).children().children('.icon').addClass('selected_menu');
			});
		});
		function order_cancel(order_number, pd_name) {
			var c = confirm("\'" + pd_name + "\' 제품 구매를 취소하시겠습니까?");
			if(c) {
				location.href="orderCancel.do?order_number="+order_number;
			}
		}
		function order_refund(order_number, pd_name) {
			var c = confirm("\'" + pd_name + "\' 제품 환불 신청하시겠습니까?\n 환불은 제품 반환 및 상태 확인 후 이루어집니다.");
			if(c) {
				location.href="orderRefund.do?order_number="+order_number;
			}
		}
	</script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage_onlymenu.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order_and_shipping.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/order_and_shipping.js"></script>
	
</head>
<body>
    <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

    <section id="container">
        <br>
        <div id="main">
            <article class="arti_menu" id="mypage_menu"></article>
            <article class = "arti_order_and_shipping">
                <br/> <br/>
                <div>
                    <div id="tab_container_j">
                        <!--판매조회_위탁판매-->
                        <ul class="tabs">
                            <li class="tab-link current" data-tab="tab-1">
                                <a href="#" class="anchor current" name="#tab-1">주문/배송 조회</a>
                            </li>
                            <li class="tab-link" data-tab="tab-2">
                                <a href="#" class="anchor" name="#tab-2">취소/반품 내역</a>
                            </li>
                        </ul>
                        <hr id="tab-line" class="tab-line">
                    </div>
                    <div id="tab-1" class="tab-content current">
                        <table class="tab_table">
                            <thead>
                                <tr>
                                    <td>주문일자<br/>[주문번호]</td>
                                    <td>이미지</td>
                                    <td>상품명</td>
                                    <td>상품구매금액</td>
                                    <td>주문처리상태</td>
                                    <td>취소/환불</td>
                                </tr>
                            </thead>
                            <tbody>
                            <% if( oaslist == null || oaslist.size() == 0) { %>
                            	<tr  style="height:200px;">
                            		<td colspan="6"> 주문하신 상품이 존재하지 않습니다.</td>
                            	</tr>
                            <% } else { 
                            	for (int i = 0; i < oaslist.size(); i++) {
                            		HashMap<String,Object> oasData = oaslist.get(i);
                            		
                            		String order_date = oasData.get("order_order_date").toString();
                            		order_date = order_date.split(" ")[0];
                            		
                            		DecimalFormat df3 = new DecimalFormat(",###");
                            		int price = Integer.parseInt(oasData.get("order_product_price").toString());
                            		String order_price = df3.format(price) + "원";
                            		
                            		String btn_value = null;
                            		if( oasData.get("order_status").equals("입금전") ) {
                            			btn_value = "취 소";
                            		} else {
                            			btn_value = "환 불";
                            		}
                            %>
								<tr>
                                    <td><%=order_date %><br/><a href="orderDetail.do?order_number=<%=oasData.get("order_number") %>">[<%=oasData.get("order_number") %>]</a></td>
                                    <td><img src="/Goodluxe/image/<%=oasData.get("pb_main_img_stored") %>" class = "order_shipping_img"></td>
                                    <td><a href="findEnNum.do?pb_number=<%=oasData.get("pb_number")%>"><%=oasData.get("pb_md_name") %></a></td>
                                    <td><%=order_price %></td>
                                    <td><%=oasData.get("order_status") %></td>
                                    <%
                                    String order_number = oasData.get("order_number").toString();
                                    String pd_name = oasData.get("pb_md_name").toString();
                                    if(btn_value.equals("취 소")) {
                                    %>
                                    <td><button onClick="order_cancel('<%=order_number %>', '<%=pd_name %>')"><%=btn_value %></button></td>
                                    <%} else { 
                                    	Calendar today = Calendar.getInstance();
                            			Timestamp ct = new Timestamp(today.getTimeInMillis());
                            			Timestamp pt = Timestamp.valueOf(oasData.get("order_pay_date").toString());
                            			long time = (ct.getTime()-pt.getTime())/(1000*60*60*24);                            			
                            		%>
                                    <td>
                            		<%
                                    	if( time <= 14 ) {
                                    %>
                                    	<button onClick="order_refund('<%=order_number %>', '<%=pd_name %>')"><%=btn_value %></button>
                                    <%} else {%> - <%}%> </td> <% } %>
                                </tr>
                            <% 
                            		}
                            	} %>
                            </tbody>
                        </table>
                        
                    </div>
    
                    <div id="tab-2" class="tab-content">
                        <table class="tab_table">
                            <thead>
                                <tr>
                                    <td>주문일자<br/>[주문번호]</td><td>이미지</td><td>상품명</td><td>상품구매금액</td><td>주문처리상태</td><td>취소/환불</td>
                                </tr>
                            </thead>
                            <tbody >
                            <% if( cancellist == null || cancellist.size() == 0) { %>
                            	<tr  style="height:200px;">
                            		<td colspan="6"> 취소하신 상품이 존재하지 않습니다.</td>
                            	</tr>
                            <% } else { 
                            	for (int i = 0; i < cancellist.size(); i++) {
                            		HashMap<String,Object> cancelData = cancellist.get(i);
                            		
                            		String order_date = cancelData.get("order_order_date").toString();
                            		order_date = order_date.split(" ")[0];
                            		
                            		DecimalFormat df3 = new DecimalFormat(",###");
                            		int price = Integer.parseInt(cancelData.get("order_product_price").toString());
                            		String order_price = df3.format(price) + "원";
                            		
                            %>
								<tr>
                                    <td><%=order_date %><br/><a href="orderDetail.do?order_number=<%=cancelData.get("order_number") %>">[<%=cancelData.get("order_number") %>]</a></td>
                                    <td><img src='/Goodluxe/image/<%=cancelData.get("pb_main_img_stored") %>' class = "order_shipping_img"></td>
                                    <td><a href="findEnNum.do?pb_number=<%=cancelData.get("pb_number")%>"><%=cancelData.get("pb_md_name") %></a></td>
                                    <td><%=order_price %></td>
                                    <td><%=cancelData.get("order_status") %></td>
                                    <td><button onClick="location.href='orderDetail.do?order_number=<%=cancelData.get("order_number") %>'; return false;">상세보기</button></td>
                                </tr>
                            <% 
                            		}
                            	} %>
                            </tbody>
                        </table>
                    </div>
    
                </div>
                <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>
            </article>
        </div>
    </section>

    <footer id="footer">
    </footer>
</body>
</html>