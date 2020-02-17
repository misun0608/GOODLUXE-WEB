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
		function selectData(){
			$('#output').empty();
			
			$.ajax({
				url:'/goodluxe/getReturnList.do',
				type:'POST',
				dataType : "json", 
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success:function(returnList) { 
					
						$.each(returnList, function(index, item) {
							var output = '';
							var order_date1 = new Date(item.order_order_date);
							var order_date_shaped = date_format(order_date1);
							output += '<tr class="tr2">';
							
							output += '<td class="td3">'+item.order_number+'</td>';
							output += '<td class="td3">'+order_date_shaped+'</td>';
							output += '<td class="td3">'+item.order_status;
							if(item.order_status=='환불신청'){
								output+= '&nbsp;<button id = "return_confirm" value = "'+item.order_number+'">상품 회수중</button>';
							}else if(item.order_status=='반품확인'){
								output+= '&nbsp;<button id = "return_finished" value = "'+item.order_number+'">회수&환불 완료</button>';
							}
							output += '</td>';
							output += '<td class="td3">'+item.order_pay_system;
							if(item.order_pay_system == '무통장입금'){
								output+= '[ '+item.order_refund_account+'('+item.order_refund_bank+') ]';
							}
							output += '</td>';
							output += '<td class="td3">'+item.order_pay_price+'</td>';
							output += '<td class="td3">'+item.member_id+'</td>';
							output += '<td class="td3">'+item.pb_number+'</td>';
							output += '</tr>';
							console.log("output:" + output);
							$('#output').append(output);
							
						});
				},
			 	error:function() {
					alert("리스트 ajax통신 실패!!!");
				}	
				});
		}
		
		
		
		$('#search_btn').click(event,function(){
			search_btn_click();
		});
		
		function search_btn_click(){
			$('#output').empty();
			var params = $('#search_detail_form').serialize();
	        jQuery.ajax({
	        	url:'/goodluxe/getDetailReturndList.do',
	        		type:'POST',
	        		data : params,
	 				dataType : "json",
	 				contentType:'application/x-www-form-urlencoded; charset=UTF-8',
	 				success: function(data){
	 					$.each(data, function(index, item){
	 						var output = '';
							var order_date1 = new Date(item.order_order_date);
							var order_date_shaped = date_format(order_date1);
							output += '<tr class="tr2">';
							
							output += '<td class="td3">'+item.order_number+'</td>';
							output += '<td class="td3">'+order_date_shaped+'</td>';
							output += '<td class="td3">'+item.order_status;
							if(item.order_status=='환불신청'){
								output+= '&nbsp;<button id = "return_confirm" value = "'+item.order_number+'">상품 회수중</button>';
							}else if(item.order_status=='반품확인'){
								output+= '&nbsp;<button id = "return_finished" value = "'+item.order_number+'">회수&환불 완료</button>';
							}
							output += '</td>';
							output += '<td class="td3">'+item.order_pay_system;
							if(item.order_pay_system == '무통장입금'){
								output+= '[ '+item.order_refund_account+'('+item.order_refund_bank+') ]';
							}
							output += '</td>';
							output += '<td class="td3">'+item.order_pay_price+'</td>';
							output += '<td class="td3">'+item.member_id+'</td>';
							output += '<td class="td3">'+item.pb_number+'</td>';
							output += '</tr>';
							console.log("output:" + output);
							$('#output').append(output);
	 					
	 					});
	 				},
	 				error:function(){
	 					alert("리스트 ajax통신 실패!!!");
	 				}
	      		});
	     	   //event.preventDefault();
			}
		
		
		$(document).on('click','#return_confirm',function(event) { //얘가 바로 동적 버튼!!!
			 
			var return_confirm = $(this);
		 	//alert(select_btn.attr("value"));
			var data = return_confirm.attr("value");
			
			var params = {
				"order_number": data
			}
			jQuery.ajax({
				url : '/goodluxe/setReturnConfirm.do',
                type : 'POST',
                data : params, // 서버로 보낼 데이터
                contentType : 'application/x-www-form-urlencoded; charset=UTF-8', //https://thiago6.tistory.com/11 참고 
            	success: function () {
            		//selectData();
            		//$("search_btn").trigger("click");
            		search_btn_click();
                },
                error:function() {
                   alert("insert ajax통신 실패!!!");
                }
             });
             // 기본 이벤트 제거
             event.preventDefault();
          });
		
		
		
		
		var w = new WebSocket("ws://localhost:8080/goodluxe/broadcasting2.do");
		
		
		w.onopen = function(){ //클라이언트와 서버간의 웹소켓이 정상적으로 생성되었다.(연결되었다)
			alert("WebSocket Conneted!!!");
		}
		w.onclose = function(e){ //웹소켓 연결이 종료되면 호출됨.
			alert("WebSocket closed!!!");
		}
		w.onerror = function(e){ //연결 실패시 호출됨.
			alert("WebSocket error!!!");
		}
		
		$(document).on('click','#return_finished',function(event) { //얘가 바로 동적 버튼!!!
			 
			var return_finished = $(this);
		 	//alert(select_btn.attr("value"));
			var data = return_finished.attr("value");
			
			var params = {
				"order_number": data
			}
			
			jQuery.ajax({
				url : '/goodluxe/setReturnFinished.do',
                type : 'POST',
                data : params, // 서버로 보낼 데이터
                contentType : 'application/x-www-form-urlencoded; charset=UTF-8', //https://thiago6.tistory.com/11 참고 
                dataType : "json",
                success: function(data){
                	search_btn_click();
 					$.each(data, function(index, item){
	            		
            			w.send( item.member_id );
            			
            			alarm("알람전송");
            			console.log("알람 전송 완료");
 					});
 				},
                error:function() {
                   alert("insert ajax통신 실패!!!");
                }
             });
             // 기본 이벤트 제거
             event.preventDefault();
          });
		
		
		
		selectData();
		
	});
