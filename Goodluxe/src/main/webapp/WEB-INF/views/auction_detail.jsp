<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.util.*"%>
<%@page import="com.spring.goodluxe.jj.*"%>
<%@page import="com.spring.goodluxe.voes.AuctionVO"%>
<%@page import="com.spring.goodluxe.voes.Auction_HistoryVO"%>
<%@page import="com.spring.goodluxe.voes.Purchase2VO"%>
<%@page import="org.springframework.util.*"%>
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
<meta name="viewport"
	content="user-scalable=no,width=device-width, initial-scale=1.0" />
<title>기본 페이지</title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="./resources/css/goodluxe-header.css" />
<link rel="stylesheet" href="./resources/css/login.css" />
<link rel="stylesheet" href="./resources/css/goodluxe-footer.css" />
<link rel="stylesheet" href="./resources/css/md_auction_detail.css">
<script type="text/javascript" src="./resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="./resources/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="./resources/js/goodluxe-header.js"></script>
<script type="text/javascript" src="./resources/js/login.js"></script>
<script type="text/javascript" src="./resources/js/md_detail.js"></script>
<script type="text/javascript" src="./resources/js/goodluxe-footer.js"></script>
<script type="text/javascript" src="./resources/js/auction_detail.js"></script>

	
<script type="text/javascript">



			$('.detail_main_image_left>a>img').on({ 

			"click" : function(){ //->썸네일이미지를 클릭했을때 

			var imgSrc = $(this).attr('src'); //->변수 imgSrc 에 클릭한 이미지의 속성 src의 값을 담은 후 

			$('.detail_main_image_right>img').attr('src',imgSrc); //->큰이미지에 속성 src를 imgSrc로 변경합니다.
			alert('${pageContext.request.contextPath}');
			
			}
			});
		</script>
<script>
		$(document).ready(function(){
			$("#header").load("header.do");
			$("#nav_bar").load("navBar.do");
			$("#login_box").load("loginBox.do");
			$("#footer").load("footer.do");
		});
	</script>

</head>

<%
request.setCharacterEncoding("UTF-8");
if (session.getAttribute("member_id") == null) {
	out.println("<script>");
	out.println("location.href='loginForm.do'");
	out.println("</script>");
}

String member_id = (String) session.getAttribute("member_id");

	AuctionVO auctionvo = (AuctionVO) request.getAttribute("auctionvo");
	int historynumber = ((Integer) request.getAttribute("auctionnumber")).intValue();
	Purchase2VO purchasevo = (Purchase2VO) request.getAttribute("purchasevo");
	int ordercount = (int) request.getAttribute("ordercount"); 
	
	/* 		Auction_HistoryVO historyvo= (Auction_HistoryVO)request.getAttribute("historyvo"); */
	String path = "/Goodluxe/image/";
%>




