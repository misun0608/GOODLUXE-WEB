<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin_design_all.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.menu.js"></script>
<title>Insert title here</title>
</head>
<body>
	<header id="hd">
		<div id="hd_top">
			<button type="button" id="btn_gnb" class="btn_gnb_close btn_gnb_open"></button>
			<div id="logo">
				<a href="./adminMain.html"><img src="./img/logo.png"></a>
			</div>

			<div id="tnb">
				<ul>
					<li class="tnb_li"><a href="#" class="tnb_service"
						target="_blank"><img src="./img/home.png" width="25px"></a></li>
				</ul>
			</div>
		</div>
		<nav id="gnb" class="gnb_large gnb_small">

			<ul class="gnb_ul">
				<li class="gnb_li">
					<button type="button" class="btn_op menu-200 menu-order-2"
						title="회원관리">회원관리</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>회원관리</h3>
							<ul>
								<li><a href="./admincustomermanagement.html"
									class="gnb_2da  ">회원관리</a></li>
								<li><a href="./adminpointmanagement.html"
									class="gnb_2da  gnb_grp_div">적립금관리</a></li>
								<li><a href="./admincouponmanagement.html"
									class="gnb_2da  ">쿠폰관리</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="gnb_li">
					<button type="button" class="btn_op menu-900 menu-order-2"
						title="회원관리">상품관리</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>상품관리</h3>
							<ul>
								<li><a href="#" class="gnb_2da">매입 상품 등록</a></li>
								<li><a href="#" class="gnb_2da">위탁 상품 등록</a></li>
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
								<li><a href="./adminpostmanagement.html" class="gnb_2da  ">게시판관리</a></li>
								<li><a href="./adminvksao.html" class="gnb_2da  ">게시판
										판매 등록</a></li>
								<li><a href="./adminrudao.html" class="gnb_2da  ">게시판
										경매 등록</a></li>
								<li><a href="#" class="gnb_2da  gnb_grp_div">Q&A관리</a></li>
								<li><a href="#" class="gnb_2da gnb_grp_style ">FAQ관리</a></li>
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
								<li><a href="./adminorderproduct.html"
									class="gnb_2da gnb_grp_style gnb_grp_div">주문목록</a></li>
								<li><a href="./adminorderproduct_cancel.html"
									class="gnb_2da gnb_grp_style gnb_grp_div">주문취소</a></li>
								<li><a href="./adminorderproduct_refund.html"
									class="gnb_2da gnb_grp_style gnb_grp_div">주문 반품</a></li>
								<li><a href="./adminorderproduct_return.html"
									class="gnb_2da gnb_grp_style gnb_grp_div">주문 환불</a></li>
								<li><a href="./adminorderproduct_customermanagement.html"
									class="gnb_2da gnb_grp_style ">주문 고객 관리</a></li>
								<li><a href="./adminproductregister.html" class="gnb_2da  ">상품등록</a></li>
								<li><a href="./admindelivermanagement.html"
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
								<li><a href="./adminMain.html" class="gnb_2da  ">매출현황</a></li>
								<li><a href="./admindelivermanagement.html"
									class="gnb_2da ">배송관리</a></li>
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

			<h1 id="container_title">관리자 판매 페이지</h1>
			<div class="container_wr">

				<form name="input_form" action="./postUploadAction.do" method="post" enctype ="multipart/form-data">
					<br> <br>
					<h3>▶ 기본 정보 입력</h3>
					<br>
					<table class="impormation" border="1">
						<tr>
							<td class="td1">게시글 분류</td>
							<td class="td2">
								<select name = "pb_division"> 
									<option value = "purchase">매입</option>
									<option value = "consign">위탁</option>
								</select>
							</td>
						</tr>
  						<tr>
							<td class="td1">상품개체번호</td>
							<td class="td2"><input name="entity_number" class="text1"></td>
						</tr>

						<tr>
							<td class="td1">제품이름</td>
							<td class="td2"><input name="pb_md_name" class="text1"></td>
						</tr>
						<tr>
							<td class="td1">판매상태</td>
							<td class="td2">
								<input type = "radio" name = "pb_sale_status" value = "onsale">판매중
								<input type = "radio" name = "pb_sale_status" value = "inprogress">거래진행중
								<input type = "radio" name = "pb_sale_status" value = "sold"> 판매완료
								
							</td>
						</tr>
						<tr>
							<td class="td1">게시상태</td>
							<td class="td2">
								<input type = "radio" name = "pb_post_status" value = "onboard">게시중
								<input type = "radio" name = "pb_post_status" value = "offboard">게시안함
							</td>
						</tr>
						<tr>
						<tr height="200px">
							<td class="td1">상품 상세 설명</td>
							<td class="td2"><textarea name = "pb_detail"></textarea></td>
						</tr>
					</table>
					<br> <br>
	
					<h3>▶ 이미지 등록</h3>
					<br>
					<table class="impormation" border="1">
						<tr>
							<td class="td1">대표 이미지</td>
							<td class="td2">
								<div class="form-group" align="right">
									<input type="file" name = "pb_detail_img" class="form-control-file"
										id="exampleInputFile" aria-describedby="fileHelp">
								</div>
							</td>
	
						</tr>
						<tr>
							<td class="td1">상세 이미지</td>
							<td class="td2">
								<div class="form-group" align="right">
									<input type="file" name = "pb_main_img" class="form-control-file"
										id="exampleInputFile" aria-describedby="fileHelp">
								</div>
							</td>
						</tr> 
					</table>
	
					<br> <br> <br> <br> <br> <br>
	
					<div align="center">
						<input type="reset" class="btn3" value = "취소">
						<input type="submit" class="btn4" value = "등록">
					</div>
				</form>
			</div>
		</div>
	</div>




	<footer class="container-fluid">
		<p>Footer Text</p>
	</footer>
</body>
</html>