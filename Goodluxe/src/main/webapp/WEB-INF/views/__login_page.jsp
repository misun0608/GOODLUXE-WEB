<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.goodluxe.voes.MemberVO"%>
<%
	String mem_id = (String) session.getAttribute("member_id");
	String mem_class = (String) session.getAttribute("member_class");
	String mem_isadmin = (String) session.getAttribute("member_isadmin");
%>

<!DOCTYPE html >
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main_page.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/goodluxe-header.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/main_page.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/goodluxe-footer.js"></script>
<script>
	function onclick_login() {
		var params = $('#login_form').serialize(); // serialize로 문자열형태로? 만듦
		$.ajax({
			url : '/goodluxe/login.do',
			type : 'POST',
			data : params, // 서버로 전달할 데이터
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : "json", // 서버로 보내줄 타입  //응답할 타입은 json으로 하겠다

			success : function(retVal) {
				if (retVal.result == "login_success") {
					alert("로그인에 성공했습니다")
					location.href = "./main_page.do";
				} else if (retVal.result == "login_black") {
					alert("블랙리스트입니다")
					location.href = "./main_page.do";
				} else if (retVal.result == "login_admin") {
					alert("관리자입니다")
					location.href = "./main_page.do";
				} else if (retVal.result == "loginFail_confirm") {
					alert("이메일을 인증해주세요")
				} else if (retVal.result == "loginFail_IdPw") {
					alert("아이디나 비밀번호를 확인해주세요")
				} else { // 실패했다면
					alert("가입되지 않은 아이디입니다");
				}
			},
			error : function() {
				alert("ajax통신 실패");
			}
		});
	};
