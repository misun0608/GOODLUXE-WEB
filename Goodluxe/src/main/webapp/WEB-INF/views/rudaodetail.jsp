<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.util.*"%>
<%@page import="com.spring.goodluxe.jj.*"%>
<%@page import="com.spring.goodluxe.jj.AuctionVO"%>
<%@page import="com.spring.goodluxe.jj.Auction_HistoryVO"%>
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
<script>
			$('.detail_main_image_left>a>img').on({ 

			"click" : function(){ //->썸네일이미지를 클릭했을때 

			var imgSrc = $(this).attr('src'); //->변수 imgSrc 에 클릭한 이미지의 속성 src의 값을 담은 후 

			$('.detail_main_image_right>img').attr('src',imgSrc); //->큰이미지에 속성 src를 imgSrc로 변경합니다.


		</script>


</head>

<%
	/* ArrayList<String> file_1[] = new ArrayList<String>();
	try{
	
		// 파일 업로드. 폼에서 가져온 인자값을 얻기 위해request 객체 전달,
		//업로드 경로, 파일 최대 크기, 한글처리, 파일 중복처리
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
	
	
		Enumeration<String> files = multi.getFileNames();
		while(files.hasMoreElements()){
		String name = files.nextElement();
		file_1.add(multi.getFilesystemName(name));
		}
	
		}catch(Exception e){
		// 예외처리
		e.printStackTrace();
		}
	*/
	
	AuctionVO auctionvo = (AuctionVO) request.getAttribute("auctionvo");
	int historynumber = ((Integer) request.getAttribute("auctionnumber")).intValue();
	Purchase2VO purchasevo = (Purchase2VO) request.getAttribute("purchasevo");
	
	
	
	/* 		Auction_HistoryVO historyvo= (Auction_HistoryVO)request.getAttribute("historyvo"); */
	String path = "./resources/img/auction_img/";
%>
<body id="body_press" >

	<header>

		<div class="header">
			<div class="header_bg">
				<div class="header_area">
					<ul class="topmenu nonmember_menu on">
						<li class="cs"><a href="#">고객센터</a></li>
						<li class="singin"><a href="#">회원가입</a></li>
						<li class="login"><a href="#">로그인</a></li>
					</ul>
					<ul class="topmenu member_menu">
						<li class="cs"><a href="#">고객센터</a></li>
						<li class="logout"><a href="#">로그아웃</a></li>
						<li class="mypage"><a href="#">마이페이지</a></li>
						<li class="notice"><img src="img/icons/notice.png"> <a
							href="#" class='notice_btn'>알림</a>
							<ul class="notice_content">
								<li><a href="#" class="notice_list on"> '생로랑 모노그램 카바스백'
										제품을 구매할 수 있습니다 :D<br> 이 기회를 놓치지 마세요!
								</a></li>
								<li><a href="search_result.html" class="notice_list on">
										'생로랑 모노그램 카바스백' 제품이 판매 완료되었습니다 ㅠㅠ..<br> Saint Laurent 의
										다른 제품을 보시겠어요?
								</a></li>
								<li><a href="#" class="notice_list"> '생로랑 모노그램 카바스백' 최고
										경매가가 갱신되었습니다.<br> 경매 진행 상황을 확인하세요!
								</a></li>
								<li><a href="#" class="notice_list"> '생로랑 모노그램 카바스백' 경매
										종료 하루 전입니다.<br> 경매 진행 상황을 확인하세요!
								</a></li>
								<li><a href="#" class="notice_list"> '생로랑 모노그램 카바스백' 경매
										종료까지 한 시간 남았습니다.<br> 경매 진행 상황을 확인하세요!
								</a></li>
								<li><a href="#" class="notice_more notice_list"> 지난 알림
										더보기 </a></li>
							</ul></li>
						<li class="notice"><a href="#">관리자페이지</a></li>
					</ul>
					<div class="mobile_menu">
						<img src="img/icons/list-menu_gold.png" alt="mobile_menu">
						<!-- <img src="img/icons/list-menu_white.png" alt="mobile_menu"> -->
					</div>
					<div class="logo">
						<a href="main_page.html">GOODLUXE</a>
					</div>
				</div>
			</div>
		</div>
	</header>

	<nav>
		<div class="nav">
			<div class="nav_bg">
				<div class="nav_area">
					<div class="menubar">
						<ul class="menu">
							<li><a href="#">ALL BRAND</a>
								<ul class="submenu">
									<div>
										<li><a href="#">Armani</a></li>
										<li><a href="#">Balenciaga</a></li>
										<li><a href="#">Bally</a></li>
										<li><a href="#">Balmain</a></li>
										<li><a href="#">Berluti</a></li>
										<li><a href="#">Bottega Veneta</a></li>
										<li><a href="#">BOUCHERON</a></li>
										<li><a href="#">Breguet</a></li>
										<li><a href="#">BREITLING</a></li>
										<li><a href="#">Brunello Cucinelli</a></li>
										<li><a href="#">Burberrys</a></li>
										<li><a href="#">Bvlgari</a></li>
										<li><a href="#">Cartier</a></li>
										<li><a href="#">Celine</a></li>
										<li><a href="#">Chanel</a></li>
									</div>
									<div>
										<li><a href="#">Christian Dior</a></li>
										<li><a href="#">Christian louboutin</a></li>
										<li><a href="#">CHRONOSWISS</a></li>
										<li><a href="#">Coach</a></li>
										<li><a href="#">Colombo</a></li>
										<li><a href="#">Comme des Garcons</a></li>
										<li><a href="#">Damiani</a></li>
										<li><a href="#">DELVAUX</a></li>
										<li><a href="#">Dior Homme</a></li>
										<li><a href="#">Dolce&Gabbana</a></li>
										<li><a href="#">Dries Van Noten</a></li>
										<li><a href="#">Dsquared2</a></li>
										<li><a href="#">DVF</a></li>
										<li><a href="#">Ermanno Scervino</a></li>
										<li><a href="#">Etro</a></li>
									</div>
									<div>
										<li><a href="#">Fendi</a></li>
										<li><a href="#">Ferragamo</a></li>
										<li><a href="#">For Man</a></li>
										<li><a href="#">Franck Muller</a></li>
										<li><a href="#">Fred</a></li>
										<li><a href="#">Giuseppe Zanotti</a></li>
										<li><a href="#">Giambattista Valli</a></li>
										<li><a href="#">Givenchy</a></li>
										<li><a href="#">Goyard</a></li>
										<li><a href="#">Gucci</a></li>
										<li><a href="#">HarryWinston</a></li>
										<li><a href="#">Helen Kaminski</a></li>
										<li><a href="#">Hermes</a></li>
										<li><a href="#">HUBLOT</a></li>
										<li><a href="#">Isabel Marant</a></li>
									</div>
									<div>
										<li><a href="#">Jimmy Choo</a></li>
										<li><a href="#">Louis Vuitton</a></li>
										<li><a href="#">Manolo Blahnik</a></li>
										<li><a href="#">Maje</a></li>
										<li><a href="#">Marc by Marc Jacobs</a></li>
										<li><a href="#">Marc Jacobs</a></li>
										<li><a href="#">Marni</a></li>
										<li><a href="#">Martin Margiella</a></li>
										<li><a href="#">Max Mara</a></li>
										<li><a href="#">Michael kors</a></li>
										<li><a href="#">Miu Miu</a></li>
										<li><a href="#">MONCLERE</a></li>
										<li><a href="#">MontBlanc</a></li>
										<li><a href="#">Moschino</a></li>
										<li><a href="#">Mulberry</a></li>
									</div>
									<div>
										<li><a href="#">OMEGA</a></li>
										<li><a href="#">Prada</a></li>
										<li><a href="#">Proenza schouler</a></li>
										<li><a href="#">Rick owens</a></li>
										<li><a href="#">ROCHAS</a></li>
										<li><a href="#">ROGER DUBUIS</a></li>
										<li><a href="#">Roger Vivier</a></li>
										<li><a href="#">Rolex</a></li>
										<li><a href="#">Sacai</a></li>
										<li><a href="#">See by Chloe</a></li>
										<li><a href="#">Stella McCartney</a></li>
										<li><a href="#">Stuart Weitzman</a></li>
										<li><a href="#">Syaring</a></li>
										<li><a href="#">Tagheuer</a></li>
										<li><a href="#">Tasaki</a></li>
									</div>
									<div>
										<li><a href="#">THOM BROWNE</a></li>
										<li><a href="#">Tiffany</a></li>
										<li><a href="#">Tod's</a></li>
										<li><a href="#">Tom ford</a></li>
										<li><a href="#">Tory burch</a></li>
										<li><a href="#">Valentino</a></li>
										<li><a href="#">Valexstra</a></li>
										<li><a href="#">Vanessa Bruno</a></li>
										<li><a href="#">Vivienne westwood</a></li>
										<li><a href="#">YSL Rive Gauche</a></li>
										<li><a href="#">Zadig&Voltaire</a></li>
										<li><a href="#">그 외 브랜드</a></li>
									</div>
								</ul></li>
							<li><a href="#">CLOTHES</a></li>
							<li><a href="#">JEWELRY</a></li>
							<li><a href="#">WATCH</a></li>
							<li><a href="#">BAG</a></li>
							<li><a href="#">WALLET</a></li>
							<li><a href="#">GLASSES</a></li>
							<li><a href="#">SHOES</a></li>
							<li><a href="#">EVENT</a></li>
						</ul>
						<ul class="search">
							<img src="img/icons/search_icon_black.png" alt="search"
								class="search_icon" />
							<form action="" method="get" id="search_form">
								<div class="search_area">
									<div class="search_data">
										<input type="text" name="" id="" class="search_box"><input
											type="button" value="검색" class="search_btn">
									</div>
									<div class="search_close">
										<img src="img/icons/cross-out_black.png" alt="close"
											class="search_close_icon" />
									</div>
								</div>
							</form>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<div class="login_bg">
		<div class="login_outline">
			<div class="login_top"></div>
			<div class="login_right"></div>
			<div class="login_bottom"></div>
			<div class="login_left"></div>
			<div class="login_area">
				<img src="img/icons/cross-out_black.png" alt="close"
					class="login_close" />
				<div class="login_title">LOGIN</div>
				<form action="" id="login_form">
					<div class="login_data">
						<div class="group">
							<input type="text" class="input_login"> <span
								class="highlight"></span> <label>아이디</label>
						</div>
						<div class="group">
							<input type="password" class="input_login"> <span
								class="highlight"></span> <label>비밀번호</label>
						</div>
					</div>
					<a href="#" class="find_login_data">아이디/비밀번호 찾기</a> <input
						type="button" class="login_btn" value="로그인">

				</form>
				<div class="login_line">
					<hr>
					<span>or</span>
					<hr>
				</div>
				<div class="login_icons">
					<a href="#"><img src="img/icons/google.png" alt="google"
						class="login_icon"></a> <a href="#"><img
						src="img/icons/kakao.png" alt="kakao" class="login_icon"></a> <a
						href="#"><img src="img/icons/naver.png" alt="naver"
						class="login_icon"></a>
				</div>
				<div class="anonymous">
					<span>계정이 없으신가요?</span> <a href="#">회원가입</a>
				</div>
			</div>
		</div>
	</div>

	<section id="container">
		<form action="./history.do" name="auction_detail" method="post">
			
	
			<br>


			<div id="main">
				<div class="cover">
					<div id="photoarea">
						<div class="detail_main_image_right">

							<a class="detail_main_image_link_right"> <img
								src="<%=path%><%=auctionvo.getAUCTION_PHOTO1_STORED()%>"
								alt="가방" name="AUCTION_PHOTO1_STORED" class="main_image">
							</a>

						</div>
						<div class="thumbnail_images">
							<div class="detail_main_image_area1 detail_main_image_left">
								<a class="main_image_link1"> <img
									src="<%=path%><%=auctionvo.getAUCTION_PHOTO1_STORED()%>"
									alt="가방" name="AUCTION_PHOTO1_STORED" class="thumbnail_image">
								</a>
							</div>	
							<div class="detail_main_image_area2 detail_main_image_left">
								<a class="main_image_link2"> <img
									src="<%=path%><%=auctionvo.getAUCTION_PHOTO2_STORED()%>"
									name="AUCTION_PHOTO2_STORED" alt="가방" class="thumbnail_image">
								</a>
							</div>
							<div class="detail_main_image_area3 detail_main_image_left">
								<a class="main_image_link3"> <img
									src="<%=path%><%=auctionvo.getAUCTION_PHOTO3_STORED()%>"
									alt="가방" name="AUCTION_PHOTO3_STORED" class="thumbnail_image">
								</a>
							</div>
							<div class="detail_main_image_area4 detail_main_image_left">
								<a class="main_image_link4"> <img
									src="<%=path%><%=auctionvo.getAUCTION_PHOTO4_STORED()%>"
									alt="가방" name="AUCTION_PHOTO4_STORED" class="thumbnail_image">
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

										<%=auctionvo.getAUCTION_NOW_PRICE()%>
									</span>
								</div>
								<div class="md_detail_row">
									<span class="md_detail_cell md_detail_title"> 입찰 건수 </span> <span
										id="container" class="md_detail_cell md_detail_d_period"
										onclick="popup()"> <%=historynumber%>
									</span>
									<SCRIPT LANGUAGE="JavaScript">
	
									function popup(){
 
									var url = "auctionhistory.do?auction_post_number=<%=auctionvo.getAUCTION_POST_NUMBER()%>";
 
									var name = "history";
 
									window.open(url,name,"width=1000,heightght=1000,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50");
 
									}
 
									</script>


								</div>
								<div class="md_detail_row">
									<span class="md_detail_cell md_detail_title"> 남은 시간 </span>
									<!-- <span class="md_detail_cell md_detail_grade" style="color: rgb(0, 110, 255);"> -->
									<span id="newcountdown" class="md_detail_cell md_detail_grade"
										style="color: rgb(236, 27, 27);"> </span>
									<!-- <button type="button" class="content">
									 -->
									</button>

									<script>
									CountDownTimer('<%=auctionvo.getAUCTION_END_TIME()%>','newcountdown');

									function CountDownTimer(dt, id) {
										var end = new Date(dt);

										var _second = 1000;
										var _minute = _second * 60;
										var _hour = _minute * 60;
										var _day = _hour * 24;
										var timer;

										function showRemaining() {
											var now = new Date();
											var distance = end - now;
											
											
											
											if(distance <= 0 && distance <=-1){
												$(function(){
   												// $('.content').click(function(){
       
   													var params= <%=auctionvo.getAUCTION_POST_NUMBER() %>;
   													var url = jQuery(location).attr('href');


													$.ajax({//ajax 호출 JQuery.ajax== 
														url:'/goodluxe/insertJSON.do?auction_post_number=<%=auctionvo.getAUCTION_POST_NUMBER() %>'+"&link="+url  , //수행하고자 하는 url 형식, port번호 다음부터 경로가 일치하도록 작성 (컨트롤러 참조)
														type:'GET', //데이터 보낼 때 방식 사용
														data: params, //서버로 보낼 데이터 타입
														contentType: 'application/x-www-form-urlencoded;charset=utf-8',
														dataType: 'json', //결과 값을 받아올 때 (응답받을 때 ) 서버에서 보내줄 데이터 타입
														success : function(data){	

															var jsondata = JSON.stringify(data);

															alert(jsondata);
															

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
									  }
									   
									   
									   obj.value = number + num; 
									   }  
								
								</script>
										<a href="#" onclick="addCount(-50000); return false;"
											class="downprice"><input type="button" value="-"
											class="auction_minus"></a> <input type="text" id="unit" style="pointer-events:none;"
											class="auction_price_text" name="AUHIS_BETTING_PRICE"
											value="<%=auctionvo.getAUCTION_NOW_PRICE() %>"> <input
											type="hidden" name="AUCTION_POST_NUMBER"
											value="<%=auctionvo.getAUCTION_POST_NUMBER() %>"> <input
											type="hidden" name="MEMBER_ID"
											value="skyjaejin">
										<!-- <input type="hidden" name="AUHIS_BID_TIME" value="2020-01-29" > -->

										<a href="#" onclick="addCount(50000); return false;"
											class="upprice"><input type="button" value="+"
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
		   }else{
		   alert("입찰 되었씁니다.");
		   }
		})
    </script>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 하단 영역 -->
					<div class="md_detail_bottom">
						<!-- 제품 상세설명 -->
						<div class="md_detail_explanation">
							<h3 class="md_detail_explanation_title">상품상세</h3>
							<br />
							<p class="md_detail_explanation_article">


								<%=auctionvo.getAUCTION_DETAIL()%>

							</p>


						</div>
						<%
							String img_5 = auctionvo.getAUCTION_PHOTO5_STORED();
							String[] str = img_5.split(",");
							for (int i = 0; i < str.length; i++) {
						%><img src="<%=path%><%=str[i]%>" width="600px"
							name="AUCTION_PHOTO5_STORED">

						<%
							}
						%>



					</div>

					<!-- 연관 제품 -->
					<div class="related_item_area">
						<h3 class="related_item_title">Related Items</h3>
						<div class="related_item_list">
							<div class="related_item">
								<a href="#"> <img src="img/md_img/chanel_bag.jpg" alt="">
									<div class="related_item_info">
										<div class="related_item_brand">Chanel</div>
										<div class="related_item_name">샤넬 캐비어 클래식 미듐</div>
										<div class="related_item_price">4,900,000원</div>
									</div>
								</a>
							</div>
							<div class="related_item">
								<a href="#"> <img src="img/md_img/chanel_bag.jpg" alt="">
									<div class="related_item_info">
										<div class="related_item_brand">Chanel</div>
										<div class="related_item_name">샤넬 캐비어 클래식 미듐</div>
										<div class="related_item_price">4,900,000원</div>
									</div>
								</a>
							</div>
							<div class="related_item">
								<a href="#"> <img src="img/md_img/chanel_bag.jpg" alt="">
									<div class="related_item_info">
										<div class="related_item_brand">Chanel</div>
										<div class="related_item_name">샤넬 캐비어 클래식 미듐</div>
										<div class="related_item_price">4,900,000원</div>
									</div>
								</a>
							</div>
							<div class="related_item">
								<a href="#"> <img src="img/md_img/chanel_bag.jpg" alt="">
									<div class="related_item_info">
										<div class="related_item_brand">Chanel</div>
										<div class="related_item_name">샤넬 캐비어 클래식 미듐</div>
										<div class="related_item_price">4,900,000원</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
	</section>

	<footer id="footer">
		<div class="footer">
			<div class="footer_bg">
				<div class="footer_area">
					<p class="footer_title">CODE COMPANY</p>
					<div class="footer_context">
						<ul>
							<li>호스팅 서비스사업자 : (주)GOODLUXE</li>
							<li>사업자등록번호 : 222-22-22222 [사업자정보확인]</li>
							<li>통신판매업신고 : 2019-서울강남-0202</li>
						</ul>
						<ul>
							<li>주소 서울 서초구 강남대로 459</li>
							<li>개인정보관리책임자 : 비트캠프</li>
							<li>COPYRIGHTⓒ GOODLUXE ALL RIGHT RESERVED.</li>
							<li>Icon made by Freepik from www.flaticon.com</li>
						</ul>
						<ul>
							<li>해당 사이트는 학습 목적으로 제작되었으며 상업적 요소가 없음을 밝힙니다.</li>
							<li>This site is intended for learning purposes and has no
								commercial elements.</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
	</form>
</body>

</html>





<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.util.*"%>
<%@page import="com.spring.goodluxe.jj.*"%>
<%@page import="com.spring.goodluxe.jj.AuctionVO" %>
<%@page import="com.spring.goodluxe.jj.Auction_HistoryVO" %>

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
<script>
$('.detail_main_image_left>a>img').on({ 

	 "click" : function(){ //->썸네일이미지를 클릭했을때 



	var imgSrc = $(this).attr('src'); //->변수 imgSrc 에 클릭한 이미지의 속성 src의 값을 담은 후 



	$('.detail_main_image_right>img').attr('src',imgSrc); //->큰이미지에 속성 src를 imgSrc로 변경합니다.


</script>


</head>

<body class="">

	<%
	AuctionVO auctionvo = (AuctionVO) request.getAttribute("auctionvo");
	int historynumber = ((Integer)request.getAttribute("auctionnumber")).intValue();
/* 		Auction_HistoryVO historyvo= (Auction_HistoryVO)request.getAttribute("historyvo"); */
	String path= "./resources/img/auction_img/";
	%>
	
	<header>
	
		<div class="header">
			<div class="header_bg">
				<div class="header_area">
					<ul class="topmenu nonmember_menu on">
						<li class="cs"><a href="#">고객센터</a></li>
						<li class="singin"><a href="#">회원가입</a></li>
						<li class="login"><a href="#">로그인</a></li>
					</ul>
					<ul class="topmenu member_menu">
						<li class="cs"><a href="#">고객센터</a></li>
						<li class="logout"><a href="#">로그아웃</a></li>
						<li class="mypage"><a href="#">마이페이지</a></li>
						<li class="notice"><img src="img/icons/notice.png"> <a
							href="#" class='notice_btn'>알림</a>
							<ul class="notice_content">
								<li><a href="#" class="notice_list on"> '생로랑 모노그램 카바스백'
										제품을 구매할 수 있습니다 :D<br> 이 기회를 놓치지 마세요!
								</a></li>
								<li><a href="search_result.html" class="notice_list on">
										'생로랑 모노그램 카바스백' 제품이 판매 완료되었습니다 ㅠㅠ..<br> Saint Laurent 의
										다른 제품을 보시겠어요?
								</a></li>
								<li><a href="#" class="notice_list"> '생로랑 모노그램 카바스백' 최고
										경매가가 갱신되었습니다.<br> 경매 진행 상황을 확인하세요!
								</a></li>
								<li><a href="#" class="notice_list"> '생로랑 모노그램 카바스백' 경매
										종료 하루 전입니다.<br> 경매 진행 상황을 확인하세요!
								</a></li>
								<li><a href="#" class="notice_list"> '생로랑 모노그램 카바스백' 경매
										종료까지 한 시간 남았습니다.<br> 경매 진행 상황을 확인하세요!
								</a></li>
								<li><a href="#" class="notice_more notice_list"> 지난 알림
										더보기 </a></li>
							</ul></li>
						<li class="notice"><a href="#">관리자페이지</a></li>
					</ul>
					<div class="mobile_menu">
						<img src="img/icons/list-menu_gold.png" alt="mobile_menu">
						<!-- <img src="img/icons/list-menu_white.png" alt="mobile_menu"> -->
					</div>
					<div class="logo">
						<a href="main_page.html">GOODLUXE</a>
					</div>
				</div>
			</div>
		</div>
	</header>

	<nav>
		<div class="nav">
			<div class="nav_bg">
				<div class="nav_area">
					<div class="menubar">
						<ul class="menu">
							<li><a href="#">ALL BRAND</a>
								<ul class="submenu">
									<div>
										<li><a href="#">Armani</a></li>
										<li><a href="#">Balenciaga</a></li>
										<li><a href="#">Bally</a></li>
										<li><a href="#">Balmain</a></li>
										<li><a href="#">Berluti</a></li>
										<li><a href="#">Bottega Veneta</a></li>
										<li><a href="#">BOUCHERON</a></li>
										<li><a href="#">Breguet</a></li>
										<li><a href="#">BREITLING</a></li>
										<li><a href="#">Brunello Cucinelli</a></li>
										<li><a href="#">Burberrys</a></li>
										<li><a href="#">Bvlgari</a></li>
										<li><a href="#">Cartier</a></li>
										<li><a href="#">Celine</a></li>
										<li><a href="#">Chanel</a></li>
									</div>
									<div>
										<li><a href="#">Christian Dior</a></li>
										<li><a href="#">Christian louboutin</a></li>
										<li><a href="#">CHRONOSWISS</a></li>
										<li><a href="#">Coach</a></li>
										<li><a href="#">Colombo</a></li>
										<li><a href="#">Comme des Garcons</a></li>
										<li><a href="#">Damiani</a></li>
										<li><a href="#">DELVAUX</a></li>
										<li><a href="#">Dior Homme</a></li>
										<li><a href="#">Dolce&Gabbana</a></li>
										<li><a href="#">Dries Van Noten</a></li>
										<li><a href="#">Dsquared2</a></li>
										<li><a href="#">DVF</a></li>
										<li><a href="#">Ermanno Scervino</a></li>
										<li><a href="#">Etro</a></li>
									</div>
									<div>
										<li><a href="#">Fendi</a></li>
										<li><a href="#">Ferragamo</a></li>
										<li><a href="#">For Man</a></li>
										<li><a href="#">Franck Muller</a></li>
										<li><a href="#">Fred</a></li>
										<li><a href="#">Giuseppe Zanotti</a></li>
										<li><a href="#">Giambattista Valli</a></li>
										<li><a href="#">Givenchy</a></li>
										<li><a href="#">Goyard</a></li>
										<li><a href="#">Gucci</a></li>
										<li><a href="#">HarryWinston</a></li>
										<li><a href="#">Helen Kaminski</a></li>
										<li><a href="#">Hermes</a></li>
										<li><a href="#">HUBLOT</a></li>
										<li><a href="#">Isabel Marant</a></li>
									</div>
									<div>
										<li><a href="#">Jimmy Choo</a></li>
										<li><a href="#">Louis Vuitton</a></li>
										<li><a href="#">Manolo Blahnik</a></li>
										<li><a href="#">Maje</a></li>
										<li><a href="#">Marc by Marc Jacobs</a></li>
										<li><a href="#">Marc Jacobs</a></li>
										<li><a href="#">Marni</a></li>
										<li><a href="#">Martin Margiella</a></li>
										<li><a href="#">Max Mara</a></li>
										<li><a href="#">Michael kors</a></li>
										<li><a href="#">Miu Miu</a></li>
										<li><a href="#">MONCLERE</a></li>
										<li><a href="#">MontBlanc</a></li>
										<li><a href="#">Moschino</a></li>
										<li><a href="#">Mulberry</a></li>
									</div>
									<div>
										<li><a href="#">OMEGA</a></li>
										<li><a href="#">Prada</a></li>
										<li><a href="#">Proenza schouler</a></li>
										<li><a href="#">Rick owens</a></li>
										<li><a href="#">ROCHAS</a></li>
										<li><a href="#">ROGER DUBUIS</a></li>
										<li><a href="#">Roger Vivier</a></li>
										<li><a href="#">Rolex</a></li>
										<li><a href="#">Sacai</a></li>
										<li><a href="#">See by Chloe</a></li>
										<li><a href="#">Stella McCartney</a></li>
										<li><a href="#">Stuart Weitzman</a></li>
										<li><a href="#">Syaring</a></li>
										<li><a href="#">Tagheuer</a></li>
										<li><a href="#">Tasaki</a></li>
									</div>
									<div>
										<li><a href="#">THOM BROWNE</a></li>
										<li><a href="#">Tiffany</a></li>
										<li><a href="#">Tod's</a></li>
										<li><a href="#">Tom ford</a></li>
										<li><a href="#">Tory burch</a></li>
										<li><a href="#">Valentino</a></li>
										<li><a href="#">Valexstra</a></li>
										<li><a href="#">Vanessa Bruno</a></li>
										<li><a href="#">Vivienne westwood</a></li>
										<li><a href="#">YSL Rive Gauche</a></li>
										<li><a href="#">Zadig&Voltaire</a></li>
										<li><a href="#">그 외 브랜드</a></li>
									</div>
								</ul></li>
							<li><a href="#">CLOTHES</a></li>
							<li><a href="#">JEWELRY</a></li>
							<li><a href="#">WATCH</a></li>
							<li><a href="#">BAG</a></li>
							<li><a href="#">WALLET</a></li>
							<li><a href="#">GLASSES</a></li>
							<li><a href="#">SHOES</a></li>
							<li><a href="#">EVENT</a></li>
						</ul>
						<ul class="search">
							<img src="img/icons/search_icon_black.png" alt="search"
								class="search_icon" />
							<form action="" method="get" id="search_form">
								<div class="search_area">
									<div class="search_data">
										<input type="text" name="" id="" class="search_box"><input
											type="button" value="검색" class="search_btn">
									</div>
									<div class="search_close">
										<img src="img/icons/cross-out_black.png" alt="close"
											class="search_close_icon" />
									</div>
								</div>
							</form>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<div class="login_bg">
		<div class="login_outline">
			<div class="login_top"></div>
			<div class="login_right"></div>
			<div class="login_bottom"></div>
			<div class="login_left"></div>
			<div class="login_area">
				<img src="img/icons/cross-out_black.png" alt="close"
					class="login_close" />
				<div class="login_title">LOGIN</div>
				<form action="" id="login_form">
					<div class="login_data">
						<div class="group">
							<input type="text" class="input_login"> <span
								class="highlight"></span> <label>아이디</label>
						</div>
						<div class="group">
							<input type="password" class="input_login"> <span
								class="highlight"></span> <label>비밀번호</label>
						</div>
					</div>
					<a href="#" class="find_login_data">아이디/비밀번호 찾기</a> <input
						type="button" class="login_btn" value="로그인">

				</form>
				<div class="login_line">
					<hr>
					<span>or</span>
					<hr>
				</div>
				<div class="login_icons">
					<a href="#"><img src="img/icons/google.png" alt="google"
						class="login_icon"></a> <a href="#"><img
						src="img/icons/kakao.png" alt="kakao" class="login_icon"></a> <a
						href="#"><img src="img/icons/naver.png" alt="naver"
						class="login_icon"></a>
				</div>
				<div class="anonymous">
					<span>계정이 없으신가요?</span> <a href="#">회원가입</a>
				</div>
			</div>
		</div>
	</div>

	<section id="container">
	<form action="./history.do" name="auction_detail" method="post">
	<table>
						
	<input type="hidden" name="AUCTION_MD_NAME" value="까르티에 팔찌">
	<input type="hidden" name="AUCTION_BRAND" value="까르티에 팔찌">
	<input type="hidden" name="AUCTION_START_PRICE" value="1000000">
	<input type="hidden" name="AUCTION_NOW_PRICE" value="<%=auctionvo.getAUCTION_NOW_PRICE() %>">
	<input type="hidden" name="AUCTION_BID_PRICE" value="0">
	<input type="hidden" name="AUCTION_START_TIME" value="<%=auctionvo.getAUCTION_START_TIME() %>">
	<input type="hidden" name="AUCTION_END_TIME" value="<%=auctionvo.getAUCTION_END_TIME() %>">
	
	<input type="hidden" name="AUCTION_DETAIL" value="할말하않">
	<input type="hidden" name="AUCTION_LIKE" value="0">
	<input type="hidden" name="AUCTION_POST_STATUS" value="게시 중" checked />
	<input type="hidden" name="ENTITY_NUMBER" value="경매 전" checked/> 
	<input type="hidden" name="AUCTION_PRICE_TIME" value="<%=auctionvo.getAUCTION_PRICE_TIME() %>">
	<input type="hidden" name="AUCTION_POST_DATE" value="<%=auctionvo.getAUCTION_POST_DATE() %>" class="ct">
	</table>
		<br>
		<div id="main">
			<div class="cover">
				<div id="photoarea">
					<div class="detail_main_image_right">
						<a class="detail_main_image_link_right"> <img
							src="<%=path %><%=auctionvo.getAUCTION_PHOTO1_STORED() %>" alt="가방" name="AUCTION_PHOTO1_STORED" class="main_image">
						</a>
	
					</div>
					<div class="thumbnail_images">
						<div class="detail_main_image_area1 detail_main_image_left">
							<a class="main_image_link1"> <img
								src="<%=path %><%=auctionvo.getAUCTION_PHOTO2_STORED() %>" alt="가방" name="AUCTION_PHOTO1_STORED" class="thumbnail_image">
							</a>
						</div>
						<div class="detail_main_image_area2 detail_main_image_left">
							<a class="main_image_link2"> <img
								src="<%=path %><%=auctionvo.getAUCTION_PHOTO1_STORED() %>" name="AUCTION_PHOTO1_STORED" alt="가방"
								class="thumbnail_image">
							</a>
						</div>
						<div class="detail_main_image_area3 detail_main_image_left">
							<a class="main_image_link3"> <img
								src="<%=path %><%=auctionvo.getAUCTION_PHOTO2_STORED() %>" alt="가방" name="AUCTION_PHOTO1_STORED"
								class="thumbnail_image">
							</a>
						</div>
						<div class="detail_main_image_area4 detail_main_image_left">
							<a class="main_image_link4"> <img
								src="<%=path %><%=auctionvo.getAUCTION_PHOTO1_STORED() %>" alt="가방" name="AUCTION_PHOTO1_STORED"
								class="thumbnail_image">
							</a>
						</div>
					</div>
				</div>
			
				<div id="textarea">
					<div class="textarea_align">
						<div class="textarea2 md_auction_detail_brand"><%=auctionvo.getAUCTION_BRAND() %></div>
						<div class="textarea2 md_detail_name"><%=auctionvo.getAUCTION_MD_NAME() %>
						</div>

						<hr id="name_line">
						<div class="md_detail_table">
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 현재 경매가 </span> 
								<span id="unit_2"
									class="md_detail_cell md_auction_detail_price"
									style="font-size: 21px;"> <!-- <span class="md_detail_cell md_detail_price" style="color: rgb(236, 27, 27); font-size: 23px;"> -->
									
									<%=auctionvo.getAUCTION_NOW_PRICE()%>	
								</span>
							</div>
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 입찰 건수 </span> 
								
								<span id="container" class="md_detail_cell md_detail_d_period" onclick="popup()">
									<%=historynumber %> </span>
									<SCRIPT LANGUAGE="JavaScript">
	
									function popup(){
 
									var url = "auctionhistory.do?auction_post_number=<%=auctionvo.getAUCTION_POST_NUMBER() %>";
 
									var name = "history";
 
									window.open(url,name,"width=1000,heightght=1000,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50");
 
									}
 
									</script>
 

							</div>
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 남은 시간 </span>
								<!-- <span class="md_detail_cell md_detail_grade" style="color: rgb(0, 110, 255);"> -->
								<span id="newcountdown" class="md_detail_cell md_detail_grade"
									style="color: rgb(236, 27, 27);"> </span>


								<script>
									CountDownTimer('<%=auctionvo.getAUCTION_END_TIME()%>','newcountdown');

									function CountDownTimer(dt, id) {
										var end = new Date(dt);

										var _second = 1000;
										var _minute = _second * 60;
										var _hour = _minute * 60;
										var _day = _hour * 24;
										var timer;

										function showRemaining() {
											var now = new Date();
											var distance = end - now;
											if (distance < 0) {

												clearInterval(timer);
												document.getElementById(id).innerHTML = 'EXPIRED!';

												return;
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
									   
									   if(number+num < <%=auctionvo.getAUCTION_NOW_PRICE() %>){ 
									      alert("더 이상 낮출 수 없습니다"); 
									      
									      return false; 
									  }
									   
									   
									   obj.value = number + num; 
									   }  
								
								</script>					                        
     <a href="#" onclick="addCount(-50000); return false;" class="downprice"><input type="button" value="-" class="auction_minus"></a>  
   <input type="" id="unit" class="auction_price_text" name="AUHIS_BETTING_PRICE"  value="<%=auctionvo.getAUCTION_NOW_PRICE() %>">
   <input type="hidden" name="AUCTION_POST_NUMBER" value="<%=auctionvo.getAUCTION_POST_NUMBER() %>" >
   <input type="hidden" name="MEMBER_ID" value="<%=auctionvo.getENTITY_NUMBER() %>" >
   <!-- <input type="hidden" name="AUHIS_BID_TIME" value="2020-01-29" > -->
  
     <a href="#" onclick="addCount(50000); return false;" class="upprice"><input type="button" value="+" class="auction_plus"></a> 
    </div>
   <div>
    <a href="javascript:auction_detail.submit()"><button id="auction_history_button" type="text" class="md_auction_buybtn buybtn2"  >입찰하기</button></a>
    <script>
    $('#auction_history_button').on('click', function(event) { 

		
		   var obj = document.getElementById("unit");  
		
		   var number = Number(obj.value);
		if(number==<%=auctionvo.getAUCTION_NOW_PRICE() %>){
			   alert("입찰값이 현재가격과 같습니다. ");
			   return false;
		   }else{
		   alert("입찰 되었씁니다.");
		   }
		}) 
    </script>
    </div>
							</div>
						</div>
					</div>
				</div>
				<!-- 하단 영역 -->
				<div class="md_detail_bottom">
					<!-- 제품 상세설명 -->
					<div class="md_detail_explanation">
						<h3 class="md_detail_explanation_title">상품상세</h3>
						<br />
						<p class="md_detail_explanation_article">
						
						
							<%=auctionvo.getAUCTION_DETAIL()%>

						</p>
						<img src="<%=path %><%=auctionvo.getAUCTION_PHOTO2_STORED() %>" width="600px" name="AUCTION_PHOTO2_STORED">
					</div>
					<!-- 연관 제품 -->
					<div class="related_item_area">
						<h3 class="related_item_title">Related Items</h3>
						<div class="related_item_list">
							<div class="related_item">
								<a href="#"> <img src="img/md_img/chanel_bag.jpg" alt="">
									<div class="related_item_info">
										<div class="related_item_brand">Chanel</div>
										<div class="related_item_name">샤넬 캐비어 클래식 미듐</div>
										<div class="related_item_price">4,900,000원</div>
									</div>
								</a>
							</div>
							<div class="related_item">
								<a href="#"> <img src="img/md_img/chanel_bag.jpg" alt="">
									<div class="related_item_info">
										<div class="related_item_brand">Chanel</div>
										<div class="related_item_name">샤넬 캐비어 클래식 미듐</div>
										<div class="related_item_price">4,900,000원</div>
									</div>
								</a>
							</div>
							<div class="related_item">
								<a href="#"> <img src="img/md_img/chanel_bag.jpg" alt="">
									<div class="related_item_info">
										<div class="related_item_brand">Chanel</div>
										<div class="related_item_name">샤넬 캐비어 클래식 미듐</div>
										<div class="related_item_price">4,900,000원</div>
									</div>
								</a>
							</div>
							<div class="related_item">
								<a href="#"> <img src="img/md_img/chanel_bag.jpg" alt="">
									<div class="related_item_info">
										<div class="related_item_brand">Chanel</div>
										<div class="related_item_name">샤넬 캐비어 클래식 미듐</div>
										<div class="related_item_price">4,900,000원</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer id="footer">
		<div class="footer">
			<div class="footer_bg">
				<div class="footer_area">
					<p class="footer_title">CODE COMPANY</p>
					<div class="footer_context">
						<ul>
							<li>호스팅 서비스사업자 : (주)GOODLUXE</li>
							<li>사업자등록번호 : 222-22-22222 [사업자정보확인]</li>
							<li>통신판매업신고 : 2019-서울강남-0202</li>
						</ul>
						<ul>
							<li>주소 서울 서초구 강남대로 459</li>
							<li>개인정보관리책임자 : 비트캠프</li>
							<li>COPYRIGHTⓒ GOODLUXE ALL RIGHT RESERVED.</li>
							<li>Icon made by Freepik from www.flaticon.com</li>
						</ul>
						<ul>
							<li>해당 사이트는 학습 목적으로 제작되었으며 상업적 요소가 없음을 밝힙니다.</li>
							<li>This site is intended for learning purposes and has no
								commercial elements.</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
	</form>
</body>

</html> --%>