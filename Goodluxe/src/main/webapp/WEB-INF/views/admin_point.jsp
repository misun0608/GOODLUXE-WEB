<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
  <meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="viewport" content="user-scalable=no,width=device-width, initial-scale=1.0" />
	<title>관리자페이지</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_point_update.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_design_all.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
   $(document).ready(function(){
      $("#hd").load("admin_header.do");
      $("#admin_footer").load("admin_footer.do");
   });
</script>

<script>

// 새창 띄우기
/* function popupform(){
	var popwidth = 460;
	var popheight = 300;
	
	var LeftPosition=(screen.width-popwidth)/2;
	var TopPosition=(screen.height-popheight)/2;
	
	var setting = "toolbar=no, status=no, menubar=no, location=no, resizable=no, scrollbars=no, height="+popheight+", width="+popwidth+",top="+TopPosition+",left="+LeftPosition+"";
	var url = "./pointUpdateView.do"
	window.open(url,'포인트 업데이트',setting);
} */

// nullcheck
function nullcheck(){
    var member_id = document.getElementById("member_id2").value;
    var point_amount = document.getElementById("point_amount").value;
    
    if(member_id==""){
       alert("아이디를 입력하세요");
       $('#member_id2').val('');
       return false;
    }
    
    if(point_amount==""){
        alert("적립금을 입력하세요");
        $('#point_amount').val('');
        return false;
    }
    return true;
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
	
	
	// 모달...
	var modal = document.querySelector(".modal");
    var trigger = document.querySelector(".trigger");
    var closeButton = document.querySelector(".close-button");
    //var cancelButton = document.querySelector("#cancel");

   //console.log(modal);

   function toggleModal() {
        modal.classList.toggle("show-modal");
        $('#member_id2').val('');
        $('#point_amount').val('');
    }

   function windowOnClick(event) {
        if (event.target === modal) {
            toggleModal();
            $('#member_id2').val('');
            $('#point_amount').val('');
        }
    }

   trigger.addEventListener("click", toggleModal);
   closeButton.addEventListener("click", toggleModal);
   //cancel.addEventListener("click", toggleModal);
   window.addEventListener("click", windowOnClick);
	
	// 포인트 입력창
   $('.input_point').on('focusout',function(){
       if($(this).val() != '') {
           $(this).siblings('label').addClass('color');
       } else {
           $(this).siblings('label').removeClass('color');
       }
   });
	
	// 한글 특수문자 입력 금지
	$("#member_id").on("keyup", function() { 
   	$(this).val($(this).val().replace(/[^0-9a-z]/g,"")); 
   });
	
	// 숫자만 입력
	$("#point_amount").on("keyup", function() {
   	$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	// 적립 / 회수 버튼 눌렀을 때
	$('.point_btn').on('click', function(e){
		e.preventDefault();
		// 빈칸인지 확인		
		if(!nullcheck()){
			return;
		}
		
		//window.opener.name="parentPage";	// 부모창의 이름 설정
		//document.point_form.target="parentPage";	// 타겟을 부모창으로 설정
		
		var btnvalue = $(this).val();
		
		$('#btn_value').val(btnvalue);
		document.getElementById('point_form').submit();
		self.close();
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
		              var num = index + 1;
		              
		               var output= '';
		               output += '<tr class="tr2">';
		               output += '<td class="context_td">'+num+'</td>';
		               output += '<td class="context_td">'+date+'</td>';
		               output += '<td class="context_td">'+item.member_id+'</td>';
		               output += '<td class="context_td">'+numberFormat(item.point_amount)+'</td>';
		               output += '<td class="context_td">'+item.point_status+'</td></tr>';
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
                    var num = index + 1;
					
					var output = '';
					output += '<tr class="tr2">';
					output += '<td class="context_td">'+num+'</td>';
					output += '<td class="context_td">'+date+'</td>';
					output += '<td class="context_td">'+item.member_id+'</td>';
					output += '<td class="context_td">'+numberFormat(item.point_amount)+'</td>';
					output += '<td class="context_td">'+item.point_status+'</td></tr>';
					$('#pointtable-tbody').append(output);
            	});
            	$('#member_id').val('');
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
  <header id="hd"></header>


<div id="wrapper">
        <div id="container" class="container-small">
            <h1 id="container_title">적립금관리 페이지</h1>
            <div class="container_wr">
                <section>

                    <br>

                    <br>
                    <h3>| 회원 검색 </h3>
                    <br>
                    <form name="searchform" id="searchform" method="post">
                    <table class="id_table">
                        <tr>
                            <td class="td1">아이디</td>
                            <td class="id_search_td">
                                &nbsp;&nbsp;
                                <input type="text" id="member_id" name="member_id" class="id_search_input" onkeyup="enterkey();">
                                <button type="button" id="idsearchbtn" class="id_search_btn">검색</button>
                            </td>
                        </tr>

                    </table>
                    </form>


                    <br>
                    <br>

                    <h3>| 회원 적립금 내역</h3>
                    <br />
                    <div align="left">
                        <button type="button" id="selectAllbtn"  name="selectbutton" class="select_all_btn">전체보기</button>
                        <!-- <button type="button" id="updatebtn" name="selectbutton" class="select_all_btn" onclick="popupform();">입력</button> -->
                        <button type="button" id="updatebtn2" name="selectbutton" class="trigger select_all_btn">입력</button>
                        &nbsp;&nbsp;&nbsp;
                    </div>
                    <br>
                    <%-- 테이블 --%>
                    <table id="pointtable" class="point_table">
                    	<thead>
                    		<tr class="tr_title">
                    			<td class="title_td">번호</td>
                    			<td class="title_td">날짜</td>
                    			<td class="title_td">아이디</td>
                    			<td class="title_td">금액</td>
                    			<td class="title_td">내용</td>
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
    
    <!-- 모달 시작 -->
	<div class="modal">
		<div class="modal-content">
		<span class="close-button">&times;</span>
			<!-- <div class="point_title">POINT UPDATE</div> -->
			<form action="./admin_point_insert.do" id="point_form" name="point_form">
				<div class="point_data">
					<div class="group">
						<input type="text" id="member_id2" name="member_id" class="input_point" required="required">
						<span class="highlight"></span><label>아이디</label>
					</div>
					<div class="group">
						<input type="text" id="point_amount" name="point_amount" class="input_point" required="required">
						<span class="highlight"></span><label>적립금</label>
					</div>
					<input type="hidden" id="btn_value" name="btn_value" value="">
				</div>
	
				<input type="button" id="point_btn1" class="point_btn" value="적립">
				<input type="button" id="point_btn2" class="point_btn point_btn_back" value="회수">
			</form>
		</div>
	</div>
	<!-- 모달 끝 -->

  <footer id="admin_footer" class="container-fluid"></footer>

</body>

</html>