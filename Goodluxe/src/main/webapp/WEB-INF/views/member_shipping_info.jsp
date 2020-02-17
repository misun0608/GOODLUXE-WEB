<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%
	HashMap<String, String> member_shipping_info = (HashMap<String,String>)request.getAttribute("shipping_info");
	String order_number = member_shipping_info.get("order_number");
	String member_id = member_shipping_info.get("member_id");
	String member_name = member_shipping_info.get("member_name");
	String order_zipcode = member_shipping_info.get("order_zipcode");
	String order_addr1 = member_shipping_info.get("order_addr1");
	String order_addr2 = member_shipping_info.get("order_addr2");
	String order_phone = member_shipping_info.get("order_phone");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<li>
		<ul><%= member_id %>님의 배송 정보</ul>
		
		<ul>주문번호 : <%= order_number %></ul>
		<ul>받는 사람 : <%= member_name %></ul>
		<ul>주  소 : [ <%=order_zipcode %> ] <%= order_addr1%> <%=order_addr2 %></ul>
		<ul>핸드폰  : <%= order_phone %></ul>
		
		
		
	</li>
		
	
	
</body>
</html>