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
	
		function time_format(format) {
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
			var sec = format.getSeconds();
			if(sec<10) {
				sec = '0' + sec;
			}
			return year + "-" + month + "-" + date + " " + hour + ":" + min + ":" + sec;
		}
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
		
		//페이징
		function page(){ 
			
			$('#hisoutput').each(function() {
				var pagesu = 10;  //페이지 번호 갯수
				var currentPage = 0;
				var numPerPage = 10;  //목록의 수
				var $table = $(this);   
				var tr = $('#auctistable tbody tr');
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
						var output = '';
						var startTime = new Date(item.auction_START_TIME);
						var startTimeShaped = time_format(startTime);
						var endTime = new Date(item.auction_END_TIME);
						var endTimeShaped = time_format(endTime);
						var postDate = new Date(item.auction_POST_DATE);
						var postDateShaped = time_format(postDate);
						output += '<tr class="tr2">';
						output += '<td class="td4">'+item.auction_POST_NUMBER+'</td>';
						output += '<td class="td4">'+item.auction_MD_NAME+'</td>';
						output += '<td class="td4">'+item.entity_NUMBER+'</td>';
						output += '<td class="td4">'+startTimeShaped+'</td>';
						output += '<td class="td4">'+endTimeShaped+'</td>';
						output += '<td class="td4">'+item.auction_BID_PRICE+'</td>';
						output += '<td class="td4">'+postDateShaped+'</td>';
						output += '<td class="td4">'+item.auction_POST_STATUS+'<button id = "stat_change" value="'+item.auction_POST_NUMBER+'">상태변경</button></td>';
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
		$(document).on('click','#auctionList tbody tr',function(event) { 
			var selectedtr = $(this);
			var selectedtd = selectedtr.children();
			var postNumber = selectedtd.eq(0).text();
			params = { "AUCTION_POST_NUMBER" : postNumber};
			$('#hisoutput').empty();
			jQuery.ajax({
				url : '/goodluxe/adminGetAutionDetail.do',
                type : 'POST',
                data : params , 
                dataType : "json", 
                contentType : 'application/x-www-form-urlencoded; charset=UTF-8', 
                success:function(AucHisList) { 
					$.each(AucHisList, function(index, item) {
						console.log(item);
						var hisoutput = '';
						var bid_time = new Date(item.auhis_BID_TIME);
						var bid_timeShaped = time_format(bid_time);
						hisoutput += '<tr class="tr2">';
						hisoutput += '<td class="td3">'+item.member_ID+'</td>';
						hisoutput += '<td class="td3">'+bid_timeShaped+'</td>';
						hisoutput += '<td class="td3">'+item.auhis_BETTING_PRICE+'</td>';
						hisoutput += '</tr>';
						console.log("hisoutput:" + hisoutput);
						$('#hisoutput').append(hisoutput);
					});
					//alert("페이징이 작동을 하나요??");
					page();//페이징
				},
                error:function() {
                   alert("insert ajax통신 실패!!!");
                }
             });
             // 기본 이벤트 제거
             event.preventDefault();
          });
		$(document).on('click','#stat_change',function(event) { 
			var post_number = $(this).val();
			
			params = { "AUCTION_POST_NUMBER" : post_number};
			
			jQuery.ajax({
				url : '/goodluxe/adminAuctionStatChange.do',
                type : 'POST',
                data : params , 
                contentType : 'application/x-www-form-urlencoded; charset=UTF-8', 
                success:function() { 
                	selectData();
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
					<table class="information scrolledTable" id = "auctionList" >
						<thead>
						<tr class="tr1">
							<td class="title_td scrolledTd">경매 게시글 번호</td>
							<td class="title_td scrolledTd">제품이름</td>
							<td class="title_td scrolledTd">상품개체번호</td>
							<td class="title_td scrolledTd">경매시작시간</td>
							<td class="title_td scrolledTd">경매마감시간</td>
							<td class="title_td scrolledTd">제품낙찰가</td>
							<td class="title_td scrolledTd">게시일</td>
							<td class="title_td scrolledTd">게시상태</td>
						</tr>
						</thead>
						<tbody id = "output" class = "scrolledTable">						
							
						</tbody>
					</table>
					<br/><br/><br/>
					<br/><br/><br/>
				
					<table class="information auctistable" id = "output_table">
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
			        		
			        	</div>
			        </center> 
					<br />
				</section>
			</div>

		</div>
	</div>


	<footer id="admin_footer" class="container-fluid"></footer>

</body>

</html>