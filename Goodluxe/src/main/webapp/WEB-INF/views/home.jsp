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

<br /><br /><a href="admin_main.do">미선_관리자_메인</a>
<br /><br /><a href="pointView.do">미선_관리자_포인트</a>
<br /><br /><a href="pointUpdateModal.do">미선_관리자_모달</a>

<br /><br /><a href="adminProductRegisterPurchase.do">지예_매입 등록</a>
<br /><br /><a href="adminProductRegisterConsign.do">지예_위탁등록</a>
<br /><br /><a href="adminPostUpload.do">지예_게시물등록</a>
<br /><br /><a href="adminCoupon.do">지예 admin 쿠폰관리</a>
<br /><br /><a href="adminCustomer.do">지예 admin 블랙리스트관리</a>
<br /><br /><a href="adminOrder.do">지예 admin 주문관리</a>
<br /><br /><a href="adminProduct.do">지예 admin 상품관리</a>
<br /><br /><a href="adminReturn.do">지예 admin 반품관리</a>

<br /><br /><a href="jaejinupage.do">재진</a>

<br /><br />
css, js, img를 가져다가 사용하고 싶다면...<br>
webapp > resources > css / js / img 폴더에 넣고<br>
사용할 때는<br>
\${pageContext.request.contextPath}/resources/...<br>
이런식으로 경로를 넣고 사용하십시오...(맨 앞에 역슬래시 빼야하는거 알죠...?)<br><br>

<img src="${pageContext.request.contextPath}/resources/img/janhae.jpg" style="width:100px;">
</body>
</html>
