<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div id="hd_top">
			<button type="button" id="btn_gnb" class="btn_gnb_close btn_gnb_open"></button>
			<div id="logo">
				<a href="./admin_main.do"><img
					src="${pageContext.request.contextPath}/resources/img/admin_img/logo.png"></a>
			</div>

			<div id="tnb">
				<ul>
					<li class="tnb_li">
						<a href="./mainPage.do" class="tnb_service" target="_blank";>
							<img src="${pageContext.request.contextPath}/resources/img/admin_img/home.png" width="25px">
						</a>
					</li>
				</ul>
			</div>
		</div>
		
		<nav id="gnb" class="gnb_large gnb_small">
			<ul class="gnb_ul">
				<li class="gnb_li">
					<button type="button" class="btn_op menu-200 menu-order-2">회원관리</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>회원관리</h3>
							<ul>
								<li>
									<a href="./adminCoupon.do" class="gnb_2da gnb_grp_div">쿠폰관리</a>
								</li>
								<li>
									<a href="./pointView.do" class="gnb_2da gnb_grp_div">적립금관리</a>
								</li>
								<li>
									<a href="./adminCustomer.do" class="gnb_2da gnb_grp_div">블랙리스트관리</a>
								</li>
							</ul>
						</div>
					</div>
				</li>
				<li class="gnb_li">
					<button type="button" class="btn_op menu-900 menu-order-2">상품관리</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>상품관리</h3>
							<ul>
								<li>
									<a href="./adminProduct.do" class="gnb_2da gnb_grp_div">상품관리</a>
								</li>
								<li>
									<a href="./adminProductRegisterPurchase.do" class="gnb_2da gnb_grp_div">매입상품등록</a>
								</li>
								<li>
									<a href="./adminProductRegisterConsign.do" class="gnb_2da gnb_grp_div">위탁상품등록</a>
								</li>
							</ul>
						</div>
					</div>
				</li>
				<li class="gnb_li">
					<button type="button" class="btn_op menu-300 menu-order-3">게시판관리</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>게시판관리</h3>
							<ul>
								<li>
									<a href="./adminPostUpload.do" class="gnb_2da gnb_grp_div">판매글등록</a>
								</li>
								<li>
									<a href="./admin_auction.do" class="gnb_2da gnb_grp_div">경매글등록</a>
								</li>
							</ul>
						</div>
					</div>
				</li>
				<li class="gnb_li">
					<button type="button" class="btn_op menu-400 menu-order-4">쇼핑몰관리</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>주문관리</h3>
							<ul>
								<li>
									<a href="./adminOrder.do" class="gnb_2da gnb_grp_div">주문관리</a>
								</li>
								<li>
									<a href="./adminReturn.do" class="gnb_2da gnb_grp_div">반품관리</a>
								</li>
							</ul>
						</div>
					</div>
				</li>
				<li class="gnb_li">
					<button type="button" class="btn_op menu-500 menu-order-5">쇼핑몰현황/기타</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>쇼핑몰현황/기타</h3>
							<ul>
								<li>
									<a href="./admin_main.do" class="gnb_2da">매출현황</a>
								</li>
								<li>
									<a href="./adminAutionManager.do" class="gnb_2da">경매감독</a>
								</li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</nav>
</body>
</html>