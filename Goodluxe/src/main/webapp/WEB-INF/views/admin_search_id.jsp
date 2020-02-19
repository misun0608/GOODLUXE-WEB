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
	<div class="modal">
		<div class="modal-content">
			<center>
			<%
				if(nullChk.equals("none")){
					%>
					
					<p>요청하신 아이디와 일치하는 회원이 없습니다.</p>
					
					<%
				}else{
			%>
		
			<table class="id_search_table">
				<thead>
					<tr>
						<td class="title_td"> 아이디 </td>
						<td class="title_td"> 이 름 </td>
						<td class="title_td">가입일</td>
						<td class="title_td">등급</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="context_td"> <%=memberVO.getMember_id() %> </td>
						<td class="context_td"> <%=memberVO.getMember_name() %> </td>
						<td class="context_td"> <%=memberVO.getMember_join_date() %></td>
						<td class="context_td"> <%=memberVO.getMember_class() %></td>
					</tr>
				</tbody>
			</table>
				
				<button class="bottom_btn" onclick = "window.close();"> 사용하기 </button>
		
		
			<%
				}
			%>
		</div>
	</div>
</body>
</html>