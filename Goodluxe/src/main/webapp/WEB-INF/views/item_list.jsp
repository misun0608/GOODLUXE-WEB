<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.spring.goodluxe.jy.ProductBoardVO"%>
<%@ page import="com.spring.goodluxe.jy.ProductVO"%>


<%
	ArrayList<HashMap<String, Object>> productList 
		= (ArrayList<HashMap<String, Object>>)request.getAttribute("productList");
	
	int currentPage = (int)request.getAttribute("currentPage");
	int count = (int)request.getAttribute("count");
	int number = (int)request.getAttribute("number");
	int pageSize = (int)request.getAttribute("pageSize");

	String il_search_brand = (String)request.getAttribute("il_search_brand");
	String il_search_category = (String)request.getAttribute("il_search_category");
	String il_search_grade = (String)request.getAttribute("il_search_grade");
	String il_search_price = (String)request.getAttribute("il_search_price");
%>
<script>
	
		
	

</script>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="user-scalable=no,width=device-width, initial-scale=1.0" />
<title>제품 리스트</title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/item_list.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/item_list_doesntExist.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/goodluxe-header.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/goodluxe-footer.js"></script>

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
						<li class="notice"><img src="${pageContext.request.contextPath}/resources/img/icons/notice.png"> <a
							href="#" class='notice_btn'>알림</a>
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
						<img src="${pageContext.request.contextPath}/resources/img/icons/list-menu_gold.png" alt="mobile_menu">
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
										<li><a href="./itemList.do?il_search_brand=Bottega Veneta">Bottega Veneta</a></li>
										<li><a href="./itemList.do?il_search_brand=BOUCHERON">BOUCHERON</a></li>
										<li><a href="./itemList.do?il_search_brand=Breguet">Breguet</a></li>
										<li><a href="./itemList.do?il_search_brand=BREITLING">BREITLING</a></li>
										<li><a href="./itemList.do?il_search_brand=Brunello Cucinelli">Brunello Cucinelli</a></li>
										<li><a href="./itemList.do?il_search_brand=Burberrys">Burberrys</a></li>
										<li><a href="./itemList.do?il_search_brand=Bvlgari">Bvlgari</a></li>
										<li><a href="./itemList.do?il_search_brand=Cartier">Cartier</a></li>
										<li><a href="./itemList.do?il_search_brand=Celine">Celine</a></li>
										<li><a href="./itemList.do?il_search_brand=Chanel">Chanel</a></li>
									</div>
									<div>
										<li><a href="./itemList.do?il_search_brand=Christian Dior">Christian Dior</a></li>
										<li><a href="./itemList.do?il_search_brand=Christian louboutin">Christian louboutin</a></li>
										<li><a href="./itemList.do?il_search_brand=CHRONOSWISS">CHRONOSWISS</a></li>
										<li><a href="./itemList.do?il_search_brand=Coach">Coach</a></li>
										<li><a href="./itemList.do?il_search_brand=Colombo">Colombo</a></li>
										<li><a href="./itemList.do?il_search_brand=Comme des Garcons">Comme des Garcons</a></li>
										<li><a href="./itemList.do?il_search_brand=Damiani">Damiani</a></li>
										<li><a href="./itemList.do?il_search_brand=DELVAUX">DELVAUX</a></li>
										<li><a href="./itemList.do?il_search_brand=Dior Homme">Dior Homme</a></li>
										<li><a href="./itemList.do?il_search_brand=Dolce&Gabbana">Dolce&Gabbana</a></li>
										<li><a href="./itemList.do?il_search_brand=Dries Van Noten">Dries Van Noten</a></li>
										<li><a href="./itemList.do?il_search_brand=Dsquared2">Dsquared2</a></li>
										<li><a href="./itemList.do?il_search_brand=DVF">DVF</a></li>
										<li><a href="./itemList.do?il_search_brand=Ermanno Scervino">Ermanno Scervino</a></li>
										<li><a href="./itemList.do?il_search_brand=Etro">Etro</a></li>
									</div>
									<div>
										<li><a href="./itemList.do?il_search_brand=Fendi">Fendi</a></li>
										<li><a href="./itemList.do?il_search_brand=Ferragamo">Ferragamo</a></li>
										<li><a href="./itemList.do?il_search_brand=For Man">For Man</a></li>
										<li><a href="./itemList.do?il_search_brand=Franck Muller">Franck Muller</a></li>
										<li><a href="./itemList.do?il_search_brand=Fred">Fred</a></li>
										<li><a href="./itemList.do?il_search_brand=Giuseppe Zanotti">Giuseppe Zanotti</a></li>
										<li><a href="./itemList.do?il_search_brand=Giambattista Valli">Giambattista Valli</a></li>
										<li><a href="./itemList.do?il_search_brand=Givenchy">Givenchy</a></li>
										<li><a href="./itemList.do?il_search_brand=Goyard">Goyard</a></li>
										<li><a href="./itemList.do?il_search_brand=Gucci">Gucci</a></li>
										<li><a href="./itemList.do?il_search_brand=HarryWinston">HarryWinston</a></li>
										<li><a href="./itemList.do?il_search_brand=Helen Kaminski">Helen Kaminski</a></li>
										<li><a href="./itemList.do?il_search_brand=Hermes">Hermes</a></li>
										<li><a href="./itemList.do?il_search_brand=HUBLOT">HUBLOT</a></li>
										<li><a href="./itemList.do?il_search_brand=Isabel Marant">Isabel Marant</a></li>
									</div>
									<div>
										<li><a href="./itemList.do?il_search_brand=Jimmy Choo">Jimmy Choo</a></li>
										<li><a href="./itemList.do?il_search_brand=Louis Vuitton">Louis Vuitton</a></li>
										<li><a href="./itemList.do?il_search_brand=Manolo Blahnik">Manolo Blahnik</a></li>
										<li><a href="./itemList.do?il_search_brand=Maje">Maje</a></li>
										<li><a href="./itemList.do?il_search_brand=Marc by Marc Jacobs">Marc by Marc Jacobs</a></li>
										<li><a href="./itemList.do?il_search_brand=Marc Jacobs">Marc Jacobs</a></li>
										<li><a href="./itemList.do?il_search_brand=Marni">Marni</a></li>
										<li><a href="./itemList.do?il_search_brand=Martin Margiella">Martin Margiella</a></li>
										<li><a href="./itemList.do?il_search_brand=Max Mara">Max Mara</a></li>
										<li><a href="./itemList.do?il_search_brand=Michael kors">Michael kors</a></li>
										<li><a href="./itemList.do?il_search_brand=Miu Miu">Miu Miu</a></li>
										<li><a href="./itemList.do?il_search_brand=MONCLERE">MONCLERE</a></li>
										<li><a href="./itemList.do?il_search_brand=MontBlanc">MontBlanc</a></li>
										<li><a href="./itemList.do?il_search_brand=Moschino">Moschino</a></li>
										<li><a href="./itemList.do?il_search_brand=Mulberry">Mulberry</a></li>
									</div>
									<div>
										<li><a href="./itemList.do?il_search_brand=OMEGA">OMEGA</a></li>
										<li><a href="./itemList.do?il_search_brand=Prada">Prada</a></li>
										<li><a href="./itemList.do?il_search_brand=Proenza schouler">Proenza schouler</a></li>
										<li><a href="./itemList.do?il_search_brand=Rick owens">Rick owens</a></li>
										<li><a href="./itemList.do?il_search_brand=ROCHAS">ROCHAS</a></li>
										<li><a href="./itemList.do?il_search_brand=ROGER DUBUIS">ROGER DUBUIS</a></li>
										<li><a href="./itemList.do?il_search_brand=Roger Vivier">Roger Vivier</a></li>
										<li><a href="./itemList.do?il_search_brand=Rolex">Rolex</a></li>
										<li><a href="./itemList.do?il_search_brand=Sacai">Sacai</a></li>
										<li><a href="./itemList.do?il_search_brand=See by Chloe">See by Chloe</a></li>
										<li><a href="./itemList.do?il_search_brand=Stella McCartney">Stella McCartney</a></li>
										<li><a href="./itemList.do?il_search_brand=Stuart Weitzman">Stuart Weitzman</a></li>
										<li><a href="./itemList.do?il_search_brand=Syaring">Syaring</a></li>
										<li><a href="./itemList.do?il_search_brand=Tagheuer">Tagheuer</a></li>
										<li><a href="./itemList.do?il_search_brand=Tasaki">Tasaki</a></li>
									</div>
									<div>
										<li><a href="./itemList.do?il_search_brand=THOM BROWNE">THOM BROWNE</a></li>
										<li><a href="./itemList.do?il_search_brand=Tiffany">Tiffany</a></li>
										<li><a href="./itemList.do?il_search_brand=Tod's">Tod's</a></li>
										<li><a href="./itemList.do?il_search_brand=Tom ford">Tom ford</a></li>
										<li><a href="./itemList.do?il_search_brand=Tory burch">Tory burch</a></li>
										<li><a href="./itemList.do?il_search_brand=Valentino">Valentino</a></li>
										<li><a href="./itemList.do?il_search_brand=Valexstra">Valexstra</a></li>
										<li><a href="./itemList.do?il_search_brand=Vanessa Bruno">Vanessa Bruno</a></li>
										<li><a href="./itemList.do?il_search_brand=Vivienne westwood">Vivienne westwood</a></li>
										<li><a href="./itemList.do?il_search_brand=YSL Rive Gauche">YSL Rive Gauche</a></li>
										<li><a href="./itemList.do?il_search_brand=Zadig?Voltaire">Zadig&Voltaire</a></li>
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
				<img src="${pageContext.request.contextPath}/resources/img/icons/cross-out_black.png" alt="close"
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
					<a href="#"><img src="${pageContext.request.contextPath}/resources/img/icons/google.png" alt="google"
						class="login_icon"></a> <a href="#"><img
						src="${pageContext.request.contextPath}/resources/img/icons/kakao.png" alt="kakao" class="login_icon"></a> <a
						href="#"><img src="${pageContext.request.contextPath}/resources/img/icons/naver.png" alt="naver"
						class="login_icon"></a>
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
			<div class="il_area">
				<article class="il_1st">
					<form id="il_search_form" onclick = "filtering_check();">
						<select name="il_search_brand" id="il_search_brand"
							class="il_search_select_box">
							<option value="all">브랜드</option>
							<option value="Armani"  ${il_search_brand=='Armani'?"selected":""}  >Armani</option>
							<option value="Balenciaga"  ${il_search_brand=='Balenciaga'?"selected":""} >Balenciaga</option>
							<option value="Bally"   ${il_search_brand=='Bally'?"selected":""}  >Bally</option>
							<option value="Balmain"  ${il_search_brand=='Balmain'?"selected":""} >Balmain</option>
							<option value="Berluti"  ${il_search_brand=='Berluti'?"selected":""} >Berluti</option>
							<option value="Bottega"  ${il_search_brand=='Bottega'?"selected":""} >Bottega Veneta</option>
							<option value="BOUCHERON"  ${il_search_brand=='BOUCHERON'?"selected":""}  >BOUCHERON</option>
							<option value="Breguet"  ${il_search_brand=='Breguet'?"selected":""}  >Breguet</option>
							<option value="BREITLING"  ${il_search_brand=='BREITLING'?"selected":""}  >BREITLING</option>
							<option value="Brunello"  ${il_search_brand=='Brunello'?"selected":""}  >Brunello Cucinelli</option>
							<option value="Burberrys"  ${il_search_brand=='Burberrys'?"selected":""}  >Burberrys</option>
							<option value="Bvlgari"  ${il_search_brand=='Bvlgari'?"selected":""}  >Bvlgari</option>
							<option value="Cartier" ${il_search_brand=='Cartier'?"selected":""} >Cartier</option>
							<option value="Celine"  ${il_search_brand=='Celine'?"selected":""}  >Celine</option>
							<option value="Chanel"  ${il_search_brand=='Chanel'?"selected":""}  >Chanel</option>
							<option value="Christian"  ${il_search_brand=='Christian'?"selected":""}  >Christian Dior</option>
							<option value="Christian"  ${il_search_brand=='Christian'?"selected":""}  >Christian louboutin</option>
							<option value="CHRONOSWISS"  ${il_search_brand=='CHRONOSWISS'?"selected":""}  >CHRONOSWISS</option>
							<option value="Coach"  ${il_search_brand=='Coach'?"selected":""}  >Coach</option>
							<option value="Colombo"  ${il_search_brand=='Colombo'?"selected":""}  >Colombo</option>
							<option value="Comme des Garcons"  ${il_search_brand=='Comme des Garcons'?"selected":""}  >Comme des Garcons</option>
							<option value="Damiani"  ${il_search_brand=='Damiani'?"selected":""}  >Damiani</option>
							<option value="DELVAUX"  ${il_search_brand=='DELVAUX'?"selected":""}  >DELVAUX</option>
							<option value="Dior Homme"  ${il_search_brand=='Dior Homme'?"selected":""}  >Dior Homme</option>
							<option value="Dolce&Gabbana"  ${il_search_brand=='Dolce\\&Gabbana'?"selected":""}  >Dolce&Gabbana</option>
							<option value="Dries Van Noten"  ${il_search_brand=='Dries Van Noten'?"selected":""}  >Dries Van Noten</option>
							<option value="Dsquared2"  ${il_search_brand=='Dsquared2'?"selected":""}  >Dsquared2</option>
							<option value="DVF"  ${il_search_brand=='DVF'?"selected":""}  >DVF</option>
							<option value="Ermanno Scervino"  ${il_search_brand=='Ermanno Scervino'?"selected":""}  >Ermanno Scervino</option>
							<option value="Etro"  ${il_search_brand=='Etro'?"selected":""}  >Etro</option>
							<option value="Fendi"  ${il_search_brand=='Fendi'?"selected":""}  >Fendi</option>
							<option value="Ferragamo"  ${il_search_brand=='Ferragamo'?"selected":""}  >Ferragamo</option>
							<option value="For Man"  ${il_search_brand=='For Man'?"selected":""}  >For Man</option>
							<option value="Franck"  ${il_search_brand=='Franck'?"selected":""}  >Franck Muller</option>
							<option value="Fred"  ${il_search_brand=='Fred'?"selected":""}  >Fred</option>
							<option value="Giuseppe Zanotti"  ${il_search_brand=='Giuseppe Zanotti'?"selected":""}  >Giuseppe Zanotti</option>
							<option value="Giambattista Valli"  ${il_search_brand=='Giambattista Valli'?"selected":""}  >Giambattista Valli</option>
							<option value="Givenchy"  ${il_search_brand=='Givenchy'?"selected":""}  >Givenchy</option>
							<option value="Goyard"  ${il_search_brand=='Goyard'?"selected":""}  >Goyard</option>
							<option value="Gucci"  ${il_search_brand=='Gucci'?"selected":""}  >Gucci</option>
							<option value="HarryWinston"  ${il_search_brand=='HarryWinston'?"selected":""}  >HarryWinston</option>
							<option value="Helen Kaminski"  ${il_search_brand=='Helen Kaminski'?"selected":""}  >Helen Kaminski</option>
							<option value="Hermes"  ${il_search_brand=='Hermes'?"selected":""}  >Hermes</option>
							<option value="HUBLOT"  ${il_search_brand=='HUBLOT'?"selected":""}  >HUBLOT</option>
							<option value="Isabel Marant"  ${il_search_brand=='Isabel Marant'?"selected":""}  >Isabel Marant</option>
							<option value="Jimmy Choo"  ${il_search_brand=='Jimmy Choo'?"selected":""}  >Jimmy Choo</option>
							<option value="Louis Vuitton"  ${il_search_brand=='Louis Vuitton'?"selected":""}  >Louis Vuitton</option>
							<option value="Manolo Blahnik"  ${il_search_brand=='Manolo Blahnik'?"selected":""}  >Manolo Blahnik</option>
							<option value="Maje"  ${il_search_brand=='Maje'?"selected":""}  >Maje</option>
							<option value="Marc by Marc Jacobs"  ${il_search_brand=='Marc by Marc Jacobs'?"selected":""}  >Marc by Marc Jacobs</option>
							<option value="Marc Jacobs"  ${il_search_brand=='Marc Jacobs'?"selected":""}  >Marc Jacobs</option>
							<option value="Marni"  ${il_search_brand=='Marni'?"selected":""}  >Marni</option>
							<option value="Martin Margiella"  ${il_search_brand=='Martin Margiella'?"selected":""}  >Martin Margiella</option>
							<option value="Max Mara"  ${il_search_brand=='Max Mara'?"selected":""}  >Max Mara</option>
							<option value="Michael kors"  ${il_search_brand=='Michael kors'?"selected":""}  >Michael kors</option>
							<option value="Miu Miu"  ${il_search_brand=='Miu Miu'?"selected":""}  >Miu Miu</option>
							<option value="MONCLERE"  ${il_search_brand=='MONCLERE'?"selected":""}  >MONCLERE</option>
							<option value="MontBlanc"  ${il_search_brand=='MontBlanc'?"selected":""}  >MontBlanc</option>
							<option value="Moschino"  ${il_search_brand=='Moschino'?"selected":""}  >Moschino</option>
							<option value="Mulberry"  ${il_search_brand=='Mulberry'?"selected":""}  >Mulberry</option>
							<option value="OMEGA"  ${il_search_brand=='OMEGA'?"selected":""}  >OMEGA</option>
							<option value="Prada"  ${il_search_brand=='Prada'?"selected":""}  >Prada</option>
							<option value="Proenza schouler"  ${il_search_brand=='Proenza schouler'?"selected":""}  >Proenza schouler</option>
							<option value="Rick owens"  ${il_search_brand=='Rick owens'?"selected":""}  >Rick owens</option>
							<option value="ROCHAS"  ${il_search_brand=='ROCHAS'?"selected":""}  >ROCHAS</option>
							<option value="ROGER DUBUIS"  ${il_search_brand=='ROGER DUBUIS'?"selected":""}  >ROGER DUBUIS</option>
							<option value="Roger Vivier"  ${il_search_brand=='Roger Vivier'?"selected":""}  >Roger Vivier</option>
							<option value="Rolex"  ${il_search_brand=='Rolex'?"selected":""}  >Rolex</option>
							<option value="Sacai"  ${il_search_brand=='Sacai'?"selected":""}  >Sacai</option>
							<option value="See by Chloe"  ${il_search_brand=='See by Chloe'?"selected":""}  >See by Chloe</option>
							<option value="Stella McCartney"  ${il_search_brand=='Stella McCartney'?"selected":""}  >Stella McCartney</option>
							<option value="Stuart Weitzman"  ${il_search_brand=='Stuart Weitzman'?"selected":""}  >Stuart Weitzman</option>
							<option value="Syaring"  ${il_search_brand=='Syaring'?"selected":""}  >Syaring</option>
							<option value="Tagheuer"  ${il_search_brand=='Tagheuer'?"selected":""}  >Tagheuer</option>
							<option value="Tasaki"  ${il_search_brand=='Tasaki'?"selected":""}  >Tasaki</option>
							<option value="THOM BROWNE"  ${il_search_brand=='THOM BROWNE'?"selected":""}  >THOM BROWNE</option>
							<option value="Tiffany"  ${il_search_brand=='Tiffany'?"selected":""}  >Tiffany</option>
							<option value="Tod's" >Tod's</option>
							<option value="Tom ford"  ${il_search_brand=='Tom ford'?"selected":""}  >Tom ford</option>
							<option value="Tory burch"  ${il_search_brand=='Tory burch'?"selected":""}  >Tory burch</option>
							<option value="Valentino"  ${il_search_brand=='Valentino'?"selected":""}  >Valentino</option>
							<option value="Valexstra"  ${il_search_brand=='Valexstra'?"selected":""}  >Valexstra</option>
							<option value="Vanessa Bruno"  ${il_search_brand=='Vanessa Bruno'?"selected":""}  >Vanessa Bruno</option>
							<option value="Vivienne Westwood"  ${il_search_brand=='Vivienne Westwood'?"selected":""}  >Vivienne westwood</option>
							<option value="YSL Rive Gauche"  ${il_search_brand=='YSL Rive Gauche'?"selected":""}  >YSL Rive Gauche</option>
							<option value="Zadig&Voltaire"  ${il_search_brand=='Zadig\\&Voltaire'?"selected":""}  >Zadig&Voltaire</option>
							<option value="etc">그 외 브랜드</option>
						</select> <select name="il_search_category" id="il_search_category"
							class="il_search_select_box">
							<option value="all">카테고리</option>
							<option value="CLOTHES" ${il_search_category=='CLOTHES'?"selected":""} >CLOTHES</option>
							<option value="JEWELRY" ${il_search_category=='JEWELRY'?"selected":""} >JEWELRY</option>
							<option value="WATCH" ${il_search_category=='WATCH'?"selected":""} >WATCH</option>
							<option value="BAG" ${il_search_category=='BAG'?"selected":""} >BAG</option>
							<option value="WALLET" ${il_search_category=='WALLET'?"selected":""} >WALLET</option>
							<option value="GLASSES" ${il_search_category=='GLASSES'?"selected":""} >GLASSES</option>
							<option value="SHOES" ${il_search_category=='SHOES'?"selected":""} >SHOES</option>
						</select> <select name="il_search_grade" id="il_search_grade"
							class="il_search_select_box">
							<option value="all">등급</option>
							<option value="NS" ${il_search_grade=='NS'?"selected":""}  >NS</option>
							<option value="A" ${il_search_grade=='A'?"selected":""}  >A</option>
							<option value="B" ${il_search_grade=='B'?"selected":""} >B</option>
						</select> <select name="il_search_price" id="il_search_price"
							class="il_search_select_box">
							<option value="all">가격</option>
							<option value="lt10" ${il_search_grade=='lt10'?"selected":""} >10만원 미만</option>
							<option value="10to50" ${il_search_grade=='10to50'?"selected":""} >10만원 이상 ~ 50만원 미만</option>
							<option value="50to100" ${il_search_grade=='50to100'?"selected":""} >50만원 이상 ~ 100만원 미만</option>
							<option value="100to200" ${il_search_grade=='100to200'?"selected":""} >100만원 이상 ~ 200만원 미만</option>
							<option value="200to300" ${il_search_grade=='200to300'?"selected":""} >200만원 이상 ~ 300만원 미만</option>
							<option value="300to400" ${il_search_grade=='300to400'?"selected":""} >300만원 이상 ~ 400만원 미만</option>
							<option value="400to500" ${il_search_grade=='400to500'?"selected":""} >400만원 이상 ~ 500만원 미만</option>
							<option value="gt500" ${il_search_grade=='gt500'?"selected":""} >500만원 이상</option>
						</select> <input type="submit" value="검색" class="il_search_btn">
					</form>
				</article>
				<article class="il_2nd">
					<% 
						if(count == 0){
					%>
						<div class = "research_none_div">
						
							<p class = "research_none_p1">검색 결과가 없습니다.</p>
						</div>
					<%
						}
					%>
				
				
					<% for( int i = 0; i<productList.size(); i++){ 
						HashMap<String,Object>  productHM = new HashMap <String, Object>();	
						productHM = (HashMap<String,Object>)productList.get(i);
						String img_name = (String)productHM.get("pb_main_img_stored");
						String brand_name = (String)productHM.get("pd_brand");
						String product_name = (String)productHM.get("pb_md_name");
						String entity_number = (String)productHM.get("entity_number");
						//int product_price = (Integer)productHM.get("sale_price");
						//int product_price = Integer.valueOf((String)productHM.get("sale_price"));
						int product_price_nonshaped = Integer.parseInt((productHM.get("sale_price")).toString());
						DecimalFormat df = new DecimalFormat("###,###");
						String product_price_shaped = df.format(product_price_nonshaped);
						
					%>
					<a href="./mdDetail.do?entity_number=<%=entity_number%>">
						<div class="il_card">
							<div class="il_md_img">
								<img src="/Goodluxe/image/<%= img_name%>" alt="md_img"
									class="il_md_img_path">
							</div>
							<div class="md_info">
								<div class="il_md_brand"><%= brand_name %></div>
								<div class="il_md_name"><%= product_name %></div>
								<div class="il_md_price"><%= product_price_shaped %> 원</div>
							</div>
						</div>
					</a> 
					
				<!--<a href="#">
						<div class="il_card">
							<div class="il_md_img">
								<img src="${pageContext.request.contextPath}/resources/img/md_img/md_img.jpg" alt="md_img"
									class="il_md_img_path">
							</div>
							<div class="md_info">
								<div class="il_md_brand">Saint Laurent</div>
								<div class="il_md_name">생로랑 모노그램 카바스백</div>
								<div class="il_md_price">1,383,000 원</div>
							</div>
						</div>
					</a> -->
					<% 
						number--;
						}//포문1닫힘 
					%>
					
				</article>
	 			<article class="il_3rd">
					<table class="il_paging">
						<tbody>
							<tr>
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
								<td class="page_edge"><a href="itemList.do?pageNum=1&pageCount=<%=pageCount%>&il_search_brand=<%=il_search_brand%>&il_search_category=<%=il_search_category%>&il_search_grade=<%=il_search_grade%>&il_search_price=<%=il_search_price%>" class="page_first" >첫페이지</a></td>
								<td class="page_arrow"><a href="itemList.do?pageNum=<%=startPage-5%>&pageCount=<%=pageCount%>&il_search_brand=<%=il_search_brand%>&il_search_category=<%=il_search_category%>&il_search_grade=<%=il_search_grade%>&il_search_price=<%=il_search_price%>" class="arrow left" >&lt;&lt;</a></td>
							<% 	
								for(i = startPage; (i<=startPage+4)&&(i<=pageCount);i++){
							%>	
								<td class="page_normal">
									<a href="itemList.do?pageNum=<%=i%>&pageCount=<%=pageCount%>&il_search_brand=<%=il_search_brand%>&il_search_category=<%=il_search_category%>&il_search_grade=<%=il_search_grade%>&il_search_price=<%=il_search_price%>"class="il_now_page" class="num" ><%= i%></a>
								</td>
							<%
								}
								
							%>
								<td class="page_arrow"><a href="itemList.do?pageNum=<%=startPage+5%>&pageCount=<%=pageCount%>&il_search_brand=<%=il_search_brand%>&il_search_category=<%=il_search_category%>&il_search_grade=<%=il_search_grade%>&il_search_price=<%=il_search_price%>" class="arrow right" >&gt;&gt;</a></td>
								<td class="page_edge"><a href="itemList.do?pageNum=<%=pageCount%>&pageCount=<%=pageCount%>&il_search_brand=<%=il_search_brand%>&il_search_category=<%=il_search_category%>&il_search_grade=<%=il_search_grade%>&il_search_price=<%=il_search_price%>" class="page_last" >끝페이지</a></td>
							<%
								
							}
						%>
							</tr>
						</tbody>
					</table>
				</article>
	
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
							<li>Icon made by Freepik from www.flaticon.com / Photo
								courtesy photos-public-domain.com</li>
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