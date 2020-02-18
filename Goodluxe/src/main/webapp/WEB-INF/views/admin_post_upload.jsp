<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin_design_all.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.menu.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
   $(document).ready(function(){
      $("#hd").load("admin_header.do");
      $("#admin_footer").load("admin_footer.do");
   });
</script>
<script>
	function submitCheck(){
		
		if(document.input_form.entity_number.value==""){
			alert(document.input_form.entity_number.value);
			alert("상품개체번호를 입력하세요.");
			return false;
		}
	
		if(document.input_form.pb_md_name.value==""){
			alert("제품이름을 입력하세요.");
			return false;
		}
		
		if(document.input_form.pb_sale_status.value==""){
			alert("판매상태를 입력하세요.");
			return false;
		}
		
		if(document.input_form.pb_post_status.value==""){
			alert("게시상태를 입력하세요.");
			return false;
		}
		
		if(document.input_form.pb_main_img.value==""){
			alert("메인이미지를 입력하세요.");
			return false;
		}
		
		if( document.input_form.pb_detail_img1.value==""){
			alert("상세이미지를 입력하세요.");
			return false;
		}
		if( document.input_form.pb_detail_img2.value==""){
			alert("상세이미지를 입력하세요.");
			return false;
		}
		if( document.input_form.pb_detail_img3.value==""){
			alert("상세이미지를 입력하세요.");
			return false;
		}
		
		
		return true;
	}
	
	$(document).ready(function(){ 
		var fileTarget = $('#exampleInputFile'); 
		var fileTarget2 = $('#exampleInputFile2'); 
		var fileTarget3 = $('#exampleInputFile3'); 
		var fileTarget4 = $('#exampleInputFile4');
		
		fileTarget.on('change', function(){ // 값이 변경되면 
			var cur=$(".form-group input[type='file']").val(); 
			$(".upload-name").val(cur); 
		});
		
		fileTarget2.on('change', function(){ // 값이 변경되면 
			var cur=$(".form-group input[type='file']").val(); 
			$(".upload-name2").val(cur); 
		}); 
		
		fileTarget3.on('change', function(){ // 값이 변경되면 
			var cur=$(".form-group input[type='file']").val(); 
			$(".upload-name3").val(cur); 
		}); 
		
		fileTarget4.on('change', function(){ // 값이 변경되면 
			var cur=$(".form-group input[type='file']").val(); 
			$(".upload-name4").val(cur); 
		}); 
	});

	
</script>
<script>



</script>

</head>
<body>
	<header id="hd"></header>

	<div id="wrapper">
		<div id="container" class="container-small">

			<h1 id="container_title">관리자 판매 페이지</h1>
			<div class="container_wr">
			<!-- 	<table > 
					<tr><td>개체번호</td><td>매입/위탁</td><td>상품명</td><td>브랜드</td><td>카테고리</td></tr>
					<tbody id = "output">
					여기에 추가로 상품리스트 보는곳을 만드시오
					</tbody>
				</table> -->
				<form name="input_form" action="./postUploadAction.do" method="post" enctype ="multipart/form-data" onsubmit = "return submitCheck()">
					<br> <br>
					<h3>| 기본 정보 입력</h3>
					<br>
					<table class="information">
						<tr>
							<td class="td1">게시글 분류</td>
							<td class="td2">
								<select name="pb_division" class="search"> 
									<option value = "purchase">매입</option>
									<option value = "consign">위탁</option>
								</select>
							</td>
						</tr>
  						<tr>
							<td class="td1">상품개체번호</td>
							<td class="td2">
								<input type="text" name="entity_number" class="text1"></td>
						</tr>

						<tr>
							<td class="td1">제품이름</td>
							<td class="td2">
								<input type="text" name="pb_md_name" class="text1">
							</td>
						</tr>
						<!--<tr>
							<td class="td1">판매상태</td>
							<td class="td2">
								<input type = "radio" name = "pb_sale_status" value = "판매중">판매중
								<input type = "radio" name = "pb_sale_status" value = "판매중">거래진행중
							 	<input type = "radio" name = "pb_sale_status" value = "판매완료"> 판매완료 
								
							</td>
						</tr> -->
						<tr>
							<td class="td1">게시상태</td>
							<td class="td2">
								&nbsp;
								<input type = "radio" id="pb_post_status1" name = "pb_post_status" value = "게시중" checked>
								<label for="pb_post_status1">게시중</label>
								<input type = "radio" id="pb_post_status2" name = "pb_post_status" value = "게시안함">
								<label for="pb_post_status2">게시안함</label>
							</td>
						</tr>
						<tr>
						<tr height="200px">
							<td class="td1">상품 상세 설명</td>
							<td class="td2">
								<textarea name="pb_detail" id="pb_detail_area"></textarea>
							</td>
						</tr>
					</table>
					<br> <br>
	
					<h3>| 이미지 등록</h3>
					<br>
					<table class="information">
						<tr>
							<td class="td1">대표 이미지</td>
							<td class="td2">
								<div class="form-group" align="left">
								&nbsp;
									<label for="exampleInputFile">업로드</label> 
									<input type="file" name ="pb_main_img" class="form-control-file"
										id="exampleInputFile" aria-describedby="fileHelp">
									<input class="upload-name" value="파일선택">
								</div>
							</td>
	
						</tr>
						<tr>
							<td class="td1">상세 이미지1</td>
							<td class="td2">
								<div class="form-group" align="left">
								&nbsp;
									<label for="exampleInputFile2">업로드</label> 
									<input type="file" name = "pb_detail_img1" class="form-control-file"
										id="exampleInputFile2" aria-describedby="fileHelp">
									<input class="upload-name2" value="파일선택">
								</div>
							</td>
						</tr> 
						<tr>
							<td class="td1">상세 이미지2</td>
							<td class="td2">
								<div class="form-group" align="left">
								&nbsp;
									<label for="exampleInputFile3">업로드</label> 
									<input type="file" name = "pb_detail_img2" class="form-control-file"
										id="exampleInputFile3" aria-describedby="fileHelp">
									<input class="upload-name3" value="파일선택">
								</div>
							</td>
						</tr> 
						<tr>
							<td class="td1">상세 이미지3</td>
							<td class="td2">
								<div class="form-group" align="left">
								&nbsp;
									<label for="exampleInputFile4">업로드</label> 
									<input type="file" name = "pb_detail_img3" class="form-control-file"
										id="exampleInputFile4" aria-describedby="fileHelp">
									<input class="upload-name4" value="파일선택">
								</div>
							</td>
						</tr> 
						
						
					</table>
	
					<br> <br>
	
					<div align="center">
						<input type="reset" class="bottom_btn cancel_btn" value ="취소">
						<input type="submit" class="bottom_btn" value ="등록">
					</div>
				
					<br />
					<br />
				</form>
			</div>
		</div>
	</div>




	<footer id="admin_footer" class="container-fluid"></footer>
</body>
</html>