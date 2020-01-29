<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.DecimalFormat,java.sql.Timestamp,com.spring.goodluxe.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="viewport" content="user-scalable=no,width=device-width, initial-scale=1.0" />
	
	<title>GOODLUXE :: 굿럭스</title>
	
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script>
		$(document).ready(function(){
			$("#header").load("header.do");
			$("#nav_bar").load("navBar.do");
			$("#login_box").load("loginBox.do");
			$("#footer").load("footer.do");
		});
	</script>
	
	<!-- md_detail -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/md_detail.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/md_detail.js"></script>
	
</head>
<body>
    <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

    <section id="container">
        <br>
        <div id="main">
            <div class="md_detail_cover">
                <div id="md_detail_photoarea">
                    <div class="detail_main_image_right">
                        <a class="detail_main_image_link_right">
                            <img src="${pageContext.request.contextPath}/resources/img/md_img/chanel_bag.jpg" alt="가방" class="md_detail_main_image">
                        </a>
                    </div>
                    <div class="md_detail_thumbnail_images">
                        <div class="detail_main_image_area1 detail_main_image_left">
                            <a class="main_image_link1">
                                <img src="${pageContext.request.contextPath}/resources/img/md_img/chanel_bag.jpg" alt="가방" class="md_detail_thumbnail_image">
                            </a>
                        </div>
                        <div class="detail_main_image_area2 detail_main_image_left">
                            <a class="main_image_link2">
                                <img src="${pageContext.request.contextPath}/resources/img/md_img/chanel_bag2.jpg" alt="가방" class="md_detail_thumbnail_image">
                            </a>
                        </div>
                        <div class="detail_main_image_area3 detail_main_image_left">
                            <a class="main_image_link3">
                                <img src="${pageContext.request.contextPath}/resources/img/md_img/chanel_bag3.jpg" alt="가방" class="md_detail_thumbnail_image">
                            </a>
                        </div>
                        <div class="detail_main_image_area4 detail_main_image_left">
                            <a class="main_image_link4">
                                <img src="${pageContext.request.contextPath}/resources/img/md_img/chanel_bag4.jpg" alt="가방" class="md_detail_thumbnail_image">
                            </a>
                        </div>
                    </div>
                </div>
                <div id="md_detail_textarea">
                    <div class="md_detail_textarea_align">
                        <div class="md_detail_textarea2 md_detail_brand">
                            Chanel
                        </div>
                        <div class="md_detail_textarea2 md_detail_name">
                            샤넬 캐비어 클래식 미듐
                        </div>
                        
                        <hr id="name_line">
                        <div class="md_detail_table">
                            <div class="md_detail_row">
                                <span class="md_detail_cell md_detail_title">
                                    가격
                                </span>
                                <span class="md_detail_cell md_detail_price">
                                    4,900,000원
                                </span>
                            </div>
                            <div class="md_detail_row">
                                <span class="md_detail_cell md_detail_title">
                                    적립포인트
                                </span>
                                <span class="md_detail_cell md_detail_point">
                                    4,900P
                                </span>
                            </div>
                            <div class="md_detail_row">
                                <span class="md_detail_cell md_detail_title">
                                    배송비
                                </span>
                                <span class="md_detail_cell md_detail_delivery_fee">
                                    무료
                                </span>
                            </div>
                            <div class="md_detail_row">
                                <span class="md_detail_cell md_detail_title">
                                    배송일
                                </span>
                                <span class="md_detail_cell md_detail_d_period">
                                    결제일로부터 3일 이내 배송
                                </span>
                            </div>
                            <div class="md_detail_row">
                                <span class="md_detail_cell md_detail_title">
                                    제품등급
                                </span>
                                <span class="md_detail_cell md_detail_grade">
                                    A
                                </span>
                            </div>
                            <div class="md_detail_row">
                                <span class="md_detail_cell md_detail_title">
                                    배송구분
                                </span>
                                <span class="md_detail_cell md_detail_delivery_domestic">
                                    본 상품은 국내배송만 가능합니다
                                </span>
                                <hr id="name_line">
                            </div>
                            <div class="md_detail_textarea2 md_detail_btnpart">
                                <button class="buybtn buybtn2">구매하기</button>
                                <button class="notibtn"><img src="${pageContext.request.contextPath}/resources/img/icons/bell.png" alt="알림"
                                        width="16px">&nbsp;&nbsp;알림</button>
                                <button class="likebtn"><img src="${pageContext.request.contextPath}/resources/img/icons/heart.png" alt="좋아요"
                                        width="16px">&nbsp;&nbsp;좋아요</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 하단 영역 -->
                <div class="md_detail_bottom">
                    <!-- 제품 상세설명 -->
                    <div class="md_detail_explanation">
                        <h3 class="md_detail_explanation_title">상품상세</h3>
                        <br />
<p class="md_detail_explanation_article">
내용 : 깔끔한 컬러의 고급스러운 캐비어 소재에 우아한 디자인이 돋보이는 숄더백입니다.<br />
턴락 오픈방식이며 내외부 다양한 수납공간이 있어 편하게 수납하실 수 있습니다.<br />
상태 : 은장 잔스크래치,모서리 한곳 점마모외 상태좋은 A등급입니다.<br />
8자리 244번대<br />
부속품 : 더스트, 개런티카드, 영수증<br />
Made In FRANCE<br />
</p>
                    </div>
                    <!-- 연관 제품 -->
                    <div class="related_item_area">
                        <h3 class="related_item_title">Related Items</h3>
                        <div class="related_item_list">
                            <div class="related_item">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/resources/img/md_img/chanel_bag.jpg" alt="">
                                    <div class="related_item_info">
                                        <div class="related_item_brand">Chanel</div>
                                        <div class="related_item_name">샤넬 캐비어 클래식 미듐</div>
                                        <div class="related_item_price">4,900,000원</div>
                                    </div>
                                </a>
                            </div>
                            <div class="related_item">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/resources/img/md_img/chanel_bag.jpg" alt="">
                                    <div class="related_item_info">
                                        <div class="related_item_brand">Chanel</div>
                                        <div class="related_item_name">샤넬 캐비어 클래식 미듐</div>
                                        <div class="related_item_price">4,900,000원</div>
                                    </div>
                                </a>
                            </div>
                            <div class="related_item">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/resources/img/md_img/chanel_bag.jpg" alt="">
                                    <div class="related_item_info">
                                        <div class="related_item_brand">Chanel</div>
                                        <div class="related_item_name">샤넬 캐비어 클래식 미듐</div>
                                        <div class="related_item_price">4,900,000원</div>
                                    </div>
                                </a>
                            </div>
                            <div class="related_item">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/resources/img/md_img/chanel_bag.jpg" alt="">
                                    <div class="related_item_info">
                                        <div class="related_item_brand">Chanel</div>
                                        <div class="related_item_name">샤넬 캐비어 클래식 미듐</div>
                                        <div class="related_item_price">4,900,000원</div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer id="footer">
    </footer>
</body>
</html>