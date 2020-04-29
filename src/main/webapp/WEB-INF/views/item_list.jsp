<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.spring.goodluxe.jy.SellingBoardVO"%>
<%@ page import="com.spring.goodluxe.jy.ProductVO"%>
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
						<img src="${pageContext.request.contextPath}/resources/img/icons/list-menu_gold.png" alt="mobile_menu">
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
							<li><a href="event_page.html">EVENT</a></li>
						</ul>
						<ul class="search">
							<img src="${pageContext.request.contextPath}/resources/img/icons/search_icon_black.png" alt="search"
								class="search_icon" />
							<form action="" method="get" id="search_form">
								<div class="search_area">
									<div class="search_data">ㅁ
										<input type="text" name="" id="" class="search_box"><input
											type="button" value="검색" class="search_btn">
									</div>
									<div class="search_close">
										<img src="${pageContext.request.contextPath}/resources/img/icons/cross-out_black.png" alt="close"
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
					<form action="" id="il_search_form">
						<select name="il_search_brand" id="il_search_brand"
							class="il_search_select_box">
							<option value="all">브랜드</option>
							<option value="Armani">Armani</option>
							<option value="Balenciaga">Balenciaga</option>
							<option value="Bally">Bally</option>
							<option value="Balmain">Balmain</option>
							<option value="Berluti">Berluti</option>
							<option value="Bottega">Bottega Veneta</option>
							<option value="BOUCHERON">BOUCHERON</option>
							<option value="Breguet">Breguet</option>
							<option value="BREITLING">BREITLING</option>
							<option value="Brunello">Brunello Cucinelli</option>
							<option value="Burberrys">Burberrys</option>
							<option value="Bvlgari">Bvlgari</option>
							<option value="Cartier">Cartier</option>
							<option value="Celine">Celine</option>
							<option value="Chanel">Chanel</option>
							<option value="Christian">Christian Dior</option>
							<option value="Christian">Christian louboutin</option>
							<option value="CHRONOSWISS">CHRONOSWISS</option>
							<option value="Coach">Coach</option>
							<option value="Colombo">Colombo</option>
							<option value="Comme des Garcons">Comme des Garcons</option>
							<option value="Damiani">Damiani</option>
							<option value="DELVAUX">DELVAUX</option>
							<option value="Dior Homme">Dior Homme</option>
							<option value="Dolce&Gabbana">Dolce&Gabbana</option>
							<option value="Dries Van Noten">Dries Van Noten</option>
							<option value="Dsquared2">Dsquared2</option>
							<option value="DVF">DVF</option>
							<option value="Ermanno Scervino">Ermanno Scervino</option>
							<option value="Etro">Etro</option>
							<option value="Fendi">Fendi</option>
							<option value="Ferragamo">Ferragamo</option>
							<option value="For Man">For Man</option>
							<option value="Franck">Franck Muller</option>
							<option value="Fred">Fred</option>
							<option value="Giuseppe Zanotti">Giuseppe Zanotti</option>
							<option value="Giambattista Valli">Giambattista Valli</option>
							<option value="Givenchy">Givenchy</option>
							<option value="Goyard">Goyard</option>
							<option value="Gucci">Gucci</option>
							<option value="HarryWinston">HarryWinston</option>
							<option value="Helen Kaminski">Helen Kaminski</option>
							<option value="Hermes">Hermes</option>
							<option value="HUBLOT">HUBLOT</option>
							<option value="Isabel Marant">Isabel Marant</option>
							<option value="Jimmy Choo">Jimmy Choo</option>
							<option value="Louis Vuitton">Louis Vuitton</option>
							<option value="Manolo Blahnik">Manolo Blahnik</option>
							<option value="Maje">Maje</option>
							<option value="Marc by Marc Jacobs">Marc by Marc Jacobs</option>
							<option value="Marc Jacobs">Marc Jacobs</option>
							<option value="Marni">Marni</option>
							<option value="Martin Margiella">Martin Margiella</option>
							<option value="Max Mara">Max Mara</option>
							<option value="Michael kors">Michael kors</option>
							<option value="Miu Miu">Miu Miu</option>
							<option value="MONCLERE">MONCLERE</option>
							<option value="MontBlanc">MontBlanc</option>
							<option value="Moschino">Moschino</option>
							<option value="Mulberry">Mulberry</option>
							<option value="OMEGA">OMEGA</option>
							<option value="Prada">Prada</option>
							<option value="Proenza schouler">Proenza schouler</option>
							<option value="Rick owens">Rick owens</option>
							<option value="ROCHAS">ROCHAS</option>
							<option value="ROGER DUBUIS">ROGER DUBUIS</option>
							<option value="Roger Vivier">Roger Vivier</option>
							<option value="Rolex">Rolex</option>
							<option value="Sacai">Sacai</option>
							<option value="See by Chloe">See by Chloe</option>
							<option value="Stella McCartney">Stella McCartney</option>
							<option value="Stuart Weitzman">Stuart Weitzman</option>
							<option value="Syaring">Syaring</option>
							<option value="Tagheuer">Tagheuer</option>
							<option value="Tasaki">Tasaki</option>
							<option value="THOM BROWNE">THOM BROWNE</option>
							<option value="Tiffany">Tiffany</option>
							<option value="Tod's">Tod's</option>
							<option value="Tom ford">Tom ford</option>
							<option value="Tory burch">Tory burch</option>
							<option value="Valentino">Valentino</option>
							<option value="Valexstra">Valexstra</option>
							<option value="Vanessa Bruno">Vanessa Bruno</option>
							<option value="Vivienne westwood">Vivienne westwood</option>
							<option value="YSL Rive Gauche">YSL Rive Gauche</option>
							<option value="Zadig&Voltaire">Zadig&Voltaire</option>
							<option value="etc">그 외 브랜드</option>
						</select> <select name="il_search_category" id="il_search_category"
							class="il_search_select_box">
							<option value="all">카테고리</option>
							<option value="CLOTHES">CLOTHES</option>
							<option value="JEWELRY">JEWELRY</option>
							<option value="WATCH">WATCH</option>
							<option value="BAG">BAG</option>
							<option value="WALLET">WALLET</option>
							<option value="GLASSES">GLASSES</option>
							<option value="SHOES">SHOES</option>
						</select> <select name="il_search_grade" id="il_search_grade"
							class="il_search_select_box">
							<option value="all">등급</option>
							<option value="NS">NS</option>
							<option value="A">A</option>
							<option value="B">B</option>
						</select> <select name="il_search_price" id="il_search_price"
							class="il_search_select_box">
							<option value="all">가격</option>
							<option value="lt10">10만원 미만</option>
							<option value="10to50">10만원 이상 ~ 50만원 미만</option>
							<option value="50to100">50만원 이상 ~ 100만원 미만</option>
							<option value="100to200">100만원 이상 ~ 200만원 미만</option>
							<option value="200to300">200만원 이상 ~ 300만원 미만</option>
							<option value="300to400">300만원 이상 ~ 400만원 미만</option>
							<option value="400to500">400만원 이상 ~ 500만원 미만</option>
							<option value="gt500">500만원 이상</option>
						</select> <input type="submit" value="검색" class="il_search_btn">
					</form>
				</article>
				<article class="il_2nd">
					<% for( int i = 0; i<12; i++){ %>
					<a href="#">
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
					</a> 
					<% }//포문1닫힘 %>
				</article>
				<article class="il_3rd">
					<table class="il_paging">
						<tbody>
							<tr>
								<td><a href="#">&lt;&lt;</a></td>
								<td><a href="#" class="il_now_page">1</a></td>
								<td><a href="#">2</a></td>
								<td><a href="#">3</a></td>
								<td><a href="#">4</a></td>
								<td><a href="#">5</a></td>
								<td><a href="#">&gt;&gt;</a></td>
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