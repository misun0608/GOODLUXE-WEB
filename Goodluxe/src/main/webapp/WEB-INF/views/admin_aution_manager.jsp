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
	
		
		function selectData(){
			$('#output').empty();
			$.ajax({
				url:'/goodluxe/admingetAuctionInfo.do',
				type:'POST',
				dataType : "json", 
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success:function(AuctionList) { 
					$.each(AuctionList, function(index, item) {
						console.log(item);
						//alert(item.AUCTION_POST_NUMBER);
						var output = '';
						//var order_date1 = new Date(item.order_order_date);
						//var order_date_shaped = date_format(order_date1);
						//output += '<a href = "getAutionHistoryInfo.do?AUCTION_POST_NUMBER='+item.auction_POST_NUMBER+'" id = "aution_detail" >';
						output += '<tr class="tr2">';
						output += '<td class="td3">'+item.auction_POST_NUMBER+'</td>';
						output += '<td class="td3">'+item.auction_MD_NAME+'</td>';
						output += '<td class="td3">'+item.entity_NUMBER+'</td>';
						output += '<td class="td3">'+item.auction_START_TIME+'</td>';
						output += '<td class="td3">'+item.auction_END_TIME+'</td>';
						output += '<td class="td3">'+item.auction_BID_PRICE+'</td>';
						output += '<td class="td3">'+item.auction_POST_DATE+'</td>';
						output += '<td class="td3">'+item.auction_POST_STATUS+'</td>';
						output += '</tr>';
						//output += '</a>';
						console.log("output:" + output);
						$('#output').append(output);
					});
				},
			 	error:function() {
					alert("리스트 ajax통신 실패!!!");
				}	
			});
		}
		$(document).on('click','#auctionList tr',function(event) { //얘가 바로 동적 버튼!!!
			alert("헤에ㅔ에엥ㅇ");
			var selectedtr = $(this);
			var selectedtd = selectedtr.children();
			console.log("selectedtr"+selectedtr);
			console.log("selectedtd"+selectedtd);
			var postNumber = selectedtd.eq(0).text();
			console.log("postNumber"+postNumber);
			params = { "AUCTION_POST_NUMBER" : postNumber};
			
			jQuery.ajax({
				url : '/goodluxe/adminGetAutionDetail.do',
                type : 'POST',
                data : params , 
                dataType : "json", 
                contentType : 'application/x-www-form-urlencoded; charset=UTF-8', //https://thiago6.tistory.com/11 참고 
                success:function(AucHisList) { 
					$.each(AucHisList, function(index, item) {
						console.log(item);
						//alert(item.AUCTION_POST_NUMBER);
						var hisoutput = '';
						//var order_date1 = new Date(item.order_order_date);
						//var order_date_shaped = date_format(order_date1);
						hisoutput += '<tr class="tr2">';
						hisoutput += '<td class="td3">'+item.member_ID+'</td>';
						hisoutput += '<td class="td3">'+item.auhis_BID_TIME+'</td>';
						hisoutput += '<td class="td3">'+item.auhis_BITTING_PRICE+'</td>';
						hisoutput += '</tr>';
						console.log("hisoutput:" + hisoutput);
						$('#hisoutput').append(hisoutput);
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
						<table class="information auctionList" id = "auctionList" >

						<tr class="tr1">
							<td class="title_td">경매 게시글 번호</td>
							<td class="title_td">제품이름</td>
							<td class="title_td">상품개체번호</td>
							<td class="title_td">경매시작시간</td>
							<td class="title_td">경매마감시간</td>
							<td class="title_td">제품낙찰가</td>
							<td class="title_td">게시일</td>
							<td class="title_td">게시상태</td>
						</tr>
						<tbody id = "output" class = "scrolledTable">						
							
						</tbody>
					</table>
						<br/>
						
						<div class="btn12" align="center">
							<button type="button" class="bottom_btn cancel_btn">초기화</button>
							<button type="button" class="bottom_btn" id = "search_btn">검색</button>
						</div>
					</form>
					<br> <br>
					<br>
					<table class="information" id = "output_table">

						<tr class="tr1">
							<td class="title_td">아이디</td>
							<td class="title_td">입찰시간</td>
							<td class="title_td">입찰가격</td>
						</tr>
						<tbody id = "hisoutput">						
							
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