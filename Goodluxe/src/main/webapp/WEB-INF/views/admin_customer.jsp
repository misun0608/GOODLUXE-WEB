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
	$(document).ready(function(){
		function selectData() {
			$('#output').empty();
				$.ajax({
					url : '/goodluxe/getAllMemberList.do',
					type : 'POST',
					dataType:"json",
					contentType:'application/x-www-form-urlencoded; charset=UTF-8',
					success:function(data){
						$.each(data,function(index,item){
							
							var isblack = "";
							if(item.member_class=="B"){isblack = "블랙리스트"}else{isblack = "일반"}
							var output = ''; 
							output += '<tr class="tr2">';
							output += '<td class="td3"><input type = "hidden" name = "member_id" value = "'+item.member_id+'">'+item.member_id+'</td>';
							output += '<td class="td3">'+item.member_name+'</td>';
							output += '<td class="td3">'+isblack+'</td>';
							output += '<td class="td3">'+item.member_phone+'</td>';
							output += '<td class="td3">'+item.member_email+'</td>';
							output += '<td class="td3"><button class="btn4" id = "black_btn" value = "'+item.member_id+'">블랙리스트 설정</button> </td>';
							output += '</tr>';
							console.log("output:" + output);
							$('#output').append(output);//뒤에 이어붙이기
							//alert('오');
						});
					},
		         error:function() {
		            alert("리스트 ajax통신 실패!!!");
		         }
			});
		}
		$('#search_btn').click(function(event){
			if($('#idSearchBox').val()==""){
				alert("아이디를 입력하세요");
				return;
			}
			var params = $('#search_member_form').serialize();
			//아이디 입력 안햇을때 처리
			jQuery.ajax({
				url : '/goodluxe/getMemberList.do',
				type : 'POST',
				data : params,
				dataType:"json",
				contentType:'application/x-www-form-urlencoded; charset=UTF-8',
				success:function(data){
					$('#output').empty();
					var isblack = "";
					if(data.member_class=="B"){isblack = "블랙리스트"}else{isblack = "일반"}
					var output = ''; 
					output += '<tr class="tr2">';
					output += '<td class="td3"><input type = "hidden" name = "member_id" value = "'+data.member_id+'">'+data.member_id+'</td>';
					output += '<td class="td3">'+data.member_name+'</td>';
					output += '<td class="td3">'+isblack+'</td>';
					output += '<td class="td3">'+data.member_phone+'</td>';
					output += '<td class="td3">'+data.member_email+'</td>';
					output += '<td class="td3"><button class="btn4" id = "black_btn" value = "'+data.member_id+'">블랙리스트 설정</button> </td>';
					output += '</tr>';
					console.log("output:" + output);
					$('#output').append(output);//뒤에 이어붙이기
					$('#idSearchBox').val('');
				},
				error:function() {
		           alert("리스트 ajax통신 실패!!!");
		        }
			});
		});
		 $(document).on('click','#black_btn',function(event) { //얘가 바로 동적 버튼!!!
			 
			var select_btn = $(this);
		 	//alert(select_btn.attr("value"));
			var data = select_btn.attr("value");
			
			var params = {
				"member_id": data
			}
			jQuery.ajax({
				url : '/goodluxe/setBlackClass.do',
                type : 'POST',
                data : params, // 서버로 보낼 데이터
                contentType : 'application/x-www-form-urlencoded; charset=UTF-8', //https://thiago6.tistory.com/11 참고 
                dataType : "json", // 서버에서 보내줄 타입
                success: function (retVal) {
                	
					if (retVal.res == "B") {//예외 발생 --> res=="FAIL"
						alert("블랙리스트 해제 성공");
						selectData();
					}else if(retVal.res == "Y"){
						alert("블랙리스트  설정  성공");
						selectData();
                   }
                },
                error:function() {
                   alert("insert ajax통신 실패!!!");
                }
             });
             // 기본 이벤트 제거
             event.preventDefault();
          });
		 
		 $('#init_btn').click(function(event){
			 document.getElementById("idSearchBox").value = "";
			 selectData();
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

			<h1 id="container_title">관리자 고객관리 페이지</h1>
			<div class="container_wr">
				<section>
					<br> <br>
					<h3>▶회원조회</h3>
					<br>
					<form id = "search_member_form">
						<table class="impormation" border="1">
							<tr>
								<td class="td1">아이디</td>
								<td class="td2"><input class="text3" name="member_id" id = "idSearchBox"></td>
							</tr>
						<!--<tr>
								<td class="td1">이름</td>
								<td class="td2"><input class="text3" name="member_name">
								</td>
							</tr>
							<tr>
								<td class="td1">주문번호</td>
								<td class="td2"><input class="text3" name="order_number">
								</td>
							</tr>-->
<!--						<tr>
								<td class="td1">회원등급</td>
								<td class="td2"><select class="search" name="member_class">
										<option value="other" name="member_class">블랙리스트 아님</option>
										<option value="B" name="member_class">블랙리스트</option>
								</select> 
							</tr>  -->
						</table>
					</form>

					<div class="btn12" align="center">
						<button type="button" class="btn1_2" id = "init_btn">초기화</button>
						<button type="button" class="btn1" id = "search_btn">검색</button>
					</div>
					<br><br><br>
					
					
						<div class="config01">
							<!-- <input type="submit" class="btn4" id = "black_btn" value = "블랙리스트 설정"/>  -->
							<br>
						</div> 
						<table border="1">
							<tr class="tr1">
								<td class="td4">아이디</td>
								<td class="td4">이름</td>
								<td class="td4">등급</td>
								<td class="td4">핸드폰</td>
								<td class="td4">이메일</td>	
								<td class="td4">블랙리스트 설정/해제</td>
							</tr>
							<tbody  id = "output">
							
							</tbody>
						</table>
					
					<br>
				</section>
			</div>

		</div>
	</div>

	<footer class="container-fluid">
		<p>Footer Text</p>
	</footer>

</body>

</html>