</script>

<script>
	
	


</script>



</head>
<body>
	<header id="hd"></header>

	<div id="wrapper">

		<div id="container" class="container-small">

			<h1 id="container_title">주문 관리 목록 > 반품</h1>
			<div class="container_wr">
				<section>


					<br> <br>
					<form id = "search_detail_form">
						<table class="information">
						
							<tr>
								<td class="td1">주문상태로 검색</td>
								<td class="td2">&nbsp;&nbsp;
									<input type="radio" name="orderstatus" value = "all"  checked> 전체 &nbsp;
									<input type="radio" name="orderstatus" value = "환불신청"> 환불 신청 &nbsp;
									<input type="radio" name="orderstatus" value = "반품확인"> 반품 확인(처리중) &nbsp;
									<input type="radio" name="orderstatus" value = "환불완료"> 환불 완료 &nbsp;
								</td>
							</tr>
						</table>
						<br/>
						<!-- 
						<table class="impormation" border="1">	
							 <tr>
								<td class="td1"> 주문번호로 검색</td>
								<td class="td2"> <input name="order_number" class="text3"></td>
							</tr>
						</table>
	 					 -->
						<div class="btn12" align="center">
							<button type="button" class="btn1_2">초기화</button>
							<button type="button" class="btn1" id = "search_btn">검색</button>
						</div>
					</form>
					<br> <br>
					<br>
					<table border="1">

						<tr class="tr1">
							<td class="td4">주문번호</td>
							<td class="td4">주문일</td>
							<td class="td4">주문상태</td>
							<td class="td4">결제방식</td>
							<td class="td4">결제금액</td>
							<td class="td4">주문자 아이디</td>
							<td class="td4">상품 번호</td>
						</tr>
						<tbody id = "output">						
							
						</tbody>
					</table>
					<br>
					
				</section>
			</div>

		</div>
	</div>


	<footer id="admin_footer" class="container-fluid"></footer>

</body>

</html>