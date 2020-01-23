<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<br /><br /><a href="adminProductRegisterPurchase.do">지예_매입상품 등록</a>
<br /><br /><a href="adminProductRegisterConsign.do">지예_위탁상품 등록</a>
<br /><br /><a href="adminPostUpload.do">지예_게시물 작성</a>
<br /><br /><a href="itemList.do">지예_제품리스트</a>
<br /><br /><a href="#">재진_만들고자 하는 페이지를 연결합시다</a>

<br /><br />
css, js, img를 가져다가 사용하고 싶다면...<br>
webapp > resources > css / js / img 폴더에 넣고<br>
사용할 때는<br>
\${pageContext.request.contextPath}/resources/...<br>
이런식으로 경로를 넣고 사용하십시오...(맨 앞에 역슬래시 빼야하는거 알죠...?)<br><br>

<img src="${pageContext.request.contextPath}/resources/img/janhae.jpg" style="width:100px;">
</body>
</html>
