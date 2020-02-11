<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String member_id = (String)request.getAttribute("member_id");
%>
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
   
   <!-- mypage_apply2 / 마이페이지 > 판매신청 -->
   <script>
      $(document).ready(function(){
         $("#mypage_menu").load("mypageMenu.do", function(){
            $('.menu_container').children('a').eq(1).children().children('.icon').addClass('selected_menu');
         });
      });
   </script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage_onlymenu.css" />
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage_apply_form.css" />
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage_apply_form.js"></script>

</head>

<body class="">
    <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

    <section id="container">
        <br>
        <div id="main">
            <article class="arti_menu" id="mypage_menu"></article>

            <!-- 판매/매입 신청 -->
            <article class="ap_1st arti_box">
                <div class="apply_manual">
                    - 상품 상세정보를 입력 후 아래 확인 버튼을 누르시면 접수가 완료됩니다.<br/><br/>
                </div>
            </article>
            <article class="ap_2nd arti_box">
                <form name="write_form" action="./insertApply.do" method="post" enctype="multipart/form-data">
                    <div class="info_area">
                        <div class="select_brand_area">
                            <div>브랜드</div>
                            <select multiple name="ap_selected_brand">
                                <option value="Armani">Armani</option>
                                <option value="Balenciaga">Balenciaga</option>
                                <option value="Bally">Bally</option>
                                <option value="Balmain">Balmain</option>
                                <option value="Berluti">Berluti</option>
                                <option value="Bottega">Bottega Veneta</option>
                                <option value="BOUCHERON">BOUCHERON</option>
                                <option value="Breguet">Breguet</option>
                                <option value="BREITLING">BREITLING</option>
                                <option value="Brunello">Brunello Cucinelli</option>
                                <option value="Burberrys">Burberrys</option>
                                <option value="Bvlgari">Bvlgari</option>
                                <option value="Cartier">Cartier</option>
                                <option value="Celine">Celine</option>
                                <option value="Chanel">Chanel</option>
                                <option value="Christian">Christian Dior</option>
                                <option value="Christian">Christian louboutin</option>
                                <option value="CHRONOSWISS">CHRONOSWISS</option>
                                <option value="Coach">Coach</option>
                                <option value="Colombo">Colombo</option>
                                <option value="Comme des Garcons">Comme des Garcons</option>
                                <option value="Damiani">Damiani</option>
                                <option value="DELVAUX">DELVAUX</option>
                                <option value="Dior Homme">Dior Homme</option>
                                <option value="Dolce&Gabbana">Dolce&Gabbana</option>
                                <option value="Dries Van Noten">Dries Van Noten</option>
                                <option value="Dsquared2">Dsquared2</option>
                                <option value="DVF">DVF</option>
                                <option value="Ermanno Scervino">Ermanno Scervino</option>
                                <option value="Etro">Etro</option>
                                <option value="Fendi">Fendi</option>
                                <option value="Ferragamo">Ferragamo</option>
                                <option value="For Man">For Man</option>
                                <option value="Franck">Franck Muller</option>
                                <option value="Fred">Fred</option>
                                <option value="Giuseppe Zanotti">Giuseppe Zanotti</option>
                                <option value="Giambattista Valli">Giambattista Valli</option>
                                <option value="Givenchy">Givenchy</option>
                                <option value="Goyard">Goyard</option>
                                <option value="Gucci">Gucci</option>
                                <option value="HarryWinston">HarryWinston</option>
                                <option value="Helen Kaminski">Helen Kaminski</option>
                                <option value="Hermes">Hermes</option>
                                <option value="HUBLOT">HUBLOT</option>
                                <option value="Isabel Marant">Isabel Marant</option>
                                <option value="Jimmy Choo">Jimmy Choo</option>
                                <option value="Louis Vuitton">Louis Vuitton</option>
                                <option value="Manolo Blahnik">Manolo Blahnik</option>
                                <option value="Maje">Maje</option>
                                <option value="Marc by Marc Jacobs">Marc by Marc Jacobs</option>
                                <option value="Marc Jacobs">Marc Jacobs</option>
                                <option value="Marni">Marni</option>
                                <option value="Martin Margiella">Martin Margiella</option>
                                <option value="Max Mara">Max Mara</option>
                                <option value="Michael kors">Michael kors</option>
                                <option value="Miu Miu">Miu Miu</option>
                                <option value="MONCLERE">MONCLERE</option>
                                <option value="MontBlanc">MontBlanc</option>
                                <option value="Moschino">Moschino</option>
                                <option value="Mulberry">Mulberry</option>
                                <option value="OMEGA">OMEGA</option>
                                <option value="Prada">Prada</option>
                                <option value="Proenza schouler">Proenza schouler</option>
                                <option value="Rick owens">Rick owens</option>
                                <option value="ROCHAS">ROCHAS</option>
                                <option value="ROGER DUBUIS">ROGER DUBUIS</option>
                                <option value="Roger Vivier">Roger Vivier</option>
                                <option value="Rolex">Rolex</option>
                                <option value="Sacai">Sacai</option>
                                <option value="See by Chloe">See by Chloe</option>
                                <option value="Stella McCartney">Stella McCartney</option>
                                <option value="Stuart Weitzman">Stuart Weitzman</option>
                                <option value="Syaring">Syaring</option>
                                <option value="Tagheuer">Tagheuer</option>
                                <option value="Tasaki">Tasaki</option>
                                <option value="THOM BROWNE">THOM BROWNE</option>
                                <option value="Tiffany">Tiffany</option>
                                <option value="Tod's">Tod's</option>
                                <option value="Tom ford">Tom ford</option>
                                <option value="Tory burch">Tory burch</option>
                                <option value="Valentino">Valentino</option>
                                <option value="Valexstra">Valexstra</option>
                                <option value="Vanessa Bruno">Vanessa Bruno</option>
                                <option value="Vivienne westwood">Vivienne westwood</option>
                                <option value="YSL Rive Gauche">YSL Rive Gauche</option>
                                <option value="Zadig&Voltaire">Zadig&Voltaire</option>
                                <option value="etc">그 외 브랜드</option>
                            </select>
                        </div>
                        <div class="select_category_area">
                            <div>카테고리</div>
                            <select multiple name="ap_selected_category">
                                <option value="CLOTHES">Clothes</option>
                                <option value="JEWELRY">Jewelry</option>
                                <option value="WATCH">Watch</option>
                                <option value="BAG">Bag</option>
                                <option value="WALLET">Wallet</option>
                                <option value="GLASSES">Glasses</option>
                                <option value="SHOES">Shoes</option>
                            </select>
                        </div>
                        <div class="write_info_area">
                            <table class="applytable">
                                <tr>
                                    <td class="titletd">상품명</td>
                                    <td>
                                    	<input type="hidden" class="apply_inputarea" name="member_id" value="<%=member_id %>">
                                    	<input type="text" class="apply_inputarea" name="ap_md_name" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="titletd">판매희망가</td>
                                    <td><input type="text" id="ap_hope_price" class="apply_inputarea" name="ap_hope_price" required></td>
                                </tr>
                                <tr>
                                    <td class="titletd">구매연도</td>
                                    <td><input type="text" class="apply_inputarea" name="ap_buy_year" required></td>
                                </tr>
                                <tr>
                                    <td class="titletd">구매가격</td>
                                    <td><input type="text" id="ap_buy_price" class="apply_inputarea" name="ap_buy_price" required></td>
                                </tr>
                                <tr>
                                    <td class="titletd">구매매장</td>
                                    <td><input type="text" class="apply_inputarea" name="ap_buy_store" required></td>
                                </tr>
                                <tr>
                                    <td class="titletd">사진</td>
                                    <td><input type="file" name="ap_md_pictures" multiple required>&nbsp;
                                        <span class="photo_manual">최소 3장 이상 업로드해주세요.</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="titletd">판매방법</td>
                                    <td>
                                        <input type="radio" name="ap_smethod" id="apply_combtn" value="위탁판매">
                                        <label for="apply_combtn" class="apply_label">위탁판매</label>
                                        &nbsp;
                                        <input type="radio" name="ap_smethod" id="apply_sellbtn" value="판매">
                                        <label for="apply_sellbtn" class="apply_label">판매</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="titletd">배송방법</td>
                                    <td>
                                        <input type="radio" name="ap_dmethod" id="parcel" value="우체국 택배">
                                        <label for="parcel" class="apply_label">우체국 택배</label>
                                        &nbsp;
                                        <input type="radio" name="ap_dmethod" id="visit" value="직접 매장 방문">
                                        <label for="visit" class="apply_label">직접 매장 방문</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="btn_area">
                        <div class="ap_2nd_btn_box">
                            <input type="button" class="ap_2nd_btn" value="확인" onClick="add_list();">
                            <input type="reset" class="ap_2nd_btn" value="취소">
                        </div>
                    </div>
                </form>
            </article>

            </div>
            <br /><br />
        </div>
    </section>

    <footer id="footer"></footer>

</body>

</html>