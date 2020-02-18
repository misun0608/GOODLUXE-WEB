<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.spring.goodluxe.voes.*" %>
<%
	MemberVO vo = (MemberVO) request.getAttribute("MemberVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<!--
        viewport meta 태그
        * user-scalable=no : 화면확대, 축소 불가능
        * width=device-width : 화면 너비=장치 너비
        * initial-scale=1.0 : 초기 확대 비율
    -->
<meta name="viewport"
	content="user-scalable=no,width=device-width, initial-scale=1.0" />
<title>GOODLUXE :: 굿럭스</title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean"
	rel="stylesheet">
<!-- <link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/EBSHMJESaeronRA.woff" rel="stylesheet"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/joinstyle2.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/goodluxe-header.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/joinjs2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/goodluxe-footer.js"></script>
<!-- 우편번호 찾기 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	$(document).ready(function() {
		$("#header").load("header.do");
		$("#nav_bar").load("navBar.do");
		$("#login_box").load("loginBox.do");
		$("#footer").load("footer.do");
	});

	function emailAddr() {
		if (join_input_form.email_select.value == 'etc') {
			join_input_form.email2.readOnly = false;
			join_input_form.email2.value = '';
			join_input_form.email2.focus();
		} else {
			join_input_form.email2.value = join_input_form.email_select.value;
		}
	}


	function join_check() {

		var forms = document.getElementById("join_input_form");

		if (join_input_form.join_id.value == "") {
			alert("아이디를 확인해 주십시오.");
			join_input_form.join_id.focus();

			return false;

// 		} else if ((forms.MEMBER_JUMIN1.value == "")
// 				|| (forms.MEMBER_JUMIN1.value.length < 6)) {
// 			alert("주민등록번호를 정확히 입력해 주십시오.");
// 			forms.MEMBER_JUMIN1.focus();
// 			return false;
// 		} "src/main/webapp/WEB-INF/views/mypage_restriction_view.jsp"else if ((forms.MEMBER_JUMIN2.value == "")
// 				|| (forms.MEMBER_JUMIN2.value.length < 7)) {
// 			alert("주민등록번호를 정확히 입력해 주십시오.");
// 			forms.MEMBER_JUMIN2.focus();
// 			return false;
		} else {

			var phone1 = join_input_form.telinput1.value;
			var phone2 = join_input_form.telinput2.value;
			var phone3 = join_input_form.telinput3.value;
	
			var member_phone = phone1 + phone2 + phone3;
			document.getElementById('member_phone').value = member_phone;
	
			var email1 = join_input_form.email1.value;
			var email2 = join_input_form.email2.value;
	
			var email = email1 + "@" + email2;
			document.getElementById('member_email').value = email;

		return true;
		}
	}
</script>

</head>

<body class="">
    <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

	<section id="container">
		<br>
		<div id="main">
			<center>
				<br /> <br />
				<div class="jointstep_image">
					<img
						src="${pageContext.request.contextPath}/resources/img/icon_join/icon_join_2.png"
						alt="가입단계">
				</div>

				<br /> <br /> <br />
				<!-- <hr class="join_underline"><br /> -->
				<!-- 기본 정보와 브랜드/취향 정보 나눠서 form 만들어야 하나? 그럴 필요 없지 않나? submit은 하나인데? 큰 form 안에 작은 form 두 개 이런식으로 만드나>??? -->
				<form action="joinform3_2.do" method="post" name="join_input_form" onSubmit="return join_check();">
					<!-- 				<form method="post" name="join_input_form" onsubmit="return joinform3"> -->
					<div class="joinall">
						<h3>기본 정보</h3>
						<br />
						<div class="joinform1">
							<table class="jointable">
								<!-- <form name="input_form"> -->
								<tr class="jointablerow">
									<td class="jttitle">아이디</td>
									<td class="jointd">
										<input type="text" class="username_input" id="join_id" check_result="fail"
										ime-mode="disabled" maxlength="10" name="member_id" placeholder="10자 이내로 입력해주세요" 
										style="padding-left: 5px" required> 
										<!-- <div id="id_overlap_msg"></div> <button type="button" class="id_overlap_btn" onclick="id_overlap_check()">중복확인</button> -->
										<!-- <input type="hidden" name="idDuplication" value="idUncheck"> -->
									</td>
								<tr>
									<td></td>
									<td class="alert alert-success_id" id="alert-success_id"
										style="font-size: 12px; color: #0084c9; padding: 4px 0 0 5px">사용할
										수 있는 아이디입니다.</td>
									<td class="alert alert-danger_id" id="alert-danger_id"
										style="font-size: 12px; color: #f9341a; padding: 4px 0 0 5px">아이디를
										입력해 주세요.</td>
									<td class="alert alert-danger_id1" id="alert-danger_id1"
										style="font-size: 12px; color: #f9341a; padding: 4px 0 0 5px">동일한
										아이디가 존재합니다.</td>
									<td class="alert alert-danger_id2" id="alert-danger_id2"
										style="font-size: 12px; color: #f9341a; padding: 4px 0 0 5px">영문자와
										숫자만 사용해주세요.</td>
								</tr>
								<!--                                        <td class="chk_font" id="chk_id"></td> -->
								</tr>
								<tr class="jointablerow">
									<td class="jttitle">비밀번호</td>
									<td class="jointd">
										<input type="password" class="join_inputarea passwd" id="join_pw1" 
										maxlength="16" name="member_pw" placeholder="10~16자 이내로 입력해주세요" required>
									</td>
								</tr>
								<tr class="jointablerow">
									<td class="jttitle">비밀번호 확인</td>
									<td class="jointd">
										<input type="password" class="join_inputarea passwd" id="join_pw2" 
										maxlength="16" placeholder="비밀번호를 다시 입력해주세요" required>
									</td>
								<tr>
									<td></td>
									<td class="alert alert-success_pw" id="alert-success_pw"
										style="font-size: 12px; color: #0084c9; padding: 4px 0 0 5px">비밀번호가
										일치합니다.</td>
									<td class="alert alert-danger_pw" id="alert-danger_pw"
										style="font-size: 12px; color: #f9341a; padding: 4px 0 0 5px">비밀번호가
										일치하지 않습니다.</td>
									<td class="alert alert-danger_pw1" id="alert-danger_pw1"
										style="font-size: 12px; color: #f9341a; padding: 4px 0 0 5px">비밀번호는
										10자 이상 입력해주세요.</td>
								</tr>
								</tr>
								<tr class="jointablerow">
									<td class="jttitle">이름</td>
									<td class="jointd"><input type="text" name="member_name"
										class="join_inputarea" required></td>
								</tr>
								<tr class="jointablerow">
									<td class="jttitle">주소</td>
									<td class="jointd">
										<input type="button" value="우편번호" class="zipcode_button" onclick="openZipSearch()"
										style="width: 70px; height: 27px; background-color: #1e86da; color: white; margin-top: 5px; border: 0px">
										<input type="text" id="order_zipcode" name="member_zipcode" readonly="readonly" class="zipcode"><br /> 
										<input type="text" id="order_addr1" name="member_addr1" placeholder=" 기본주소" class="addr" readonly><br /> 
										<input type="text" id="order_addr2" name="member_addr2" placeholder=" 상세주소" class="addr"></td>
								</tr>
								<tr class="jointablerow">
									<td class="jttitle">휴대전화</td>
									<td class="jointd">
										<input type="tel" name="telinput1" id="telinput1" class="join_inputarea telinput1" maxlength="3" required>
										&nbsp;-&nbsp;
										<input type="tel" name="telinput2" id="telinput2" class="join_inputarea telinput2" maxlength="4" required>
										&nbsp;-&nbsp;
										<input name="telinput3" id="telinput3" type="tel" class="join_inputarea telinput3" maxlength="4" required></td>
								</tr>
								<tr>
									<td class="jttitle">이메일</td>
									<td class="jointd">
										<input type="text" class="join_inputarea emailinput" id="email1" name="email1"
										size="10" STYLE="ime-mode: inactive"> @ <!-- 										<input type="text"  -->
										<!-- 										class="join_inputarea emailinput" id="email2" size="15" style="ime-mod: inactive"> -->
										<input type="text" class="join_inputarea emailinput" id="email2" name="email2" size="10" 
										STYLE="ime-mode: inactive" readonly> 
										<select id="email_select" class="join_inputarea" name="email_select" onChange="emailAddr();">
											<option value="" selected disabled>-이메일 선택-</option>
											<option value="naver.com">naver.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="nate.com">nate.com</option>
											<option value="empas.com">empas.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="etc">직접입력</option>
										</select>
									<input type="hidden" id="member_email" name="member_email" value="">
									<input type="hidden" id="member_phone" name="member_phone" value=member_phone>
									<input type="hidden" name="member_class" value="N">
									<input type="hidden" name="member_isadmin" value="N">
									</td>

									<!-- 								<tr> -->
									<!-- 									<td></td> -->
									<!-- 									<td class="alert alert-success_email" id="alert-success_email" -->
									<!-- 										style="font-size: 12px; color: #0084c9; padding: 4px 0 0 5px">사용할 -->
									<!-- 										수 있는 이메일입니다.</td> -->
									<!-- 									<td class="alert alert-danger_email" id="alert-danger_email" -->
									<!-- 										style="font-size: 12px; color: red; padding: 4px 0 0 5px">아이디를 -->
									<!-- 										입력해 주세요.</td> -->
									<!-- 									<td class="alert alert-danger_email1" id="alert-danger_email1" -->
									<!-- 										style="font-size: 12px; color: #f9341a; padding: 4px 0 0 5px">동일한 -->
									<!-- 										이메일이 존재합니다.</td> -->
									<!-- 									<td class="alert alert-danger_email2" id="alert-danger_email2" -->
									<!-- 										style="font-size: 12px; color: #f9341a; padding: 4px 0 0 5px">영문자와 -->
									<!-- 										숫자만 사용해주세요.</td> -->
									<!-- 									<td class="alert alert-danger_email3" id="alert-danger_email3" -->
									<!-- 										style="font-size: 12px; color: #f9341a; padding: 4px 0 0 5px">중복 -->
									<!-- 										확인 되지 않은 이메일입니다.</td> -->
									<!-- 								</tr> -->
									<!--                                        <td class="chk_font" id="chk_id"></td> -->
								</tr>
								<tr>
									<td></td>
									<td class="jtitle" style="padding: 7px 0 5px 0; font-size: 12px; color: gray;">
									해당 주소로 발송된 메일을 통해 인증 후 사이트 이용이 가능하니 정확한 주소를 기입해주십시오.</td>
								</tr>
								<tr>
									<td class="jtitle">이메일 수신동의</td>
									<td class="jointd"><input type="radio"
										class="join_inputarea" name="member_email_receive" value="Y"
										checked>동의 &nbsp;&nbsp;&nbsp; <input type="radio"
										class="join_inputarea" name="member_email_receive" value="N">미동의</td>
								</tr>

							</table>
						</div>
						<br /> <br /> <br />

						<h3>추가 정보</h3>
						<br />
						<div class="joinform2">
							<table class="jointable2">
								<tr>
									<td class="jttitle liked_title">관심 상품 분야</td>
									</div>
								<tr>
									<td class="jointable2_top_td">
										<div class="join_td_catebox">
											<input type="checkbox" class="likedcate"
												name="member_like_category" value="시계">
											<p>시계</p>
											<br /> <input type="checkbox" class="likedcate"
												name="member_like_category" value="주얼리">
											<p>주얼리</p>
										</div>
										<div class="join_td_catebox">
											<input type="checkbox" class="likedcate"
												name="member_like_category" value="가방">
											<p>가방</p>
											<br /> <input type="checkbox" class="likedcate"
												name="member_like_category" value="옷">
											<p>옷</p>
										</div>
										<div class="join_td_catebox">
											<input type="checkbox" class="likedcate"
												name="member_like_category" value="신발">
											<p>신발</p>
											<br /> <input type="checkbox" class="likedcate"
												name="member_like_category" value="악세사리">
											<p>악세사리</p>
										</div>
										<div class="join_td_catebox">
											<input type="checkbox" class="likedcate"
												name="member_like_category" value="지갑">
											<p>지갑</p>
											<br /> <input type="checkbox" class="likedcate"
												name="member_like_category" value="안경">
											<p>안경</p>
										</div>
									</td>

								</tr>
								<tr>
									<td class="jttitle liked_title" id="prefer_brand_td">관심
										브랜드</td>
								</tr>
								<tr>
									<td>
										<div class="join_td_brandbox">
											<input type="checkbox" class="join_prefer_brand"
												name="join_prefer_brand" value="Armani">
											<p>Armani</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Balenciaga">
											<p>Balenciaga</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Bally">
											<p>Bally</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Balmain">
											<p>Balmain</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Barluti">
											<p>Barluti</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Bottega Veneta">
											<p>Bottega Veneta</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="BOUCHERON">
											<p>BOUCHERON</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Breguet">
											<p>Breguet</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="BREITLING">
											<p>BREITLING</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Brunello Cucinelli">
											<p>Brunello Cucinelli</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Burberrys">
											<p>Burberrys</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Bvlgari">
											<p>Bvlgari</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Cartier">
											<p>Cartier</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Celine">
											<p>Celine</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Chanel">
											<p>Chanel</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Christian Dior">
											<p>Christian Dior</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Christian louboutin">
											<p>Christian louboutin</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Chronoswiss">
											<p>Chronoswiss</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Coach">
											<p>Coach</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Colombo">
											<p>Colombo</p>
											<br />
											<!-- <input type="checkbox" class="join_prefer_brand">
                                    <p>Comme des Garcons</p><br /> -->
											<input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Damiani">
											<p>Damiani</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="DELVAUX">
											<p>DELVAUX</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Dior Homme">
											<p>Dior Homme</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Dolce&Gabbana">
											<p>Dolce&Gabbana</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Dries Van Noten">
											<p>Dries Van Noten</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Dsquared2">
											<p>Dsquared2</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="DVF">
											<p>DVF</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Ermanno Scervino">
											<p>Ermanno Scervino</p>
											<br />
										</div>
										<div class="join_td_brandbox">
											<input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Etro">
											<p>Etro</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Fendi">
											<p>Fendi</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Ferragamo">
											<p>Ferragamo</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="For Man">
											<p>For Man</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Franck Muller">
											<p>Franck Muller</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Fred">
											<p>Fred</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Guiseppe Zanotti">
											<p>Guiseppe Zanotti</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Giambattista Valli">
											<p>Giambattista Valli</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Givenchy">
											<p>Givenchy</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Goyard">
											<p>Goyard</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Gucci">
											<p>Gucci</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="HarryWinston">
											<p>HarryWinston</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Helen Kaminski">
											<p>Helen Kaminski</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Hermes">
											<p>Hermes</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="HUBLOT">
											<p>HUBLOT</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Isabel Marant">
											<p>Isabel Marant</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Jimmy Choo">
											<p>Jimmy Choo</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Louis Vuitton">
											<p>Louis Vuitton</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Manolo Blahnik">
											<p>Manolo Blahnik</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Maje">
											<p>Maje</p>
											<br />
											<!-- <input type="checkbox" class="join_prefer_brand">
                                    <p>Marc by Marc Jacobs</p><br /> -->	
											<input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Marc Jacobs">
											<p>Marc Jacobs</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Marni">
											<p>Marni</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Martin Margiella">
											<p>Martin Margiella</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Max Mara">
											<p>Max Mara</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="kors">
											<p>kors</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Miu Miu">
											<p>Miu Miu</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="MONCLERE">
											<p>MONCLERE</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="MontBlanc">
											<p>MontBlanc</p>
											<br />
										</div>
										<div class="join_td_brandbox">
											<input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Moschino">
											<p>Moschino</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Mulberry">
											<p>Mulberry</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Omega">
											<p>Omega</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Prada">
											<p>Prada</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Proenza schouler">
											<p>Proenza schouler</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Rick owens">
											<p>Rick owens</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="ROCHAS">
											<p>ROCHAS</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="ROGER DUBUIS">
											<p>ROGER DUBUIS</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Roger Vivier">
											<p>Roger Vivier</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Rolex">
											<p>Rolex</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Sacai">
											<p>Sacai</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="See by Chloe">
											<p>See by Chloe</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Stella McDartney">
											<p>Stella McDartney</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Stuart Weitzman">
											<p>Stuart Weitzman</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Syaring">
											<p>Syaring</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Tagheuer">
											<p>Tagheuer</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Tasaki">
											<p>Tasaki</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="THOM BROWNE">
											<p>THOM BROWNE</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Tiffany">
											<p>Tiffany</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Tod's">
											<p>Tod's</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Tom ford">
											<p>Tom ford</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Tory burch">
											<p>Tory burch</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Valentino">
											<p>Valentino</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Valexstra">
											<p>Valexstra</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Vanessa Bruno">
											<p>Vanessa Bruno</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Vivienne westwood">
											<p>Vivienne westwood</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="YSL Rive Gauche">
											<p>YSL Rive Gauche</p>
											<br /> <input type="checkbox" class="join_prefer_brand"
												name="member_like_brand" value="Zadig&Voltaire">
											<p>Zadig&Voltaire</p>
											<br />

										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<center>
											<br /> <br /> 
											<input type="button" class="join_btn join_btn1" value="이전"> 
											<input type="submit" class="join_btn join_btn2" value="회원가입">
									</td>
								</tr>
							</table>
						</div>
				</form>
		</div>
		<br />
		</div>
	</section>

	<footer id="footer">
	</footer>
</body>

</html>