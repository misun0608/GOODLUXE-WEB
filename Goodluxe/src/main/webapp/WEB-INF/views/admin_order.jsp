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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/modal_popup_form.css">
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
	
	
	function dateSelect(){
		if( search_filter_form.period.value == 'write'){
			search_filter_form.start_date_text.readOnly = false;
			search_filter_form.end_date_text.readOnly = false;
		}else{
			search_filter_form.start_date_text.readOnly = true;
			search_filter_form.end_date_text.readOnly = true;
			search_filter_form.start_date_text.value = "";
			search_filter_form.end_date_text.value = "";
		}
	}
	
	function invoice_show(){
		
		$(document).on('click','#invoice_input',function(event) {
		var the_btn = $(this);
		event.preventDefault();
		//$(this).css("display","none");
		//$(this).parent().children("#order_invoice_number").show();
		//$(this).parent().children("#inv_p").show();
		//$(this).parent().children("#btn_start_shipping").show();
		the_btn.parent().children().eq(2).show();
		the_btn.parent().children().eq(3).show();
		the_btn.parent().children().eq(4).show();
		//$("#order_invoice_number").show();
		//$("#inv_p").show();
		//$("#btn_start_shipping").show();
		
		});
		
	}
</script>
<script>
	$(function(){
		$(document).on('click','#modal_open',function(event) {
			event.preventDefault();
			$(".modal_win").show();
			$("#dark").show();
		});
		$(document).on('click','#modal_ok',function(event) {
			$(".modal_win").hide();
			$("#dark").hide();
		});
	
 		$(document).mouseup(function(event){
			var container = $(".modal_win");
			if(!container.is(event.target)&& container.has(event.target).length===0){
				container.css("display","none");
				$("#dark").css("display","none");
			}
		});
	});


