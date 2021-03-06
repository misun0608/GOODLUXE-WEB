<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.util.*"%>
<%@page import="com.spring.goodluxe.voes.AuctionVO"%>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin_design_all.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src='${pageContext.request.contextPath}/resources/js/jquery.form.js' type="text/javascript" language="javascript"></script>
<script src='${pageContext.request.contextPath}/resources/js/jquery.MetaData.js' type="text/javascript" language="javascript"></script>
<script src='${pageContext.request.contextPath}/resources/js/jquery.MultiFile.js' type="text/javascript" language="javascript"></script>
<script src='${pageContext.request.contextPath}/resources/js/jquery.MultiFile.min.js' type="text/javascript" language="javascript"></script>

<script>
	$(document).ready(function() {
		$("#hd").load("admin_header.do");
		$("#admin_footer").load("admin_footer.do");
	});
</script>


</head>

<body>
	<form onsubmit="return checkz()" action="./auction_detail.do"
		name="adminrudao" method="post" enctype=multipart/form-data>
		<header id="hd"></header>
		<script type="text/javascript">
		
		
		
		
		
			function checkz() {

				if ($("#AUCTION_START_TIME").val() == "") {
					alert("경매 시작 시간 입력해주세요 YYYY-MM-DD hh:mm:ss");
					$("#AUCTION_START_TIME").focus();
					return false;
				}
				if ($("#AUCTION_END_TIME").val() == "") {
					alert("경매 마감 시간 입력해주세요 YYYY-MM-DD hh:mm:ss");
					$("#AUCTION_END_TIME").focus();
					return false;
				}
				if ($("#AUCTION_DETAIL").val() == "") {
					alert("상세 설명을 입력해주세요");
					$("#AUCTION_DETAIL").focus();
					return false;
				}
				
				 var fileInput = document.getElementById("real_input");
				 var files = fileInput.files;
				//alert(files.length);
				if (files.length > 4 || files.length < 4) {
					alert("이미지 4개를 골라주세요.");
					return false;
				}
				 var fileInput_2 = document.getElementById("gdsImg_2");
				 var files_2 = fileInput_2.files;
				//alert(files_2.length);
				if (files_2.length < 1) {
					alert("이미지를 1개 이상 골라주세요.");
					return false;
				}
				
				
				
				

				return true;
			}

			function checkEntity() {

				var entity_number = $('#entity_number').val();

				$.ajax({
							type : 'POST', //데이터 보낼 때 방식 사용
							url : '/goodluxe/enumberCheck.do',
							contentType : 'application/x-www-form-urlencoded; charset=utf-8',
							async : false,
							dataType : 'json', //결과 값을 받아올 때 (응답받을 때 ) 서버에서 보내줄 데이터 타입
							data : {
								"entity_number" : entity_number
							},
							success : function(data) {
								if (entity_number == "" || data == '0') {
									$("#signupbtn").prop("disabled", true);
									$("#signupbtn").css("background-color",
											"#aaaaaa");
									$("#checkaa").css("background-color",
											"#FFCECE");
									idCheck = 0;
								} else if (data == '1') {
									$("#signupbtn").prop("disabled", false);
									$("#signupbtn").css("background-color",
											"#BBCDDB");
									$("#checkaa").css("background-color",
											"#FFCECE");
									idCheck = 0;
								}
							},
							error : function(request, status, error) {
								alert("해당하는 상품번호가 없습니다.")
								var msg = "ERROR<br><br>"
								msg += request.status + "<br>"
										+ request.responseText + "<br>" + error;
								console.log(msg);
							}
						});
			}

			function putimpormation(obj) {
				var entity_number = obj.value;
				$
						.ajax({
							type : 'POST', //데이터 보낼 때 방식 사용
							url : '/goodluxe/putimporamtion.do',
							contentType : 'application/x-www-form-urlencoded; charset=utf-8',
							async : false,
							dataType : 'json', //결과 값을 받아올 때 (응답받을 때 ) 서버에서 보내줄 데이터 타입
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

							},
							error : function(request, status, error) {
								alert("해당하는 상품 번호가 없습니다!")
								$("#pd_name").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
								$("#pd_brand").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
								$("#pd_category").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
								$("#quality_grade").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
								$("#sale_price").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
								$("#sale_price_2").val(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐

								var msg = "ERROR<br><br>"
								msg += request.status + "<br>"
										+ request.responseText + "<br>" + error;
								console.log(msg);
							}
						})
			}

			 /* 	var loopSearch=true;
			 	var value = document.getElementById('entity_number').value;
				 alert(value);
			 	
				function keywordSearch(){
					if(loopSearch==false)
						return;
				 var value = document.getElementById('entity_number').value;
				 alert(value);
					$.ajax({
						type : "get",
						async : true, //false인 경우 동기식으로 처리한다.
						url : "/goodluxe/keywordSearch.do",
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
						   html += jsonInfo.keyword[i]+"<br/>";
					    }
					    var listView = document.getElementById("suggestList");
					    listView.innerHTML = html;
					    show('suggest');
					}else{
					    hide('suggest');
					} 
				}   */
		</script>

		<div id="wrapper">

			<div id="container" class="container-small">

				<h1 id="container_title">| 게시판관리 > 경매글등록</h1>
				<div class="container_wr">
					<section>
						<br> <br>
						<h3>| 기본 정보 입력</h3>
						<br>
						<table class="information" id="ajaxTable">
							<tr>
								<td class="td1">상품번호</td>
								<td class="td2" colspan="3"><input type="text"
									name="ENTITY_NUMBER" id="entity_number"
									onblur="putimpormation(this)" oninput="checkEntity()" 
									class="" /> </td>
									
							</tr>
							<tr>
								<td class="td1">상품명</td>
								<td class="td2" colspan="3"><input type="text" id="pd_name"
									name="AUCTION_MD_NAME" style="pointer-events: none;"
									class="text1"></td>
							</tr>
							<tr>
								<td class="td1">브랜드</td>
								<td class="td2"><input type="text" id="pd_brand"
									name="pd_brand" style="pointer-events: none;" class="text1"></td>
								<td class="td1">카테고리</td>
								<td class="td2"><input type="text" id="pd_category"
									style="pointer-events: none;" name="pd_category" class="text1"></td>
							</tr>
							<tr>
								<td class="td1">상품 등급</td>
								<td class="td2" colspan="3"><input type="text"
									id="quality_grade" style="pointer-events: none;"
									name="quality_grade" class="text1"></td>
							</tr>
							<tr>
								<td class="td1">경매 시작가</td>
								<td class="td2"><input type="text" id="sale_price"
									name="AUCTION_START_PRICE" class="text1"></td>
								<td class="td1">현재 금액</td>
								<td class="td2"><input type="text" id="sale_price_2"
									style="pointer-events: none;" name="AUCTION_NOW_PRICE"
									class="text1"></td>
							</tr>

							<tr>
								<td class="td1">경매 시작일</td>
								<td class="td2"><input type="text" id="AUCTION_START_TIME"
									name="AUCTION_START_TIME" class="AUCTION_START_TIME"></td>
								<td class="td1">경매 마감일</td>
								<td class="td2"><input type="text" id="AUCTION_END_TIME"
									name="AUCTION_END_TIME" class="text1"></td>
							</tr>

							<tr>
								<td class="td1">상세 설명</td>
								<td class="td2" colspan="3"><textarea name="AUCTION_DETAIL"
										id="AUCTION_DETAIL"></textarea></td>
							</tr>
							<tr>
								<td class="td1">게시 상태</td>
								<td class="td2" colspan="3">&nbsp; <input type="radio"
									id="auction_post1" name="AUCTION_POST_STATUS" value="게시중" checked/> <label
									for="auction_post1" >게시중</label> <input type="radio"
									id="auction_post2" name="AUCTION_POST_STATUS" value="게시안함" /> <label
									for="auction_post2">게시안함</label>
								</td>
							</tr>

							<input type="hidden" name="member_id" value="member_id" />

						</table>
						<br> <br>

						<h3>| 이미지 등록</h3>
						<br>

						<div class="inputArea">
							<table class="information">
								<tr>
									<td class="td1">대표 이미지</td>
									<td class="td2">&nbsp;<label for="gdsImg">이미지</label> <input
										type="file" id="real_input" class="" maxlength="4" accept="img/*" 
										name="file_1" multiple />
										<div id="imagePreview"></div> <script type="text/javascript"
											charset="utf-8"></script> <script type="text/javascript">
												const browseBtn = document
														.querySelector('.browse-btn');
												const realInput = document
														.querySelector('#real_input');

												function readInputFile(e) {
													var sel_files = [];

													$('#imagePreview').empty();

													var files = e.target.files;
													var fileArr = Array.prototype.slice.call(files);
													var index = 0;

													fileArr.forEach(function(f) {
																if (!f.type.match("image/.*")) {
																	alert("이미지 확장자만 업로드 가능합니다.");
																	return false;
																};
																if (files.length < 5) {
																	sel_files.push(f);
																	var reader = new FileReader();
																	reader.onload = function(e) {
																		var html = `src=${e.target.result} data-file=${f.name} />`;
																		$('imagePreview').append(html);
																		index++;
																	};
																	reader.readAsDataURL(f);
																}
															})
													if (files.length > 4
															|| files.length < 4) {
														$('#select_img_3').empty();

														return false;
													}
													if (files.length == 4) {
														$('#select_img_3')
																.empty();
														return true;
													}
												}

												$('#real_input').on('change',
														readInputFile);

												$(document)
														.ready(
																function() {
																	$(
																			"#real_input")
																			.on(
																					"change",
																					handleImgsFilesSelect);
																});
												
												
											</script>
									</td>

								</tr>
								<tr>
									<td class="td1">상세 이미지</td>
									<td class="td2">&nbsp;<label for="gdsImg_2">이미지</label> <input
										type="file" class="" id="gdsImg_2" name="file_2" multiple />
										<div class="select_img_2"></div> <script
											type="text/javascript" charset="utf-8"></script> <script
											type="text/javascript">
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
									<td class="td2"><br>
									<label for="gdsImg_2"></label> <input type="hidden"
										id="gdsImg_3" name="file_3" />
										<div id="select_img_3" class="select_img_3"></div></td>
								</tr>
							</table>
						</div>
						<br> <br>

						<div align="center">
							<a href="javascript:adminrudao.reset()">
								<button type="button" class="bottom_btn cancel_btn">취소</button>
							</a> <a href="javascript:adminrudao.submit()">
								<button id="signupbtn" disabled="true" class="bottom_btn">등록</button>
							</a>
						</div>
						<br /> <br />
					</section>
				</div>

			</div>

		</div>


		<footer id="admin_footer" class="container-fluid"></footer>
	</form>
</body>

</html>