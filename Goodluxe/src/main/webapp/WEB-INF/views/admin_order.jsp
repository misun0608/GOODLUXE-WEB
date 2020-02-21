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
		$(this).parent().children("#order_invoice_number").show();
		$(this).parent().children("#inv_p").show();
		$(this).parent().children("#btn_start_shipping").show();
		//the_btn.parent().children().eq(2).show();
		//the_btn.parent().children().eq(3).show();
		//the_btn.parent().children().eq(4).show();
		//the_btn.parent().children().eq(5).show();
		//$("#order_invoice_number").show();
		//$("#inv_p").show();
		//$("#btn_start_shipping").show();
		
		});
		
	}
</script>
<!-- <script>
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
	


</script> -->
<script>
	$(document).ready(function(){
		// 모달...
		var modal = document.querySelector(".modal");
	    var closeButton = document.querySelector(".close-button");

	
	    function toggleModal() {
	        modal.classList.toggle("show-modal");
	        //$('#member_id2').val('');
	     }
	    
	    // 모달바깥창 눌렀을 때 꺼지게
	    function windowOnClick(event) {
	        if (event.target === modal) {
	            toggleModal();
	        }
	    }
	   
	    closeButton.addEventListener("click", toggleModal);
	    window.addEventListener("click", windowOnClick);
	   
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
		
		$('input[name=is_payed]:eq(1)').click(function(event){
			document.getElementById("is_checked3").checked = true;
			document.getElementById("is_checked4").checked = false;
			document.getElementById("is_checked5").checked = false;
			document.getElementById("is_checked6").checked = false;
		});
		$('input[name=is_payed]:eq(2)').click(function(event){
			document.getElementById("is_checked3").checked = false;
			document.getElementById("is_checked4").checked = true;
			document.getElementById("is_checked5").checked = true;
			document.getElementById("is_checked6").checked = true;
		});
		
		function selectData() {
			$('#output').empty();
				$.ajax({
					url : '/goodluxe/getAllOrderList.do',
					type : 'POST',
					dataType:"json",
					contentType:'application/x-www-form-urlencoded; charset=UTF-8',
					success:function(data){
						$.each(data,function(index,item){
							if(item.order_status!='환불완료' & item.order_status!='반품확인' & item.order_status!='환불신청'){
								var date = new Date(item.order_pay_date);
								var pay_date = date_format(date);
								
								if(item.order_pay_date == null){pay_date = ""}
								
								var link = "./getShippingInfo.do?order_number='"+item.order_number+"'";
								var wintxt = "window.open('this.href','배송정보','resizable=no width=600 height=700');";
								
								var output = ''; 
								output += '<tr class="tr2">';
								//output += '<td class="td3"><input type="checkbox" id = "chk_one" name="change_me" value = "'+item.order_number+'"></td>';
								output += '<td class="context_td">'+pay_date+'</td>';
								output += '<td class="context_td">'+item.order_number+'</td>';
								output += '<td class="context_td"><span id = "show_member_info" style="cursor: pointer;">'+item.member_id+'</span></td>';
								
								output += '<td class="context_td">'+item.pb_number+'</td>';
								output += '<td class="context_td">'+item.order_pay_price+'</td>';
								output += '<td class="context_td">'+item.order_pay_system+'</td>';
								output += '<td class="context_td">'+item.order_status;
									if(item.order_status=='입금전'){
										output += '<br/><button class="delivery_btn" value="'+item.order_number+'" id ="btn_money_get">배송준비중</button>'
									}
									if(item.order_status=='배송준비중'){
										output +='<br /><button class="delivery_btn" id = "invoice_input" onclick = "invoice_show();">배송시작</button><br/>';
										output +='<p id ="inv_p" style="display:none">송장번호 :</p><input type ="text" id ="order_invoice_number" style="display:none">';
										output +='<button class="delivery_btn confirm_btn" value ="'+item.order_number+'" id ="btn_start_shipping" style="display:none">확인</button>';
									}
									if(item.order_status=='배송중'){
										output +='<br /><button class="delivery_btn finish_btn" value = "'+item.order_number+'" id = "btn_end_shipping">배송완료</button>';
									}
								output +='</td>';
								output += '</tr>';
								console.log("output:" + output);
								$('#output').append(output);//뒤에 이어붙이기
							}
						});
						page();
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
								if(item.order_status!='환불완료' & item.order_status!='반품확인' & item.order_status!='환불신청'){
									var date = new Date(item.order_pay_date);
									var pay_date = date_format(date);
									
									if(item.order_pay_date == null){pay_date = ""}
									
									var link = "./getShippingInfo.do?order_number='"+item.order_number+"'";
									var wintxt = "window.open('this.href','배송정보','resizable=no width=600 height=700');";
									
									var output = ''; 
									output += '<tr>';
									//output += '<td class="td3"><input type="checkbox" id = "chk_one" name="change_me"  value = "'+item.order_number+'"></td>';
									output += '<td class="context_td">'+pay_date+'</td>';
									output += '<td class="context_td">'+item.order_number+'</td>';
									output += '<td class="context_td"><span id = "show_member_info" style="cursor: pointer;">'+item.member_id+'</span></td>';
									output += '<td class="context_td">'+item.pb_number+'</td>';
									output += '<td class="context_td">'+item.order_pay_price+'</td>';
									output += '<td class="context_td">'+item.order_pay_system+'</td>';
									output += '<td class="context_td">'+item.order_status;
										if(item.order_status=='입금전'){
											output += '<br/><button class="delivery_btn" value="'+item.order_number+'" id ="btn_money_get">배송준비중</button>'
										}
										if(item.order_status=='배송준비중'){
											output +='<br /><button class="delivery_btn" id="invoice_input" onclick = "invoice_show();">배송시작</button><br/>';
											output +='<p id = "inv_p" style = "display:none">송장번호 :</p> <input type = "text" id = "order_invoice_number" style = "display:none">';
											output +='<button class="delivery_btn confirm_btn" value = "'+item.order_number+'" id = "btn_start_shipping" style = "display:none">확인</button>';
										}
										if(item.order_status=='배송중'){
											output +='<br /><button class="delivery_btn finish_btn" value="'+item.order_number+'" id ="btn_end_shipping">배송완료</button>';
										} 
									output +='</td>';
									output += '</tr>';
									console.log("output:" + output);
									
									$('#output').append(output);//뒤에 이어붙이기	
								}	
							}
	 					});
	 					page();
	 				},
	 				error:function(){
	 					alert("리스트 ajax통신 실패!!!");
	 				}
	      		});
	     	   //event.preventDefault();
			});
		
		
		// a태그 모달(a태그 안되서 span으로 변경)
		$(document).on('click','#show_member_info',function(event) { 
			//alert(" gkgkgkgkgkg ");
			var memberlink = $(this);
			var orderNum = memberlink.parent().prev().text();
			//alert("orderNum" + orderNum);
			$('#order_detail_table').empty();
			//var params = $('#order_number').serialize();
			//alert('ajax들어옴');
			var params = { "order_number" : orderNum };
	        jQuery.ajax({
	        	url:'/goodluxe/getShippingDetail.do',
	        		type:'GET',
	        		data : params,
	 				dataType : "json",
	 				contentType:'application/x-www-form-urlencoded; charset=UTF-8',
	 				traditional:true,
	 				success: function(data){
							var output = ''; 
							output += '<tr>';
							output += '<td colspan="2" class="top_td"><b>'+data.member_id + '</b>&nbsp;님의 배송 정보'+'</td></tr>';
							output += '<tr><td class="order_ti_td">'+'주문번호'+'</td>';
							output += '<td class="order_co_td">'+data.order_number+'</td></tr>';
							output += '<tr><td class="order_ti_td">'+'받는사람'+'</td>';
							output += '<td class="order_co_td">'+data.member_name+'</td></tr>';
							output += '<tr><td class="order_ti_td">'+'주 소'+'</td>';
							output += '<td class="order_co_td">'+data.order_addr1+data.order_addr2+'<br />우)'+data.order_zipcode+'</td></tr>';
							output += '<tr><td class="order_ti_td">'+'핸드폰'+'</td>';
							output += '<td class="order_co_td">'+data.order_phone+'</td></tr>';
							
							$('#order_detail_table').append(output);//뒤에 이어붙이기	
							toggleModal();
	 				},
	 				error:function(){
	 					alert("리스트 ajax통신 실패!!!");
	 				}
	      		});
	     	   event.preventDefault();
			});
		
		
		$(document).on('click','#btn_start_shipping',function(event) { 
			var start_btn = $(this);
			var orderNo = start_btn.attr("value");
			var invoice_txt = start_btn.parent();
			var invoice = invoice_txt.attr("value");
			var order_invoice_number =start_btn.prev().val();
			
			alert('alert'+order_invoice_number);
			if(order_invoice_number==""){
				alert('송장번호를 입력하세요');//왜 안뜨나요....???
				return false;
			}
			
			var params = {"order_number" : orderNo, "order_invoice_number":order_invoice_number}
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
		
		$(document).on('click','#btn_money_get',function(event) { 
			var money_get_btn = $(this);
			var data = money_get_btn.attr("value");
	
			var params = {
				"order_number" : data
			}
			jQuery.ajax({
				url : '/goodluxe/adminOrderMoneyGetShipping.do',
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
			
		$('#init_btn').click(function(event){
		//$(document).on('click','#init_btn',function(event) { 
			document.getElementById("order_number_txt").value =""; 
			document.getElementById("period").value="none";
			document.getElementById("date1").value="";
			document.getElementById("date2").value="";

			document.getElementById("is_checked2").checked= true;
			document.getElementById("is_checked3").checked= true;
			document.getElementById("is_checked4").checked= true;
			document.getElementById("is_checked5").checked= true;
			document.getElementById("is_checked6").checked= true;
			$("input:radio[id='cancelY']").prop("checked",true);
			selectData();
		});
		
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
</head>
<body>

	<header id="hd"></header>
	
	<div id="wrapper">

		<div id="container" class="container-small">

			<h1 id="container_title">| 주문 관리 > 전체 주문 목록</h1>
			<div class="container_wr">
				<section>
					<br><br>
					<form id = "search_filter_form">
						<table class="information" >
							<tr>
								<td class="td1">주문번호</td>
								<td class="td2">&nbsp;&nbsp;<input type="text"
									class="text3" name="order_number"id = "order_number_txt"></td>
							</tr>
						</table>
						<br/>
						<table class="information">
							<tr>
								<td class="td1">기간</td>
								<td class="td2">
									<select class="search" name = "period" id = "period" onchange= "dateSelect();">
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
								<td class="td2">&nbsp;&nbsp;
									<input type="checkbox"name="check_order_status" value = "입금전" id = "is_checked3" checked> 입금대기 &nbsp;
									<input type="checkbox"name="check_order_status" value = "배송준비중" id = "is_checked4" checked> 배송 준비중 &nbsp;
									<input type="checkbox"name="check_order_status" value = "배송중" id = "is_checked5" checked> 배송중 &nbsp;
									<input type="checkbox"name="check_order_status" value = "배송완료" id = "is_checked6" checked> 배송 완료
								</td>
							</tr>
							
							<tr>
								<td class="td1">입금 /결제상태</td>
								<td class="td2">&nbsp;&nbsp;
									<input type="radio" name="is_payed" id ="is_checked2" value="all" checked> 
									<label for="is_checked2">전체</label>
									<input type="radio" id="is_payed1" name="is_payed" value="beforeP">
									<label for="is_payed1">입금전</label>
									<input type="radio" id="is_payed2" name="is_payed" value="afterP">
									<label for="is_payed2">결제완료</label>
								</td>
							</tr>
	
						</table>
						<br/>
						<table class="information">
							<tr>
								<td class="td1">cs 주문상태</td>
								<td class="td2">&nbsp;&nbsp;
									<!-- <input type="radio"name="is_canceled" id = "is_checked" value = "all" checked> 전체 &nbsp; -->
									<input type="radio" name="is_canceled" value = "cancelY" id ="cancelY" checked>
									<label for="cancelY">취소제외</label>
									<input type="radio" id="cancelN" name="is_canceled" value = "cancelN">
									<label for="cancelN">취소내역</label>
								</td>
							</tr>
						</table>
						<div class="btn12" align="center">
							<button type="button" class="order_select_all_btn" id="init_btn">전체보기</button>
							<button type="button" class="bottom_btn" id="search_btn">검색</button>
						</div>
					</form>
					<br> <br>
					<form id = "order_status_form" method = "post" class = "table_behind">
					
						<!--  <input type = "submit" class="btn4" id="btn_start_shipping" value = "배송상태변경-발송완료">
						<input type = "submit" class="btn4" id="modal_open" value = "배송상태변경-배송완료">
						<button id = "modal_open">fasdfasd</button>-->
						
						
						<table class="information" id ="output_table">
							<tr class="tr1">
								<!--  <td class="td3"><input type="checkbox"id="chk_all" onclick = "checkAll();"></td> -->
								<td class="title_td">주문일(결제일)</td>
								<td class="title_td">주문번호</td>
								<td class="title_td">주문자</td>
								<td class="title_td">상품번호[상품명]</td>
								<td class="title_td">결제금액</td>
								<td class="title_td">결제수단</td>
								<td class="title_td">배송상태</td>
							</tr>
							<tbody id = "output">
								
							</tbody>
						</table>
					</form>
					<br>
					 <center>
			          	<div class="pagination" id="pagination">
			         </center> 
			         <br />
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
	<!-- Modal -->
	<div class="modal">
		<div class="modal-content">
			<span class="close-button">&times;</span>
			<br />
			<table id="order_detail_table"></table>
		</div>
	</div>
	

	<footer id="admin_footer" class="container-fluid"></footer>
</body>

</html>