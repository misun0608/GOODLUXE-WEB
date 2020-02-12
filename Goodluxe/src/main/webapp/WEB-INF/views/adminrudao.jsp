<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.util.*"%>
<%@page import="com.spring.goodluxe.jj.AuctionVO"%>

<!-- 파일 중복처리 객체 임포트 -->

<!doctype html>
<html lang="ko">
<script type="text/javascript">
	var ts = Math.floor(+new Date() / 1000);
	var ct = Math.floor(+new Date());
</script>


<head>
<meta charset="utf-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>관리자메인</title>
<link rel="stylesheet" href="./resources/css/admincss.css">

<script type="text/javascript" src="./resources/js/jquery-3.4.1.js"></script>
<script src="./resources/js/jquery-1.8.3.min.js"></script>
<script src="./resources/js/jquery.menu.js"></script>

</head>

<body>
	<form action="./rudaodetail.do" name="adminrudao" method="post"
		enctype=multipart/form-data>
		<header id="hd">
			<div id="hd_top">
				<button type="button" id="btn_gnb"
					class="btn_gnb_close btn_gnb_open"></button>
				<div id="logo">
					<a href="./adminMain.html"><img src="./resources/img/admin.png"
						width="30px"></a>
				</div>

				<div id="tnb">
					<ul>
						<li class="tnb_li"><a href="#" class="tnb_service"
							target="_blank"><img src="./resources/img/home.png"
								width="25px"></a></li>
					</ul>
				</div>
			</div>
			<nav id="gnb" class="gnb_large gnb_small">

				<ul class="gnb_ul">
					<li class="gnb_li">
						<button type="button" class="btn_op menu-200 menu-order-2"
							title="회원관리">회원관리</button>
						<div class="gnb_oparea_wr">
							<div class="gnb_oparea">
								<h3>회원관리</h3>
								<ul>
									<li><a href="./admincustomermanagement.html"
										class="gnb_2da  ">회원관리</a></li>
									<li><a href="./adminpointmanagement.html"
										class="gnb_2da  gnb_grp_div">적립금관리</a></li>
									<li><a href="./admincouponmanagement.html"
										class="gnb_2da  ">쿠폰관리</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="gnb_li">
						<button type="button" class="btn_op menu-900 menu-order-2"
							title="회원관리">상품관리</button>
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
						<button type="button" class="btn_op menu-300 menu-order-3"
							title="게시판관리">게시판관리</button>
						<div class="gnb_oparea_wr">
							<div class="gnb_oparea">
								<h3>게시판관리</h3>
								<ul>
									<li><a href="./adminpostmanagement.html" class="gnb_2da  ">게시판관리</a></li>
									<li><a href="./adminvksao.html" class="gnb_2da  ">게시판
											판매 등록</a></li>
									<li><a href="./adminrudao.html" class="gnb_2da  ">게시판
											경매 등록</a></li>
									<li><a href="#" class="gnb_2da  gnb_grp_div">QnA관리</a></li>
									<li><a href="#" class="gnb_2da gnb_grp_style ">FAQ관리</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="gnb_li">
						<button type="button" class="btn_op menu-400 menu-order-4"
							title="쇼핑몰관리">몰관리</button>
						<div class="gnb_oparea_wr">
							<div class="gnb_oparea">
								<h3>사이트 관리</h3>
								<ul>
									<li><a href="./adminorderproduct.html"
										class="gnb_2da gnb_grp_style gnb_grp_div">주문목록</a></li>
									<li><a href="./adminorderproduct_cancel.html"
										class="gnb_2da gnb_grp_style gnb_grp_div">주문취소</a></li>
									<li><a href="./adminorderproduct_refund.html"
										class="gnb_2da gnb_grp_style gnb_grp_div">주문 반품</a></li>
									<li><a href="./adminorderproduct_return.html"
										class="gnb_2da gnb_grp_style gnb_grp_div">주문 환불</a></li>
									<li><a href="./adminorderproduct_customermanagement.html"
										class="gnb_2da gnb_grp_style ">주문 고객 관리</a></li>
									<li><a href="./adminproductregister.html"
										class="gnb_2da  ">상품등록</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="gnb_li">
						<button type="button" class="btn_op menu-500 menu-order-5"
							title="쇼핑몰현황/기타">쇼핑몰현황/기타</button>
						<div class="gnb_oparea_wr">
							<div class="gnb_oparea">
								<h3>쇼핑몰현황/기타</h3>
								<ul>
									<li><a href="./adminMain.html" class="gnb_2da  ">매출현황</a></li>
									<li><a href="./admindelivermanagement.html"
										class="gnb_2da ">배송관리</a></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</nav>

		</header>

		<script src="http://code.jquery.com/jquery-latest.js"></script>

		<script type="text/javascript">
		function checkEntity(){
			
		    var entity_number = $('#entity_number').val();
		    
		    $.ajax({
		    	 type:'POST', //데이터 보낼 때 방식 사용
		    	 url : '/goodluxe/enumberCheck.do',
		    	 contentType:'application/x-www-form-urlencoded; charset=utf-8',
		    	 async:false,
		    	 dataType: 'json', //결과 값을 받아올 때 (응답받을 때 ) 서버에서 보내줄 데이터 타입
	             data : {
	            	"entity_number" : entity_number
	             },
	             success : function(data) {
	                if(entity_number=="" || data=='0') {
	                    $("#signupbtn").prop("disabled", true);
	                    $("#signupbtn").css("background-color", "#aaaaaa");
	                    $("#checkaa").css("background-color", "#FFCECE");
	                    idCheck = 0;
	                } else if (data == '1') {
	                    $("#signupbtn").prop("disabled", false);
	                    $("#signupbtn").css("background-color", "#BBCDDB");
	                    $("#checkaa").css("background-color", "#FFCECE");
	                    idCheck = 0;
	                } 
	            }, error: function (request, status, error){ 
	            	alert("bye!")
				      var msg = "ERROR<br><br>"
				      msg += request.status + "<br>" + request.responseText + "<br>" + error;
				      console.log(msg);                    
				    }
	        });
	    }
		
		function putimpormation(obj){
			var entity_number = obj.value;
			 $.ajax({
		    	 type:'POST', //데이터 보낼 때 방식 사용
		    	 url : '/goodluxe/putimporamtion.do',
		    	 contentType:'application/x-www-form-urlencoded; charset=utf-8',
		    	 async:false,
		    	 dataType: 'json', //결과 값을 받아올 때 (응답받을 때 ) 서버에서 보내줄 데이터 타입
	             data : {
	            	"entity_number" : entity_number
	             },
	             success : function(data) {
	            	 $("#pd_name").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
	            	 $("#pd_brand").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
	            	 $("#pd_category").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
	            	 $("#quality_grade").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
	            	 $("#sale_price").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
	            	 $("#sale_price_2").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐

	     
	            	 
	            	$('#pd_brand').val(data.pd_brand);
	            	 $('#pd_name').val(data.pd_name);
	            	$('#pd_category').val(data.pd_category);
	            	$('#quality_grade').val(data.quality_grade);
	            	 $('#sale_price').val(data.sale_price);
	            	 $('#sale_price_2').val(data.sale_price);
	            	 
	            	 
	            	 
	             }
		, error: function (request, status, error){ 
        	alert("bye!")
        	 		$("#pd_name").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
	            	 $("#pd_brand").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
	            	 $("#pd_category").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
	            	 $("#quality_grade").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
	            	 $("#sale_price").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
	            	 $("#sale_price_2").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐

		      var msg = "ERROR<br><br>"
		      msg += request.status + "<br>" + request.responseText + "<br>" + error;
		      console.log(msg);                    
		    }
			})
			} 	
		
	/* 	var loopSearch=true;
		function keywordSearch(){
			if(loopSearch==false)
				return;
		 var value=document.frmSearch.searchWord.value;
			$.ajax({
				type : "get",
				async : true, //false인 경우 동기식으로 처리한다.
				url : "${contextPath}/goods/keywordSearch.do",
				data : {keyword:value},
				success : function(data, textStatus) {
				    var jsonInfo = JSON.parse(data);
					displayResult(jsonInfo);
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다."+data);
				},
				complete : function(data, textStatus) {
					//alert("작업을완료 했습니다");
					
				}
			}); //end ajax	
		}
		
		function displayResult(jsonInfo){
			var count = jsonInfo.keyword.length;
			if(count > 0) {
			    var html = '';
			    for(var i in jsonInfo.keyword){
				   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
			    }
			    var listView = document.getElementById("suggestList");
			    listView.innerHTML = html;
			    show('suggest');
			}else{
			    hide('suggest');
			} 
		} */
		 
		
		
		</script>

		<div id="wrapper">

			<div id="container" class="container-small">

				<h1 id="container_title">관리자 경매 페이지</h1>
				<div class="container_wr">
					<section>



						<br>
						<h3>▶ 기본 정보 입력</h3>
						<br>
						<table class="impormation" id="ajaxTable" border="1">
							<tr>
								<td class="td1">상품번호</td>
								<td class="td2"><input name="ENTITY_NUMBER" id="entity_number" onblur="putimpormation(this)" oninput = "checkEntity()" class="text1"  /></td>
							</tr>
							<tr>
								<td class="td1">상품명</td>
								<td class="td2"><input id="pd_name" name="AUCTION_MD_NAME" style="pointer-events:none;" class="text1"></td>
							</tr>
							<tr>
								<td class="td1">브랜드</td>
								<td class="td2"><input id="pd_brand" name="pd_brand" style="pointer-events:none;" class="text1"></td>
							</tr>
							<tr>
								<td class="td1">카테고리</td>
								<td class="td2"><input id="pd_category" style="pointer-events:none;" name="pd_category" class="text1"></td>
							</tr>
							<tr>
								<td class="td1">상품 등급</td>
								<td class="td2"><input id="quality_grade" style="pointer-events:none;" name="quality_grade" class="text1"></td>
							</tr>
							<tr>
								<td class="td1">경매 시작가</td>
								<td class="td2"><input id="sale_price" name="AUCTION_START_PRICE"
									class="text1"></td>
							</tr>
							<tr>
								<td class="td1">현재 금액</td>
								<td class="td2"><input id="sale_price_2" style="pointer-events:none;" name="AUCTION_NOW_PRICE"
									class="text1"></td>
							</tr>
							<tr>
								<td class="td1">경매 시작일</td>
								<td class="td2"><input name="AUCTION_START_TIME"
									class="text1"></td>
							</tr>
							<tr>
								<td class="td1">경매 마감일</td>
								<td class="td2"><input name="AUCTION_END_TIME"
									class="text1"></td>
							</tr>
							<tr height="200px">
								<td class="td1">상품 상세 설명</td>
								<td class="td2"><input name="AUCTION_DETAIL" class="text1"></td>
							</tr>
							<tr>
								<td class="td1">경매 게시 상태</td>
								<td class="td2">&nbsp; <input type="radio" />
									&nbsp;전체&nbsp; <input type="radio" name="AUCTION_POST_STATUS" />
									게시 중&nbsp; <input type="radio" name="AUCTION_POST_STATUS" />
									게시 안함&nbsp;
								</td>
								
							</tr>
							
