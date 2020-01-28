<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <section id = "menu_section">
     <div class = "menu_div">
         <h1 class = "mypage_title">
             | MY PAGE
         </h1>
         <div class = "my_info" > 
             <ul class="info_list">
                 <li>사용가능한 쿠폰 : <a href = "coupon_view.html">1장</a></li>
                 <li>적립금 : <a href = "point_view.html">5000원</a></li> 
                 <li>허수구매율 : <a href = "restriction.html"> 0%</a></li>
                 <li>관심상품 : <a href = "mypage_liked_goods.html">2개 </a></li>
             </ul>
         </div>
         <div class = "menu_container">
             <a href = "mypageOAS.do">
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/box_w_resize.png" class = "img_icon"/></div>
                     <div class = "menu_content">
                         <h4>주문조회</h4>
                     </div>
                 </div>
             </a>
             <a href = "mypageApplyForm.do">
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/shop_w_resize.png" class = "img_icon"/></div>
                     <div class = "menu_content">
                         <h4>판매신청</h4>
                     </div>
                 </div>
             </a>
             <a href = "mypage_salesinquiry.html">
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/wish_w_resize.png" class = "img_icon"/></div>
                     <div class = "menu_content">
                         <h4>판매조회</h4>
                     </div>
                 </div>
             </a>
             <a href = "restriction.html">
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/lock_w_resize.png" class = "img_icon"/> </div>
                     <div class = "menu_content">
                         <h4>구매제한</h4>
                     </div>
                 </div>
             </a>
             <a href = "point_view.html">    
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/money_w_resize.png" class = "img_icon"/></div>
                     <div class = "menu_content">
                         <h4>적립금</h4>
                     </div>
                 </div>
             </a>
             <a href = "coupon_view.html">
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/coupon_w_resize.png" class = "img_icon"/></div>
                     <div class = "menu_content">
                         <h4>쿠폰</h4>
                     </div>
                 </div>
             </a>
             <a href = "mypage_liked_goods.html">
                 <div class = "box">
                     <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/heart_w_resize.png" class = "img_icon"/></i></div>
                     <div class = "menu_content">
                         <h4>관심 상품</h4>
                     </div>
                 </div>
             </a>
             <a href = "my_info.html">
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