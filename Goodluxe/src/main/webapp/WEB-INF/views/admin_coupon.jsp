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
		            output += '<tr><td class="td3"><input type="checkbox" name="delete_this" id = "chk_one" value = "'+item.coupon_number+'"></td>';
					output += '<td class="td3">'+item.coupon_number+'</td>';
					output += '<td class="td3">'+item.coupon_type+'</td>';
					output += '<td class="td3">'+ date +'</td>';
					output += '<td class="td3">'+item.member_id+'</td></tr>';
		            $('#output').append(output);//뒤에 이어붙이기
		         });
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
	 						output += '<tr><td class="td3"><input type="checkbox" name="delete_this" id = "chk_one" value = "'+item.coupon_number+'"></td>';
	 						output += '<td class="td3">'+item.coupon_number+'</td>';
	 						output += '<td class="td3">'+item.coupon_type+'</td>';
	 						output += '<td class="td3">'+ date +'</td>';
	 						output += '<td class="td3">'+item.member_id+'</td></tr>';
							console.log("output:" + output);
							$('#output').append(output);//뒤에 이어붙이기
	 					});
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
	 				dataType : "json",
	 				contentType:'application/x-www-form-urlencoded; charset=UTF-8',
	 				success: function(result){	
							selectData();
	 				},
	 				error:function(){
	 					alert("리스트 ajax통신 실패!!!");
	 				}
	      		});
	     	   //event.preventDefault();
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
                <li><a href="./adminMain.html" class="gnb_2da  ">매출현황</a></li>
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
      <h1 id="container_title">관리자 쿠폰관리 페이지</h1>
      <div class="container_wr">
        <section>
          <br><br>	
          
          <h3>▶쿠폰 발급 </h3>
          <br>
          <form name = "issue_form" action = "./issueCoupon.do">
	          <table class="impormation" border="1">
	            <tr>
	              <td class="td1">발급 대상</td>
	              <td class="td2">
	                &nbsp;&nbsp;<input type = text class="text3" id = "member_id" name = "member_id">
	                <button type="button" class="btn22" onclick = "newWin();">아이디 검색</button>
	                <!-- "window.open('adminSearchId.do','아이디검색','resizable=no width=600 height=700')" -->
	                <input type="checkbox" class="allselect" name = "allselect" value = "all_member"> 전원 지급
	              </td>
	            </tr>
	            <tr>
	              <td class="td1">쿠폰 분류</td>
	              <td class="td2">
	                <select name= "coupon_type" class="search">
						<option name = "coupon_type" value="배송비 무료쿠폰">배송비 무료쿠폰</option>
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
	            <button type="submit" class="btn1">발급</button>
	          </div>
          </form>
          
          <br>
          <br>

          <h3>▶쿠폰 발급 검색 </h3>
          <br>
          <form id = "issued_list_form" method = "post">
	          <table class="impormation" border="1" >
	            <tr>
	              <td class="td1">발급 대상</td>
	              <td class="td2">
	                &nbsp;&nbsp;
	                <input class="text3" name = "member_id2" id = "member_id2">
	                <button type="button" class="btn22" onclick = "newWin2();">아이디 검색</button>
	                <input type="checkbox" class="allselect"name = "allselect" value = "all_member"> 전체 보기
	              </td>
	            </tr>
	            <tr>
	              <td class="td1">쿠폰 종류</td>
	              <td class="td2">
	                <select class="search" name = "coupon_type">
	                	<option name = "coupon_type" value="전체">전체</option>
		                <option name = "coupon_type" value="배송비 무료쿠폰">배송비 무료쿠폰</option>
						<option name = "coupon_type" value="명절맞이 5%할인(최대 100만원)">명절맞이 5%할인(최대 100만원)</option>
						<option name = "coupon_type" value="2020쥐띠해 기념 10%할인 쿠폰(최대 50만원)">2020쥐띠해 기념 10%할인 쿠폰(최대 50만원)</option>
	                </select>
	              </td>
	            </tr>
	            <tr>
	              <td class="td1">쿠폰 상태</td>
	              <td class="td2">
	                &nbsp;&nbsp;<input type="radio" name="coupon_status" value = "all" checked > 전체
	                <input type="radio" name="coupon_status" value = "사용전"> 사용전
	                <input type="radio" name="coupon_status" value = "사용후"> 사용후
	              </td>
	            </tr>
	          </table>
	          <div class="btn12" align="center">
	            <button type="button" class="btn1" id = "search_btn">검색</button>
	          </div>
	      </form>    
          <br>
          <br>
	
		<form name="delete_form" method = "post">
          <h3>▶ 발급 쿠폰 목록 </h3>
          <button type="button" class="btn3" id = "delete_btn">삭제</button>
          <br>
          <table border="1" >
            <tr class="tr1">
              <td class="td3"><input type="checkbox"id="chk_all" onclick = "checkAll();"></td>
              <td class="td4">쿠폰 번호</td>
              <td class="td4">쿠폰  종류</td>
              <td class="td4">사용 기한</td>
              <td class="td4">아이디</td>
            </tr>
            <tbody id = "output">
            
            </tbody>
          </table>
         </form>

          <br>
          <p align="center">◁&nbsp;1&nbsp;2&nbsp;3&nbsp;4&nbsp;5&nbsp;▷</p>
        </section>
      </div>
    </div>
  </div>

  <footer class="container-fluid">
    <p>Footer Text</p>
  </footer>

</body>

</html>