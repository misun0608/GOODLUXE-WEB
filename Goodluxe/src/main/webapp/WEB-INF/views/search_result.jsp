<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.spring.goodluxe.jy.ProductBoardVO"%>
<%@ page import="com.spring.goodluxe.jy.ProductVO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	ArrayList<HashMap<String, Object>> productList = (ArrayList<HashMap<String, Object>>) request
			.getAttribute("productList");
	
	int currentPage = (int) request.getAttribute("currentPage");
	int count = (int) request.getAttribute("count");
	int number = (int) request.getAttribute("number");
	int pageSize = (int) request.getAttribute("pageSize");
	String search_content = (String)request.getAttribute("search_content");
	String orderbywhat = (String)request.getAttribute("orderbywhat");
	System.out.println("jsp파일 orderby = "+ orderbywhat);
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-search_result.css" />
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
						<li class="notice"><img src="img/icons/notice.png"> <a
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
						<img src="img/icons/list-menu_gold.png" alt="mobile_menu">
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
										<li><a href="./itemList.do?il_search_brand=Balenciaga">Armani</a></li>
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
		<br>
		<div id="main">
			<div class="sr_section_area">
				<article class="sr_first">
					<span>'<%= search_content %>'에 대한 검색 결과</span> <span><%=count%> 개의 상품이 검색되었습니다</span>
				</article>
				
				<article class="sr_second">
					<ul>
						<li class="sort on"><a href="searchResult.do?search_content=<%=search_content%>&orderbywhat=recently">최신순</a></li>
						<li class="sort_split"><a href="#">|</a></li>
						<li class="sort"><a href="searchResult.do?search_content=<%=search_content%>&orderbywhat=popular">인기순</a></li>
						<li class="sort_split"><a href="#">|</a></li>
						<li class="sort"><a href="searchResult.do?search_content=<%=search_content%>&orderbywhat=highprice">높은 가격순</a></li>
						<li class="sort_split"><a href="#">|</a></li>
						<li class="sort"><a href="searchResult.do?search_content=<%=search_content%>&orderbywhat=lowprice">낮은 가격순</a></li>
					</ul>
				</article>
				
				<article class = "search_none">
					<%
						if(count == 0){
					%>
						<div class = "research_none_div">
							<p class = "research_none_p1">검색 결과가 없습니다.</p>
						</div>
					<%
						}
					%>
				</article>
				
				<article class="sr_third">
				
				<%
						for (int j = 0; j <productList.size(); j++) {
							HashMap<String,Object>  productHM = new HashMap <String, Object>();	
							productHM = (HashMap<String,Object>)productList.get(j);
							String img_name = (String)productHM.get("pb_main_img_stored");
							String brand_name = (String)productHM.get("pd_brand");
							String product_name = (String)productHM.get("pb_md_name");
							int product_price_nonshaped = Integer.parseInt((productHM.get("sale_price")).toString());
							DecimalFormat df = new DecimalFormat("###,###");
							String product_price_shaped = df.format(product_price_nonshaped);
							
							
					%>
					<a href="#">
						<div class="card">
							<div class="md_img">
								<img src="/Goodluxe/image/<%= img_name%>" alt="md_img"
									class="md_img_path">
							</div>
							<div class="md_info">
								<div class="md_brand"><%= brand_name %></div>
								<div class="md_name"><%= product_name %></div>
								<div class="md_price"><%= product_price_shaped %> 원</div>
							</div>
						</div>
					</a>


					<%
						number--;
						}
					%>

				
				</article>
				<article class="sr_forth">
					<table class="paging">
						<tbody>
							<tr>
								<%
									if (count > 0) {
										int pageCount = ((count - 1) / pageSize) + 1;
										int startPage = 1;
										int i;

										if (currentPage % 10 != 0)
											startPage = (int) (currentPage / 5) * 5 + 1;
										else
											startPage = currentPage - 4;
										int pageBlock = 5;
								%>
								<td class="page_edge"><a
									href="searchResult.do?pageNum=1&pageCount=<%=pageCount%>&search_content=<%=search_content%>&orderbywhat=<%=orderbywhat%>">첫페이지</a></td>
								<td class="page_arrow"><a
									href="searchResult.do?pageNum=<%=startPage - 5%>&pageCount=<%=pageCount%>&search_content=<%=search_content%>&orderbywhat=<%=orderbywhat%>">&lt;&lt;</a></td>
								<%
									for (i = startPage; (i <= startPage + 4) && (i <= pageCount); i++) {
								%>
								<td class="page_normal"><a
									href="searchResult.do?pageNum=<%=i%>&pageCount=<%=pageCount%>&search_content=<%=search_content%>&orderbywhat=<%=orderbywhat%>"
									class="il_now_page"><%=i%></a></td>
								<%
									}
								%>
								<td class="page_arrow"><a
									href="searchResult.do?pageNum=<%=startPage + 5%>&pageCount=<%=pageCount%>&search_content=<%=search_content%>&orderbywhat=<%=orderbywhat%>">&gt;&gt;</a></td>
								<td class="page_edge"><a
									href="searchResult.do?pageNum=<%=pageCount%>&pageCount=<%=pageCount%>&search_content=<%=search_content%>&orderbywhat=<%=orderbywhat%>">끝페이지</a></td>
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