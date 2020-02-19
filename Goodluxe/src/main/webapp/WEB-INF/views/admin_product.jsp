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
//<!--<input type="checkbox" id = "chk_all" onclick = "checkAll();">-->
	function selectData() {
		var division_chk = $(':radio[name="pb_division"]:checked').val();
		var params = {"pb_division":division_chk};
		$('#outputth').empty();
		$('#output').empty();
			$.ajax({
				url:'/goodluxe/adminAllProductList.do',
				type:'POST',
				data : params,
				dataType : "json", 
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success:function(data) { 
					if(division_chk=="purchase"){
						var output = "";
						var outputth = "";
						outputth = '<tr class="tr1">'
							+'<td class="td3"></td>'
							+'<td class="title_td">상품번호</td>'
							+'<td class="title_td">상품이름</td>'
							+'<td class="title_td">브랜드</td>'
							+'<td class="title_td">카테고리</td>'
							+'<td class="title_td">상품등급</td>'
							+'<td class="title_td">감정서유무</td>'
							+'<td class="title_td">제품구성품</td>'
							+'<td class="title_td">판매가격</td>'
							+'<td class="title_td">매입가격</td>'
							+'<td class="title_td">매입일</td>'
							+'<td class="title_td">판매자아이디</td>'
							+'<td class="title_td">판매상태</td>'
							+'<td class="title_td">게시상태</td>'
							+'</tr>';
							//+'<tbody>';
						$.each(data, function(index, item) {
							console.log("아이템은????????????"+item);
							
							var purc_date1 = new Date(item.purc_date);
							var purc_date_shaped = date_format(purc_date1);
							output += '<tr class="tr2">';
							output += '<td class="td3"><input type="checkbox" name="delete_this" id = "chk_one" value = "'+item.entity_number+'"></td>';
							output += '<td class="context_td">'+item.entity_number+'</td>';
							output += '<td class="context_td">'+item.pd_name+'</td>';
							output += '<td class="context_td">'+item.pd_brand+'</td>';
							output += '<td class="context_td">'+item.pd_category+'</td>';
							output += '<td class="context_td">'+item.quality_grade+'</td>';
							output += '<td class="context_td">'+item.appraise_exist+'</td>';
							output += '<td class="context_td">'+item.pd_component+'</td>';
							output += '<td class="context_td">'+item.sale_price+'</td>';
							output += '<td class="context_td">'+item.buying_price+'</td>';
							output += '<td class="context_td">'+purc_date_shaped+'</td>';
							output += '<td class="context_td">'+item.member_id+'</td>';
							output += '<td class="context_td">'+item.pb_sale_status;
							output += '<br /><button id="chg_sale_stat_btn" class="delete_btn" value="'+item.entity_number+'">상태변경</button></td>';
							output += '<td class="context_td">'+item.pb_post_status;
							output += '<br /><button id="chg_post_stat_btn" class="delete_btn" value="'+item.entity_number+'">상태변경</button></td>';
							output += '</tr>';
						});
						//output+='</tbody>';
						console.log("output:" + output);
						$('#outputth').append(outputth)
						$('#output').append(output);//뒤에 이어붙이기
					}else{
						var output = "";
						var outputth = "";
						outputth = '<tr class="tr1">'
							+'<td class="td3"></td>'
							+'<td class="title_td">상품번호</td>'
							+'<td class="title_td">상품이름</td>'
							+'<td class="title_td">브랜드</td>'
							+'<td class="title_td">카테고리</td>'
							+'<td class="title_td">상품등급</td>'
							+'<td class="title_td">감정서유무</td>'
							+'<td class="title_td">제품구성품</td>'
							+'<td class="title_td">판매가격</td>'
							+'<td class="title_td">수수료</td>'
							+'<td class="title_td">위탁기간</td>'
							+'<td class="title_td">위탁인 아이디</td>'
							+'<td class="title_td">판매상태</td>'
							+'<td class="title_td">게시상태</td>'
							+'</tr>';
							//+'<tbody>';
						$.each(data, function(index, item) {
							var start_date1 = new Date(item.start_date);
							var start_date_shaped = date_format(start_date1);
							var end_date1 = new Date(item.end_date);
							var end_date_shaped = date_format(end_date1);
							
							output += '<tr class="tr2">';
							output += '<td class="td3"><input type="checkbox" name="delete_this" id = "chk_one" value = "'+item.entity_number+'"></td>';
							output += '<td class="context_td">'+item.entity_number+'</td>';
							output += '<td class="context_td">'+item.pd_name+'</td>';
							output += '<td class="context_td">'+item.pd_brand+'</td>';
							output += '<td class="context_td">'+item.pd_category+'</td>';
							output += '<td class="context_td">'+item.quality_grade+'</td>';
							output += '<td class="context_td">'+item.appraise_exist+'</td>';
							output += '<td class="context_td">'+item.pd_component+'</td>';
							output += '<td class="context_td">'+item.sale_price+'</td>';
							output += '<td class="context_td">'+item.commission+'</td>';
							output += '<td class="context_td">'+start_date_shaped+'  ~  '+end_date_shaped+'</td>';
							output += '<td class="context_td">'+item.member_id+'</td>';
							output += '<td class="context_td">'+item.pb_sale_status;
							output += '<br /><button id="chg_sale_stat_btn" class="delete_btn" value="'+item.entity_number+'">상태변경</button></td>';
							output += '<td class="context_td">'+item.pb_post_status;
							output += '<br /><button id="chg_post_stat_btn" class="delete_btn" value="'+item.entity_number+'">상태변경</button></td>';
							output += '</tr>';
						});	
						//output+='</tbody>';
						$('#outputth').append(outputth);//뒤에 이어붙이기
						console.log("output:" + output);
						$('#output').append(output);//뒤에 이어붙이기
					}
					page();
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
		$('#outputth').empty();
		$('#output').empty();
		jQuery.ajax({
			url : '/goodluxe/adminProductList.do',
			type : 'POST',
			data : params,
			dataType:"json",
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success:function(data) { 
				if(division_chk=="purchase"){
					var output = "";
					var outputth = "";
					outputth = '<tr class="tr1">'
						+'<td class="td3"><input type="checkbox"  id = "chk_all"></td>'
						+'<td class="title_td">상품번호</td>'
						+'<td class="title_td">상품이름</td>'
						+'<td class="title_td">브랜드</td>'
						+'<td class="title_td">카테고리</td>'
						+'<td class="title_td">상품등급</td>'
						+'<td class="title_td">감정서유무</td>'
						+'<td class="title_td">제품구성품</td>'
						+'<td class="title_td">판매가격</td>'
						+'<td class="title_td">매입가격</td>'
						+'<td class="title_td">매입일</td>'
						+'<td class="title_td">판매자아이디</td>'
						+'<td class="title_td">판매상태</td>'
						+'<td class="title_td">게시상태</td>'
						+'</tr>';
					
					$.each(data, function(index, item) {
						var purc_date1 = new Date(item.purc_date);
						var purc_date_shaped = date_format(purc_date1);
						output += '<tr class="tr2">';
						output += '<td class="td3"><input type="checkbox" name="delete_this" id = "chk_one" value = "'+item.entity_number+'"></td>';
						output += '<td class="context_td">'+item.entity_number+'</td>';
						output += '<td class="context_td">'+item.pd_name+'</td>';
						output += '<td class="context_td">'+item.pd_brand+'</td>';
						output += '<td class="context_td">'+item.pd_category+'</td>';
						output += '<td class="context_td">'+item.quality_grade+'</td>';
						output += '<td class="context_td">'+item.appraise_exist+'</td>';
						output += '<td class="context_td">'+item.pd_component+'</td>';
						output += '<td class="context_td">'+item.sale_price+'</td>';
						output += '<td class="context_td">'+item.buying_price+'</td>';
						output += '<td class="context_td">'+purc_date_shaped+'</td>';
						output += '<td class="context_td">'+item.member_id+'</td>';
						output += '<td class="context_td">'+item.pb_sale_status;
						output += '<br /><button id="chg_sale_stat_btn" class="delete_btn" value = "'+item.entity_number+'">상태변경</button></td>';
						output += '<td class="context_td">'+item.pb_post_status;
						output += '<br /><button id="chg_post_stat_btn" class="delete_btn" value = "'+item.entity_number+'">상태변경</button></td>';
						output += '</tr>';
					});
					$('#outputth').append(outputth);//뒤에 이어붙이기
					console.log("output:" + output);
					$('#output').append(output);//뒤에 이어붙이기
				}else{
					var output  = "";
					var outputth = "";
					outputth = '<tr class="tr1">'
						+'<td class="td3"><input type="checkbox"name="delivermanagement" id = "chk_all"></td>'
						+'<td class="title_td">상품번호</td>'
						+'<td class="title_td">상품이름</td>'
						+'<td class="title_td">브랜드</td>'
						+'<td class="title_td">카테고리</td>'
						+'<td class="title_td">상품등급</td>'
						+'<td class="title_td">감정서유무</td>'
						+'<td class="title_td">제품구성품</td>'
						+'<td class="title_td">판매가격</td>'
						+'<td class="title_td">수수료</td>'
						+'<td class="title_td">위탁기간</td>'
						+'<td class="title_td">위탁인아이디</td>'
						+'<td class="title_td">판매상태</td>'
						+'<td class="title_td">게시상태</td>'
						+'</tr>';
						
					$.each(data, function(index, item) {
						var start_date1 = new Date(item.start_date);
						var start_date_shaped = date_format(start_date1);
						var end_date1 = new Date(item.end_date);
						var end_date_shaped = date_format(end_date1);
						
						output += '<tr class="tr2">';
						output += '<td class="td3"><input type="checkbox"name="delete_this" id = "chk_one"  value = "'+item.entity_number+'"></td>';
						output += '<td class="context_td">'+item.entity_number+'</td>';
						output += '<td class="context_td">'+item.pd_name+'</td>';
						output += '<td class="context_td">'+item.pd_brand+'</td>';
						output += '<td class="context_td">'+item.pd_category+'</td>';
						output += '<td class="context_td">'+item.quality_grade+'</td>';
						output += '<td class="context_td">'+item.appraise_exist+'</td>';
						output += '<td class="context_td">'+item.pd_component+'</td>';
						output += '<td class="context_td">'+item.sale_price+'</td>';
						output += '<td class="context_td">'+item.commission+'</td>';
						output += '<td class="context_td">'+start_date_shaped+'  ~  '+end_date_shaped+'</td>';
						output += '<td class="context_td">'+item.member_id+'</td>';
						output += '<td class="context_td">'+item.pb_sale_status;
						output += '<br /><button id="chg_sale_stat_btn" class="delete_btn" value="'+item.entity_number+'">상태변경</button></td>';
						output += '<td class="context_td">'+item.pb_post_status;
						output += '<br /><button id="chg_post_stat_btn" class="delete_btn" value = "'+item.entity_number+'">상태변경</button></td>';
						output += '</tr>';
					});	
					
					console.log("output:" + output);
					$('#outputth').append(outputth);//뒤에 이어붙이기
					$('#output').append(output);//뒤에 이어붙이기
				}
				page();
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
			var numRows = tr.length-1;
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




});

</script>

</head>
<body>

	<header id="hd"></header>

	<div id="wrapper">

		<div id="container" class="container-small">
			<h1 id="container_title">상품상태 관리</h1>
			<div class="container_wr">
				<section>
				
					<br />
					<br />
					
					<h3>| 배송관리</h3>
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
									<input type="radio" id="pb_post_status2" name ="pb_post_status" value = "게시중"/>
									<label for="pb_post_status2">게시중</label>
									<input type="radio" id="pb_post_status3" name ="pb_post_status" value = "게시안함"/>
									<label for="pb_post_status3">게시안함</label>
								</td>
							</tr>
							<tr>
								<td class="td1">판매상태</td>
								<td class="td2">&nbsp;&nbsp;
									<input type="radio" name ="pb_sale_status" value ="all" id ="is_checked2" checked/>
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
						<table class="information" id ="output_table">
							<tr>
								<td class="td1">상품번호</td>
								<td class="td2">
									<input type = "text" class="text3" name = "entity_number" id = "txtentity_number">
								</td>
							</tr>
						</table>


						<div class="btn12" align="center">
							<button type="button" class="bottom_btn cancel_btn" id = "init_btn">초기화</button>
							<button type="button" class="bottom_btn" id ="search_btn">검색</button>
						</div>
					</form>
					<br> <br> <br> <br> <br>
					<div class="config01">
						<button type="button" class="delete_btn" id ="delete_btn">선택삭제</button>
						<br> <br>
					</div>
					<form id = "chk_form">
						<table class="information2" id="output_table">
							<thead id="outputth"></thead>
							<tbody id="output"></tbody>
						</table>
					</form>
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