</script>
</head>
<body class="">

	<header>
		<div class="header">
			<div class="header_bg">
				<div class="header_area">
					<%
						if (mem_id == null) {
					%>
					<ul class="topmenu member_menu on">
						<li class="cs"><a href="#">고객센터</a></li>
						<li class="singin"><a href="joinform.do">회원가입</a></li>
						<li class="login"><a href="#">로그인</a></li>
					</ul>
					<%
						} else {
							if (mem_class.equals("Y") || mem_class.equals("B")) {
					%>
					<ul class="topmenu member_menu on">
						<li class="cs"><a href="#">고객센터</a></li>
						<li class="logout"><a href="logout.do">로그아웃</a></li>
						<li class="mypage"><a href="#">마이페이지</a></li>
						<li class="notice"><img
							src="${pageContext.request.contextPath}/resources/img/icons/notice.png">
							<a href="#" class='notice_btn'>알림</a>
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
					</ul>
					<%
						} else if (mem_isadmin.equals("Y")) {
					%>
					<ul class="topmenu member_menu on">
						<li class="notice"><a href="#">관리자페이지</a></li>
						<li class="logout"><a href="logout.do">로그아웃</a></li>
					</ul>
					<%
						}
						}
					%>
					<div class="mobile_menu">
						<img
							src="${pageContext.request.contextPath}/resources/img/icons/list-menu_gold.png"
							alt="mobile_menu">
						<!-- <img src="img/icons/list-menu_white.png" alt="mobile_menu"> -->
					</div>
					<div class="logo">
						<a href="login_page.html">GOODLUXE</a>
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
							<li><a href="event_page.html">EVENT</a></li>
						</ul>
						<ul class="search">
							<img
								src="${pageContext.request.contextPath}/resources/img/icons/search_icon_black.png"
								alt="search" class="search_icon" />
							<form action="" method="get" id="search_form">
								<div class="search_area">
									<div class="search_data">
										<input type="text" name="" id="" class="search_box"><input
											type="button" value="검색" class="search_btn">
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
				<form action="/login.do" id="login_form">
					<div class="login_data">
						<div class="group">
							<input type="text" name="member_id" class="input_login">
							<span class="highlight"></span> <label>아이디</label>
						</div>
						<div class="group">
							<input type="password" name="member_pw" class="input_login">
							<span class="highlight"></span> <label>비밀번호</label>
						</div>
					</div>
					<a href="#" class="find_login_data">아이디/비밀번호 찾기</a> <input
						type="button" id="login_btn" class="login_btn"
						onclick="onclick_login()" value="로그인">

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
			<article class="mp_1st">
				<video
					src="${pageContext.request.contextPath}/resources/img/video/taking_pictures.mp4"
					class="main_video" autoplay loop poster="img/md_img/loading.png"></video>
			</article>
			<div class="mp_section_area">
				<article class="mp_2nd">
					<div class="main_images">
						<div class="main_image_right">
							<a href="#" class="main_image_link_right"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md01.png"
								alt="" class="main_image"></a>
						</div>
						<div class="main_image_area1 main_image_left">
							<a href="#" class="main_image_link1"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md01.png"
								alt="" class="main_image"></a>
						</div>
						<div class="main_image_area2 main_image_left">
							<a href="#" class="main_image_link2"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md02.png"
								alt="" class="main_image"></a>
						</div>
						<div class="main_image_area3">
							<a href="#" class="main_image_link3"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md_black.png"
								alt="" class="main_image"></a>
						</div>
						<div class="main_image_area4 main_image_left">
							<a href="#" class="main_image_link4"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md04.png"
								alt="" class="main_image"></a>
						</div>
						<div class="main_image_area5 main_image_left">
							<a href="#" class="main_image_link5"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md05.png"
								alt="" class="main_image"></a>
						</div>
						<div class="main_image_area6 main_image_left">
							<a href="#" class="main_image_link6"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md06.png"
								alt="" class="main_image"></a>
						</div>
						<div class="main_image_area7">
							<a href="#" class="main_image_link7"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md_black.png"
								alt="" class="main_image"></a>
						</div>
						<div class="main_image_area8 main_image_left">
							<a href="#" class="main_image_link8"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md08.png"
								alt="" class="main_image"></a>
						</div>
						<div class="main_image_area9 main_image_left">
							<a href="#" class="main_image_link9"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md09.png"
								alt="" class="main_image"></a>
						</div>
						<div class="main_image_area10 main_image_left">
							<a href="#" class="main_image_link10"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md10.png"
								alt="" class="main_image"></a>
						</div>
						<div class="main_image_area11">
							<a href="#" class="main_image_link11"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md_black.png"
								alt="" class="main_image"></a>
						</div>
					</div>
				</article>
				<article class="mp_3rd">
					<a href="#">
						<div class="mp_card">
							<div class="mp_md_img">
								<img
									src="${pageContext.request.contextPath}/resources/img/md_img/md_img.jpg"
									alt="md_img" class="mp_md_img_path">
							</div>
							<div class="mp_md_info">
								<div class="mp_md_brand">Saint Laurent</div>
								<div class="mp_md_name">생로랑 모노그램 카바스백</div>
								<div class="mp_md_price">1,383,000 원</div>
							</div>
						</div>
					</a> <a href="#">
						<div class="mp_card">
							<div class="mp_md_img">
								<img
									src="${pageContext.request.contextPath}/resources/img/md_img/md_img.jpg"
									alt="md_img" class="mp_md_img_path">
							</div>
							<div class="mp_md_info">
								<div class="mp_md_brand">Saint Laurent</div>
								<div class="mp_md_name">생로랑 모노그램 카바스백</div>
								<div class="mp_md_price">1,383,000 원</div>
							</div>
						</div>
					</a> <a href="#">
						<div class="mp_card">
							<div class="mp_md_img">
								<img
									src="${pageContext.request.contextPath}/resources/img/md_img/md_img.jpg"
									alt="md_img" class="mp_md_img_path">
							</div>
							<div class="mp_md_info">
								<div class="mp_md_brand">Saint Laurent</div>
								<div class="mp_md_name">생로랑 모노그램 카바스백</div>
								<div class="mp_md_price">1,383,000 원</div>
							</div>
						</div>
					</a> <a href="#">
						<div class="mp_card">
							<div class="mp_md_img">
								<img
									src="${pageContext.request.contextPath}/resources/img/md_img/md_img.jpg"
									alt="md_img" class="mp_md_img_path">
							</div>
							<div class="mp_md_info">
								<div class="mp_md_brand">Saint Laurent</div>
								<div class="mp_md_name">생로랑 모노그램 카바스백</div>
								<div class="mp_md_price">1,383,000 원</div>
							</div>
						</div>
					</a> <a href="#">
						<div class="mp_card">
							<div class="mp_md_img">
								<img
									src="${pageContext.request.contextPath}/resources/img/md_img/md_img.jpg"
									alt="md_img" class="mp_md_img_path">
							</div>
							<div class="mp_md_info">
								<div class="mp_md_brand">Saint Laurent</div>
								<div class="mp_md_name">생로랑 모노그램 카바스백</div>
								<div class="mp_md_price">1,383,000 원</div>
							</div>
						</div>
					</a> <a href="#">
						<div class="mp_card">
							<div class="mp_md_img">
								<img
									src="${pageContext.request.contextPath}/resources/img/md_img/md_img.jpg"
									alt="md_img" class="mp_md_img_path">
							</div>
							<div class="mp_md_info">
								<div class="mp_md_brand">Saint Laurent</div>
								<div class="mp_md_name">생로랑 모노그램 카바스백</div>
								<div class="mp_md_price">1,383,000 원</div>
							</div>
						</div>
					</a> <a href="#">
						<div class="mp_card">
							<div class="mp_md_img">
								<img
									src="${pageContext.request.contextPath}/resources/img/md_img/md_img.jpg"
									alt="md_img" class="mp_md_img_path">
							</div>
							<div class="mp_md_info">
								<div class="mp_md_brand">Saint Laurent</div>
								<div class="mp_md_name">생로랑 모노그램 카바스백</div>
								<div class="mp_md_price">1,383,000 원</div>
							</div>
						</div>
					</a> <a href="#">
						<div class="mp_card">
							<div class="mp_md_img">
								<img
									src="${pageContext.request.contextPath}/resources/img/md_img/md_img.jpg"
									alt="md_img" class="mp_md_img_path">
							</div>
							<div class="mp_md_info">
								<div class="mp_md_brand">Saint Laurent</div>
								<div class="mp_md_name">생로랑 모노그램 카바스백</div>
								<div class="mp_md_price">1,383,000 원</div>
							</div>
						</div>
					</a> <a href="#">
						<div class="mp_card">
							<div class="mp_md_img">
								<img
									src="${pageContext.request.contextPath}/resources/img/md_img/md_img.jpg"
									alt="md_img" class="mp_md_img_path">
							</div>
							<div class="mp_md_info">
								<div class="mp_md_brand">Saint Laurent</div>
								<div class="mp_md_name">생로랑 모노그램 카바스백</div>
								<div class="mp_md_price">1,383,000 원</div>
							</div>
						</div>
					</a> <a href="#">
						<div class="mp_card">
							<div class="mp_md_img">
								<img
									src="${pageContext.request.contextPath}/resources/img/md_img/md_img.jpg"
									alt="md_img" class="mp_md_img_path">
							</div>
							<div class="mp_md_info">
								<div class="mp_md_brand">Saint Laurent</div>
								<div class="mp_md_name">생로랑 모노그램 카바스백</div>
								<div class="mp_md_price">1,383,000 원</div>
							</div>
						</div>
					</a> <a href="#">
						<div class="mp_card">
							<div class="mp_md_img">
								<img
									src="${pageContext.request.contextPath}/resources/img/md_img/md_img.jpg"
									alt="md_img" class="mp_md_img_path">
							</div>
							<div class="mp_md_info">
								<div class="mp_md_brand">Saint Laurent</div>
								<div class="mp_md_name">생로랑 모노그램 카바스백</div>
								<div class="mp_md_price">1,383,000 원</div>
							</div>
						</div>
					</a> <a href="#">
						<div class="mp_card">
							<div class="mp_md_img">
								<img
									src="${pageContext.request.contextPath}/resources/img/md_img/md_img.jpg"
									alt="md_img" class="mp_md_img_path">
							</div>
							<div class="mp_md_info">
								<div class="mp_md_brand">Saint Laurent</div>
								<div class="mp_md_name">생로랑 모노그램 카바스백</div>
								<div class="mp_md_price">1,383,000 원</div>
							</div>
						</div>
					</a>
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