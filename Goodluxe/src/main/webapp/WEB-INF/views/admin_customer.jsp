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
      $("#hd").load("admin_header.do");
      $("#admin_footer").load("admin_footer.do");
   });
</script>
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
							output += '<td class="context_td"><input type = "hidden" name = "member_id" value = "'+item.member_id+'">'+item.member_id+'</td>';
							output += '<td class="context_td">'+item.member_name+'</td>';
							output += '<td class="context_td">'+isblack+'</td>';
							output += '<td class="context_td">'+item.member_phone+'</td>';
							output += '<td class="context_td">'+item.member_email+'</td>';
							output += '<td class="context_td"><button class="delete_btn black_btn" id="black_btn" value = "'+item.member_id+'">블랙리스트 설정</button> </td>';
							output += '</tr>';
							console.log("output:" + output);
							$('#output').append(output);//뒤에 이어붙이기
							//alert('오');
						});
						page();
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
					output += '<td class="context_td"><input type = "hidden" name = "member_id" value = "'+data.member_id+'">'+data.member_id+'</td>';
					output += '<td class="context_td">'+data.member_name+'</td>';
					output += '<td class="context_td">'+isblack+'</td>';
					output += '<td class="context_td">'+data.member_phone+'</td>';
					output += '<td class="context_td">'+data.member_email+'</td>';
					output += '<td class="context_td"><button class="delete_btn" id="black_btn" value = "'+data.member_id+'">설정</button> </td>';
					output += '</tr>';
					console.log("output:" + output);
					$('#output').append(output);//뒤에 이어붙이기
					$('#idSearchBox').val('');
					page();
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

	<script src="http://code.jquery.com/jquery-latest.js"></script>


	<div id="wrapper">

		<div id="container" class="container-small">

			<h1 id="container_title">관리자 고객관리 페이지</h1>
			<div class="container_wr">
				<section>
					<br><br>
					<h3>| 회원조회</h3>
					<br>
					<form id = "search_member_form">
						<table class="information">
							<tr>
								<td class="td1">아이디</td>
								<td class="td2">
									<input type="text" class="id_search_input" name="member_id" id ="idSearchBox">
								</td>
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
						<button type="button" class="bottom_btn cancel_btn" id ="init_btn">초기화</button>
						<button type="button" class="bottom_btn" id ="search_btn">검색</button>
					</div>
					<br><br><br>
					
					
						<div class="config01">
							<!-- <input type="submit" class="btn4" id = "black_btn" value = "블랙리스트 설정"/>  -->
							<br>
						</div> 
						<table class="information" id="output_table">
							<tr class="tr1">
								<td class="title_td">아이디</td>
								<td class="title_td">이름</td>
								<td class="title_td">등급</td>
								<td class="title_td">핸드폰</td>
								<td class="title_td">이메일</td>	
								<td class="title_td">블랙리스트 설정/해제</td>
							</tr>
							<tbody  id = "output">
							
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