<body id="body_press" oncontextmenu="return false">

	  <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

	<section id="container">
	<script>
	function checkz() {
	
		 var obj = document.getElementById("unit");  
			
		   var number = Number(obj.value);
		if(number <= <%=auctionvo.getAUCTION_NOW_PRICE()%>){
			   alert("입찰값이 현재가격과 같거나 적습니다. ");
			   return false;
		   }
		
		return true;
	}
	</script>
		<form action="./history.do" name="auction_detail" method="GET" onsubmit="checkz()" >


			<br>


			<div id="main">
				<div class="cover">
					<div id="photoarea">
						<div class="detail_main_image_right" >

							<a class="detail_main_image_link_right"> <img
								src="<%=path%><%=auctionvo.getAUCTION_PHOTO1_STORED()%>"
								alt="가방" name="AUCTION_PHOTO1_STORED" class="main_image">
							</a>

						</div>
						<div class="thumbnail_images">
							<div class="detail_main_image_area1 detail_main_image_left">
								<a class="main_image_link1"> <img
									src="<%=path%><%=auctionvo.getAUCTION_PHOTO1_STORED()%>"
									alt="가방" name="AUCTION_PHOTO1_STORED" class="thumbnail_image"
									style="width:122px; height:120px;">
								</a>
							</div>
							<div class="detail_main_image_area2 detail_main_image_left">
								<a class="main_image_link2"> <img
									src="<%=path%><%=auctionvo.getAUCTION_PHOTO2_STORED()%>"
									name="AUCTION_PHOTO2_STORED" alt="가방" class="thumbnail_image"
									style="width:122px; height:120px">
								</a>
							</div>
							<div class="detail_main_image_area3 detail_main_image_left">
								<a class="main_image_link3"> <img
									src="<%=path%><%=auctionvo.getAUCTION_PHOTO3_STORED()%>"
									alt="가방" name="AUCTION_PHOTO3_STORED" class="thumbnail_image"
									style="width:122px; height:120px">
								</a>
							</div>
							<div class="detail_main_image_area4 detail_main_image_left">
								<a class="main_image_link4"> <img
									src="<%=path%><%=auctionvo.getAUCTION_PHOTO4_STORED()%>"
									alt="가방" name="AUCTION_PHOTO4_STORED" class="thumbnail_image"
									style="width:122px; height:120px">
								</a>
							</div>
						</div>
					</div>

					<div id="textarea">
						<div class="textarea_align">
							<div class="textarea2 md_auction_detail_brand"><%=purchasevo.getPd_brand() %></div>
							<div class="textarea2 md_detail_name"><%=auctionvo.getAUCTION_MD_NAME()%>
							</div>

							<hr id="name_line">
							<div class="md_detail_table">
								<div class="md_detail_row">
									<span class="md_detail_cell md_detail_title"> 현재 경매가 </span> <span
										id="unit_2" class="md_detail_cell md_auction_detail_price"
										style="font-size: 21px;"> <!-- <span class="md_detail_cell md_detail_price" style="color: rgb(236, 27, 27); font-size: 23px;"> -->

										
									</span>
								</div>
								<div class="md_detail_row">
									<span class="md_detail_cell md_detail_title"> 입찰 건수 </span> <span
										id="historycount" class="md_detail_cell md_detail_d_period"
										onclick="popup()"> 
									</span>
									<script type="text/javascript">
	
									function popup(){
 
									var url = "auctionhistory.do?auction_post_number=<%=auctionvo.getAUCTION_POST_NUMBER()%>";
 
									var name = "history";
 
									window.open(url,name,"width=1000,height=1000,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50");
 
									}
									playAlert_1 = setInterval(function() {
									var params= <%=auctionvo.getAUCTION_POST_NUMBER()%>;
										var url = jQuery(location).attr('href');


									$.ajax({//ajax 호출 JQuery.ajax== 
										url:'/goodluxe/selectauction.do?auction_post_number='+<%=auctionvo.getAUCTION_POST_NUMBER()%>, //수행하고자 하는 url 형식, port번호 다음부터 경로가 일치하도록 작성 (컨트롤러 참조)
										type:'GET', //데이터 보낼 때 방식 사용
										 //서버로 보낼 데이터 타입
										contentType: 'application/x-www-form-urlencoded;charset=utf-8',
										dataType: 'json', //결과 값을 받아올 때 (응답받을 때 ) 서버에서 보내줄 데이터 타입
										success : function(data){	
											
											$("#unit_2").html("");
											 	var str = data;
											 	$('#unit_2').append(str);
										
											
											},
											  error: function (request, status, error){  
											      var msg = "ERROR<br><br>"
											      msg += request.status + "<br>" + request.responseText + "<br>" + error;
											      console.log(msg);                    
											    }
									});
									
									
									
									$.ajax({//ajax 호출 JQuery.ajax== 
										url:'/goodluxe/selecthistory.do?auction_post_number='+<%=auctionvo.getAUCTION_POST_NUMBER()%>, //수행하고자 하는 url 형식, port번호 다음부터 경로가 일치하도록 작성 (컨트롤러 참조)
										type:'GET', //데이터 보낼 때 방식 사용
										 //서버로 보낼 데이터 타입
										contentType: 'application/x-www-form-urlencoded;charset=utf-8',
										dataType: 'json', //결과 값을 받아올 때 (응답받을 때 ) 서버에서 보내줄 데이터 타입
										success : function(data){	
											$("#historycount").html("");
											
											 	var str = data;
											 	$('#historycount').append(str);
										
											
											},
											  error: function (request, status, error){  
											      var msg = "ERROR<br><br>"
											      msg += request.status + "<br>" + request.responseText + "<br>" + error;
											      console.log(msg);                    
											    }
									});
									}, 1000);
									</script>


								</div>
								<div class="md_detail_row">
									<span class="md_detail_cell md_detail_title"> 남은 시간 </span>
									<!-- <span class="md_detail_cell md_detail_grade" style="color: rgb(0, 110, 255);"> -->
									<span id="newcountdown" class="md_detail_cell md_detail_grade"
										style="color: rgb(236, 27, 27);"> </span>
									<!-- <button type="button" class="content">
									 -->
									<!-- </button> -->

									<script>
									
									CountDownTimer('<%=auctionvo.getAUCTION_END_TIME()%>','newcountdown');
									
									
									
									function CountDownTimer(dt, id) {
										var end = new Date(dt);
										var starttime = '<%=auctionvo.getAUCTION_START_TIME() %>';
										var start = new Date(starttime);
										
										var _second = 1000;
										var _minute = _second * 60;
										var _hour = _minute * 60;
										var _day = _hour * 24;
										var timer;
										
										
										function showRemaining() {
											var now = new Date();
											var distance = end - now;
											var startauction = now - start;
											//alert(end);
											//alert(now);
											//alert(distance);
											//alert(starttime);
											//alert(startauction);
											
											if(distance < 0){
												
												//alert('${ordercount}');
												if('${ordercount}' > 0){
													return false;
												}else{
												$(function(){
   												// $('.content').click(function(){
       
   													var params= <%=auctionvo.getAUCTION_POST_NUMBER()%>;
   													var url = jQuery(location).attr('href');


													$.ajax({//ajax 호출 JQuery.ajax== 
														url:'/goodluxe/insertJSON.do?auction_post_number=<%=auctionvo.getAUCTION_POST_NUMBER()%>'+"&link="+url  , //수행하고자 하는 url 형식, port번호 다음부터 경로가 일치하도록 작성 (컨트롤러 참조)
														type:'GET', //데이터 보낼 때 방식 사용
														data: params, //서버로 보낼 데이터 타입
														contentType: 'application/x-www-form-urlencoded;charset=utf-8',
														dataType: 'json', //결과 값을 받아올 때 (응답받을 때 ) 서버에서 보내줄 데이터 타입
														success : function(data){	
															
															},
															  error: function (request, status, error){  
															      var msg = "ERROR<br><br>"
															      msg += request.status + "<br>" + request.responseText + "<br>" + error;
															      console.log(msg);                    
															    }
													});
    });
											//	});
															
											}
											}
											
											
											
											if (distance < 0) {
												alert("경매가 마감되었습니다.")
												clearInterval(timer);
												//document.getElementById("body_press").innerHTML = '<EXPIRED!>';
												document.getElementById("newcountdown").innerHTML="경매가 종료되었습니다.";
												$button_joinus = $('#auction_history_button').attr('disabled', true);
												$button_joinus = $('.auction_plus').attr('disabled', true);
												$button_joinus = $('.auction_minus').attr('disabled', true);
												
												return;
											}
											//alert(startauction);
											if(startauction < 0){
												document.getElementById("newcountdown").innerHTML="경매가 준비중에 있습니다.";
												$button_joinus = $('#auction_history_button').attr('disabled', true);
												$button_joinus = $('.auction_plus').attr('disabled', true);
												$button_joinus = $('.auction_minus').attr('disabled', true);
												return;
												}else{
													$button_joinus = $('#auction_history_button').attr('disabled', false);
													$button_joinus = $('.auction_plus').attr('disabled', false);
													$button_joinus = $('.auction_minus').attr('disabled', false);
													}
											
											var days = Math.floor(distance
													/ _day);
											var hours = Math
													.floor((distance % _day)
															/ _hour);
											var minutes = Math
													.floor((distance % _hour)
															/ _minute);
											var seconds = Math
													.floor((distance % _minute)
															/ _second);

											document.getElementById(id).innerHTML = days
													+ '일 ';
											document.getElementById(id).innerHTML += hours
													+ '시간 ';
											document.getElementById(id).innerHTML += minutes
													+ '분 ';
											document.getElementById(id).innerHTML += seconds
													+ '초';
										}

										timer = setInterval(showRemaining, 1000);
									}
								</script>
								</div>
								<div class="md_detail_row">
									<!-- <span class="md_detail_cell md_detail_title">
                                    배송구분
                                </span>
                                <span class="md_detail_cell md_detail_delivery_domestic">
                                    본 상품은 국내배송만 가능합니다
                                </span> -->
									<hr id="name_line">
								</div>
								<div class="textarea2 btnpart">
									<div style="display: flex; align-items: center">
										<script> 
								$(document)
								function addCount(num){  
									   var obj_2 = document.getElementById("unit_2");
									   var obj = document.getElementById("unit");  
									   var number_2 = Number(obj_2.value);
									   var number = Number(obj.value);
									   
									   if(number+num < <%=auctionvo.getAUCTION_NOW_PRICE()%>){ 
									      alert("더 이상 낮출 수 없습니다"); 
									      
									      return false; 
									  } else if(number+num > <%=auctionvo.getAUCTION_NOW_PRICE()%> *2 ) {
										  alert("현재 경매 참여 가능한 최대가 입니다.");
										  return false;
									  }
									   
									   
									   obj.value = number + num; 
									   }  
								
								</script>
										<%
											int orig_val = (int)auctionvo.getAUCTION_NOW_PRICE();
											int gab = (int)(orig_val * 0.1);
										%>
								
										<a href="#" 
											class="downprice" ><input type="button" value="-" onclick="addCount(-<%=gab %>); return false;"
											class="auction_minus"></a> <input type="text" id="unit"
											style="pointer-events: none;" class="auction_price_text"
											name="AUHIS_BETTING_PRICE"
											value="<%=auctionvo.getAUCTION_NOW_PRICE()%>"> <input
											type="hidden" name="auction_post_number"
											value="<%=auctionvo.getAUCTION_POST_NUMBER()%>"> <input
											type="hidden" name="member_id" value="<%=member_id %>">
										<!-- <input type="hidden" name="AUHIS_BID_TIME" value="2020-01-29" > -->

										<a href="#" 
											class="upprice"><input type="button" value="+" onclick="addCount(<%=gab %>); return false;"
											class="auction_plus"></a>
									</div>
									<div>
									<a href="javascript:auction_detail.submit()"><button
												id="auction_history_button" type="text"
												class="md_auction_buybtn buybtn2">입찰하기</button></a>
										<script>
    $('#auction_history_button').on('click', function(event) { 
		
		   var obj = document.getElementById("unit");  
		
		   var number = Number(obj.value);
		if(number==<%=auctionvo.getAUCTION_NOW_PRICE()%>){
			   alert("입찰값이 현재가격과 같습니다. ");
			   return false;
		   }else if(number < <%=auctionvo.getAUCTION_NOW_PRICE()%>){
			   alert("입찰값이 현재가격보다 낮습니다.. ");
			   return false;
		   }		
    });
		
    </script>
    <script type="text/javascript">
    var end = new Date('<%=auctionvo.getAUCTION_END_TIME()%>');
    var now = new Date();	
    var distance = end - now;
    			
    if (distance < 0) {
    	alert("경매가 마감되었습니다.")
    	//clearInterval(timer);
    	//document.getElementById("body_press").innerHTML = '<EXPIRED!>';
    	document.getElementById("newcountdown").innerHTML="경매가 종료되었습니다.";
    	$button_joinus = $('#auction_history_button').attr('disabled', true);
    	$button_joinus = $('.auction_plus').attr('disabled', true);
    	$button_joinus = $('.auction_minus').attr('disabled', true);
    	
    }
    </script>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 하단 영역 -->
					<div class="md_detail_bottom">
						<!-- 제품 상세설명 -->
						
						<%
							String img_5 = auctionvo.getAUCTION_PHOTO5_STORED();
							String[] str = img_5.split(",");
							for (int i = 0; i < str.length; i++) {
						%><img src="<%=path%><%=str[i]%>" width="1000px"
							name="AUCTION_PHOTO5_STORED">

						<%
							}
						%>
						<div class="md_detail_explanation">
							<h3 class="md_detail_explanation_title">상품상세</h3>
							<br />
							<p class="md_detail_explanation_article">
							<%=auctionvo.getAUCTION_DETAIL()%>
								
							</p>


						</div>


					</div>

					<!-- 연관 제품 -->
			</div>
			</form>
	</section>

	 <footer id="footer">
    </footer>
	
</body>

</html>

