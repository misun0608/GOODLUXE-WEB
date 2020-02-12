<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="com.spring.goodluxe.jj.ChatVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("member_isadmin")=="N") {
		out.println("<script>");
		out.println("location.href='loginForm.do'");
		out.println("</script>");
	}	
	
	
	
	String member_id = (String)session.getAttribute("member_id");
	String member_name = (String)session.getAttribute("member_name");
	ArrayList<ChatVO> chatlist = (ArrayList)request.getAttribute("chatlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<table border="1" align="center">
			<tr>
				<td align="center">순번</td>
				<td align="center">회원 아이디</td>
				<td align="center">마지막 시간의 메시지</td>
				<td align="center">입장버튼</td>
			</tr>
			<%for(int i=0; i<chatlist.size(); i++){ %>
			<tr>
				<td align="center"><%=i+1 %></td>
				<td align="center"><%=chatlist.get(i).getMember_id()%></td>
				<td align="center"><%=chatlist.get(i).getMessage_time()%><br /><%=chatlist.get(i).getMember_message() %></td>
				<td align="center"><a href="client_chat.do?<%=chatlist.get(i).getMember_id() %>" ><button type="button" Style="font-size:125%; width:100%; height:50px;">입장</button></a></td>
			</tr>
				<%} %>
				
		</table>
	</form>
</body>
</html>