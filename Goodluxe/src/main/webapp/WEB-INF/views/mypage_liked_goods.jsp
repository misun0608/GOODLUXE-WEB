<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>





<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="viewport"
	content="user-scalable=no,width=device-width, initial-scale=1.0" />

<title>GOODLUXE :: 굿럭스</title>

<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script>
	$(document).ready(function() {
		$("#header").load("header.do");
		$("#nav_bar").load("navBar.do");
		$("#login_box").load("loginBox.do");
		$("#footer").load("footer.do");
	});
</script>


<!--  my_page_liked_goods   -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage_onlymenu.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage_liked_goods.css" />




</head>
<body>
	<header id="header"></header>

	<nav id="nav_bar"></nav>

	<div class="login_bg" id="login_box"></div>

	<section id="container">
		<br>
		<div id="main">
			<article class="arti_menu" id="mypage_menu"></article>

			<center>
				<div id="liked_goods_cover">
					<center>
						<div id="liked_goods_cover2">
							<div class="liked_goods_announce">
								<p>
									- 관심 상품이 판매되면 목록에서 자동으로 삭제됩니다.<br /> - 각 상품별로 주문 가능하며, 묶음배송 외
									택배비는 각각 부담됩니다.
								</p>
							</div>
							<br />
							<table id="liked_goodslist" border="1">
								<thead>
									<tr class="liked_goods_top_tr">
										<td class="liked_goods_top_td"><input type="checkbox"
											id="chk_all"></td>
										<td class="liked_goods_top_td img_td">이미지</td>
										<td class="liked_goods_top_td">상품명</td>
										<td class="liked_goods_top_td">상품구매금액</td>
										<td class="liked_goods_top_td">등급</td>
										<td class="liked_goods_top_td liked_goods_btn_td">선택</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox" class="chk"></td>
										<td class="liked_goods_img_td"><img
											src="img/md_img/wallet2.jpg" alt="샤넬 장지갑" width="150px">
										</td>
										<td>샤넬 장지갑</td>
										<td>3,250,000원</td>
										<td>A</td>
										<td class="liked_goods_btn_td"><input type="button"
											class="liked_goods_btn" value="주문"><br /> <input
											type="button" class="liked_goods_btn" value="삭제"></td>
									</tr>
								</tbody>
							</table>
							<div class="liked_goods_btnpart">
								<input type="button"
									class="liked_goods_btn liked_goods_deletebtn" value="선택 상품 삭제">
							</div>
							<!-- 페이징 부분 -->
							<center>
								<div class="liked_goods_page">
									<ul class="pagination modal">
										<li><a href="#" class="page_first">처음 페이지</a></li>
										<li><a href="#" class="arrow left"><<</a></li>
										<li><a href="#" class="active num">1</a></li>
										<li><a href="#" class="num">2</a></li>
										<li><a href="#" class="num">3</a></li>
										<li><a href="#" class="num">4</a></li>
										<li><a href="#" class="num">5</a></li>
										<li><a href="#" class="num">6</a></li>
										<li><a href="#" class="num">7</a></li>
										<li><a href="#" class="num">8</a></li>
										<li><a href="#" class="num">9</a></li>
										<li><a href="#" class="arrow right">>></a></li>
										<li><a href="#" class="page_last">끝 페이지</a></li>
									</ul>
								</div>
							</center>
						</div>
					</center>
				</div>
			</center>
		</div>
	</section>

	<footer id="footer"> </footer>
</body>
</html>