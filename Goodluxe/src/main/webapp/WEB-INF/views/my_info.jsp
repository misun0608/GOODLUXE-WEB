<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>





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
	
    
    <!--  my_info   -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage_onlymenu.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my_info.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/my_info.js"></script>
	



</head>
<body>
    <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

    <section id="container">
        <br>
        <div id="main">
			<article class="arti_menu" id="mypage_menu"></article> 
		
				<section id = "menu_section">
                <div class = "menu_div">
                    <h1 class = "mypage_title">
                        MY PAGE
                    </h1>
                    <div class = "my_info" > 
                        <ul class="info_list">
                            <li>사용가능한 쿠폰 : <a href = "#">1장</a></li>
                            <li>적립금 : <a href = "#">5000원</a></li> 
                            <li>허수구매율 : <a href = "#"> 0%</a></li>
                            <li>관심상품 : <a href = "#">2개 </a></li>
                        </ul>
                    </div>
                    <div class = "menu_container">
                        <a href = "#">
                            <div class = "box">
                                <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/box_w_resize.png" class = "img_icon"/></div>
                                <div class = "menu_content">
                                    <h4>주문조회</h4>
                                </div>
                            </div>
                        </a>
                        <a href = "#"></a>
                            <div class = "box">
                                <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/shop_w_resize.png" class = "img_icon"/></div>
                                <div class = "menu_content">
                                    <h4>판매신청</h4>
                                </div>
                            </div>
                        </a>
                        <a href = "#">
                            <div class = "box">
                                <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/wish_w_resize.png" class = "img_icon"/></div>
                                <div class = "menu_content">
                                    <h4>판매조회</h4>
                                </div>
                            </div>
                        </a>
                        <a href = "#">
                            <div class = "box">
                                <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/lock_w_resize.png" class = "img_icon"/> </div>
                                <div class = "menu_content">
                                    <h4>구매제한</h4>
                                </div>
                            </div>
                        </a>
                        <a href = "#">    
                            <div class = "box">
                                <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/money_w_resize.png" class = "img_icon"/></div>
                                <div class = "menu_content">
                                    <h4>적립금</h4>
                                </div>
                            </div>
                        </a>
                        <a href = "#">
                            <div class = "box">
                                <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/coupon_w_resize.png" class = "img_icon"/></div>
                                <div class = "menu_content">
                                    <h4>쿠폰</h4>
                                </div>
                            </div>
                        </a>
                        <a href = "#">
                            <div class = "box">
                                <div class = "icon"><img src ="${pageContext.request.contextPath}/resources/img/icons/heart_w_resize.png" class = "img_icon"/></i></div>
                                <div class = "menu_content">
                                    <h4>관심 상품</h4>
                                </div>
                            </div>
                        </a>
                        <a href = "#">
                            <div class = "box">
                                <div class = "icon selected_menu"><img src ="${pageContext.request.contextPath}/resources/img/icons/person_w_resize.png" class = "img_icon"/></div>
                                <div class = "menu_content"> 
                                    <h4>개인 정보</h4> 
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </section>
                <h3 class = "my_info_title">▶기본정보</h3>
                <br/>
                <div class = "cancel_member_container"><a href = "#" class = "cancel_member" ><p>회원탈퇴</p></a></div>
                <form name = "member_my_info_form" >
                    <table class = "personal_info_table">
                        <tr>
                            <td>아이디</td>
                            <td>bitcamp202</td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <input type = "password" placeholder="10~16자 이내로 입력해주세요" minlength="10" maxlength="16">
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호 확인</td>
                            <td><input type = "password"></td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td>이지예</td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <input type = "button" value="우편번호" class = "zipcode_button"><input type = "text" readonly="readonly" class = "zipcode"><br/>
                                <input type = "text" placeholder=" 기본주소" class = "addr"><br/>
                                <input type = "text" placeholder=" 상세주소" class = "addr">
                            </td>
                        </tr>
                        <tr>
                            <td>휴대전화</td>
                            <td>
                                <input type = "tel">
                                &nbsp;&nbsp;-&nbsp;&nbsp;
                                <input type = "tel">
                                &nbsp;&nbsp;-&nbsp;&nbsp;
                                <input type = "tel">
                            </td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td class = "grey_letter">
                                <input type = "text" class = "email" id = "email1"> &nbsp;&nbsp;@&nbsp;&nbsp;
                                <input type = "text"  class = "email" placeholder="    직접입력" id = "email2" readonly="readOnly"  STYLE="ime-mode: inactive">
                                <select id = "email_select" class = "email2" name = "email_select" onchange= "emailAddr();">
                                    <option value="" selected disabled>-이메일 선택-</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="nate.com">nate.com</option>
                                    <option value="empas.com">empas.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="etc">직접입력</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>이메일 수신 여부</td>
                            <td>
                                <input type = "radio" name = "email_promotion" id = "agree" checked><label for = "agree">동의</label>
                                <input type = "radio" name = "email_promotion" id = "disagree"><label for = "disagree">비동의</label>
                                <p class = "smaller_grey">&nbsp;&nbsp;쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p>
                            </td>
                        </tr>
                    </table>
                    <br/> <br/> <br/><br/><br/>
                    <h3 class = "my_info_title">▶추가정보</h3>
                    <br/><br/>
                    <table class = "additional_info_table1">
                        <tr>
                            <td>관심상품 분야</td>
                        </tr>
                        <tr>
                            <td>
                                <input type = "checkbox" name = "prefer_category"><label for = "prefer_category"> 옷</label>
                                <input type = "checkbox" name = "prefer_category"><label for = "prefer_category"> 쥬얼리</label>
                                <input type = "checkbox" name = "prefer_category"><label for = "prefer_category"> 시계</label>
                                <input type = "checkbox" name = "prefer_category"><label for = "prefer_category"> 가방</label>
                                <input type = "checkbox" name = "prefer_category"><label for = "prefer_category"> 지갑</label>
                                <input type = "checkbox" name = "prefer_category"><label for = "prefer_category"> 안경</label>
                                <input type = "checkbox" name = "prefer_category"><label for = "prefer_category"> 신발</label>
                            </td>
                        </tr>
                    </table>
                    <br/><br/><br/>
                    <table class = "additional_info_table2">
                        <tr>
                            <td>관심 브랜드</td>
                        </tr>
                        <tr>
                            <td>
                                <div class = "td_brandbox">
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Armani</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Balenciaga</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Bally</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Balmain</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Barluti</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Bottega Veneta</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">BOUCHERON</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Breguet</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">BREITLING</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Brunello Cucinelli</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Burberrys</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Bvlgari</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Cartier</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Celine</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Chanel</label><br/>
                                     <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Christian Dior</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Christian louboutin</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Chronoswiss</label><br/>
                                </div>
                                <div class = "td_brandbox">
                                   
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Coach</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Colombo</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Comme des Garcons</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Damiani</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">DELVAUX</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Dior Homme</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Dolce&Gabbana</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Dries Van Noten</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Dsquared2</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">DVF</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Ermanno Scervino</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Etro</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Fendi</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Ferragamo</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">For Man</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Franck Muller</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Fred</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Guiseppe Zanotti</label><br/>
                                </div>
                                <div class = "td_brandbox">
                                    
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Giambattista Valli</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Givenchy</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Goyard</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Gucci</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">HarryWinston</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Helen Kaminski</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Hermes</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">HUBLOT</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Isabel Marant</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Jimmy Choo</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Louis Vuitton</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Manolo Blahnik</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Maje</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Marc by Marc Jacobs</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Marc Jacobs</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Marni</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Martin Margiella</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Max Mara</label><br/>
                                    
                                </div>
                                <div class = "td_brandbox">
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Michael kors</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Miu Miu</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">MONCLERE</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">MontBlanc</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Moschino</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Mulberry</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Omega</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Prada</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Proenza schouler</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Rick owens</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">ROCHAS</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">ROGER DUBUIS</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Roger Vivier</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Rolex</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Sacai</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">See by Chloe</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Stella McDartney</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Stuart Weitzman</label><br/>
                                </div>
                                <div class = "td_brandbox">
                                    
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Syaring</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Tagheuer</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Tasaki</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">THOM BROWNE</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Tiffany</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Tod's</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Tom ford</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Tory burch</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Valentino</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Valexstra</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Vanessa Bruno</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Vivienne westwood</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">YSL Rive Gauche</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">Zadig&Voltaire</label><br/>
                                    <input type = "checkbox" name = "prefer_brand"><label for = "prefer_brand">그외브랜드</label><br/>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <br/>
                    <div class = info_button_container>
                        <input type = "button" value="취 소" class = "info_table_button">
                        <input type = "button" value="확 인" class = "info_table_button">
                    </div>
                    
                </form>
                <br/><br/><br/><br/><br/><br/><br/><br/><br/>
       
			</article>
        </div>
    </section>

    <footer id="footer">
    </footer>
</body>
</html>