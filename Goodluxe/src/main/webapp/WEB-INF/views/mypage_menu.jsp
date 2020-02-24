<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String member_id = (String)session.getAttribute("member_id");
%>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage_menu.css" />
</head>
 <section id = "menu_section">
     <div class = "menu_div">
         <h1 class = "mypage_title">
             | MY PAGE
         </h1>
          <div class = "my_info" > 
             <ul class="info_list">
                 <li><span class="mypage_id"><%=member_id %></span>&nbsp;&nbsp;<span class="mypage_menu">님의 GOODLUXE 접속을 환영합니다 :)</span></li>
<!--                  <li>적립금 : <a href = "point_view.html">5000원</a></li> 
                 <li>허수구매율 : <a href = "restriction.html"> 0%</a></li>
                 <li>관심상품 : <a href = "mypage_liked_goods.html">2개 </a></li> -->
             </ul>
         </div>
         <div class = "menu_container">
             <a href = "mypageOAS.do">
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/box_w_resize.png" class ="img_icon"/></div>
                     <div class = "menu_content">
                         <h4>주문조회</h4>
                     </div>
                 </div>
             </a>
             <a href = "get_apply_form.do">
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/shop_w_resize.png" class ="img_icon"/></div>
                     <div class = "menu_content">
                         <h4>판매신청</h4>
                     </div>
                 </div>
             </a>
             <a href = "get_salesinquiry_form.do">
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/wish_w_resize.png" class ="img_icon"/></div>
                     <div class = "menu_content">
                         <h4>판매조회</h4>
                     </div>
                 </div>
             </a>
             <a href = "get_restriction_view.do">
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/lock_w_resize.png" class = "img_icon"/> </div>
                     <div class = "menu_content">
                         <h4>구매제한</h4>
                     </div>
                 </div>
             </a>
             <a href = "get_point_view.do">    
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/money_w_resize.png" class = "img_icon"/></div>
                     <div class = "menu_content">
                         <h4>적립금</h4>
                     </div>
                 </div>
             </a>
             <a href = "get_coupon_view.do">
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/coupon_w_resize.png" class = "img_icon"/></div>
                     <div class = "menu_content">
                         <h4>쿠폰</h4>
                     </div>
                 </div>
             </a>
             <a href = "myLikedGoods.do">
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/heart_w_resize.png" class = "img_icon"/></i></div>
                     <div class = "menu_content">
                         <h4>관심 상품</h4>
                     </div>
                 </div>
             </a>
             <a href = "myInfo.do">
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/person_w_resize.png" class = "img_icon"/></div>
                     <div class = "menu_content"> 
                         <h4>개인 정보</h4> 
                     </div>
                 </div>
             </a>
         </div>
     </div>
 </section>