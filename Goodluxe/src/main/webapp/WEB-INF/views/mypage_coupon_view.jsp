<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import = "com.spring.goodluxe.voes.MemberVO" %>
<%@ page import = "com.spring.goodluxe.voes.CouponVO" %>
<%@ page import="java.text.SimpleDateFormat"%>

    
<%
	MemberVO mvo = (MemberVO)request.getAttribute("memberVO");
	//포인트 내역 리스트
	ArrayList<CouponVO> coupon_list = (ArrayList<CouponVO>)request.getAttribute("couponList");
	String member_id = (String)request.getAttribute("member_id");
	int count = (int)request.getAttribute("count");
	int currentPage = (int)request.getAttribute("currentPage");
	int number = (int)request.getAttribute("number");
	int pageSize = (int)request.getAttribute("pageSize");
	
	// 시간 더하기 위해서
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String expire_date = null;
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <!--
        viewport meta 태그
        * user-scalable=no : 화면확대, 축소 불가능
        * width=device-width : 화면 너비=장치 너비
        * initial-scale=1.0 : 초기 확대 비율
    -->
    <meta name="viewport" content="user-scalable=no,width=device-width, initial-scale=1.0" />
    <title>GOODLUXE :: 굿럭스</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet">
  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage_onlymenu.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/coupon_view.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pagination.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/goodluxe-header.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/goodluxe-footer.js"></script>

<script>
$(document).ready(function() {
	// 헤더푸더 등등
	$("#header").load("header.do");
	$("#nav_bar").load("navBar.do");
	$("#login_box").load("loginBox.do");
	$("#footer").load("footer.do");
	$("#mypage_menu").load("mypageMenu.do", function(){
		$('.menu_container').children('a').eq(5).children().children('.icon').addClass('selected_menu');
	});
       $('html, body').animate({
           scrollTop: $('#menu_div').offset().top
       }, 'fast'); //slow
});
</script>
</head>
<body class="">
	<header id="header"></header>
    <nav id="nav_bar"></nav>
    <div class="login_bg" id="login_box"></div>
    
    <!-- <section style="height: 800px;"> -->
    <section id="container">
        <br>
        <div id="main">
            <article class="arti_menu" id="mypage_menu"></article>
            
            <!-- 페이징 -->
			<article id = "arti_coupon">
                <div id="table_div" class="table_div">
                    <table class = "coupon_table">
        
                        <thead>
                            <tr>
                                <th>번호</th><th>쿠폰명</th><th>쿠폰혜택</th><th>사용가능 기간</th><th>사용여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <%
                            if(coupon_list == null||coupon_list.size()==0){
                            %>
                            <tr>
                            	<td colspan="5" style="text-align:center; height:200px;" >조회 가능한 쿠폰 내역이 없습니다.</td>
                            </tr>
                            <%
                            }else{
                            	for(int i=0; i<coupon_list.size(); i++){
                            		CouponVO cvo = (CouponVO)coupon_list.get(i);
                            %>
                            <tr>
                                <td data-title="NO."><%=cvo.getCoupon_number() %></td>
                                <td data-title="쿠폰명"><%=cvo.getCoupon_type() %></td>
                                <td data-title="혜택">
                                <%
                                	if(cvo.getCoupon_type().equals("가입 무료배송 쿠폰")){
                                %>
                                무료배송
                                <%
                                	}else if(cvo.getCoupon_type().equals("2020 쥐띠해 기념 1품목 20% 할인 쿠폰")){
                                %>
                                500만원 이상 구매시 최대 200만원 할인
                                <%
                                	}else if(cvo.getCoupon_type().equals("명절맞이 5%할인")){
                                %>
                                100만원 이상 구매시 최대 20만원 할인
                                <%
                                	}else{
                                %>
                                없음
                                <%
                                	}
                                %>
                                </td>
                                <td data-title="사용기간">
                                <%
                                	cal.setTime(cvo.getCoupon_expire());
                                	cal.add(Calendar.DATE, +14);
                                	expire_date = format1.format(cal.getTime());
                                %>
                                <%=format1.format(cvo.getCoupon_expire()) %>
                                ~
                                <%=expire_date %>
                                </td>
                                <td data-title="사용여부">
                                	<%=cvo.getCoupon_status() %>
                                </td>
                            </tr>
                        <%
                            	}
                            }
                        %>
                        
                        </tbody>
        
                    </table>
                    <article class="3rd_arti">
                 <center>
                        <div class="liked_goods_page">
                            <ul class="pagination modal">
                  <%   
                     if(count>0){
                        int pageCount = ((count-1)/pageSize)+1;
                        int startPage = 1;
                        int i;
                        
                        if(currentPage%10!=0)
                              startPage = (int)(currentPage/5)*5+1;
                        else
                           startPage = currentPage-4;
                        int pageBlock = 5;
                  %>
                                <li><a href="get_coupon_view.do?pageNum=1&pageCount=<%=pageCount%>&member_id=<%=member_id %>" class="page_fisrt">처음 페이지</a></li>
                                <li><a href="get_coupon_view.do?pageNum=<%=startPage-5%>&pageCount=<%=pageCount%>&member_id=<%=member_id %>" class="arrow left">&lt;&lt;</a></li>
                     <%    
                        for(i=startPage; (i<=startPage+4)&&(i<=pageCount); i++){
                     %>
                                <li><a href="get_coupon_view.do?pageNum=<%=i%>&pageCount=<%=pageCount%>&member_id=<%=member_id %>"
                                   <%
                                   if(i==currentPage){
                                   %> 
                                         class = "active num"
                                   <%
                                   }else{
                                   %>
                                         class="num"
                                   <%
                                   }
                                   %> ><%= i%></a></li>
                        <%
                           }
                        %>  
                                <li><a href="get_coupon_view.do?pageNum=<%=startPage+5%>&pageCount=<%=pageCount%>&member_id=<%=member_id %>" class="arrow right">&gt;&gt;</a></li>
                                <li><a href="get_coupon_view.do?pageNum=<%=pageCount%>&pageCount=<%=pageCount%>&member_id=<%=member_id %>" class="page_last">끝 페이지</a></li>
                  <%
                     }
                  %>
                            </ul>
                        </div>
                     </center>
            </article>
                
                </div>
                
            </article>
        </div>
    </section>
    
	<footer id="footer">
	</footer>

</body>
</html>