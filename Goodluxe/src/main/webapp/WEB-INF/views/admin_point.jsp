<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
  <meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="viewport" content="user-scalable=no,width=device-width, initial-scale=1.0" />
	<title>관리자메인</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_design_all.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>

<script>

// 새창 띄우기
function popupform(){
	var popwidth = 460;
	var popheight = 300;
	
	var LeftPosition=(screen.width-popwidth)/2;
	var TopPosition=(screen.height-popheight)/2;
	
	var setting = "toolbar=no, status=no, menubar=no, location=no, resizable=no, scrollbars=no, height="+popheight+", width="+popwidth+",top="+TopPosition+",left="+LeftPosition+"";
	var url = "./pointUpdateView.do"
	window.open(url,'포인트 업데이트',setting);
}

$(document).ready(function(){
	// 날짜형식
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
	
	// 숫자 컴마
	function numberFormat(inputNumber) {
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function checkId(){
       var member_id = document.getElementById("member_id").value;
       if(member_id==""){
          alert("아이디를 입력하세요");
          return false;
       }
	}
	
	// 엔터키
	function enterkey() {
		var keycode = event.keyCode;
			if(keycode == 13){
			go_search(); // 엔터키 입력시 실행할 구문이 담긴 function
			}else{
			return false;
		}
	}
	
	// 한글 특수문자 입력 금지
	$("#member_id").on("keyup", function() { 
    	$(this).val($(this).val().replace(/[^0-9a-z]/g,"")); 
    });

	// 페이징
	function page(){ 
		$('#pointtable-tbody').each(function() {
		var pagesu = 10;  //페이지 번호 갯수
		var currentPage = 0;
		var numPerPage = 10;  //목록의 수
		var $table = $(this);	// this는 pointtable-tbody
		var tr = $('#pointtable tbody tr');
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
		if(currentPage == numPages-1)
			return;
		
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
	
	// 디폴트 리스트
	function selectData(){
		$('#pointtable-tbody').empty();
			$.ajax({
				url:'/goodluxe/getDefaultPointList.do',
				type : 'POST',
				dataType: "json",
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success:function(data){
					$.each(data,function(index,item){
		              var ex_date = new Date(item.point_date);
		              var date = date_format(ex_date);
		               var output= '';
		               output += '<tr class="tr2">';
		               output += '<td class="td3">'+date+'</td>';
		               output += '<td class="td3">'+item.member_id+'</td>';
		               output += '<td class="td3">'+numberFormat(item.point_amount)+'</td>';
		               output += '<td class="td3">'+item.point_status+'</td></tr>';
		               $('#pointtable-tbody').append(output);
		               });
					page();	// 페이징
					
				},
				error:function(){
					alert("포인트 리스트 ajax통신 실패!!!!");
				}
			});
	}
	$('#selectAllbtn').on('click',function(event){
		selectData();
	});
	
	// 아이디 검색 리스트
	$('#idsearchbtn').on('click',function(event){
		$('#pointtable-tbody').empty();
		// 아이디 비었을 경우
		checkId();
		var params = $('#searchform').serialize();
		$.ajax({
			url: '/goodluxe/searchPointList.do',
			type: 'POST',
			data: params,
            contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
            dataType : "json",
            success: function(data){
            	$.each(data,function(index,item){
	                var ex_date = new Date(item.point_date);
                    var date = date_format(ex_date);
					
					var output = '';
					output += '<tr class="tr2">';
					output += '<td class="td3">'+date+'</td>';
					output += '<td class="td3">'+item.member_id+'</td>';
					output += '<td class="td3">'+numberFormat(item.point_amount)+'</td>';
					output += '<td class="td3">'+item.point_status+'</td></tr>';
					$('#pointtable-tbody').append(output);
            	});
            	page();
            },
            error:function(){
            	alert("아이디 검색 포인트 리스트 ajax통신 실패");
            }
		});
	});
	selectData();
});
</script>
</head>
<body>
  <header id="hd">
    <div id="hd_top">
      <button type="button" id="btn_gnb" class="btn_gnb_close btn_gnb_open"></button>
      <div id="logo"><a href="./adminMain.html"><img src="./img/logo.png"></a></div>

      <div id="tnb">
        <ul>
          <li class="tnb_li"><a href="#" class="tnb_service" target="_blank" ><img src="./img/home.png"
                width="25px"></a></li>
        </ul>
      </div>
    </div>
    <nav id="gnb" class="gnb_large gnb_small">

      <ul class="gnb_ul">
        <li class="gnb_li">
          <button type="button" class="btn_op menu-200 menu-order-2" title="회원관리">회원관리</button>
          <div class="gnb_oparea_wr">
            <div class="gnb_oparea">
              <h3>회원관리</h3>
              <ul>
                <li><a href="./admincustomermanagement.html" class="gnb_2da  ">회원관리</a></li>
                <li><a href="./adminpointmanagement.html" class="gnb_2da  gnb_grp_div">적립금관리</a></li>
                <li><a href="./admincouponmanagement.html" class="gnb_2da  ">쿠폰관리</a></li>
              </ul>
            </div>
          </div>
        </li>
        <li class="gnb_li">
          <button type="button" class="btn_op menu-900 menu-order-2" title="회원관리">상품관리</button>
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
          <button type="button" class="btn_op menu-300 menu-order-3" title="게시판관리">게시판관리</button>
          <div class="gnb_oparea_wr">
            <div class="gnb_oparea">
              <h3>게시판관리</h3>
              <ul>
                <li><a href="./adminpostmanagement.html" class="gnb_2da  ">게시판관리</a></li>
                <li><a href="./adminvksao.html" class="gnb_2da  ">게시판 판매 등록</a></li>
                <li><a href="./adminrudao.html" class="gnb_2da  ">게시판 경매 등록</a></li>
                <li><a href="#" class="gnb_2da  gnb_grp_div">Q&A관리</a></li>
                <li><a href="#" class="gnb_2da gnb_grp_style ">FAQ관리</a></li>
              </ul>
            </div>
          </div>
        </li>
        <li class="gnb_li">
          <button type="button" class="btn_op menu-400 menu-order-4" title="쇼핑몰관리">몰관리</button>
          <div class="gnb_oparea_wr">
            <div class="gnb_oparea">
              <h3>사이트 관리</h3>
              <ul>
                <li><a href="./adminorderproduct.html" clss="gnb_2da gnb_grp_style gnb_grp_div">주문목록</a></li>
                <li><a href="./adminorderproduct_cancel.html" clss="gnb_2da gnb_grp_style gnb_grp_div">주문취소</a></li>
                <li><a href="./adminorderproduct_refund.html" clss="gnb_2da gnb_grp_style gnb_grp_div">주문 반품</a></li>
                <li><a href="./adminorderproduct_return.html" clss="gnb_2da gnb_grp_style gnb_grp_div">주문 환불</a></li>
                <li><a href="./adminorderproduct_customermanagement.html" class="gnb_2da gnb_grp_style ">주문 고객 관리</a>
                </li>
                <li><a href="./adminproductregister.html" class="gnb_2da  ">상품등록</a></li>
                <li><a href="./admindelivermanagement.html" clss="gnb_2da gnb_grp_style gnb_grp_div">배송관리</a></li>
              </ul>
            </div>
          </div>
        </li>
        <li class="gnb_li">
          <button type="button" class="btn_op menu-500 menu-order-5" title="쇼핑몰현황/기타">쇼핑몰현황/기타</button>
          <div class="gnb_oparea_wr">
            <div class="gnb_oparea">
              <h3>쇼핑몰현황/기타</h3>
              <ul>
                <li><a href="./adminMain.html" class="gnb_2da">매출현황</a></li>
                <li><a href="./admindelivermanagement.html" class="gnb_2da ">배송관리</a></li>
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
            <h1 id="container_title">관리자 적립금관리 페이지</h1>
            <div class="container_wr">
                <section>

                    <br>

                    <br>
                    <h3>▶ 회원 검색 </h3>
                    <br>
                    <form name="searchform" id="searchform" method="post">
                    <table class="impormation" border="1">
                        <tr>
                            <td class="td1">아이디</td>
                            <td class="td2">
                                &nbsp;&nbsp;<input id="member_id" name="member_id" class="text3" onkeyup="enterkey();">
                                <button type="button" id="idsearchbtn" class="btn22">아이디 검색</button>
                            </td>
                        </tr>

                    </table>
                    </form>


                    <br>
                    <br>

                    <h3>▶회원 적립금 내역</h3>
                    <div align="right">
                        <button type="button" id="selectAllbtn"  name="selectbutton" class="btn23">전체 보기</button>
                        <button type="button" id="updatebtn" name="selectbutton" class="btn23" onclick="popupform();">입력</button>
                        &nbsp;&nbsp;&nbsp;
                    </div>
                    <br>
                    <%-- 테이블 --%>
                    <table border="1" id="pointtable" class="pointtable paginated">
                    	<thead>
                    		<tr class="tr1">
                    			<td class="td4">날짜</td>
                    			<td class="td4">아이디</td>
                    			<td class="td4">금액</td>
                    			<td class="td4">내용</td>
                    		</tr>
                    	</thead>
                    	<%--ajax 내용 들어갈 tbody 부분--%>
                    	<tbody id="pointtable-tbody">
                    	
                    	</tbody>
                    </table>
                    <%-- 테이블 끝 --%>
                    
                    <%-- 페이징 --%>
                    <br />
                    <center>
                    <div class="pagination" id="pagination">
                    </div>
                    <%-- 페이징 끝 --%>
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