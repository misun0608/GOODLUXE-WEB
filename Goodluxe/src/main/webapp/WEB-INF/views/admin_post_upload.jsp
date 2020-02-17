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
</script>

</head>
<body>
	<header id="hd"></header>

	<div id="wrapper">
		<div id="container" class="container-small">

			<h1 id="container_title">관리자 판매 페이지</h1>
			<div class="container_wr">

				<form name="input_form" action="./postUploadAction.do" method="post" enctype ="multipart/form-data" onsubmit = "return submitCheck()">
					<br> <br>
					<h3>▶ 기본 정보 입력</h3>
					<br>
					<table class="impormation" border="1">
						<tr>
							<td class="td1">게시글 분류</td>
							<td class="td2">
								<select name = "pb_division"> 
									<option value = "purchase">매입</option>
									<option value = "consign">위탁</option>
								</select>
							</td>
						</tr>
  						<tr>
							<td class="td1">상품개체번호</td>
							<td class="td2"><input name="entity_number" class="text1"></td>
						</tr>

						<tr>
							<td class="td1">제품이름</td>
							<td class="td2"><input name="pb_md_name" class="text1"></td>
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
								<input type = "radio" name = "pb_post_status" value = "게시중" checked>게시중
								<input type = "radio" name = "pb_post_status" value = "게시안함">게시안함
							</td>
						</tr>
						<tr>
						<tr height="200px">
							<td class="td1">상품 상세 설명</td>
							<td class="td2"><textarea name = "pb_detail"></textarea></td>
						</tr>
					</table>
					<br> <br>
	
					<h3>▶ 이미지 등록</h3>
					<br>
					<table class="impormation" border="1">
						<tr>
							<td class="td1">대표 이미지</td>
							<td class="td2">
								<div class="form-group" align="left">
									<input type="file" name = "pb_main_img" class="form-control-file"
										id="exampleInputFile" aria-describedby="fileHelp">
								</div>
							</td>
	
						</tr>
						<tr>
							<td class="td1">상세 이미지1</td>
							<td class="td2">
								<div class="form-group" align="left">
									<input type="file" name = "pb_detail_img1" class="form-control-file"
										id="exampleInputFile" aria-describedby="fileHelp">
								</div>
							</td>
						</tr> 
						<tr>
							<td class="td1">상세 이미지2</td>
							<td class="td2">
								<div class="form-group" align="left">
									<input type="file" name = "pb_detail_img2" class="form-control-file"
										id="exampleInputFile" aria-describedby="fileHelp">
								</div>
							</td>
						</tr> 
						<tr>
							<td class="td1">상세 이미지3</td>
							<td class="td2">
								<div class="form-group" align="left">
									<input type="file" name = "pb_detail_img3" class="form-control-file"
										id="exampleInputFile" aria-describedby="fileHelp">
								</div>
							</td>
						</tr> 
						
						
					</table>
	
					<br> <br> <br> <br> <br> <br>
	
					<div align="center">
						<input type="reset" class="btn3" value = "취소">
						<input type="submit" class="btn4" value = "등록">
					</div>
				</form>
			</div>
		</div>
	</div>




	<footer class="container-fluid">
		<p>Footer Text</p>
	</footer>
</body>
</html>