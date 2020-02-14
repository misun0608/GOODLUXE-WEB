<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page  session = "true"  %>
    <%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<% 
	String session_Id = session.getId(); 
	String session_id = (String) session.getAttribute("member_id");
	String session_name = (String)session.getAttribute("member_name");
	String session_isadmin = (String)session.getAttribute("member_isadmin");
	
%>
<tr>
	<td><%=session_Id %></td>
	<td><%=session_id %></td>
	<td><%=session_name %></td>
	<td><%=session_isadmin %></td>
</tr>
	
<a href="chat.do" ><h2>chat.do 채팅 고</h2></a>
<br><br>
<br><br>


</body>
</html>