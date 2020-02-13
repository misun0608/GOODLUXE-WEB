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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script>
	function checkAll(){
		var chk_all = document.getElementById("chk_all");
		var input = document.getElementsByTagName("input");
		
		if(chk_all.checked === true){
			for(var i=0; i<input.length; i++){
				if(input[i].type == "checkbox" && input[i].id =="chk_one"&&input[i].checked==false){
					input[i].checked=true;
				}
			}
		}
		if(chk_all.checked === false){
			for(var i=0; i<input.length; i++){
				if(input[i].type == "checkbox" && input[i].id =="chk_one"&&input[i].checked==true){
					input[i].checked=false;
				}
			}
		}
	}

</script>

<script>

$(document).ready(function() {
	function date_format(format) {
		var year = format.getFullYear();
		var month = format.getMonth() + 1;
		if(month<10) {
		   month = '0' + month;
		}
		var date = format.getDate();
		if(date<10) {
		   date = '0' + date;
		}
		return year + "-" + month + "-" + date;
	}

	function selectData() {
		var division_chk = $(':radio[name="pb_division"]:checked').val();
		var params = {"pb_division":division_chk};
		
		$('#output').empty();
			$.ajax({
				url:'/goodluxe/adminAllProductList.do',
				type:'POST',
				data : params,
				dataType : "json", 
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success:function(data) { 
					if(division_chk=="purchase"){
						var output = '<tr class="tr1">'
							+'<td class="td3"><input type="checkbox" id = "chk_all" onclick = "checkAll();"></td>'
							+'<td class="td4">상품번호</td>'
							+'<td class="td4">상품이름</td>'
							+'<td class="td4">브랜드</td>'
							+'<td class="td4">카테고리</td>'
							+'<td class="td4">상품 등급</td>'
							+'<td class="td4">감정서 유무</td>'
							+'<td class="td4">제품 구성품</td>'
							+'<td class="td4">판매 가격</td>'
							+'<td class="td4">매입 가격</td>'
							+'<td class="td4">매입일</td>'
							+'<td class="td4">판매자 아이디</td>'
							+'<td class="td4">판매상태</td>'
							+'<td class="td4">게시상태</td>'
							+'</tr>';
						$.each(data, function(index, item) {
							var purc_date1 = new Date(item.purc_date);
							var purc_date_shaped = date_format(purc_date1);
							output += '<tr class="tr2">';
							output += '<td class="td3"><input type="checkbox" name="delete_this" id = "chk_one" value = "'+item.entity_number+'"></td>';
							output += '<td>'+item.entity_number+'</td>';
							output += '<td>'+item.pd_name+'</td>';
							output += '<td>'+item.pd_brand+'</td>';
							output += '<td>'+item.pd_category+'</td>';
							output += '<td>'+item.quality_grade+'</td>';
							output += '<td>'+item.appraise_exist+'</td>';
							output += '<td>'+item.pd_component+'</td>';
							output += '<td>'+item.sale_price+'</td>';
							output += '<td>'+item.buying_price+'</td>';
							output += '<td>'+purc_date_shaped+'</td>';
							output += '<td>'+item.member_id+'</td>';
							output += '<td>'+item.pb_sale_status;
							output += '<button id = "chg_sale_stat_btn" value = "'+item.entity_number+'">상태변경</button></td>';
							output += '<td>'+item.pb_post_status;
							output += '&nbsp;<button id="chg_post_stat_btn" value = "'+item.entity_number+'">상태변경</button></td>';
							output += '</tr>';
						});
						console.log("output:" + output);
						$('#output').append(output);//뒤에 이어붙이기
					}else{
						var output = '<tr class="tr1">'
							+'<td class="td3"><input type="checkbox" id = "chk_all" onclick = "checkAll();"></td>'
							+'<td class="td4">상품번호</td>'
							+'<td class="td4">상품이름</td>'
							+'<td class="td4">브랜드</td>'
							+'<td class="td4">카테고리</td>'
							+'<td class="td4">상품 등급</td>'
							+'<td class="td4">감정서 유무</td>'
							+'<td class="td4">제품 구성품</td>'
							+'<td class="td4">판매 가격</td>'
							+'<td class="td4">수수료</td>'
							+'<td class="td4">위탁기간</td>'
							+'<td class="td4">위탁인 아이디</td>'
							+'<td class="td4">판매상태</td>'
							+'<td class="td4">게시상태</td>'
							+'</tr>';
						$.each(data, function(index, item) {
							var start_date1 = new Date(item.start_date);
							var start_date_shaped = date_format(start_date1);
							var end_date1 = new Date(item.end_date);
							var end_date_shaped = date_format(end_date1);
							
							output += '<tr class="tr2">';
							output += '<td class="td3"><input type="checkbox" name="delete_this" id = "chk_one" value = "'+item.entity_number+'"></td>';
							output += '<td>'+item.entity_number+'</td>';
							output += '<td>'+item.pd_name+'</td>';
							output += '<td>'+item.pd_brand+'</td>';
							output += '<td>'+item.pd_category+'</td>';
							output += '<td>'+item.quality_grade+'</td>';
							output += '<td>'+item.appraise_exist+'</td>';
							output += '<td>'+item.pd_component+'</td>';
							output += '<td>'+item.sale_price+'</td>';
							output += '<td>'+item.commission+'</td>';
							output += '<td>'+start_date_shaped+'  ~  '+end_date_shaped+'</td>';
							output += '<td>'+item.member_id+'</td>';
							output += '<td>'+item.pb_sale_status;
							output += '<button id = "chg_sale_stat_btn" value = "'+item.entity_number+'">상태변경</button></td>';
							output += '<td>'+item.pb_post_status;
							output += '&nbsp;<button id="chg_post_stat_btn" value = "'+item.entity_number+'">상태변경</button></td>';
							output += '</tr>';
						});	
						console.log("output:" + output);
						$('#output').append(output);//뒤에 이어붙이기
					}
					
					
				},
			 	error:function() {
					alert("리스트 ajax통신 실패!!!");
				}	
				});
		}

	$('input[name=pb_division]:eq(0)').click(function(event){
		selectData();
	});
	$('input[name=pb_division]:eq(1)').click(function(event){
		selectData();
	});

	$('#search_btn').click(function(event){
		var division_chk = $(':radio[name="pb_division"]:checked').val();
		var params = $('#filteringform').serialize();
		
		$('#output').empty();
		jQuery.ajax({
			url : '/goodluxe/adminProductList.do',
			type : 'POST',
			data : params,
			dataType:"json",
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success:function(data) { 
				if(division_chk=="purchase"){
					var output = '<tr class="tr1">'
						+'<td class="td3"><input type="checkbox"  id = "chk_all"></td>'
						+'<td class="td4">상품번호</td>'
						+'<td class="td4">상품이름</td>'
						+'<td class="td4">브랜드</td>'
						+'<td class="td4">카테고리</td>'
						+'<td class="td4">상품 등급</td>'
						+'<td class="td4">감정서 유무</td>'
						+'<td class="td4">제품 구성품</td>'
						+'<td class="td4">판매 가격</td>'
						+'<td class="td4">매입 가격</td>'
						+'<td class="td4">매입일</td>'
						+'<td class="td4">판매자 아이디</td>'
						+'<td class="td4">판매상태</td>'
						+'<td class="td4">게시상태</td>'
						+'</tr>';
					$.each(data, function(index, item) {
						var purc_date1 = new Date(item.purc_date);
						var purc_date_shaped = date_format(purc_date1);
						output += '<tr class="tr2">';
						output += '<td class="td3"><input type="checkbox" name="delete_this" id = "chk_one" value = "'+item.entity_number+'"></td>';
						output += '<td>'+item.entity_number+'</td>';
						output += '<td>'+item.pd_name+'</td>';
						output += '<td>'+item.pd_brand+'</td>';
						output += '<td>'+item.pd_category+'</td>';
						output += '<td>'+item.quality_grade+'</td>';
						output += '<td>'+item.appraise_exist+'</td>';
						output += '<td>'+item.pd_component+'</td>';
						output += '<td>'+item.sale_price+'</td>';
						output += '<td>'+item.buying_price+'</td>';
						output += '<td>'+purc_date_shaped+'</td>';
						output += '<td>'+item.member_id+'</td>';
						output += '<td>'+item.pb_sale_status;
						output += '<button id = "chg_sale_stat_btn" value = "'+item.entity_number+'">상태변경</button></td>';
						output += '<td>'+item.pb_post_status;
						output += '&nbsp;<button id="chg_post_stat_btn" value = "'+item.entity_number+'">상태변경</button></td>';
						output += '</tr>';
					});
					console.log("output:" + output);
					$('#output').append(output);//뒤에 이어붙이기
				}else{
					var output = '<tr class="tr1">'
						+'<td class="td3"><input type="checkbox"name="delivermanagement" id = "chk_all"></td>'
						+'<td class="td4">상품번호</td>'
						+'<td class="td4">상품이름</td>'
						+'<td class="td4">브랜드</td>'
						+'<td class="td4">카테고리</td>'
						+'<td class="td4">상품 등급</td>'
						+'<td class="td4">감정서 유무</td>'
						+'<td class="td4">제품 구성품</td>'
						+'<td class="td4">판매 가격</td>'
						+'<td class="td4">수수료</td>'
						+'<td class="td4">위탁기간</td>'
						+'<td class="td4">위탁인 아이디</td>'
						+'<td class="td4">판매상태</td>'
						+'<td class="td4">게시상태</td>'
						+'</tr>';
					$.each(data, function(index, item) {
						var start_date1 = new Date(item.start_date);
						var start_date_shaped = date_format(start_date1);
						var end_date1 = new Date(item.end_date);
						var end_date_shaped = date_format(end_date1);
						
						output += '<tr class="tr2">';
						output += '<td class="td3"><input type="checkbox"name="delete_this" id = "chk_one"  value = "'+item.entity_number+'"></td>';
						output += '<td>'+item.entity_number+'</td>';
						output += '<td>'+item.pd_name+'</td>';
						output += '<td>'+item.pd_brand+'</td>';
						output += '<td>'+item.pd_category+'</td>';
						output += '<td>'+item.quality_grade+'</td>';
						output += '<td>'+item.appraise_exist+'</td>';
						output += '<td>'+item.pd_component+'</td>';
						output += '<td>'+item.sale_price+'</td>';
						output += '<td>'+item.commission+'</td>';
						output += '<td>'+start_date_shaped+'  ~  '+end_date_shaped+'</td>';
						output += '<td>'+item.member_id+'</td>';
						output += '<td>'+item.pb_sale_status;
						output += '<button id = "chg_sale_stat_btn" value = "'+item.entity_number+'">상태변경</button></td>';
						output += '<td>'+item.pb_post_status;
						output += '&nbsp;<button id="chg_post_stat_btn" value = "'+item.entity_number+'">상태변경</button></td>';
						output += '</tr>';
					});	
					console.log("output:" + output);
					$('#output').append(output);//뒤에 이어붙이기
				}
			},
			error:function() {
	           alert("리스트 ajax통신 실패!!!");
	        }
		});
	});
	
	

	
	 $(document).on('click','#chg_post_stat_btn',function(event) { //얘가 바로 동적 버튼!!!
		var entity_number;
	 	entity_number = $(this).val();
	 	var params = {"entity_number":entity_number};
	 	
		jQuery.ajax({
			url : '/goodluxe/postStatChange.do',
			type : 'POST',
			data : params, // 서버로 보낼 데이터
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8', //https://thiago6.tistory.com/11 참고 
          
			success: function () {
				selectData();
			},
			error:function() {
				alert("insert ajax통신 실패!!!");
			}
		});
          // 기본 이벤트 제거
          event.preventDefault();
       });
	 
	 
	 $(document).on('click','#chg_sale_stat_btn',function(event) { //얘가 바로 동적 버튼!!!
			var entity_number;
		 	entity_number = $(this).val();
		 	var params = {"entity_number":entity_number};
		 	
			jQuery.ajax({
				url : '/goodluxe/saleStatChange.do',
				type : 'POST',
				data : params, // 서버로 보낼 데이터
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8', //https://thiago6.tistory.com/11 참고 
	          
				success: function () {
					selectData();
				},
				error:function() {
					alert("insert ajax통신 실패!!!");
				}
			});
	          // 기본 이벤트 제거
	          event.preventDefault();
	       });

	 
	 $('#delete_btn').click(function(event){
			var delete_this = [];
			$("input[name='delete_this']:checked").each(function(i){
				delete_this.push($(this).val());
			});
			var params = {"delete_this":delete_this};
			
	        jQuery.ajax({
	        	url:'/goodluxe/deleteProductList.do',
	        		type:'POST',
	        		data : params,
	 				traditional:true,
	 				contentType:'application/x-www-form-urlencoded; charset=UTF-8',
	 				success: function(){	
						selectData();
	 				},
	 				error:function(){
	 					alert("리스트 ajax통신 실패!!!");
	 				}
	      		});
	     	   //event.preventDefault();
			});
	 
	 
	
	$(document).on('click','#init_btn',function(event) { 
		document.getElementById("is_checked").checked= true;
		document.getElementById("is_checked2").checked= true;
		document.getElementById("is_checked3").checked= true;
		document.getElementById("txtentity_number").value="";
	});

	selectData();






});

