<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.spring.goodluxe.voes.MemberVO" %>
<%@ page import="com.spring.goodluxe.voes.OrderVO" %>
<%@ page import="com.spring.goodluxe.voes.ProductBoardVO" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DecimalFormat" %>

    
<%
	ArrayList<HashMap<String, Object>> orderList = (ArrayList<HashMap<String, Object>>)request.getAttribute("order_list");
	
	MemberVO mvo = (MemberVO)request.getAttribute("memberVO");
	
	// 주문일
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	String order_date = null;
	
	// 구매상태
	String buying_status = null;
	
	// 허수구매율
	float restrict_rate=0;
	int cancel_num = 0;
	String restrict_status = null;
	
	for(int i=0; i<orderList.size(); i++){
		HashMap<String,Object> ovo = (HashMap<String,Object>)orderList.get(i);
			if(ovo.get("order_status").equals("취소완료")||ovo.get("order_status").equals("환불신청")||
					ovo.get("order_status").equals("반품확인")||ovo.get("order_status").equals("환불완료")){
				cancel_num += 1;
			}
			if(i == orderList.size()-1){
                restrict_rate =((float)(cancel_num/10.0))*100;
			}
	}
	
	// 컴마
	DecimalFormat df3 = new DecimalFormat("###,###");
	String md_price = null;
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/restriction.css" />

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
		$('.menu_container').children('a').eq(3).children().children('.icon').addClass('selected_menu');
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
            <article class="arti_menu" id="mypage_menu"></article>
            
			<article class ="arti_restriction">
                <div class ="my_rate_box"> 
                    <p><%=mvo.getMember_name() %> 님의 최근 허수구매율은&nbsp;</p>
                    <p class="yellow_letter"><%=restrict_rate %>%</p><p>&nbsp;로&nbsp;</p>
                    <p class="red_letter">
                    <%
                    	if(restrict_rate >= 60){
                    		restrict_status = "구매불가";
                    	}else{
                    		restrict_status = "구매가능";
                    	}
                    %>
                    <%=restrict_status %>
                    </p><p>합니다.</p>
                    <p class="left_fin mobile_size">정상구매는 결제전, 배송준비중, 배송중, 배송완료건으로써 허수구매율이 하향조정 됩니다.</p>
                    <p class="mobile_size">정상 구매율이 높으면 향후 우수 구매자 제도 도입시 많은 혜택이 있습니다. </p>
                </div>
                <div class="rate_explain_box">
                    <ul>
                        <div class="explain_par">
                            <li>허수구매 근절을 통하여 모든 고객분들께 더 많은 쇼핑 기회를 제공하고자 다음과 같은 구매제한제도를 실시합니다.</li>
                            <li>
                                <p>허수구매 : &nbsp;</p>자동취소, 환불신청, 반품확인, 환불완료 상태의 주문건.<br/>
                                <ul>
                                    <li>미입금으로 자동 취소 되기 전 고객의 주문취소 또는 고객센터, 매장, 게시판, 이메일로 취소의사를 밝힌 경우 허수구매율 제외</li>
                                    <li>허수구매율 : 최근 주문건 10건 대비 허수구매 건수 비율</li>
                                </ul>
                            </li>
                        </div>
                        <div class="explain_par">
                            <li>
                                <p>구매제한제도 : &nbsp;</p>허수구매율 60%이상이면 아래 상품들은 구매가 불가능 합니다.<br/>
                                <ul>
                                    <li>업데이트 미리보기 상품 및 최근 업데이트 후 3일 이내의 상품</li>
                                    <li>가격 조정 후 3일 이내의 상품 </li>
                                    <li>원활한 상품 회전을 위하여 배송건에 대한 반품율이 과도할 시에는 거래정지나 회원탈퇴 등의 조취를 취합니다.</li>
                                </ul>
                            </li>
                        </div>
                    </ul>
                </div>
                    <div class ="rate_histoty">
                        <div class ="rate_history_title">
                            <h3>구매내역</h3><p>(최근 구매 10건을 기준으로 출력됩니다.)</p>
                        </div>
                        <div class="history_table_div">
                            <table class="history_table">
                                <thead >
                                    <tr class="mobile_hidden">
                                        <th>번호</th><th>상품명</th><th>주문일</th><th>상품 가격</th><th>구매여부</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                	if(orderList == null||orderList.size()==0){
                                %>
                                	<tr>
                                		<td colspan="6">
                                			구매내역이 존재하지 않습니다.
                                		</td>
                                	</tr>
                                <%
                                	}else{
                                		for(int i=0; i<orderList.size(); i++){
                                			HashMap<String,Object> ovo = (HashMap<String,Object>)orderList.get(i);
                                %>
                                    <tr>
                                        <td data-title="NO."><%=orderList.size()-i %></td> 
                                        <td data-title="상품명">
                                        <%=ovo.get("pb_md_name") %>
                                        </td> 
                                        <td data-title="주문일">
                                        <%
                                        	java.sql.Timestamp ts = Timestamp.valueOf(ovo.get("order_order_date").toString());
                                        	java.sql.Date regDate = new Date(ts.getTime());
                                        %>
                                        <%=regDate %>
                                        </td>
                                        <td data-title = "상품 가격">
                                        <%
                                        	md_price = df3.format(ovo.get("order_product_price")) + "원";
                                        %>
	                                        <%=md_price %>
                                        </td> 
                                        <td data-title="구매여부">
                                        	<%
                                        	// 취소완료 환불신청 반품확인 환불완료 인경우 X
                                        		if(ovo.get("order_status").equals("취소완료")||ovo.get("order_status").equals("환불신청")||
                                        				ovo.get("order_status").equals("반품확인")||ovo.get("order_status").equals("환불완료")){
                                        			buying_status = "X";
                                        		}else{
                                        			buying_status = "O";
                                        		}
                                        	%>
                                        	<%=buying_status %>
                                        </td> 
                                    </tr>
                                <%
                                	}
                                	}
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div>
                        <table class="how_to_table">
                            <tbody>
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/resources/img/icons/sad_face.png" class ="how_to_img"></td>
                                    <td> 
                                        <p>허수 구매율을 높히지 않으려면?</p>
                                        <ul>
                                            <li>GOODLUXE에는 매력있는 상품이 많습니다. 그러니 구입 의사가 있는 상품만 신중하게 구입해주세요.</li>
                                            <li>무통장 주문 하였으나 변심으로 구매의사가 없을 경우 자동 취소가 되기 전 미리 취소요청을 해주세요.</li>
                                        </ul>
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2"> GOODLUXE는 모든 고객에게 동등한 구매 기회를 보장하기 위하여 허수구매제한 정책을 시행하고 있습니다.</td>
                                </tr>
                            </tfoot>
                            
                        </table>
                        <br/><br/><br/><br/>
                    </div>
            </article>
        </div>
    </section>
    
	<footer id="footer">
	</footer>

</body>
</html>