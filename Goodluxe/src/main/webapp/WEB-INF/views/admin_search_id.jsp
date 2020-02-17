<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.goodluxe.voes.MemberVO" %>
<%
	MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");
	String nullChk = (String)request.getAttribute("nullChk");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin_design_all.css">

</head>
<body>
	<%
		if(nullChk.equals("none")){
			%>
			
			<p>요청하신 아이디와 일치하는 회원이 없습니다.</p>
			
			<%
		}else{
	%>
	<div class="tbl_head01 tbl_wrap">
	<table border = "1">
		<tr>
			<th> 아이디 </th><th> 이 름 </th><th>가입일</th><th>등급</th>
		</tr>
		<tr>
			<td> <%=memberVO.getMember_id() %> </td>
			<td> <%=memberVO.getMember_name() %> </td>
			<td> <%=memberVO.getMember_join_date() %></td>
			<td> <%=memberVO.getMember_class() %></td>
		</tr>
		<tr>
			<td colspan = "4">
				<button onclick = "window.close();"> 사용하기 </button>
			</td>
		</tr>
	</table>
	</div>
	<%
		}
	%>
</body>
</html>