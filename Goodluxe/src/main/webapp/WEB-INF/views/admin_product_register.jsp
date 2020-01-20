<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>관리자 판매상품 등록</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_design_all.css">
	<script type="text/javascript" src="http://dev.axisj.com/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="http://dev.axisj.com/dist/AXJ.min.js"></script>
</head>
<body>

	<div id="hd_login_msg">
		최고관리자 최고관리자님 로그인 중 <a href="http://watches.zak.kr/bbs/logout.php">로그아웃</a>
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
					src="http://watches.zak.kr/adm/img/logo.png" alt="이건어디서바꾸나 관리자"></a>
			</div>

			<div id="tnb">
				<ul>
					<li class="tnb_li"><a href="#" class="tnb_service"
						target="_blank"><img src="${pageContext.request.contextPath}/resources/img/admin_menu/home.png" width="25px"></a></li>
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
									class="gnb_2da  ">게시판 판매 관리</a></li>
								<li data-menu="300250"><a href="./adminrudao.html"
									class="gnb_2da  ">게시판 경매 관리</a></li>
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
						title="쇼핑몰현황/기타">사이트몰 현황/ 기타</button>
					<div class="gnb_oparea_wr">
						<div class="gnb_oparea">
							<h3>사이트몰 현황/기타</h3>
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
	<script>
  jQuery(function($){
  
      var menu_cookie_key = 'g5_admin_btn_gnb';
  
      $(".tnb_mb_btn").click(function(){
          $(".tnb_mb_area").toggle();
      });
  
      $("#btn_gnb").click(function(){
          
          var $this = $(this);
  
          try {
              if( ! $this.hasClass("btn_gnb_open") ){
                  set_cookie(menu_cookie_key, 1, 60*60*24*365);
              } else {
                  delete_cookie(menu_cookie_key);
              }
          }
          catch(err) {
          }
  
          $("#container").toggleClass("container-small");
          $("#gnb").toggleClass("gnb_small");
          $this.toggleClass("btn_gnb_open");
  
      });
  
      $(".gnb_ul li .btn_op" ).click(function() {
          $(this).parent().addClass("on").siblings().removeClass("on");
      });
  
  });
  </script>


	<div id="wrapper">

		<div id="container" class="container-small">

			<h1 id="container_title">관리자 판매 페이지</h1>
			<div class="container_wr">

					<br> <br>
					<h3>▶ 기본 정보 입력</h3>
					<br>
					<table class="impormation" border="1">
						<tr>
							<td class="td1">브랜드</td>
							<td class="td2"><input name="brand_name" class="text1"></td>
						</tr>
						<tr>
							<td class="td1">상품명</td>
							<td class="td2"><input name="product_name" class="text1"></td>
						</tr>
						<tr>
							<td class="td1">상품 등급</td>
							<td class="td2"><input name="product_grade" class="text1"></td>
						</tr>
						<tr>
							<td class="td1">판매가</td>
							<td class="td2"><input name="selling_price" class="text1"></td>
						</tr>
						<tr>
						<tr height="200px">
							<td class="td1">상품 상세 설명</td>
							<td class="td2"><input name="product_detail" class="text1"></td>
						</tr>
						<tr>
							<td class="td1">판매 상태</td>
							<td class="td2">&nbsp;
								<input type="radio" name = "selling_status"/> 전체&nbsp; 
								<input type="radio" name = "selling_status"/> 판매 중&nbsp; 
								<input type="radio" name = "selling_status"/> 거래 진행중&nbsp; 
								<input type="radio" name = "selling_status"/> 판매 완료&nbsp;
							</td>
						</tr>
						<tr>
							<td class="td1">게시 상태</td>
							<td class="td2">&nbsp;
								<input type="radio" name = "onboard_status"/> 전체&nbsp; 
								<input type="radio" name = "onboard_status"/> 게시 중&nbsp; 
								<input type="radio" name = "onboard_status"/> 게시 안함&nbsp;
							</td>
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
									<input type="file" name = "product_main_img"class="form-control-file"
										id="exampleInputFile" aria-describedby="fileHelp">
								</div>
							</td>

						</tr>
						<tr>
							<td class="td1">상세 이미지</td>
							<td class="td2"><div class="form-group" align="right">
									<input type="file" name = "product_detail_img" class="form-control-file"
										id="exampleInputFile" aria-describedby="fileHelp">
								</div></td>

						</tr>
					</table>

					<br> <br> <br> <br> <br> <br>

					<div align="center">
						<button type="button" class="btn3" name="reset">취소</button>
						<button type="button" class="btn4">등록</button>
					</div>
			</div>

		</div>
	</div>

	<footer class="container-fluid">
		<p>Footer Text</p>
	</footer>


</body>
</html>