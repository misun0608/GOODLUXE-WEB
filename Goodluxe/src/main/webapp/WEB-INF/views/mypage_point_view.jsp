<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*" %>
<%@ page import = "com.spring.goodluxe.voes.PointVO" %>
<%@ page import = "com.spring.goodluxe.voes.MemberVO" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DecimalFormat"%>

    
<%
	MemberVO mvo = (MemberVO)request.getAttribute("memberVO");
	//포인트 내역 리스트
	ArrayList<PointVO> point_list = (ArrayList<PointVO>)request.getAttribute("pointList");
	String member_id = (String)request.getAttribute("member_id");
	int count = (int)request.getAttribute("count");
	int currentPage = (int)request.getAttribute("currentPage");
	int number = (int)request.getAttribute("number");
	int pageSize = (int)request.getAttribute("pageSize");
	
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	
	int used_point = 0;
	int minus_point = 0;
	int accumulated_point = 0;
	
	for(int i=0; i<point_list.size(); i++){
		PointVO pvo = (PointVO)point_list.get(i);
		if(pvo.getPoint_status().equals("상품구매 사용")){
			used_point += pvo.getPoint_amount();
		}else if(pvo.getPoint_status().equals("관리자 회수")){
			minus_point += pvo.getPoint_amount();
		}else{
			accumulated_point += pvo.getPoint_amount();
		}
	}
	
	// 컴마
	DecimalFormat df3 = new DecimalFormat("###,###");
	
	String total_form = df3.format(mvo.getMember_point());
	String used_point_form = df3.format(used_point);
	String minus_point_form = df3.format(minus_point);
	String accumulated_point_form = df3.format(accumulated_point);
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/point_view.css" />
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
		$('.menu_container').children('a').eq(4).children().children('.icon').addClass('selected_menu');
	});
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
            <article class = "arti_menu" id="mypage_menu"></article>
            <article id = "recent_point">
                <div class = "recent_point_box">
                    <div> <h3 class = "recent_point_title">나의 적립금 현황</h3></div>
                    <div class = "recent_point_one">
                        <div class = "recent_point_half">
                            <div class = "point_detail_title">
                            	<p class = "point_detail_letter">사용가능 적립금</p>
                            </div>
                            
                            <br/>
                            <!-- <p class = "recent_point_p">P</p> -->
                            <div class = "point_detail">
	                            <h1><%=total_form %><span class="span_black">P</span></h1>
                            </div>
                        </div>
                        <div class = "recent_point_half">
                            <div class = "point_chart_center">
                                <ul class = "point_chart">
                                    <li class = "point_chart_li1"> &nbsp;&nbsp;누적 적립금  &nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;   <%=accumulated_point_form %> P</li>
                                    <li class = "point_chart_li1"> &nbsp;&nbsp;사용 적립금  &nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;   -&nbsp;<%=used_point_form %> P</li>
                                    <li class = "point_chart_li1"> &nbsp;&nbsp;차감 적립금  &nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;   -&nbsp;<%=minus_point_form %> P</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
            <article id = "history_table">
                <div class = "history_point_box">
                    <div>
                        <h3 class = "history_point_title">적립금 적립 및 사용내역</h3>
                    </div>
                    <p class = "only_mobile">(자세한 내용은 pc에서 확인하세요)</p>
                    <table class = "content_table">
                        <thead>
                            <tr>
                                <th>번호</th><th class="hidecol">주문번호</th><th>등록일</th><th class = "hidecol">적립금 내용</th><th>적립금</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        if(point_list == null||point_list.size()==0){
                        %>
                        	<tr>
                        		<td colspan="5">조회 가능한 적립금 내역이 없습니다.</td>
                        	</tr>
                        <%
                        }else{
							for(int i=0; i<point_list.size(); i++){
								PointVO pvo = (PointVO)point_list.get(i);
                        %>
                            <tr>
                                <td class="hidecol"><%=pvo.getPoint_number() %></td>
                                <td><%=pvo.getOrder_number() %></td>
                                <td class="hidecol"><%=format1.format(pvo.getPoint_date()) %></td>
                                <td><%=pvo.getPoint_status() %></td>
                                <td>
                                <%
                                if(pvo.getPoint_status().equals("상품구매 사용")||pvo.getPoint_status().equals("관리자 회수")){
                                %>
                                -
                                <%=pvo.getPoint_amount() %>
                                <%
                                }else{
                                %>
                                +
                                <%=pvo.getPoint_amount() %>
                                <%
                                }
                                %>
                                
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
                        
                        if(currentPage%5!=0)
                              startPage = (int)(currentPage/5)*5+1;
                        else
                           startPage = currentPage-4;
                        int pageBlock = 5;
                  %>
                                <li><a href="get_point_view.do?pageNum=1&pageCount=<%=pageCount%>&member_id=<%=member_id %>" class="page_fisrt">처음 페이지</a></li>
                                <li><a href="get_point_view.do?pageNum=<%=startPage-5%>&pageCount=<%=pageCount%>&member_id=<%=member_id %>" class="arrow left">&lt;&lt;</a></li>
                     <%    
                        for(i=startPage; (i<=startPage+4)&&(i<=pageCount); i++){
                     %>
                                <li><a href="get_point_view.do?pageNum=<%=i%>&pageCount=<%=pageCount%>&member_id=<%=member_id %>"
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
                                <li><a href="get_point_view.do?pageNum=<%=startPage+5%>&pageCount=<%=pageCount%>&member_id=<%=member_id %>" class="arrow right">&gt;&gt;</a></li>
                                <li><a href="get_point_view.do?pageNum=<%=pageCount%>&pageCount=<%=pageCount%>&member_id=<%=member_id %>" class="page_last">끝 페이지</a></li>
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