</script>
<script>
	$(document).ready(function(){
		
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
			var hour = format.getHours();
			if(hour<10) {
			   hour = '0' + hour;
			}
			var min = format.getMinutes();
			if(min<10) {
			   min = '0' + min;
			}
			return year + "-" + month + "-" + date + " " + hour + ":" + min;
		}
		
		function selectData() {
			$('#output').empty();
				$.ajax({
					url : '/goodluxe/getAllOrderList.do',
					type : 'POST',
					dataType:"json",
					contentType:'application/x-www-form-urlencoded; charset=UTF-8',
					success:function(data){
						$.each(data,function(index,item){
							
							var is_canceled
							if(item.order_cancel_date==null){is_canceled="정상주문"}
							else{is_canceled="취소"}
							
							var date = new Date(item.order_pay_date);
							var pay_date = date_format(date);
							
							if(item.order_pay_date == null){pay_date = ""}
							
							var link = "./getShippingInfo.do?order_number='"+item.order_number+"'";
							var wintxt = "window.open('this.href','배송정보','resizable=no width=600 height=700');";
							
							var output = ''; 
							output += '<tr class="tr2">';
							//output += '<td class="td3"><input type="checkbox" id = "chk_one" name="change_me" value = "'+item.order_number+'"></td>';
							output += '<td class="td3">'+pay_date+'</td>';
							output += '<td class="td3">'+item.order_number+'</td>';
							output += '<td class="td3"><a href = "./getShippingInfo.do?order_number='+item.order_number+'"id = "show_member_info" onclick = '+wintxt+'>'+item.member_id+'</a></td>';
							output += '<td class="td3">'+item.pb_number+'</td>';
							output += '<td class="td3">'+item.order_pay_price+'</td>';
							output += '<td class="td3">'+item.order_pay_system+'</td>';
							output += '<td class="td3">'+item.order_status;
								if(item.order_status=='배송준비중'){
		
									output +='<button id = "invoice_input" onclick = "invoice_show();">배송시작</button><br/>';
									output +='<p id = "inv_p" style = "display:none">송장번호 :</p> <input type = "text" id = "order_invoice_number" style = "display:none">';
									output +='<button value = "'+item.order_number+'" id = "btn_start_shipping" style = "display:none">확인</button>';
							
								}
								if(item.order_status=='배송중'){
									output +='<button value = "'+item.order_number+'" id = "btn_end_shipping">판매완료</button>';
								}
							output +='</td>';
							output += '<td class="td3">'+is_canceled+'</td>';
							output += '</tr>';
							console.log("output:" + output);
							$('#output').append(output);//뒤에 이어붙이기
						});
					},
		         error:function() {
		            alert("리스트 ajax통신 실패!!!");
		         }
			});
		}

		$('#search_btn').click(function(event){
			 $('#output').empty();
			var params = $('#search_filter_form').serialize();
			alert(params);
	        jQuery.ajax({
	        	url:'/goodluxe/getOrderList.do',
	        		type:'POST',
	        		data : params,
	 				dataType : "json",
	 				contentType:'application/x-www-form-urlencoded; charset=UTF-8',
	 				traditional:true,
	 				success: function(data){
	 					$.each(data, function(index, item){
	 						if(item.order_number == "orderNull"){
								alert("검색결과가 없습니다.");
							}else{
								var is_canceled
								if(item.order_cancel_date==null){is_canceled="정상주문"}
								else{is_canceled="취소"}
								
								var date = new Date(item.order_pay_date);
								var pay_date = date_format(date);
								
								if(item.order_pay_date == null){pay_date = ""}
								
								var link = "./getShippingInfo.do?order_number='"+item.order_number+"'";
								var wintxt = "window.open('this.href','배송정보','resizable=no width=600 height=700');";
								
								var output = ''; 
								output += '<tr class="tr2">';
								//output += '<td class="td3"><input type="checkbox" id = "chk_one" name="change_me"  value = "'+item.order_number+'"></td>';
								output += '<td class="td3">'+pay_date+'</td>';
								output += '<td class="td3">'+item.order_number+'</td>';
								output += '<td class="td3"><a href = "./getShippingInfo.do?order_number='+item.order_number+'" id = "show_member_info" onclick='+wintxt+'>'+item.member_id+'</a></td>';
								output += '<td class="td3">'+item.pb_number+'</td>';
								output += '<td class="td3">'+item.order_pay_price+'</td>';
								output += '<td class="td3">'+item.order_pay_system+'</td>';
								output += '<td class="td3">'+item.order_status;
									if(item.order_status=='배송준비중'){
										output +='<button id = "invoice_input" onclick = "invoice_show();">배송시작</button><br/>';
										output +='<p id = "inv_p" style = "display:none">송장번호 :</p> <input type = "text" id = "order_invoice_number" style = "display:none">';
										output +='<button value = "'+item.order_number+'" id = "btn_start_shipping" style = "display:none">확인</button>';
									}
									if(item.order_status=='배송중'){
										output +='<button value = "'+item.order_number+'" id = "btn_end_shipping">판매완료</button>';
									} 
								output +='</td>';
								output += '<td class="td3">'+is_canceled+'</td>';
								output += '</tr>';
								console.log("output:" + output);
								$('#output').append(output);//뒤에 이어붙이기	
							}
	 					});
	 				},
	 				error:function(){
	 					alert("리스트 ajax통신 실패!!!");
	 				}
	      		});
	     	   //event.preventDefault();
			});
		
		$(document).on('click','#btn_start_shipping',function(event) { 
			var start_btn = $(this);
			var orderNo = start_btn.attr("value");
			var invoice_txt = start_btn.parent();
			var invoice = invoice_txt.attr("value");
			var the_btn =start_btn.prev().val();
			var params = {"order_number" : orderNo, "order_invoice_number":the_btn}
			jQuery.ajax({
				url :'/goodluxe/adminOrderSetStartShipping.do',
                type : 'POST',
                data : params,
                contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType : "json",
                success: function (retVal) {
                	
                	var result = retVal.res;
                	
                	alert(result);
                },
                error:function() {
                   alert("insert ajax통신 실패!!!");
                }
             });
		});
		$(document).on('click','#btn_end_shipping',function(event) { 
			var order_end_btn = $(this);
			var data = order_end_btn.attr("value");
	
			var params = {
				"order_number" : data
			}
			jQuery.ajax({
				url : '/goodluxe/adminOrderSetEndShipping.do',
                type : 'POST',
                data : params, // 서버로 보낼 데이터
                contentType : 'application/x-www-form-urlencoded; charset=UTF-8', //https://thiago6.tistory.com/11 참고 
                dataType : "json", // 서버에서 보내줄 타입
                success: function (retVal) {
                	
                	var result = retVal.res;
                	
                	alert(result);
                },
                error:function() {
                   alert("insert ajax통신 실패!!!");
                }
             });
		
		});
			
		
		$(document).on('click','#init_btn',function(event) { 
			document.getElementById("order_number_txt").value =""; 
			document.getElementById("period").value="none";
			document.getElementById("is_checked").checked= true;
			document.getElementById("is_checked2").checked= true;
			document.getElementById("is_checked3").checked= true;
			document.getElementById("is_checked4").checked= true;
			document.getElementById("is_checked5").checked= true;
			document.getElementById("is_checked6").checked= true;
			document.getElementById("date1").value="";
			document.getElementById("date2").value="";
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

			<h1 id="container_title">주문 관리 > 전체 주문 목록</h1>
			<div class="container_wr">
				<section>
					<br><br>
					<form id = "search_filter_form">
						<table class="impormation" border="1">
							<tr>
								<td class="td1">주문번호</td>
								<td class="td2">&nbsp;&nbsp;&nbsp;<input type="text"
									class="text3" name="order_number"id = "order_number_txt"></td>
							</tr>
							<tr>
								<td class="td1">기간</td>
								<td class="td2">
									<select class="search"name = "period" id = "period" onchange= "dateSelect();">
										<option name = "period" value="none">선택안함</option>
										<option name = "period" value="write">직접입력</option>
										<option name = "period" value="today">오늘</option>
										<option name = "period" value="yesterday">어제</option>
										<option name = "period" value="week">7일</option>
										<option name = "period" value="month">1개월</option>
									</select>
									<input type="date" name="start_date_text" id = "date1" class="search" readonly="readOnly" default = "">&nbsp;&nbsp;&nbsp;&nbsp; 
									~&nbsp; 
									<input type="date" name="end_date_text" id = "date2" class="search" readonly="readOnly">
	
								</td>
							</tr>
							<tr>
								<td class="td1">주문상태</td>
								<td class="td2">&nbsp;&nbsp; &nbsp;
									<input type="checkbox"name="check_order_status" value = "입금전" id = "is_checked3" checked> 입금대기 &nbsp;
									<input type="checkbox"name="check_order_status" value = "배송준비중" id = "is_checked4" checked> 배송 준비중 &nbsp;
									<input type="checkbox"name="check_order_status" value = "배송중" id = "is_checked5" checked> 배송중 &nbsp;
									<input type="checkbox"name="check_order_status" value = "배송완료" id = "is_checked6" checked> 배송 완료
								</td>
							</tr>
							<tr>
								<td class="td1">cs 주문상태</td>
								<td class="td2">&nbsp;&nbsp;&nbsp; 
									<input type="radio"name="is_canceled" id = "is_checked" value = "all" checked> 전체 &nbsp;
									<input type="radio"name="is_canceled" value = "cancelY"> 취소제외 &nbsp;
									<input type="radio"name="is_canceled" value = "cancelN"> 취소내역
								</td>
							</tr>
							<tr>
								<td class="td1">입금 / 결제상태</td>
								<td class="td2">&nbsp;&nbsp;&nbsp; 
									<input type="radio"name="is_payed" id = "is_checked2" value = "all" checked> 전체 &nbsp;
									<input type="radio"name="is_payed" value = "beforeP"> 입금 전 &nbsp;
									<input type="radio"name="is_payed" value = "afterP"> 결제 완료
								</td>
							</tr>
	
						</table>
	
						<div class="btn12" align="center">
							<button type="button" class="btn1_2" id = "init_btn" >초기화</button>
							<button type="button" class="btn1" id = "search_btn">검색</button>
						</div>
					</form>
					<br> <br>
					<form id = "order_status_form" method = "post" class = "table_behind">
					
						<!--  <input type = "submit" class="btn4" id="btn_start_shipping" value = "배송상태변경-발송완료">
						<input type = "submit" class="btn4" id="modal_open" value = "배송상태변경-판매완료">
						<button id = "modal_open">fasdfasd</button>-->
						
						
						<table border="1" >
	
							<tr class="tr1">
								<!--  <td class="td3"><input type="checkbox"id="chk_all" onclick = "checkAll();"></td> -->
								<td class="td4">주문일(결제일)</td>
								<td class="td4">주문번호</td>
								<td class="td4">주문자</td>
								<td class="td4">상품번호[상품명]</td>
								<td class="td4">결제금액</td>
								<td class="td4">결제수단</td>
								<td class="td4">배송상태</td>
								<td class="td4">취소여부</td>
							</tr>
							<tbody id = "output">
								
							</tbody>
						</table>
					</form>
					<br>
		<!-- 	<p align="center">◁&nbsp;1&nbsp;2&nbsp;3&nbsp;4&nbsp;5&nbsp;▷</p>
					<div class = "dark" id = "dark"></div>
					<div class = "modal_win">
						<form id = "shipping_info_form">
							<h3>송장번호입력</h3>
							<input type = "text" name = "order_invoice_number">
							<!-- order_number를 어떻게 받을까...<input type = "hidden"> 
							<button id = "" class="modal_ok" id = "modal_ok"> 확인 </button>
						</form>
					</div> -->
				</section>
			</div>

		</div>
	</div>
	
	

	<footer class="container-fluid">
		<p>Footer Text</p>
	</footer>
</body>

</html>