<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>관리자메인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin_design_all.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.menu.js"></script>
</head>
<body>

	<div id="hd_login_msg">
		최고관리자 최고관리자님 로그인 중 <a href="#">로그아웃</a>
	</div>


	<div id="to_content">
		<a href="#container">본문 바로가기</a>
	</div>

	<header id="hd">
		<h1>관리자메인</h1>
		<div id="hd_top">
			<button type="button" id="btn_gnb" class="btn_gnb_close btn_gnb_open"></button>
			<div id="logo">
				<a href="./adminMain.html"><img
					src="${pageContext.request.contextPath}/resources/img/admin_menu/logo.png"
					alt="이건어디서바꾸나 관리자"></a>
			</div>

			<div id="tnb">
				<ul>
					<li class="tnb_li"><a href="#" class="tnb_service"
						target="_blank"><img
							src="${pageContext.request.contextPath}/resources/img/admin_menu/home.png"
							width="25px"></a></li>
				</ul>

			</div>
		</div>
		<nav id="gnb" class="gnb_large gnb_small">
			<h2>관리자 주메뉴</h2>
			<ul class="gnb_ul">
				<li class="gnb_li">
					<button type="button" class="btn_op menu-200 menu-order-2"
						title="회원관리">회원관리</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>회원관리</h3>
							<ul>
								<li data-menu="200100"><a
									href="./admincustomermanagement.html" class="gnb_2da  ">회원관리</a></li>
								<li data-menu="200200"><a
									href="./adminpointmanagement.html" class="gnb_2da  gnb_grp_div">적립금관리</a></li>
								<li data-menu="200900"><a
									href="./admincouponmanagement.html" class="gnb_2da  ">쿠폰관리</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="gnb_li">
					<button type="button" class="btn_op menu-300 menu-order-3"
						title="게시판관리">게시판관리</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>게시판관리</h3>
							<ul>
								<li data-menu="300100"><a href="./adminpostmanagement.html"
									class="gnb_2da  ">게시판관리</a></li>
								<li data-menu="300200"><a href="./adminvksao.html"
									class="gnb_2da  ">게시판 판매 등록</a></li>
								<li data-menu="300250"><a href="./adminrudao.html"
									class="gnb_2da  ">게시판 경매 등록</a></li>
								<li data-menu="300500"><a href="#"
									class="gnb_2da  gnb_grp_div">Q&A관리</a></li>
								<li data-menu="300700"><a href="#"
									class="gnb_2da gnb_grp_style ">FAQ관리</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="gnb_li">
					<button type="button" class="btn_op menu-400 menu-order-4"
						title="쇼핑몰관리">몰관리</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>사이트 관리</h3>
							<ul>
								<li data-menu="400400"><a href="./adminorderproduct.html"
									class="gnb_2da gnb_grp_style gnb_grp_div">주문목록</a></li>
								<li data-menu="400410"><a
									href="./adminorderproduct_cancel.html"
									class="gnb_2da gnb_grp_style gnb_grp_div">주문취소</a></li>
								<li data-menu="400420"><a
									href="./adminorderproduct_refund.html"
									class="gnb_2da gnb_grp_style gnb_grp_div">주문 반품</a></li>
								<li data-menu="400430"><a
									href="./adminorderproduct_return.html"
									class="gnb_2da gnb_grp_style gnb_grp_div">주문 환불</a></li>
								<li data-menu="400440"><a
									href="./adminorderproduct_customermanagement.html"
									class="gnb_2da gnb_grp_style ">주문 고객 관리</a></li>
								<li data-menu="400300"><a
									href="./adminproductregister.html" class="gnb_2da  ">상품등록</a></li>
								<li data-menu="400700"><a
									href="./admindelivermanagement.html"
									class="gnb_2da gnb_grp_style gnb_grp_div">배송관리</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="gnb_li">
					<button type="button" class="btn_op menu-500 menu-order-5"
						title="쇼핑몰현황/기타">쇼핑몰현황/기타</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>쇼핑몰현황/기타</h3>
							<ul>
								<li data-menu="500110"><a href="./adminMain.html"
									class="gnb_2da  ">매출현황</a></li>
								<li data-menu="500130"><a
									href="./admindelivermanagement.html" class="gnb_2da ">배송관리</a></li>

							</ul>
						</div>
					</div>
				</li>
			</ul>
		</nav>

	</header>
	<script src="http://code.jquery.com/jquery-latest.js"></script>



	<div id="wrapper">

		<div id="container" class="container-small">

			<h1 id="container_title">위탁상품 등록 페이지</h1>
			<div class="container_wr">
				<form name="input_form" action="./consRegiAction.do" method="post">

					<br> <br>
					<h3>▶ 기본 정보 입력</h3>
					<br>
					<table class="impormation" border="1">
