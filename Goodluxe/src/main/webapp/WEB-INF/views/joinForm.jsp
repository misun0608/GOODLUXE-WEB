<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="memberinsert.do" name="joinform" method="post">
		<center>
			<table border=1>
				<tr>
					<td colspan="2" align=center>
						<b><font size=5>회원가입 페이지</font></b>
					</td>
				</tr>
				<tr>
					<td>아이디 : </td>
					<td><input type="text" name="member_id" /></td>
				</tr>
				<tr>
					<td>비밀번호 : </td>
					<td><input type="password" name="member_pw" /></td>
				</tr>
				<tr>
					<td>이름 : </td>
					<td><input type="text" name="member_name" /></td>
				</tr>
				<tr>
					<td>이름 : </td>
					<td><input type="text" name="member_zipcode" value="28343"/></td>
					<td><input type="text" name="member_addr1" value="서울시 온수동" /></td>
					<td><input type="text" name="member_addr2" value="경리단길" /></td>
					<td><input type="text" name="member_phone" value="01050432060" /></td>
					<td><input type="text" name="member_email" value="dbwowls12345@naver.com"/></td>
					<td><input type="text" name="member_email_receive" value="Y"/></td>
					<td><input type="text" name="member_like_brand" value="etc"/></td>
					<td><input type="text" name="member_like_category" value="etc"/></td>
					<td><input type="text" name="member_class" value="Y"/></td>
					<td><input type="text" name="member_point" value="0"/></td>
					<td><input type="text" name="member_isadmin" value="Y"/></td>
				</tr>
				
				
				<tr>
					<td colspan="2" align=center>
						<a href="javascript:joinform.submit()">회원가입</a>&nbsp;&nbsp;
						<a href="javascript:joinform.reset()">다시작성</a>
					</td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>