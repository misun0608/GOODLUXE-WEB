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
						page();
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
							
							output += '<td class="context_td">'+item.order_number+'</td>';
							output += '<td class="context_td">'+order_date_shaped+'</td>';
							output += '<td class="context_td">'+item.order_status;
							if(item.order_status=='환불신청'){
								output+= '&nbsp;<button id="return_confirm" value = "'+item.order_number+'">상품 회수중</button>';
							}else if(item.order_status=='반품확인'){
								output+= '&nbsp;<button id="return_finished" value = "'+item.order_number+'">회수&환불 완료</button>';
							}
							output += '</td>';
							output += '<td class="context_td">'+item.order_pay_system;
							if(item.order_pay_system == '무통장입금'){
								output+= '[ '+item.order_refund_account+'('+item.order_refund_bank+') ]';
							}
							output += '</td>';
							output += '<td class="context_td">'+item.order_pay_price+'</td>';
							output += '<td class="context_td">'+item.member_id+'</td>';
							output += '<td class="context_td">'+item.pb_number+'</td>';
							output += '</tr>';
							console.log("output:" + output);
							$('#output').append(output);
	 					
	 					});
	 					page();
	 				},
	 				error:function(){
	 					alert("리스트 ajax통신 실패!!!");
	 				}
	      		});
	     	   //event.preventDefault();
			}
		
		
		$(document).on('click','#return_confirm',function(event) { //얘가 바로 동적 버튼!!!
			 
			var return_confirm = $(this);
		 	
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
			//alert("WebSocket Conneted!!!");
		}
		w.onclose = function(e){ //웹소켓 연결이 종료되면 호출됨.
			//alert("WebSocket closed!!!");
		}
		w.onerror = function(e){ //연결 실패시 호출됨.
			//alert("WebSocket error!!!");
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
		
		//페이징
		function page(){ 
			$('#output').each(function() {
				var pagesu = 10;  //페이지 번호 갯수
				var currentPage = 0;
				var numPerPage = 10;  //목록의 수
				var $table = $(this);   
				var tr = $('#output_table tbody tr');
				var pagination = $("#pagination");
				   
				//length로 원래 리스트의 전체길이구함
				var numRows = tr.length;
				console.log(numRows);
				
				//Math.ceil를 이용하여 반올림
				var numPages = Math.ceil(numRows / numPerPage);
				
				//리스트가 없으면 종료
				if (numPages==0) 
					return;
				//pager라는 클래스의 div엘리먼트 작성
				var $pager = $('<div class="pager"></div>');
				var nowp = currentPage;
				var endp = nowp+10;
				
				//페이지를 클릭하면 다시 셋팅
				$table.bind('repaginate', function() {
					//기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
					// 테이블 하위 요소 중 tbody tr 요소 선택
					$table.find('tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
					$("#pagination").html("");
					
					if (numPages > 1) {     // 한페이지 이상이면
					if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
						nowp = 0;     // 1부터 
						endp = pagesu;    // 10까지
					}else{
						nowp = currentPage -5;  // 6넘어가면 2부터 찍고
						endp = nowp+pagesu;   // 10까지
						pi = 1;
					}
					if (numPages < endp) {   // 10페이지가 안되면
						endp = numPages;   // 마지막페이지를 갯수 만큼
						nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
					}
					if (nowp < 1) {     // 시작이 음수 or 0 이면
						nowp = 0;     // 1페이지부터 시작
					}
					}else{       // 한페이지 이하이면
						nowp = 0;      // 한번만 페이징 생성
						endp = numPages;
					}
		
					// [처음]
					$('<span class="pageNum first" style="cursor: pointer">처음</span>').bind('click', {newPage: page},function(event) {
						currentPage = 0;   
						$table.trigger('repaginate');  
						$($(".pageNum")[2]).addClass('active').siblings().removeClass('active');
						$("html, body").animate({ scrollTop : 0 }, 500);
					}).appendTo(pagination).addClass('clickable');
					
					// [이전]
					$('<span class="pageNum back" style="cursor: pointer">&nbsp < &nbsp</span>').bind('click', {newPage: page},function(event) {
						if(currentPage == 0) return;
						currentPage = currentPage-1;
						$table.trigger('repaginate');
						$($(".pageNum")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
						$("html, body").animate({ scrollTop : 0 }, 500);
					}).appendTo(pagination).addClass('clickable');
					
					// [1,2,3,4,5,6,7,8]
					for (var page = nowp ; page < endp; page++) {
						$('<span class="pageNum" style = "cursor: pointer"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
							currentPage = event.data['newPage'];
							$table.trigger('repaginate');
							$($(".pageNum")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
							$("html, body").animate({ scrollTop : 0 }, 500);
						}).appendTo(pagination).addClass('clickable');
					} 
					
					// [다음]
					$('<span class="pageNum next" style = "cursor: pointer">&nbsp > &nbsp</span>').bind('click', {newPage: page},function(event) {
						if(currentPage == numPages-1) return;
						currentPage = currentPage+1;
						$table.trigger('repaginate'); 
						$($(".pageNum")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
						$("html, body").animate({ scrollTop : 0 }, 500);
					}).appendTo(pagination).addClass('clickable');
		
					// [끝]
					$('<span class="pageNum last" style = "cursor: pointer">끝</span>').bind('click', {newPage: page},function(event) {
						currentPage = numPages-1;
						$table.trigger('repaginate');
						$($(".pageNum")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
						$("html, body").animate({ scrollTop : 0}, 500);
					}).appendTo(pagination).addClass('clickable');
		
					$($(".pageNum")[2]).addClass('active');
				});
				
				$pager.insertAfter($table).find('span.pageNum:first').next().next().addClass('active');   
				$pager.appendTo(pagination);
				$table.trigger('repaginate');
				
			});
		}	
		
		
		
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

			<h1 id="container_title">| 주문 관리 목록 > 반품</h1>
			<div class="container_wr">
				<section>

					<br> <br>
					<form id = "search_detail_form">
						<table class="information">
							<tr>
								<td class="td1">주문상태로 검색</td>
								<td class="td2">&nbsp;&nbsp;
									<input type="radio" id="orderstatus1" name="orderstatus" value = "all"  checked>
									<label for="orderstatus1">전체</label>
									<input type="radio" id="orderstatus2" name="orderstatus" value = "환불신청">
									<label for="orderstatus2">환불신청</label>
									<input type="radio" id="orderstatus3" name="orderstatus" value = "반품확인">
									<label for="orderstatus3">반품확인(처리중)</label>
									<input type="radio" id="orderstatus4" name="orderstatus" value = "환불완료">
									<label for="orderstatus4">환불완료</label>
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
							<button type="button" class="bottom_btn cancel_btn">초기화</button>
							<button type="button" class="bottom_btn" id = "search_btn">검색</button>
						</div>
					</form>
					<br> <br>
					<br>
					<table class="information" id = "output_table">

						<tr class="tr1">
							<td class="title_td">주문번호</td>
							<td class="title_td">주문일</td>
							<td class="title_td">주문상태</td>
							<td class="title_td">결제방식</td>
							<td class="title_td">결제금액</td>
							<td class="title_td">주문자 아이디</td>
							<td class="title_td">상품 번호</td>
						</tr>
						<tbody id = "output">						
							
						</tbody>
					</table>
					<br>
					<center>
			        	<div class="pagination" id="pagination">
			        </center> 
					<br />
				</section>
			</div>

		</div>
	</div>


	<footer id="admin_footer" class="container-fluid"></footer>

</body>

</html>