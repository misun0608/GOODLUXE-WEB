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

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
   $(document).ready(function(){
      $("#hd").load("admin_header.do");
      $("#admin_footer").load("admin_footer.do");
   });
</script>
<script>
	function submitCheck(){
		
		/*상품명 입력체크*/
		if(document.input_form.pd_name.value==""){
			alert("상품명을 입력하세요.");
			document.input_form.pd_name.focus();
			return false;
		}
		
		/*브랜드 입력체크*/
		if(document.input_form.pd_brand.value=="none"){
			alert("브랜드명을 입력하세요.");
			document.input_form.pd_brand.focus();
			return false;
		}
		
		/*카테고리 입력체크*/
		if(document.input_form.pd_category.value=="none"){
			alert("카테고리를 입력하세요.");
			return false;
		}
		
		/*상품 등급 입력체크*/
		if(document.input_form.quality_grade.value=="none"){
			alert("상품등급을 입력하세요.");
			return false;
		}
		
		/*판매가격 입력체크*/
		if(document.input_form.sale_price.value==""){
			alert("판매가격을 입력하세요.");
			return false;
		}
		
		/*매입가격 입력체크*/
		if(document.input_form.buying_price.value==""){
			alert("매입가격을 입력하세요.");
			return false;
		}
		
		/*매입날짜 입력체크*/
		if( document.input_form.purc_date_text.value==""){
			alert("매입일을 입력하세요.");
			return false;
		}
		/*판매상태 입력체크*/
		if(document.input_form.sale_status.value==""){
			alert("판매상태를 입력하세요.");
			return false;
		}
		/*감정서 유무 입력체크*/
		if(document.input_form.appraise_exist.value==""){
			alert("감정서유무를 입력하세요.");
			return false;
		}
		/*제품 구성품 체크*/
		if(document.input_form.pd_component.value==""){
			document.input_form.pd_component.value = "없음"
		}
		/*판매자 아이디 체크*/
		if(document.input_form.member_id.value==""){
			document.input_form.member_id.value = "불명"
		}

		return true;
	}
</script>

</head>
<body>

	<div id="hd_login_msg">
		최고관리자 최고관리자님 로그인 중 <a href="#">로그아웃</a>
	</div>

	<div id="to_content">
		<a href="#container">본문 바로가기</a>
	</div>

	<header id="hd"></header>

	<div id="wrapper">

		<div id="container" class="container-small">

			<h1 id="container_title">매입상품 등록 페이지</h1>
			<div class="container_wr">
				<form name="input_form" action="./purcRegiAction.do" method="post" onsubmit = "return submitCheck()">
					<!-- onsubmit="메소드();" -->

					<br> <br>
					<h3>▶ 기본 정보 입력</h3>
					<br>
					<table class="information">
<!-- 					<tr>
							<td class="td1">상품개체번호(개체고유번호)</td>
							<td class="td2"><input type="text" name="entity_number"
								class="text1"></td>
						</tr>
-->
						<tr>
							<td class="td1">상품명</td>
							<td class="td2"><input type="text" name="pd_name" class="text1">
						</td>
						</tr>
						<tr>
							<td class="td1">브랜드번호</td>
							<td class="td2"><select name="pd_brand"
								class="search">
									<option value="none">브랜드 선택</option>
									<option value="Armani">Armani</option>
									<option value="Balenciaga">Balenciaga</option>
									<option value="Bally">Bally</option>
									<option value="Balmain">Balmain</option>
									<option value="Barluti">Barluti</option>
									<option value="BOUCHERON">BOUCHERON</option>
									<option value="Breguet">Breguet</option>
									<option value="BREITLING">BREITLING</option>
									<option value="Burberrys">Burberrys</option>
									<option value="Bvlgari">Bvlgari</option>
									<option value="Cartier">Cartier</option>
									<option value="Celine">Celine</option>
									<option value="Chanel">Chanel</option>
							</select></td>
						</tr>
						<tr>
							<td class="td1">카테고리 번호</td>
							<td class="td2"><select name="pd_category"
								class="search">
									<option value="none">카테고리 선택</option>
									<option value="CLOTHES">CLOTHES</option>
									<option value="JEWELRY">JEWELRY</option>
									<option value="WATCH">WATCH</option>
									<option value="BAG">BAG</option>
									<option value="WALLET">WALLET</option>
									<option value="GLASSES">GLASSES</option>
									<option value="SHOES">SHOES</option>
							</select></td>
						</tr>
						<tr>
							<td class="td1">상품 등급</td>
							<td class="td2"><select name="quality_grade" class="search">
									<option value="none">등급 선택</option>
									<option value="NS">NS</option>
									<option value="A">A</option>
									<option value="B">B</option>
							</select></td>
						</tr>
						<tr>
							<td class="td1">판매가격</td>
							<td class="td2">
							<input type="text" name = "sale_price" class="text1" id = "sale_price">
							</td>
						</tr>
				
						<tr>
							<td class="td1">매입가격</td>
							<td class="td2"><input type="text" name="buying_price" id = "buying_price"
								class="text1">
							</td>
						</tr>
						<tr>
							<td class="td1">매입날짜</td>
							<!--
								<td class="td2"><input type="text" name="purc_date_text" id = "purc_date"
								class="search">
							</td>-->

							<td class="td2"><input type="date" name="purc_date_text" id = "purc_date" class="search"></td>
							
						</tr>
				<!--		<tr>
							<td class="td1">판매상태</td>
							<td class="td2">&nbsp;&nbsp;&nbsp;
								<input type="radio" name="sale_status" value="판매준비">판매준비&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="sale_status" value="판매중">판매중&nbsp;&nbsp;&nbsp; 
								<input type="radio"name="sale_status" value="판매완료">판매완료&nbsp;&nbsp;&nbsp; 
								
						</tr>  -->
						<tr>
							<td class="td1">감정서 유무</td>
							<td class="td2">
								&nbsp;
								<input type="radio" name="appraise_exist" id="appraise_exist1" value = "Y" checked>
								<label for="appraise_exist1">유</label>
								<input type="radio" name="appraise_exist" id="appraise_exist2" value = "N">
								<label for="appraise_exist2">무</label>
							</td>
						</tr>
						<tr>
							<td class="td1">제품 구성품</td>
							<td class="td2"><input type="text" name="pd_component" class="text1"></td>
						</tr>
	  				<tr>
							<td class="td1">판매자 아이디</td>
							<td class="td2"><input type="text" name="member_id" class="text1"></td>
						</tr>

					</table>
					<br> <br>
					<div align="center">
						<input type="reset" class="bottom_btn cancel_btn" name="reset" value="취소">
						<input type="submit" class="bottom_btn" name="submit" value="등록" onclick = "change_int();">
						<br> <br> <br> <br>
					</div>
				</form>
			</div>
		</div>
	</div>
		<footer id="admin_footer" class="container-fluid"></footer>
</body>

</html>