<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.DecimalFormat"%>
<%
	HashMap<String,Object> theProduct = (HashMap<String,Object>)request.getAttribute("theProduct");
	String main_img = (String)theProduct.get("pb_main_img_stored");
	String detail_img1 = (String)theProduct.get("pb_detail_img1_stored");
	String detail_img2 = (String)theProduct.get("pb_detail_img2_stored");
	String detail_img3 = (String)theProduct.get("pb_detail_img3_stored");
	String brand_name = (String)theProduct.get("pd_brand");
	String pb_md_name = (String)theProduct.get("pb_md_name");
	String quality_grade = (String)theProduct.get("quality_grade");
	String pb_detail = (String)theProduct.get("pb_detail");
	String entity_number=(String)theProduct.get("entity_number");
	
	int product_price = Integer.parseInt((theProduct.get("sale_price")).toString());
	DecimalFormat df = new DecimalFormat("###,###");
	String product_price_shaped = df.format(product_price);
	
	String expected_point = df.format(product_price/1000);
	
	String shipping_coast = "4000원";
	if(product_price > 1000000){
		shipping_coast = "무료";
	}else{
		shipping_coast = "4,000원";
	}
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/md_detail.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/goodluxe-header.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/md_detail.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/goodluxe-footer.js"></script>
		
		<script type="text/javascript">
		 	$(document).ready(function(){
		 		$('#likebtn').on('click',function(event){
		 			alert("일단 들어옴");
		 			jQuery.ajax({
		 			url:$(this).attr("href"),
		 			type:'GET',
		 			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		 			dataType : "json",
		 			success: function (data) {
		 				 
		 				alert("리스트 ajax통신 성공!!!");
		 			},
		 			error:function() {
  	                 	alert("리스트 ajax통신 실패!!!");
 	                }
		 		});
	
		 	}
		</script>
	</head>
<body>

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
						<li class="notice"><img
							src="${pageContext.request.contextPath}/resources/img/icons/notice.png">
							<a href="#" class='notice_btn'>알림</a>
							<ul class="notice_content">
								<li><a href="#" class="notice_list on"> '생로랑 모노그램 카바스백'
										제품을 구매할 수 있습니다 :D<br> 이 기회를 놓치지 마세요!
								</a></li>
								<li><a href="searchResult.do" class="notice_list on">
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
						<img
							src="${pageContext.request.contextPath}/resources/img/icons/list-menu_gold.png"
							alt="mobile_menu">
						<!-- <img src="img/icons/list-menu_white.png" alt="mobile_menu"> -->
					</div>
					<div class="logo">
						<a href="mainPage.do">GOODLUXE</a>
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
										<li><a href="./itemList.do?il_search_brand=Armani">Armani</a></li>
										<li><a href="./itemList.do?il_search_brand=Balenciaga">Balenciaga</a></li>
										<li><a href="./itemList.do?il_search_brand=Bally">Bally</a></li>
										<li><a href="./itemList.do?il_search_brand=Balmain">Balmain</a></li>
										<li><a href="./itemList.do?il_search_brand=Berluti">Berluti</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Bottega Veneta">Bottega
												Veneta</a></li>
										<li><a href="./itemList.do?il_search_brand=BOUCHERON">BOUCHERON</a></li>
										<li><a href="./itemList.do?il_search_brand=Breguet">Breguet</a></li>
										<li><a href="./itemList.do?il_search_brand=BREITLING">BREITLING</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Brunello Cucinelli">Brunello
												Cucinelli</a></li>
										<li><a href="./itemList.do?il_search_brand=Burberrys">Burberrys</a></li>
										<li><a href="./itemList.do?il_search_brand=Bvlgari">Bvlgari</a></li>
										<li><a href="./itemList.do?il_search_brand=Cartier">Cartier</a></li>
										<li><a href="./itemList.do?il_search_brand=Celine">Celine</a></li>
										<li><a href="./itemList.do?il_search_brand=Chanel">Chanel</a></li>
									</div>
									<div>
										<li><a
											href="./itemList.do?il_search_brand=Christian Dior">Christian
												Dior</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Christian louboutin">Christian
												louboutin</a></li>
										<li><a href="./itemList.do?il_search_brand=CHRONOSWISS">CHRONOSWISS</a></li>
										<li><a href="./itemList.do?il_search_brand=Coach">Coach</a></li>
										<li><a href="./itemList.do?il_search_brand=Colombo">Colombo</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Comme des Garcons">Comme
												des Garcons</a></li>
										<li><a href="./itemList.do?il_search_brand=Damiani">Damiani</a></li>
										<li><a href="./itemList.do?il_search_brand=DELVAUX">DELVAUX</a></li>
										<li><a href="./itemList.do?il_search_brand=Dior Homme">Dior
												Homme</a></li>
										<li><a href="./itemList.do?il_search_brand=Dolce&Gabbana">Dolce&Gabbana</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Dries Van Noten">Dries
												Van Noten</a></li>
										<li><a href="./itemList.do?il_search_brand=Dsquared2">Dsquared2</a></li>
										<li><a href="./itemList.do?il_search_brand=DVF">DVF</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Ermanno Scervino">Ermanno
												Scervino</a></li>
										<li><a href="./itemList.do?il_search_brand=Etro">Etro</a></li>
									</div>
									<div>
										<li><a href="./itemList.do?il_search_brand=Fendi">Fendi</a></li>
										<li><a href="./itemList.do?il_search_brand=Ferragamo">Ferragamo</a></li>
										<li><a href="./itemList.do?il_search_brand=For Man">For
												Man</a></li>
										<li><a href="./itemList.do?il_search_brand=Franck Muller">Franck
												Muller</a></li>
										<li><a href="./itemList.do?il_search_brand=Fred">Fred</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Giuseppe Zanotti">Giuseppe
												Zanotti</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Giambattista Valli">Giambattista
												Valli</a></li>
										<li><a href="./itemList.do?il_search_brand=Givenchy">Givenchy</a></li>
										<li><a href="./itemList.do?il_search_brand=Goyard">Goyard</a></li>
										<li><a href="./itemList.do?il_search_brand=Gucci">Gucci</a></li>
										<li><a href="./itemList.do?il_search_brand=HarryWinston">HarryWinston</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Helen Kaminski">Helen
												Kaminski</a></li>
										<li><a href="./itemList.do?il_search_brand=Hermes">Hermes</a></li>
										<li><a href="./itemList.do?il_search_brand=HUBLOT">HUBLOT</a></li>
										<li><a href="./itemList.do?il_search_brand=Isabel Marant">Isabel
												Marant</a></li>
									</div>
									<div>
										<li><a href="./itemList.do?il_search_brand=Jimmy Choo">Jimmy
												Choo</a></li>
										<li><a href="./itemList.do?il_search_brand=Louis Vuitton">Louis
												Vuitton</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Manolo Blahnik">Manolo
												Blahnik</a></li>
										<li><a href="./itemList.do?il_search_brand=Maje">Maje</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Marc by Marc Jacobs">Marc
												by Marc Jacobs</a></li>
										<li><a href="./itemList.do?il_search_brand=Marc Jacobs">Marc
												Jacobs</a></li>
										<li><a href="./itemList.do?il_search_brand=Marni">Marni</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Martin Margiella">Martin
												Margiella</a></li>
										<li><a href="./itemList.do?il_search_brand=Max Mara">Max
												Mara</a></li>
										<li><a href="./itemList.do?il_search_brand=Michael kors">Michael
												kors</a></li>
										<li><a href="./itemList.do?il_search_brand=Miu Miu">Miu
												Miu</a></li>
										<li><a href="./itemList.do?il_search_brand=MONCLERE">MONCLERE</a></li>
										<li><a href="./itemList.do?il_search_brand=MontBlanc">MontBlanc</a></li>
										<li><a href="./itemList.do?il_search_brand=Moschino">Moschino</a></li>
										<li><a href="./itemList.do?il_search_brand=Mulberry">Mulberry</a></li>
									</div>
									<div>
										<li><a href="./itemList.do?il_search_brand=OMEGA">OMEGA</a></li>
										<li><a href="./itemList.do?il_search_brand=Prada">Prada</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Proenza schouler">Proenza
												schouler</a></li>
										<li><a href="./itemList.do?il_search_brand=Rick owens">Rick
												owens</a></li>
										<li><a href="./itemList.do?il_search_brand=ROCHAS">ROCHAS</a></li>
										<li><a href="./itemList.do?il_search_brand=ROGER DUBUIS">ROGER
												DUBUIS</a></li>
										<li><a href="./itemList.do?il_search_brand=Roger Vivier">Roger
												Vivier</a></li>
										<li><a href="./itemList.do?il_search_brand=Rolex">Rolex</a></li>
										<li><a href="./itemList.do?il_search_brand=Sacai">Sacai</a></li>
										<li><a href="./itemList.do?il_search_brand=See by Chloe">See
												by Chloe</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Stella McCartney">Stella
												McCartney</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Stuart Weitzman">Stuart
												Weitzman</a></li>
										<li><a href="./itemList.do?il_search_brand=Syaring">Syaring</a></li>
										<li><a href="./itemList.do?il_search_brand=Tagheuer">Tagheuer</a></li>
										<li><a href="./itemList.do?il_search_brand=Tasaki">Tasaki</a></li>
									</div>
									<div>
										<li><a href="./itemList.do?il_search_brand=THOM BROWNE">THOM
												BROWNE</a></li>
										<li><a href="./itemList.do?il_search_brand=Tiffany">Tiffany</a></li>
										<li><a href="./itemList.do?il_search_brand=Tod's">Tod's</a></li>
										<li><a href="./itemList.do?il_search_brand=Tom ford">Tom
												ford</a></li>
										<li><a href="./itemList.do?il_search_brand=Tory burch">Tory
												burch</a></li>
										<li><a href="./itemList.do?il_search_brand=Valentino">Valentino</a></li>
										<li><a href="./itemList.do?il_search_brand=Valexstra">Valexstra</a></li>
										<li><a href="./itemList.do?il_search_brand=Vanessa Bruno">Vanessa
												Bruno</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Vivienne westwood">Vivienne
												westwood</a></li>
										<li><a
											href="./itemList.do?il_search_brand=YSL Rive Gauche">YSL
												Rive Gauche</a></li>
										<li><a
											href="./itemList.do?il_search_brand=Zadig?Voltaire">Zadig&Voltaire</a></li>
										<li><a href="#">그 외 브랜드</a></li>
									</div>
								</ul></li>
							<li><a href="./itemList.do?il_search_category=CLOTHES">CLOTHES</a></li>
							<li><a href="./itemList.do?il_search_category=JEWELRY">JEWELRY</a></li>
							<li><a href="./itemList.do?il_search_category=WATCH">WATCH</a></li>
							<li><a href="./itemList.do?il_search_category=BAG">BAG</a></li>
							<li><a href="./itemList.do?il_search_category=WALLET">WALLET</a></li>
							<li><a href="./itemList.do?il_search_category=GLASSES">GLASSES</a></li>
							<li><a href="./itemList.do?il_search_category=SHOES">SHOES</a></li>
							<li><a href="event_page.html">EVENT</a></li>
						</ul>
						<ul class="search">
							<img
								src="${pageContext.request.contextPath}/resources/img/icons/search_icon_black.png"
								alt="search" class="search_icon" />
							<form action="./searchResult.do" id="search_form" method="get">
								<div class="search_area">
									<div class="search_data">
										<input type="text" name="search_content" id=""
											class="search_box"><input type="submit" value="검색"
											class="search_btn">
									</div>
									<div class="search_close">
										<img
											src="${pageContext.request.contextPath}/resources/img/icons/cross-out_black.png"
											alt="close" class="search_close_icon" />
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
				<img
					src="${pageContext.request.contextPath}/resources/img/icons/cross-out_black.png"
					alt="close" class="login_close" />
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
					<a href="#"><img
						src="${pageContext.request.contextPath}/resources/img/icons/google.png"
						alt="google" class="login_icon"></a> <a href="#"><img
						src="${pageContext.request.contextPath}/resources/img/icons/kakao.png"
						alt="kakao" class="login_icon"></a> <a href="#"><img
						src="${pageContext.request.contextPath}/resources/img/icons/naver.png"
						alt="naver" class="login_icon"></a>
				</div>
				<div class="anonymous">
					<span>계정이 없으신가요?</span> <a href="#">회원가입</a>
				</div>
			</div>
		</div>
	</div>

	<section id="container">
		<br>
		<div id="main">
			<div class="md_detail_cover">
				<div id="md_detail_photoarea">
					<div class="detail_main_image_right">
						<a class="detail_main_image_link_right"> <img
							src="/Goodluxe/image/<%=main_img %>" alt="가방"
							class="md_detail_main_image">
						</a>
					</div>
					<div class="md_detail_thumbnail_images">
						<div class="detail_main_image_area1 detail_main_image_left">
							<a class="main_image_link1"> <img
								src="/Goodluxe/image/<%=main_img %>" alt="가방"
								class="md_detail_thumbnail_image">
							</a>
						</div>
						<div class="detail_main_image_area2 detail_main_image_left">
							<a class="main_image_link2"> <img
								src="/Goodluxe/image/<%=detail_img1 %>" alt="가방"
								class="md_detail_thumbnail_image">
							</a>
						</div>
						<div class="detail_main_image_area3 detail_main_image_left">
							<a class="main_image_link3"> <img
								src="/Goodluxe/image/<%=detail_img2 %>" alt="가방"
								class="md_detail_thumbnail_image">
							</a>
						</div>
						<div class="detail_main_image_area4 detail_main_image_left">
							<a class="main_image_link4"> <img
								src="/Goodluxe/image/<%=detail_img3 %>" alt="가방"
								class="md_detail_thumbnail_image">
							</a>
						</div>
					</div>
				</div>
				<div id="md_detail_textarea">
					<div class="md_detail_textarea_align">
						<div class="md_detail_textarea2 md_detail_brand"><%=brand_name%></div>
						<div class="md_detail_textarea2 md_detail_name"><%=pb_md_name%></div>

						<hr id="name_line">
						<div class="md_detail_table">
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 가격 </span> <span
									class="md_detail_cell md_detail_price"> <%=product_price_shaped%>원 </span>
							</div>
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 적립포인트 </span> <span
									class="md_detail_cell md_detail_point"> <%=expected_point%>P </span>
							</div>
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 배송비 </span> <span
									class="md_detail_cell md_detail_delivery_fee"> <%=shipping_coast %> </span>
							</div>
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 배송일 </span> <span
									class="md_detail_cell md_detail_d_period"> 결제일로부터 3일 이내
									배송 </span>
							</div>
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 제품등급 </span> <span
									class="md_detail_cell md_detail_grade"> <%=quality_grade %> </span>
							</div>
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 배송구분 </span> <span
									class="md_detail_cell md_detail_delivery_domestic"> 본
									상품은 국내배송만 가능합니다 </span>
								<hr id="name_line">
							</div>
							<div class="md_detail_textarea2 md_detail_btnpart">
								<a href = "#"><div class="buybtn buybtn2">구매하기</div></a>
								<a href = "#"><div class="notibtn">
									<img src="${pageContext.request.contextPath}/resources/img/icons/bell.png" alt="알림" width="16px">&nbsp;&nbsp;알림
								</div></a>
								<a href="mdDetailLike.do?entity_number=<%=entity_number%>" id="likebtn" ><div class="likebtn" >
									<img src="${pageContext.request.contextPath}/resources/img/icons/heart.png" alt="좋아요" width="16px">&nbsp;&nbsp;좋아요
								</div></a>
							</div>
						</div>
					</div>
				</div>


				<div class="md_detail_bottom">
					<!-- 제품 상세설명 -->
					<div class="md_detail_explanation">
						<h3 class="md_detail_explanation_title">상품상세</h3>
						<br />
						<p class="md_detail_explanation_article">
							내용 : 깔끔한 컬러의 고급스러운 캐비어 소재에 우아한 디자인이 돋보이는 숄더백입니다.<br /> 턴락 오픈방식이며
							내외부 다양한 수납공간이 있어 편하게 수납하실 수 있습니다.<br /> 상태 : 은장 잔스크래치,모서리 한곳
							점마모외 상태좋은 A등급입니다.<br /> 8자리 244번대<br /> 부속품 : 더스트, 개런티카드, 영수증<br />
							Made In FRANCE<br />
						</p>
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













</body>
</html>