<input type="hidden" name="member_id" value="member_id" />

						</table>
						<br> <br>

						<h3>▶ 이미지 등록</h3>
						<br>


						<div class="inputArea">





							<table class="impormation" border="1">
								<tr>
									<td class="td1">대표 이미지</td>
									<td class="td2"><br> <label for="gdsImg">이미지</label>
										<input type="file" id="real-input" class="image_inputType_file" accept="img/*" name="file_1" multiple />
										<div id="imagePreview">
										</div> <script type="text/javascript" 
											charset="utf-8"></script> <script type="text/javascript">
											
											const browseBtn = document.querySelector('.browse-btn');
											const realInput = document.querySelector('#real-input');

											
											
											function readInputFile(e){
											    var sel_files = [];
											    
											    $('#imagePreview').empty();
											    
											    var files = e.target.files;
											    var fileArr = Array.prototype.slice.call(files);
											    var index = 0;
											    
											    fileArr.forEach(function(f){
											    	if(!f.type.match("image/.*")){
											        	alert("이미지 확장자만 업로드 가능합니다.");
											        	
											            return;
											        };
											        if(files.length <5 ){
											        	sel_files.push(f);
											            var reader = new FileReader();
											            reader.onload = function(e){
											            	var html = `src=${e.target.result} data-file=${f.name} />`;
											                $('imagePreview').append(html);
											                index++;
											            };
											            reader.readAsDataURL(f);
											        }
											    })
											    if(files.length > 4 || files.length<4){
											    	alert("4장만 업로드 할 수 있습니다.");
											    	$('#imagePreview').empty();
											    	
											    	return;
											    }
											}

											$('#real-input').on('change',readInputFile);
											
											
											$(document)
											.ready(
													function() {
														$(
																"#real-input")
																.on(
																		"change",
																		handleImgsFilesSelect);
													});

											
											
											
											
										</script>
										</td>

								</tr>
								<tr>
									<td class="td1">상세 이미지</td>
									<td class="td2"><br> <label for="gdsImg_2">이미지</label>
										<input type="file" id="gdsImg_2" name="file_2" multiple />
										<div class="select_img_2">
										</div> <script type="text/javascript"
											charset="utf-8"></script> <script type="text/javascript">
												var sel_files = [];

												$(document)
														.ready(
																function() {
																	$(
																			"#gdsImg_2")
																			.on(
																					"change",
																					handleImgsFilesSelect);
																});

												function handleImgsFilesSelect(
														e) {
													var files = e.target.files;
													var filesArr = Array.prototype.slice
															.call(files);

													filesArr
															.forEach(function(f) {
																if (!f.type
																		.match("image.*")) {
																	alert("확장자는 이미지 확장자만 가능합니다.");
																	return;
																}

																sel_files
																		.push(f);

																var reader = new FileReader();
																reader.onload = function(
																		e) {
																	var img_html = "<img src=\"" + e.target.result + "\" width='300px' />";
																	$(
																			".select_img_3")
																			.append(
																					img_html);
																}
																reader
																		.readAsDataURL(f);
															});
												}
											</script></td>

								</tr>
								<tr>
									<td class="td1">이미지 미리보기</td>
									<td class="td2"><br> <label for="gdsImg_2"></label>
									<input type="hidden" id="gdsImg_3" name="file_3"  />
										<div class="select_img_3">
										</div>
										
										</td>
								</tr>
							</table>
						</div>
						<br> <br> <br> <br> <br> <br>

						<div align="center">
							<a href="javascript:adminrudao.reset()"><button type="button"
									class="btn4">취소</button></a> <a
								href="javascript:adminrudao.submit()">
								<button id="signupbtn" disabled="true" name="" class="btn4_rest">등록</button>
							</a>
						</div>
					</section>
				</div>

			</div>

		</div>



		<footer class="container-fluid">
			<p>Footer Text</p>
		</footer>
	</form>
</body>

</html>