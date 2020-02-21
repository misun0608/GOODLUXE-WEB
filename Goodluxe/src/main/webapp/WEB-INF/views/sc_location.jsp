<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="viewport"
	content="user-scalable=no,width=device-width, initial-scale=1.0" />

<title>GOODLUXE :: 굿럭스</title>

<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script>
	$(document).ready(function() {
		$("#header").load("header.do");
		$("#nav_bar").load("navBar.do");
		$("#login_box").load("loginBox.do");
		$("#footer").load("footer.do");
		
		$(".scmt").load("scMenu.do", function(){
			$('.scmt').children('a').eq(5).addClass('current');
		});

	});
</script>

<!-- sc_location -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/service_center.css" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc50a646222a7303868e2fc1557ba996"></script>
<script>
	$(document).ready(function(){
		var container = document.getElementById('sc_map');
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.502995, 127.024209), //지도의 중심좌표.
			level: 2 //지도의 레벨(확대, 축소 정도)
		};
		
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴	
		
		// 마커 생성
		var markerPosition  = new kakao.maps.LatLng(37.502995, 127.024209);
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		marker.setMap(map);
	});
</script>
</head>

<body class="">
	<header id="header"></header>

	<nav id="nav_bar"></nav>

	<div class="login_bg" id="login_box"></div>

    <section id="container">
        <br />
        <div id="main">
            <section class="service_center_container">
                <div class="service_center_main">
                    <p style="text-align: left; margin: 18px 0 16px 14px;font-size: 24px;font-weight:none;">| 고객센터</p>

                    <!--고객센터 메뉴 탭-->
                    <ul class="service_center_menu_tabs scmt"></ul>
                    <hr id="center_tab-line" class="center_tab-line">

                    <div id="center_tab-6" class="center_tab-content current">
                    	<table class="center_store_table" style="margin-top:4px;">
						    <tr class="service_center_middle_tr">
						        <td style="width: 320px; font-weight: bold; color: rgb(100, 100, 100);">주 　 소</td>
						        <td>서울특별시 서초구 강남대로 459 (백암빌딩, 구관)</td>
						    </tr>
						    <tr class="service_center_middle_tr">
						        <td style="font-weight: bold; color: rgb(100, 100, 100);">전화번호</td>
						        <td>02-3486-9600</td>
						    </tr>
						    <tr class="service_center_middle_tr">
						        <td style="height: 60px; font-weight: bold; color: rgb(100, 100, 100);">영업시간</td>
						        <td style="line-height: 16px;">월∼토: 오전11시~오후8시<br>
						            공휴일: 오후12시~오후8시<br>
						            ※ 일요일은 휴무입니다</td>
						    </tr>
						    <tr class="service_center_middle_tr">
						        <td style="font-weight: bold; color: rgb(100, 100, 100);">주차정보</td>
						        <td>발렛파킹(주차대행) 이용</td>
						    </tr>
						</table>
						<div id="sc_map" style="width:840px;height:400px; position:relative; left:50%; margin-left:-420px; top:20px;"></div>
                    </div>

                <br/><br/><br/>
                </div>
            </section>
        </div>
    </section>

	<footer id="footer"></footer>
</body>

</html>