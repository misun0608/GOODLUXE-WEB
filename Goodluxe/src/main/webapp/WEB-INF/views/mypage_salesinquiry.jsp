<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.spring.goodluxe.voes.ApplyVO" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	ArrayList<ApplyVO> apply_list = (ArrayList<ApplyVO>)request.getAttribute("applyList");
	ArrayList<HashMap<String,Object>> selling_list = (ArrayList<HashMap<String,Object>>)request.getAttribute("sellingList");
	ArrayList<HashMap<String,Object>> trading_list = (ArrayList<HashMap<String,Object>>)request.getAttribute("tradingList");
	ArrayList<HashMap<String,Object>> finish_list = (ArrayList<HashMap<String,Object>>)request.getAttribute("finishList");
	ArrayList<HashMap<String,Object>> purchasing_list = (ArrayList<HashMap<String,Object>>)request.getAttribute("purchasingList");
	
	// 날짜
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	String apply_date = null;
	String purchasing_date = null;
	
	// 컴마
	DecimalFormat df3 = new DecimalFormat("###,###");
	String hope_price = null;
	String selling_price = null;
	String selling_price2 = null;
	String selling_price3 = null;
	String buying_price = null;
%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="content-type" content="text/html;charset=utf-8" />
   <meta name="viewport" content="user-scalable=no,width=device-width, initial-scale=1.0" />
   
   <title>GOODLUXE :: 굿럭스</title>
   
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css" />
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
   <script>
      $(document).ready(function(){
         $("#header").load("header.do");
         $("#nav_bar").load("navBar.do");
         $("#login_box").load("loginBox.do");
         $("#footer").load("footer.do");
      });
   </script>
   
   <!-- mypage_apply2 / 마이페이지 > 판매신청 -->
   <script>
      $(document).ready(function(){
         $("#mypage_menu").load("mypageMenu.do", function(){
            $('.menu_container').children('a').eq(2).children().children('.icon').addClass('selected_menu');
         });
      });
   </script>
   

   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage_onlymenu.css" />
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage_salesinquiry.css" />
<%--    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage_salesinquiry.js"></script>
 --%>
   <script>
   $(document).ready(function () {
	  $('ul.inquiry_tabs li').click(function () {

	    var tab_id = $(this).attr('data-tab');
	    console.log(tab_id);

	    $('ul.inquiry_tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	    // 탭추가
	    $('a').removeClass('current');

	    $(this).addClass('current');
	    $("#" + tab_id).addClass('current');
	    // 탭추가

	  });

	  $('.com_step').click(function () {
	    var tab = $(this).attr('data-tab');
	    $('.com_step').removeClass('show');
	    $('.tab').removeClass('show');
	    $(this).addClass('show');
	    $("#" + tab).addClass('show');
	  });

	  $('.inquiry_tabs>li>a').on('click',function(){
	    $('.inquiry_tabs>li>a').removeClass('on');
	    $(this).addClass('on');
	  })
	});

   </script>

</head>
<body class="">
    <header id="header"></header>
    <nav id="nav_bar"></nav>
    <div class="login_bg" id="login_box"></div>
	
	<section id="container">
        <br>
        <div id="main">
            <article class="arti_menu" id="mypage_menu"></article>
    	
    	<!-- 판매조회_위탁판매(등록전) -->
            <center>
                <article>
                    <div id="inquiry_container">
                        <!--판매조회_위탁판매-->
                        <ul class="inquiry_tabs">
                            <li class="tab-link current" data-tab="tab-1">
                            	<a href="#" class="anchor current" name="#tab-1">위탁 상품</a></li>
                            <li class="tab-link" data-tab="tab-2">
                            	<a href="#" class="anchor" name="#tab-2">매입</a>
                            </li>
                        </ul>
                        <hr id="tab-line" class="tab-line">
                    </div>
                    <div id="tab-1" class="tab-content current">
                        <div class="steppart">
                            <div class="com_step show" data-tab="tab1" id="before">
                                <a href="#" name="#tab1">
                                    등록전<br>
                                    <% if(apply_list == null) { %> 0 <% } else { %>
                                    <%=apply_list.size() %>
                                    <% } %>
                                </a>
                            </div>
                            <div class="com_step next">
                                &gt;
                            </div>
                            <div class="com_step" data-tab="tab2" id="selling">
                                <a href="#" name="#tab2">
                                    판매중<br>
                                    <% if(selling_list == null) { %> 0 <% } else { %>
                                    <%=selling_list.size() %>
                                    <% } %>
                                </a>
                            </div>
                            <div class="com_step next">
                                &gt;
                            </div>
                            <div class="com_step" data-tab="tab3" id="trading">
                                <a href="#" name="#tab3">
                                    거래진행중<br>
                                    <% if(trading_list == null) { %> 0 <% } else { %>
                                    <%=trading_list.size() %>
                                    <% } %>
                                </a>
                            </div>
                            <div class="com_step next">
                                &gt;
                            </div>
                            <div class="com_step" data-tab="tab4" id="done">
                                <a href="#" name="#tab4">
                                    판매완료<br>
                                    <% if(finish_list == null) { %> 0 <% } else { %>
                                    <%=finish_list.size() %>
                                    <% } %>
                                </a>
                            </div>
                        </div>

                        <div class="com_content bf show tab" id="tab1">
                            <!--등록전 테이블-->
                            <table class="salelist table1">
                                <thead>
                                    <tr class="inquiry_top_tr">
                                        <td>번호</td>
                                        <td>신청일</td>
                                        <td>브랜드</td>
                                        <td>상품명</td>
                                        <td>구매년도</td>
                                        <td>희망가격</td>
                                        <td>상태</td>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                	if(apply_list == null||apply_list.size()==0){
                                %>
                                    <tr class="inquiry_middle_tr">
                                		<td colspan="7">
                                			조회가능한 데이터가 존재하지 않습니다.
                                		</td>
                                	</tr>
                                <%
                                	}else{
                                		for(int i=0; i<apply_list.size(); i++){
                                			ApplyVO avo = (ApplyVO)apply_list.get(i);
                                %>
                                    <tr class="inquiry_middle_tr">
                                        <td data-title="번호"><%=apply_list.size()-i %></td>
                                        <td data-title="신청일">
                                        <%
                                        	apply_date = format1.format(avo.getAp_apply_date());
                                        %>
                                        <%=apply_date %>
                                        </td>
                                        <td data-title="브랜드"><%=avo.getAp_selected_brand() %></td>
                                        <td data-title="상품명"><%=avo.getAp_md_name() %></td>
                                        <td data-title="구매년도"><%=avo.getAp_buy_year() %>년</td>
                                        <td data-title="희망가격">
                                        <%
                                        	hope_price = df3.format(avo.getAp_hope_price()) + "원";
                                        %>
                                        <%=hope_price %>
                                        </td>
                                        <td data-title="상태"><%=avo.getAp_decision() %></td>
                                    </tr>
                                 	<%
                                		}
                                	}
                                 	%>
                                </tbody>
                            </table>
                        </div>

                        <!--판매중-->
                        <div class="com_content ing1 tab" data-tab="tab2" id="tab2">
                            <!--판매전 테이블-->
                            <table class="salelist inquiry_salelist">
                                <thead>
                                    <tr class="inquiry_top_tr">
                                        <td>번호</td>
                                        <td>등록일</td>
                                        <td>브랜드</td>
                                        <td>상품명</td>
                                        <td>판매가격</td>
                                        <td>등급</td>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                if(selling_list == null||selling_list.size()==0){
                                %>
                                    <tr class="inquiry_middle_tr">
                                    	<td colspan="6">
                                    		조회가능한 데이터가 존재하지 않습니다.
                                    	</td>
                                    </tr>
                                    <%
                                    }else{
                                    	for(int i=0; i<selling_list.size(); i++){
                                    		HashMap<String,Object> map = (HashMap<String,Object>)selling_list.get(i);
                                    	%>
                                    <tr class="inquiry_middle_tr">
                                    	<td data-title="번호"><%=selling_list.size()-i %></td>
                                        <td data-title="등록일">
                                        <%
	                                    	java.sql.Timestamp ts = Timestamp.valueOf(map.get("pb_date").toString());
	                                    	java.sql.Date regDate = new Date(ts.getTime());
                                        %>
                                        	<%=regDate %>
                                        </td>
                                        <td data-title="브랜드">
                                        	<%=map.get("pd_brand") %>
                                        </td>
                                        <td data-title="상품명">
                                        	<%=map.get("pb_md_name") %>
                                        </td>
                                        <td data-title="판매가격">
                                        	<%
                                        		selling_price = df3.format(map.get("sale_price"))+"원";
                                        	%>
                                        	<%=selling_price %>
                                        </td>
                                        <td data-title="등급">
                                        	<%=map.get("quality_grade") %>
                                        </td>
                                    </tr>
                                    <%
                                    	}
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>

                        <!--거래진행중-->
                        <div class="com_content ing2 tab" data-tab="tab3" id="tab3">
                            <table class="salelist table3">
                                <thead>
                                    <tr class="inquiry_top_tr">
                                        <td>번호</td>
                                        <td>주문일</td>
                                        <td>결제일</td>
                                        <td>상품명</td>
                                        <td>판매가격</td>
                                        <td>거래진행상태</td>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                if(trading_list == null||trading_list.size()==0){
                                %>
                                    <tr class="inquiry_middle_tr">
                                    	<td colspan="6">
                                    	조회가능한 데이터가 존재하지 않습니다.
                                    	</td>
                                    </tr>
                                <%
                                }else{
                                	for(int i=0; i<trading_list.size(); i++){
                                		HashMap<String,Object> tmap = (HashMap<String,Object>)trading_list.get(i);
                                %>
                                	<tr class="inquiry_middle_tr">
                                		<td data-title="번호"><%=trading_list.size()-i %></td>
                                        <td data-title="주문일">
                                        <%
	                                    	java.sql.Timestamp ts = Timestamp.valueOf(tmap.get("order_order_date").toString());
	                                    	java.sql.Date regDate = new Date(ts.getTime());
                                        %>
                                        	<%=regDate %>
                                        </td>
                                        <td data-title="결제일">
                                        	<%
                                        	if(tmap.get("order_pay_date") == null){
                                        	%>
                                        	-
                                        	<%
                                        	}else{
    	                                    	java.sql.Timestamp ts3 = Timestamp.valueOf(tmap.get("order_pay_date").toString());
    	                                    	java.sql.Date regDate3 = new Date(ts3.getTime());
                                        	%>
                                        	<%=regDate3 %>
                                        	<%
                                        	}
                                        	%>
                                        </td>
                                        <td data-title="상품명">
                                        	<%=tmap.get("pb_md_name") %>
                                        </td>
                                        <td data-title="판매가격">
                                           <%
                                        		selling_price2 = df3.format((tmap.get("order_product_price"))) + "원";
                                        	%>
                                        	<%=selling_price2 %>
                                        </td>
                                        <td data-title="거래진행상태">
											<%=tmap.get("order_status") %>
										</td>
                                    </tr>
                                    <%
                                	}
                                }
                                    %>
                                </tbody>
                            </table>
                        </div>

                        <!--판매완료-->
                        <div class="com_content end tab" data-tab="tab4" id="tab4">
                            <table class="salelist table4">
                                <thead>
                                    <tr class="inquiry_top_tr">
                                        <td>번호</td>
                                        <td>주문일</td>
                                        <td>결제일</td>
                                        <td>상품명</td>
                                        <td>판매가격</td>
                                        <td>송금상태</td>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                if(finish_list == null||finish_list.size()==0){
                                %>
                                <tr class="inquiry_middle_tr">
                                	<td colspan="6">
                                		조회가능한 데이터가 존재하지 않습니다.
                                	</td>
                                </tr>
                                <%
                                }else{
                                	for(int i=0; i<finish_list.size(); i++){
                                		HashMap<String,Object> fmap = (HashMap<String,Object>)finish_list.get(i);
                                %>
                                    <tr class="inquiry_middle_tr">
                                    	<td data-title="번호"><%=finish_list.size()-i %></td>
                                        <td data-title="주문일">
                                        <%
	                                    	java.sql.Timestamp ts2 = Timestamp.valueOf(fmap.get("order_order_date").toString());
	                                    	java.sql.Date regDate2 = new Date(ts2.getTime());
                                        %>
                                        	<%=regDate2 %>
                                        </td>
                                        <td data-title="결제일">
                                        	<%
                                        	if(fmap.get("order_pay_date") == null){
                                        	%>
                                        	-
                                        	<%
                                        	}else{
    	                                    	java.sql.Timestamp ts3 = Timestamp.valueOf(fmap.get("order_pay_date").toString());
    	                                    	java.sql.Date regDate3 = new Date(ts3.getTime());
                                        	%>
                                        	<%=regDate3 %>
                                        	<%
                                        	}
                                        	%>
                                        </td>
                                        <td data-title="상품명">
                                        <%=fmap.get("pb_md_name") %>
                                        </td>
                                        <td data-title="판매가격">
                                        <%
                                        	selling_price3 = df3.format((fmap.get("order_product_price"))) + "원";
                                        %>
                                        	<%=selling_price3 %>
                                        </td>
                                        <td data-title="송금상태">완료</td>
                                    </tr>
                                    <%
                                	}
                                }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div id="tab-2" class="tab-content">
                        <table class="salelist">
                            <thead>
                                <tr class="inquiry_top_tr">
                                    <td>번호</td>
                                    <td>판매일자</td>
                                    <td>상품명</td>
                                    <td>등급</td>
                                    <td>판매가격</td>
                                    <td>주문처리상태</td>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                            if(purchasing_list == null||purchasing_list.size()==0){
                            %>
                                <tr class="inquiry_middle_tr">
                                    <td colspan="6">
                                    조회가능한 데이터가 존재하지 않습니다.
                                    </td>

                                </tr>
                             <%
                            }else{
                            	for(int i=0; i<purchasing_list.size(); i++){
                            		HashMap<String,Object> pmap = (HashMap<String,Object>)purchasing_list.get(i);
                             %>
                                <tr class="inquiry_middle_tr">
                                	<td data-title="번호"><%=purchasing_list.size()-i %></td>
                                    <td data-title="판매일자">
                                    <% 
                                    purchasing_date = format1.format(pmap.get("purc_date"));
                                    %>
                                    	<%=purchasing_date %>
                                    </td>
                                    <td data-title="상품명">
                                    	<%=pmap.get("ap_md_name") %>
                                    </td>
                                    <td data-title="등급">
                                    <%
                                    String quality_grade = null;
                                    if(pmap.get("quality_grade")==null){
                                    	quality_grade = "-";
                                    	buying_price = "-";
                                    }else{
                                    	quality_grade = (String)pmap.get("quality_grade");
                                    	buying_price = df3.format(pmap.get("ap_hope_price")) + "원";
                                    }
                                    %>
                                    	<%=quality_grade %>
                                    </td>
                                    <td data-title="판매가격">
                                    	<%=buying_price %>
                                    </td>
                                    <td data-title="주문처리상태">
                                    <%
                                    String status = (String)pmap.get("ap_decision");
                                    if(status==null){
                                    	status = "판매완료";
                                    }
                                    %>
                                    <%=status %>
                                    </td>
                                </tr>
                              <%
                            	}
                            }
                              %>
                            </tbody>
                        </table>
                    </div>

                </article>
        </div>
    </section>
    
    <footer id="footer"></footer>
    
</body>
</html>