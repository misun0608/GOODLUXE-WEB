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
<br /><br /><a href="mypageOAS.do">진_만들고자 하는 페이지를 연결합시다</a>
<br /><br /><a href="mainPage.do">민지_만들고자 하는 페이지를 연결합시다</a>


<br /><br /><a href="adminProductRegisterPurchase.do">지예_매입 등록</a>
<br /><br /><a href="adminProductRegisterConsign.do">지예_위탁등록</a>
<br /><br /><a href="adminPostUpload.do">지예_게시물등록</a>
<br /><br /><a href="itemList.do">지예_리스트</a>
<br /><br /><a href="mainPage.do">지예_메인페이지</a>
<br /><br /><a href="searchResult.do?search_content=">지예_검색결과</a>
<br /><br /><a href="mdDetail.do?entity_number=40">지예_상품상세</a>
<br /><br /><a href="myInfo.do?member_id=mjmj">지예 mypage 개인정보</a>
<br /><br /><a href="myLikedGoods.do">지예 mypage 관심상품</a>
<br /><br /><a href="adminCoupon.do">지예 admin 쿠폰관리</a>
<br /><br /><a href="adminCustomer.do">지예 admin 블랙리스트관리</a>
<br /><br /><a href="adminOrder.do">지예 admin 주문관리</a>
<br /><br /><a href="adminProduct.do">지예 admin 상품관리</a>
<br /><br /><a href="adminReturn.do">지예 admin 반품관리</a>

<br /><br />
css, js, img를 가져다가 사용하고 싶다면...<br>
webapp > resources > css / js / img 폴더에 넣고<br>
사용할 때는<br>
\${pageContext.request.contextPath}/resources/...<br>
이런식으로 경로를 넣고 사용하십시오...(맨 앞에 역슬래시 빼야하는거 알죠...?)<br><br>

<img src="${pageContext.request.contextPath}/resources/img/janhae.jpg" style="width:100px;">
</body>
</html>
