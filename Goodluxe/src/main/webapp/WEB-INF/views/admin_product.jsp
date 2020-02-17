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
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
   $(document).ready(function(){
      $("#hd").load("admin_header.do");
      $("#admin_footer").load("admin_footer.do");
   });
</script>
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

	<header id="hd"></header>

	<div id="wrapper">

		<div id="container" class="container-small">

			<h1 id="container_title">관리자 상품등록 검색(전후)</h1>
			<div class="container_wr">
				<section>


					<br>
					<h3>▶ 배송관리</h3>
					<br>
					<form id = "filteringform" method = "post">
						<table class="information">
							<tr>
								<td class="td1">분류</td>
								<td class="td2">&nbsp;&nbsp;
									<input type="radio" id="pb_division1" name = "pb_division" value = "purchase"  checked />
									<label for="pb_division1">매입</label>
									<input type="radio" id="pb_division2" name = "pb_division" value = "consign" />
									<label for="pb_division2">위탁</label>
								</td>
							</tr>
							<tr>
								<td class="td1">게시상태</td>
								<td class="td2">&nbsp;&nbsp;
									<input type="radio" name = "pb_post_status" value = "all" id = "is_checked" checked />
									<label for="is_checked">전체</label>
									<input type="radio" id="pb_post_status2" name = "pb_post_status" value = "게시중"/>
									<label for="pb_post_status2">게시중</label>
									<input type="radio" id="pb_post_status3" name = "pb_post_status" value = "게시안함"/>
									<label for="pb_post_status3">게시안함</label>
								</td>
							</tr>
							<tr>
								<td class="td1">판매상태</td>
								<td class="td2">&nbsp;&nbsp;
									<input type="radio" name = "pb_sale_status" value = "all" id ="is_checked2" checked/>
									<label for="is_checked2">전체</label>
									<input type="radio" id="pb_sale_status2" name = "pb_sale_status" value = "판매중"/>
									<label for="pb_sale_status2">판매중</label>
									<input type="radio" id="pb_sale_status3" name = "pb_sale_status" value = "거래진행중"/>
									<label for="pb_sale_status3">거래진행중</label>
									<input type="radio" id="pb_sale_status4" name = "pb_sale_status" value = "판매완료"/>
									<label for="pb_sale_status4">판매완료</label>
								</td>
							</tr>
							
						</table>
						<br/>
						<table class="information">
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
						<table border="1" id="output">
					
						</table>
					</form>
					<br>
					<p align="center">◁&nbsp;1&nbsp;2&nbsp;3&nbsp;4&nbsp;5&nbsp;▷</p>
				</section>
			</div>

		</div>
	</div>












	<footer id="admin_footer" class="container-fluid"></footer>

</body>

</html>