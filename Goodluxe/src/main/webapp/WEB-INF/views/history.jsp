<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.spring.goodluxe.jj.*" %>
	<%@ page import="java.util.ArrayList" %>
	<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="com.spring.goodluxe.voes.Auction_HistoryVO" %>

<!DOCTYPE html>
<HTML>
<HEAD>
<meta charset="UTF-8">
<TITLE>팝업</TITLE>
<script type="text/javascript">
	moveTo(500,500);
	resizeTo(350,620);
</script>

<% 
ArrayList<Auction_HistoryVO> list = (ArrayList<Auction_HistoryVO>)request.getAttribute("list");
int i=0;

%>

</HEAD>
<BODY>
<div id="container">
	<table  border="1" >
	
	<tr>
		<th>순위</th>
		<th>입찰값</th>
		<th>아이디</th>
		<th>입찰시간</th>
	</tr>
	<%for(i=0; i<list.size(); i++){
		Auction_HistoryVO vo = list.get(i);
		
		
		%>
	<tr>
		<th><%=i+1 %></th>
		<th><%=vo.getAUHIS_BETTING_PRICE() %></th>
		<th><%=vo.getMEMBER_ID().substring(0, 3) %>***</th>
		<th><%=vo.getAUHIS_BID_TIME() %></th>
	</tr>
	<% } %>
	
	</table>
	</div>
</BODY>
</HTML>