</script>

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
									clss="gnb_2da gnb_grp_style gnb_grp_div">주문목록</a></li>
								<li><a href="./adminorderproduct_cancel.html"
									clss="gnb_2da gnb_grp_style gnb_grp_div">주문취소</a></li>
								<li><a href="./adminorderproduct_refund.html"
									clss="gnb_2da gnb_grp_style gnb_grp_div">주문 반품</a></li>
								<li><a href="./adminorderproduct_return.html"
									clss="gnb_2da gnb_grp_style gnb_grp_div">주문 환불</a></li>
								<li><a href="./adminorderproduct_customermanagement.html"
									class="gnb_2da gnb_grp_style ">주문 고객 관리</a></li>
								<li><a href="./adminproductregister.html" class="gnb_2da  ">상품등록</a></li>
								<li><a href="./admindelivermanagement.html"
									clss="gnb_2da gnb_grp_style gnb_grp_div">배송관리</a></li>
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

			<h1 id="container_title">관리자 상품등록 검색(전후)</h1>
			<div class="container_wr">
				<section>


					<br>
					<h3>▶ 배송관리</h3>
					<br>
					<form id = "filteringform" method = "post">
						<table class="impormation" border="1">
							<tr>
								<td class="td1">분류</td>
								<td class="td2">&nbsp;&nbsp;&nbsp; 
									<input type="radio" id = "pb_division" name = "pb_division" value = "purchase"  checked /> 매입 &nbsp;
									<input type="radio" id = "pb_division" name = "pb_division" value = "consign" /> 위탁 &nbsp;
								</td>
							</tr>
							<tr>
								<td class="td1">게시상태</td>
								<td class="td2">&nbsp;&nbsp;&nbsp; 
									<input type="radio" name = "pb_post_status" value = "all" id = "is_checked" checked /> 전체&nbsp; 
									<input type="radio" name = "pb_post_status" value = "게시중"/> 게시 중&nbsp; 
									<input type="radio" name = "pb_post_status" value = "게시안함"/> 게시 안함&nbsp;
								</td>
							</tr>
							<tr>
								<td class="td1">판매 상태</td>
								<td class="td2">&nbsp;&nbsp;&nbsp; 
									<input type="radio" name = "pb_sale_status" value = "all" id = "is_checked2" checked/> 전체&nbsp; 
									<input type="radio" name = "pb_sale_status" value = "판매중"/> 판매 중&nbsp; 
									<input type="radio" name = "pb_sale_status" value = "거래진행중"/> 거래 진행 중&nbsp; 
									<input type="radio" name = "pb_sale_status" value = "판매완료"/> 판매 완료&nbsp;
								</td>
							</tr>
							
						</table>
						<br/>
						<table class="impormation" border="1">
							<tr>
								<td class="td1">상품 번호</td>
								<td class="td2">
									<input type = "text" class="text3" name = "entity_number" id = "txtentity_number">
								</td>
							</tr>
						</table>


						<div class="btn12" align="center">
							<button type="button" class="btn1_2" id = "init_btn" >초기화</button>
							<button type="button" class="btn1" id = "search_btn">검색</button>
						</div>
					</form>
					<br> <br> <br> <br> <br>
					<div class="config01">
						<button type="button" class="btn3" id = "delete_btn">선택삭제</button>
						<br> <br>
					</div>
					<form id = "chk_form">
						<table border="1" id = "output">
					
						</table>
					</form>
					<br>
					<p align="center">◁&nbsp;1&nbsp;2&nbsp;3&nbsp;4&nbsp;5&nbsp;▷</p>
				</section>
			</div>

		</div>
	</div>












	<footer class="container-fluid">
		<p>Footer Text</p>
	</footer>

</body>

</html>