<!-- 					<tr>
							<td class="td1">상품개체번호(개체고유번호)</td>
							<td class="td2"><input type="text" name="entity_number"
								class="text1"></td>
						</tr>
-->
						<tr>
							<td class="td1">상품명</td>
							<td class="td2"><input type="text" name="pd_name"
								class="text1"></td>
						</tr>
						<tr>
							<td class="td1">브랜드번호</td>
							<td class="td2"><select name="pd_brand"
								class="search">
									<option value="Cartier">Cartier</option>
									<option value="Dior">Dior</option>
									<option value="Etro">Etro</option>
									<option value="Givenchy">Givenchy</option>
									<option value="Gucci">Gucci</option>
									<option value="Hermes">Hermes</option>
									<option value="Jimmy Choo">Jimmy Choo</option>
									<option value="Louis Vuitton">Louis Vuitton</option>
									<option value="OM5552">OMEGA</option>
									<option value="OMEGA">Prada</option>
									<option value="Rolex">Rolex</option>
									<option value="Tiffany">Tiffany</option>
									<option value="Vivienne Westwood">Vivienne Westwodd</option>
							</select></td>
						</tr>
						<tr>
							<td class="td1">카테고리 번호</td>
							<td class="td2"><select name="pd_category" class="search">
									<option value="CLOTHES">CLOTHES</option>
									<option value="JEWELRY">JEWELRY</option>
									<option value="WATCH">WATCH</option>
									<option value="BAG">BAG</option>
									<option value="WALLET">WALLET</option>
									<option value="GLASSES">GLASSES</option>
									<option value="SHOES">SHOES</option>
							</select></td>
						</tr>
						<tr>
							<td class="td1">상품 등급</td>
							<td class="td2"><select name="quality_grade" class="search">
									<option value="none">등급 선택</option>
									<option value="NS">NS</option>
									<option value="A">A</option>
									<option value="B">B</option>
							</select></td>
						</tr>
						<tr>
							<td class="td1">판매가격</td>
							<td class="td2"><input type="text" name="sale_price"
								class="text1"></td>
						</tr>
						<tr>
							<td class="td1">수수료</td>
							<td class="td2"><input type="text" name="commission"
								class="text1"></td>
						</tr>
						<tr>
							<td class="td1">위탁기간</td>
							<td class="td2">
								<input type="date" name="start_date_text" class="search">&nbsp;&nbsp;&nbsp;&nbsp;
								~ &nbsp; 
								<input type="date" name="end_date_text" class="search"></td>
						</tr>
						<tr>
							<td class="td1">판매상태</td>
							<td class="td2">&nbsp;&nbsp;&nbsp;
								<input type="radio" name="sale_status" value="onready">판매준비&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="sale_status" value="onsale">판매중&nbsp;&nbsp;&nbsp; 
								<input type="radio"name="sale_status" value="sold">판매완료&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="sale_status" value="payed">대금지불완료&nbsp;&nbsp;&nbsp;
						</tr>
						<tr>
							<td class="td1">감정서 유무</td>
							<td class="td2">&nbsp;&nbsp;&nbsp;<input type="radio"
								name="appraise_exist" value="O">
								&nbsp;유&nbsp;&nbsp;&nbsp; <input type="radio"
								name="appraise_exist" value="X"> &nbsp;무&nbsp;
							</td>
						</tr>
						<tr>
							<td class="td1">제품 구성품</td>
							<td class="td2"><input type="text" name="pd_component"
								class="text1"></td>
						</tr>
						<tr>
							<td class="td1">판매자 아이디</td>
							<td class="td2"><input type="text" name="member_id"
								class="text1"></td>
						</tr>
					</table>
					<br> <br>
					<div align="center">
						<input type="reset" class="btn3" name="reset" value = "취소"/>
						<input type="submit" class="btn4" name = "submit" value = "등록"/>
						<br> <br> <br> <br>
					</div>
				</form>
			</div>
		</div>

		<footer class="container-fluid">
			<p>Footer Text</p>
		</footer>
</body>
</html>