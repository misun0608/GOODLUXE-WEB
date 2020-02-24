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
	
	

</script>
<script>
	function newWin(){
	    var member_id = document.getElementById("member_id").value;
	    if(member_id==""){
	    	alert("아이디를 입력하세요");
	    	return false;
	    }
	    var link = "adminSearchId.do?member_id="+member_id;
	    alert(link);
	    window.open(link,'아이디검색','resizable=no width=600 height=700');
	    
	}
	function newWin2(){
	    var member_id = document.getElementById("member_id2").value;
	    if(member_id==""){
	    	alert("아이디를 입력하세요");
	    	return false;
	    }
	    var link = "adminSearchId.do?member_id="+member_id;
	    alert(link);
	    window.open(link,'아이디검색','resizable=no width=600 height=700');
	    
	}
	function checkAll(){
		var chk_all = document.getElementById("chk_all");
		var input = document.getElementsByTagName("input");
		
		if(chk_all.checked === true){
			for(var i=0; i<18; i++){//왜 그런진 모르겠으나 갯수가 18개일때 10개가 선택됨....
				if(input[i].type == "checkbox" && input[i].id =="chk_one"&&input[i].checked==false){
					input[i].checked=true;
				}
			}
		}
		if(chk_all.checked === false){
			for(var i=0; i<18; i++){
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
	
	function date_format2(format) {
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
		return year + "-" + month + "-" + date;
	}
	
		// 모달...
		var modal = document.querySelector(".modal");
	    //var trigger = document.querySelector(".trigger");
	    var closeButton = document.querySelector(".close-button");
	    var useButton = document.querySelector(".use_btn");
	    //var cancelButton = document.querySelector("#cancel");
	
	   //console.log(modal);
	
	   function toggleModal() {
	        modal.classList.toggle("show-modal");
	        //$('#member_id2').val('');
	    }
	
	   function windowOnClick(event) {
	        if (event.target === modal) {
	            toggleModal();
	            //$('#member_id2').val('');
	        }
	    }
	
	   //trigger.addEventListener("click", toggleModal);
	   closeButton.addEventListener("click", toggleModal);
	   useButton.addEventListener("click", toggleModal);
	   //cancel.addEventListener("click", toggleModal);
	   //window.addEventListener("click", windowOnClick);
	 
		function selectData() {
		 $('#output').empty();
		   $.ajax({
		      url:'/goodluxe/CoupondefaultList.do',
		      dataType : "json", // 서버에서 보내줄 데이터 타입
		      contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		      success:function(data) {
		         $.each(data, function(index, item) {//배열의 요소에 해당되는 각각의 데이터(PeopleVO)가 item에 저장된다.
		       	  var ex_date = new Date(item.coupon_expire);
		                var date = date_format(ex_date);
		       	  var output = '';
		            output += '<tr class="context_tr"><td class="check_td"><input type="checkbox" name="delete_this" id = "chk_one" value = "'+item.coupon_number+'"></td>';
					output += '<td class="context_td">'+item.coupon_number+'</td>';
					output += '<td class="context_td">'+item.coupon_type+'</td>';
					output += '<td class="context_td">'+ date +'</td>';
					output += '<td class="context_td">'+item.member_id+'</td></tr>';
		            $('#output').append(output);//뒤에 이어붙이기
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
			var params = $('#issued_list_form').serialize();
	        jQuery.ajax({
	        	url:'/goodluxe/getCouponList.do',
	        		type:'POST',
	        		data : params,
	 				dataType : "json",
	 				contentType:'application/x-www-form-urlencoded; charset=UTF-8',
	 				success: function(data){
	 					$.each(data, function(index, item){
	 						
	 						 var reply_date = new Date(item.coupon_expire);
		                     var date = date_format(reply_date);
		                     
	 						//$('#output').empty();
	 						var output = '';
	 						output += '<tr><td class="check_td"><input type="checkbox" name="delete_this" id = "chk_one" value = "'+item.coupon_number+'"></td>';
	 						output += '<td class="context_td">'+item.coupon_number+'</td>';
	 						output += '<td class="context_td">'+item.coupon_type+'</td>';
	 						output += '<td class="context_td">'+ date +'</td>';
	 						output += '<td class="context_td">'+item.member_id+'</td></tr>';
							console.log("output:" + output);
							$('#output').append(output);//뒤에 이어붙이기
	 					});
	 					page();
	 				},
	 				error:function(){
	 					alert("리스트 ajax통신 실패!!!");
	 				}
	      		});
	     	   //event.preventDefault();
			});
		
		
		$('#delete_btn').click(function(event){
			var delete_this = [];
			$("input[name='delete_this']:checked").each(function(i){
				delete_this.push($(this).val());
			});
			  
			var params = {"delete_this":delete_this};
			
	        jQuery.ajax({
	        	url:'/goodluxe/deleteCouponList.do',
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
		
		// 아이디 검색  ver.Modal 첫번째
		$('#id_search_btn1').on('click',function(event){
			$('#id_search_table').empty();
			var member_id = $('#member_id').val();
			
			if($('#member_id').val() == ''){
				alert('아이디를 입력해주세요!');
				return;
			}
			
			console.log(member_id);
			
			var params = $('#member_id').serialize();
			
			console.log(params);
	        jQuery.ajax({
	        	url:'/goodluxe/adminCheckId.do',
	        		type:'GET',
	        		data : params,
	 				dataType : "json",
	 				contentType:'application/x-www-form-urlencoded; charset=UTF-8',
	 				success: function(data){
	 					//$.each(data, function(item){
	 						console.log('test' + data.member_name);
	 						
	 						var output = '';
		                     if(data.member_name == null & data.member_id == null){
		                    	 output += '요청하신 아이디와 일치하는 회원이 없습니다.';
		                    	 $('#id_search_table').append(output);
		                    	 $('#member_id').val('');
		                    	 toggleModal();
		                    	 return;
		                    }
	 						//$('#output').empty();
	 						
	 						var member_join_date = new Date(data.member_join_date);
		                    var date = date_format2(member_join_date);
	 						output += '<thead><tr><td class="title_td"> 아이디 </td><td class="title_td"> 이 름 </td><td class="title_td">가입일</td><td class="title_td">등급</td></tr></thead>';
	 						output += '<tbody><td class="context_td">'+data.member_id+'</td>';
	 						output += '<td class="context_td">'+data.member_name+'</td>';
	 						output += '<td class="context_td">'+date+'</td>';
	 						output += '<td class="context_td">'+data.member_class+'</td></tr></tbody>';
							//console.log("output:" + output);
							$('#id_search_table').append(output);//뒤에 이어붙이기
	 					//});
	 					//page();
	 					toggleModal();
	 				},
	 				error:function(){
	 					alert("리스트 ajax통신 실패!!!");
	 				}
	      		});
			
		});
		
		
		// 아이디 검색  ver.Modal 두번째
		$('#id_search_btn2').on('click',function(event){
			$('#id_search_table').empty();
			var member_id = $('#member_id2').val();
			
			if($('#member_id2').val() == ''){
				alert('아이디를 입력해주세요!');
				return;
			}
			
			console.log(member_id);
			
			var params = $('#member_id2').serialize();
			
			console.log(params);
	        jQuery.ajax({
	        	url:'/goodluxe/adminCheckId.do',
	        		type:'GET',
	        		data : params,
	 				dataType : "json",
	 				contentType:'application/x-www-form-urlencoded; charset=UTF-8',
	 				success: function(data){
	 					//$.each(data, function(item){
	 						console.log('test' + data.member_name);
	 						
	 						var output = '';
		                     if(data.member_name == null & data.member_id == null){
		                    	 output += '요청하신 아이디와 일치하는 회원이 없습니다.';
		                    	 $('#id_search_table').append(output);
		                    	 $('#member_id2').val('');
		                    	 toggleModal();
		                    	 return;
		                    }
	 						//$('#output').empty();
	 						
	 						var member_join_date = new Date(data.member_join_date);
		                    var date = date_format2(member_join_date);
	 						output += '<thead><tr><td class="title_td"> 아이디 </td><td class="title_td"> 이 름 </td><td class="title_td">가입일</td><td class="title_td">등급</td></tr></thead>';
	 						output += '<tbody><td class="context_td">'+data.member_id+'</td>';
	 						output += '<td class="context_td">'+data.member_name+'</td>';
	 						output += '<td class="context_td">'+date+'</td>';
	 						output += '<td class="context_td">'+data.member_class+'</td></tr></tbody>';
							//console.log("output:" + output);
							$('#id_search_table').append(output);//뒤에 이어붙이기
	 					//});
	 					//page();
	 					toggleModal();
	 				},
	 				error:function(){
	 					alert("리스트 ajax통신 실패!!!");
	 				}
	      		});
			
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
					if (numPages <= endp) {   // 10페이지가 안되면asdgasdfsfadfsdfadsfadfasdfasdaasdfs
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
      <h1 id="container_title">쿠폰관리 페이지</h1>
      <div class="container_wr">
        <section>
          <br><br>	
          
          <h3>| 쿠폰 발급 </h3>
          <br>
          <form name = "issue_form" action = "./issueCoupon.do">
	          <table class="information" border="1">
	            <tr>
	              <td class="td1">발급 대상</td>
	              <td class="td2">
	                <input type = text class="id_search_input" id = "member_id" name = "member_id">
	                <button type="button" id="id_search_btn1" class="id_search_btn">아이디 검색</button>
	                <!-- "window.open('adminSearchId.do','아이디검색','resizable=no width=600 height=700')" -->
	                <input type="checkbox" class="allselect" name = "allselect" value = "all_member"> 전원 지급
	              </td>
	            </tr>
	            <tr>
	              <td class="td1">쿠폰 분류</td>
	              <td class="td2">
	                <select name= "coupon_type" class="search">
						<option name = "coupon_type" value="가입 무료배송 쿠폰">가입 무료배송 쿠폰</option>
						<option name = "coupon_type" value="명절맞이 5%할인(최대 100만원)">명절맞이 5%할인(최대 100만원)</option>
						<option name = "coupon_type" value="2020쥐띠해 기념 10%할인 쿠폰(최대 50만원)">2020쥐띠해 기념 10%할인 쿠폰(최대 50만원)</option>
	                </select>
	              </td>
	            </tr>
	          <!--   <tr>
	              <td class="td1">사용 기한</td>
	              <td class="td2">
	                &nbsp;&nbsp;<input name="text" class="text4"> 일
	              </td>
	            </tr> -->
	          </table>
	          <div class="btn12" align="center">
	            <button type="submit" class="bottom_btn one_btn">발급</button>
	          </div>
          </form>
          
          <br>
          <br>

          <h3>| 쿠폰 발급 검색</h3>
          <br>
          <form id="issued_list_form" method="post">
	          <table class="information">
	            <tr>
	              <td class="td1">발급 대상</td>
	              <td class="td2">
	                <input type="text" class="id_search_input" name = "member_id" id = "member_id2">
	                <!-- <button type="button" class="id_search_btn" onclick = "newWin2();">아이디 검색</button> -->
	                <button type="button" id="id_search_btn2" class="id_search_btn">아이디 검색</button>
	                <input type="checkbox" class="allselect"name = "allselect" value = "all_member"> 전체 보기
	              </td>
	            </tr>
	            <tr>
	              <td class="td1">쿠폰 종류</td>
	              <td class="td2">
	                <select class="search" name = "coupon_type">
	                	<option name= "coupon_type" value="전체">전체</option>
		                <option name= "coupon_type" value="가입 무료배송 쿠폰">가입 무료배송 쿠폰</option>
						<option name= "coupon_type" value="명절맞이 5%할인(최대 100만원)">명절맞이 5%할인(최대 100만원)</option>
						<option name= "coupon_type" value="2020쥐띠해 기념 10%할인 쿠폰(최대 50만원)">2020쥐띠해 기념 10%할인 쿠폰(최대 50만원)</option>
	                </select>
	              </td>
	            </tr>
	            <tr>
	              <td class="td1">쿠폰 상태</td>
	              <td class="td2">
	                &nbsp;&nbsp;
	                <input type="radio" id="coupon_status1" name="coupon_status" value ="all" checked>
	               	<label for ="coupon_status1">전체</label>
	                <input type="radio" id="coupon_status2" name="coupon_status" value = "사용전">
					<label for ="coupon_status2">사용전</label>
	                <input type="radio" id="coupon_status3" name="coupon_status" value = "사용후">
	                <label for ="coupon_status3">사용후</label>
	              </td>
	            </tr>
	          </table>
	          <div class="btn12" align="center">
	            <button type="button" class="bottom_btn one_btn" id ="search_btn">검색</button>
	          </div>
	      </form>    
          <br>
          <br>
	
		<form name="delete_form" method = "post">
          <h3>| 발급 쿠폰 목록 </h3>
          <br />
          <button type="button" class="delete_btn" id ="delete_btn">선택삭제</button>
          <br />
          <br />
          <table class="information" id = "output_table">
            <tr class="tr_title">
              <td class="check_td">
              	<!-- <input type="checkbox"id="chk_all" class="check_td" onclick = "checkAll();"> -->
              </td>
              <td class="title_td">쿠폰 번호</td>
              <td class="title_td">쿠폰  종류</td>
              <td class="title_td">사용 기한</td>
              <td class="title_td">아이디</td>
            </tr>
            <tbody id = "output">
            
            </tbody>
          </table>
         </form>
          <br/>
         <center>
          <div class="pagination" id="pagination">
         </center>
         <br />
        </section>
      </div>
    </div>
  </div>
  <br />

	<!-- 모달 시작 -->
		<div class="modal">
		<div id="modal-content" class="modal-content">
		<span class="close-button">&times;</span>

			<center>
			<br />
<%-- 			<%
				if(nullChk.equals("none")){
					%>
					
					<p>요청하신 아이디와 일치하는 회원이 없습니다.</p>
					
					<%
				}else{
			%> --%>
		
 			<table id="id_search_table" class="id_search_table"></table>
				<br />
				<button class="bottom_btn use_btn">확인</button> 

		</div>
	</div>
	<!-- 모달 끝 -->


  <footer id="admin_footer" class="container-fluid"></footer>

</body>

</html>