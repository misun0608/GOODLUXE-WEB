<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.spring.goodluxe.voes.ProductBoardVO"%>
<%@ page import="com.spring.goodluxe.voes.ProductVO"%>


<%
	ArrayList<HashMap<String, Object>> productList 
		= (ArrayList<HashMap<String, Object>>)request.getAttribute("productList");
	
	int currentPage = (int)request.getAttribute("currentPage");
	int count = (int)request.getAttribute("count");
	int number = (int)request.getAttribute("number");
	int pageSize = (int)request.getAttribute("pageSize");

	String il_search_brand = (String)request.getAttribute("il_search_brand");
	String il_search_category = (String)request.getAttribute("il_search_category");
	String il_search_grade = (String)request.getAttribute("il_search_grade");
	String il_search_price = (String)request.getAttribute("il_search_price");
	
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
	
	<!-- item_list -->
 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/item_list.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/item_list_doesntExist.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pagination.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pagination.js"></script>


	
</head>
<body>
    <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

    <section id="container">
        <br>
   <div id="main">
			<div class="il_area">
				<article class="il_1st">
					<form id="il_search_form" onclick = "filtering_check();">
						<select name="il_search_brand" id="il_search_brand"
							class="il_search_select_box">
							<option value="all">브랜드</option>
							<option value="Armani"  ${il_search_brand=='Armani'?"selected":""}  >Armani</option>
							<option value="Balenciaga"  ${il_search_brand=='Balenciaga'?"selected":""} >Balenciaga</option>
							<option value="Bally"   ${il_search_brand=='Bally'?"selected":""}  >Bally</option>
							<option value="Balmain"  ${il_search_brand=='Balmain'?"selected":""} >Balmain</option>
							<option value="Berluti"  ${il_search_brand=='Berluti'?"selected":""} >Berluti</option>
							<option value="Bottega"  ${il_search_brand=='Bottega'?"selected":""} >Bottega Veneta</option>
							<option value="BOUCHERON"  ${il_search_brand=='BOUCHERON'?"selected":""}  >BOUCHERON</option>
							<option value="Breguet"  ${il_search_brand=='Breguet'?"selected":""}  >Breguet</option>
							<option value="BREITLING"  ${il_search_brand=='BREITLING'?"selected":""}  >BREITLING</option>
							<option value="Brunello"  ${il_search_brand=='Brunello'?"selected":""}  >Brunello Cucinelli</option>
							<option value="Burberrys"  ${il_search_brand=='Burberrys'?"selected":""}  >Burberrys</option>
							<option value="Bvlgari"  ${il_search_brand=='Bvlgari'?"selected":""}  >Bvlgari</option>
							<option value="Cartier" ${il_search_brand=='Cartier'?"selected":""} >Cartier</option>
							<option value="Celine"  ${il_search_brand=='Celine'?"selected":""}  >Celine</option>
							<option value="Chanel"  ${il_search_brand=='Chanel'?"selected":""}  >Chanel</option>
							<option value="Christian"  ${il_search_brand=='Christian'?"selected":""}  >Christian Dior</option>
							<option value="Christian"  ${il_search_brand=='Christian'?"selected":""}  >Christian louboutin</option>
							<option value="CHRONOSWISS"  ${il_search_brand=='CHRONOSWISS'?"selected":""}  >CHRONOSWISS</option>
							<option value="Coach"  ${il_search_brand=='Coach'?"selected":""}  >Coach</option>
							<option value="Colombo"  ${il_search_brand=='Colombo'?"selected":""}  >Colombo</option>
							<option value="Comme des Garcons"  ${il_search_brand=='Comme des Garcons'?"selected":""}  >Comme des Garcons</option>
							<option value="Damiani"  ${il_search_brand=='Damiani'?"selected":""}  >Damiani</option>
							<option value="DELVAUX"  ${il_search_brand=='DELVAUX'?"selected":""}  >DELVAUX</option>
							<option value="Dior Homme"  ${il_search_brand=='Dior Homme'?"selected":""}  >Dior Homme</option>
							<option value="Dolce&Gabbana"  ${il_search_brand=='Dolce\\&Gabbana'?"selected":""}  >Dolce&Gabbana</option>
							<option value="Dries Van Noten"  ${il_search_brand=='Dries Van Noten'?"selected":""}  >Dries Van Noten</option>
							<option value="Dsquared2"  ${il_search_brand=='Dsquared2'?"selected":""}  >Dsquared2</option>
							<option value="DVF"  ${il_search_brand=='DVF'?"selected":""}  >DVF</option>
							<option value="Ermanno Scervino"  ${il_search_brand=='Ermanno Scervino'?"selected":""}  >Ermanno Scervino</option>
							<option value="Etro"  ${il_search_brand=='Etro'?"selected":""}  >Etro</option>
							<option value="Fendi"  ${il_search_brand=='Fendi'?"selected":""}  >Fendi</option>
							<option value="Ferragamo"  ${il_search_brand=='Ferragamo'?"selected":""}  >Ferragamo</option>
							<option value="For Man"  ${il_search_brand=='For Man'?"selected":""}  >For Man</option>
							<option value="Franck"  ${il_search_brand=='Franck'?"selected":""}  >Franck Muller</option>
							<option value="Fred"  ${il_search_brand=='Fred'?"selected":""}  >Fred</option>
							<option value="Giuseppe Zanotti"  ${il_search_brand=='Giuseppe Zanotti'?"selected":""}  >Giuseppe Zanotti</option>
							<option value="Giambattista Valli"  ${il_search_brand=='Giambattista Valli'?"selected":""}  >Giambattista Valli</option>
							<option value="Givenchy"  ${il_search_brand=='Givenchy'?"selected":""}  >Givenchy</option>
							<option value="Goyard"  ${il_search_brand=='Goyard'?"selected":""}  >Goyard</option>
							<option value="Gucci"  ${il_search_brand=='Gucci'?"selected":""}  >Gucci</option>
							<option value="HarryWinston"  ${il_search_brand=='HarryWinston'?"selected":""}  >HarryWinston</option>
							<option value="Helen Kaminski"  ${il_search_brand=='Helen Kaminski'?"selected":""}  >Helen Kaminski</option>
							<option value="Hermes"  ${il_search_brand=='Hermes'?"selected":""}  >Hermes</option>
							<option value="HUBLOT"  ${il_search_brand=='HUBLOT'?"selected":""}  >HUBLOT</option>
							<option value="Isabel Marant"  ${il_search_brand=='Isabel Marant'?"selected":""}  >Isabel Marant</option>
							<option value="Jimmy Choo"  ${il_search_brand=='Jimmy Choo'?"selected":""}  >Jimmy Choo</option>
							<option value="Louis Vuitton"  ${il_search_brand=='Louis Vuitton'?"selected":""}  >Louis Vuitton</option>
							<option value="Manolo Blahnik"  ${il_search_brand=='Manolo Blahnik'?"selected":""}  >Manolo Blahnik</option>
							<option value="Maje"  ${il_search_brand=='Maje'?"selected":""}  >Maje</option>
							<option value="Marc by Marc Jacobs"  ${il_search_brand=='Marc by Marc Jacobs'?"selected":""}  >Marc by Marc Jacobs</option>
							<option value="Marc Jacobs"  ${il_search_brand=='Marc Jacobs'?"selected":""}  >Marc Jacobs</option>
							<option value="Marni"  ${il_search_brand=='Marni'?"selected":""}  >Marni</option>
							<option value="Martin Margiella"  ${il_search_brand=='Martin Margiella'?"selected":""}  >Martin Margiella</option>
							<option value="Max Mara"  ${il_search_brand=='Max Mara'?"selected":""}  >Max Mara</option>
							<option value="Michael kors"  ${il_search_brand=='Michael kors'?"selected":""}  >Michael kors</option>
							<option value="Miu Miu"  ${il_search_brand=='Miu Miu'?"selected":""}  >Miu Miu</option>
							<option value="MONCLERE"  ${il_search_brand=='MONCLERE'?"selected":""}  >MONCLERE</option>
							<option value="MontBlanc"  ${il_search_brand=='MontBlanc'?"selected":""}  >MontBlanc</option>
							<option value="Moschino"  ${il_search_brand=='Moschino'?"selected":""}  >Moschino</option>
							<option value="Mulberry"  ${il_search_brand=='Mulberry'?"selected":""}  >Mulberry</option>
							<option value="OMEGA"  ${il_search_brand=='OMEGA'?"selected":""}  >OMEGA</option>
							<option value="Prada"  ${il_search_brand=='Prada'?"selected":""}  >Prada</option>
							<option value="Proenza schouler"  ${il_search_brand=='Proenza schouler'?"selected":""}  >Proenza schouler</option>
							<option value="Rick owens"  ${il_search_brand=='Rick owens'?"selected":""}  >Rick owens</option>
							<option value="ROCHAS"  ${il_search_brand=='ROCHAS'?"selected":""}  >ROCHAS</option>
							<option value="ROGER DUBUIS"  ${il_search_brand=='ROGER DUBUIS'?"selected":""}  >ROGER DUBUIS</option>
							<option value="Roger Vivier"  ${il_search_brand=='Roger Vivier'?"selected":""}  >Roger Vivier</option>
							<option value="Rolex"  ${il_search_brand=='Rolex'?"selected":""}  >Rolex</option>
							<option value="Sacai"  ${il_search_brand=='Sacai'?"selected":""}  >Sacai</option>
							<option value="See by Chloe"  ${il_search_brand=='See by Chloe'?"selected":""}  >See by Chloe</option>
							<option value="Stella McCartney"  ${il_search_brand=='Stella McCartney'?"selected":""}  >Stella McCartney</option>
							<option value="Stuart Weitzman"  ${il_search_brand=='Stuart Weitzman'?"selected":""}  >Stuart Weitzman</option>
							<option value="Syaring"  ${il_search_brand=='Syaring'?"selected":""}  >Syaring</option>
							<option value="Tagheuer"  ${il_search_brand=='Tagheuer'?"selected":""}  >Tagheuer</option>
							<option value="Tasaki"  ${il_search_brand=='Tasaki'?"selected":""}  >Tasaki</option>
							<option value="THOM BROWNE"  ${il_search_brand=='THOM BROWNE'?"selected":""}  >THOM BROWNE</option>
							<option value="Tiffany"  ${il_search_brand=='Tiffany'?"selected":""}  >Tiffany</option>
							<option value="Tod's" >Tod's</option>
							<option value="Tom ford"  ${il_search_brand=='Tom ford'?"selected":""}  >Tom ford</option>
							<option value="Tory burch"  ${il_search_brand=='Tory burch'?"selected":""}  >Tory burch</option>
							<option value="Valentino"  ${il_search_brand=='Valentino'?"selected":""}  >Valentino</option>
							<option value="Valexstra"  ${il_search_brand=='Valexstra'?"selected":""}  >Valexstra</option>
							<option value="Vanessa Bruno"  ${il_search_brand=='Vanessa Bruno'?"selected":""}  >Vanessa Bruno</option>
							<option value="Vivienne Westwood"  ${il_search_brand=='Vivienne Westwood'?"selected":""}  >Vivienne westwood</option>
							<option value="YSL Rive Gauche"  ${il_search_brand=='YSL Rive Gauche'?"selected":""}  >YSL Rive Gauche</option>
							<option value="Zadig&Voltaire"  ${il_search_brand=='Zadig\\&Voltaire'?"selected":""}  >Zadig&Voltaire</option>
							<option value="etc">그 외 브랜드</option>
						</select> <select name="il_search_category" id="il_search_category"
							class="il_search_select_box">
							<option value="all">카테고리</option>
							<option value="CLOTHES" ${il_search_category=='CLOTHES'?"selected":""} >CLOTHES</option>
							<option value="JEWELRY" ${il_search_category=='JEWELRY'?"selected":""} >JEWELRY</option>
							<option value="WATCH" ${il_search_category=='WATCH'?"selected":""} >WATCH</option>
							<option value="BAG" ${il_search_category=='BAG'?"selected":""} >BAG</option>
							<option value="WALLET" ${il_search_category=='WALLET'?"selected":""} >WALLET</option>
							<option value="GLASSES" ${il_search_category=='GLASSES'?"selected":""} >GLASSES</option>
							<option value="SHOES" ${il_search_category=='SHOES'?"selected":""} >SHOES</option>
						</select> <select name="il_search_grade" id="il_search_grade"
							class="il_search_select_box">
							<option value="all">등급</option>
							<option value="NS" ${il_search_grade=='NS'?"selected":""}  >NS</option>
							<option value="A" ${il_search_grade=='A'?"selected":""}  >A</option>
							<option value="B" ${il_search_grade=='B'?"selected":""} >B</option>
						</select> <select name="il_search_price" id="il_search_price"
							class="il_search_select_box">
							<option value="all">가격</option>
							<option value="lt10" ${il_search_grade=='lt10'?"selected":""} >10만원 미만</option>
							<option value="10to50" ${il_search_grade=='10to50'?"selected":""} >10만원 이상 ~ 50만원 미만</option>
							<option value="50to100" ${il_search_grade=='50to100'?"selected":""} >50만원 이상 ~ 100만원 미만</option>
							<option value="100to200" ${il_search_grade=='100to200'?"selected":""} >100만원 이상 ~ 200만원 미만</option>
							<option value="200to300" ${il_search_grade=='200to300'?"selected":""} >200만원 이상 ~ 300만원 미만</option>
							<option value="300to400" ${il_search_grade=='300to400'?"selected":""} >300만원 이상 ~ 400만원 미만</option>
							<option value="400to500" ${il_search_grade=='400to500'?"selected":""} >400만원 이상 ~ 500만원 미만</option>
							<option value="gt500" ${il_search_grade=='gt500'?"selected":""} >500만원 이상</option>
						</select> <input type="submit" value="검색" class="il_search_btn">
					</form>
				</article>
				<article class="il_2nd">
					<% 
						if(count == 0){
					%>
						<div class = "research_none_div">
						
							<p class = "research_none_p1">검색 결과가 없습니다.</p>
						</div>
					<%
						}
					%>
				
				
					<% for( int i = 0; i<productList.size(); i++){ 
						HashMap<String,Object>  productHM = new HashMap <String, Object>();	
						productHM = (HashMap<String,Object>)productList.get(i);
						String img_name = (String)productHM.get("pb_main_img_stored");
						String brand_name = (String)productHM.get("pd_brand");
						String product_name = (String)productHM.get("pb_md_name");
						String entity_number = (String)productHM.get("entity_number");
						//int product_price = (Integer)productHM.get("sale_price");
						//int product_price = Integer.valueOf((String)productHM.get("sale_price"));
						int product_price_nonshaped = Integer.parseInt((productHM.get("sale_price")).toString());
						DecimalFormat df = new DecimalFormat(",###");
						String product_price_shaped = df.format(product_price_nonshaped);
						
						String saleStatus = (String)productHM.get("pb_sale_status");
						
					%>
					<a href="./mdDetail.do?entity_number=<%=entity_number%>">
						<%
						if(saleStatus.equals("거래진행중")){ %>
							<div  class = "dealing_now">
								<span>거래 진행중인 <br/> 상품입니다.</span>
							</div>	
						<% } %>
						<div class="il_card">
							<div class="il_md_img">
								<img src="/Goodluxe/image/<%= img_name%>" alt="md_img"
									class="il_md_img_path">
							</div>
							<div class="md_info">
								<div class="il_md_brand"><%= brand_name %></div>
								<div class="il_md_name"><%= product_name %></div>
								<div class="il_md_price"><%= product_price_shaped %> 원</div>
							</div>
						</div>
						
					</a> 
					
				<!--<a href="#">
						<div class="il_card">
							<div class="il_md_img">
								<img src="${pageContext.request.contextPath}/resources/img/md_img/md_img.jpg" alt="md_img"
									class="il_md_img_path">
							</div>
							<div class="md_info">
								<div class="il_md_brand">Saint Laurent</div>
								<div class="il_md_name">생로랑 모노그램 카바스백</div>
								<div class="il_md_price">1,383,000 원</div>
							</div>
						</div>
					</a> -->
					<% 
						number--;
						}//포문1닫힘 
					%>
					
				</article>
	 			<article class="3rd_arti">
	 				 <center>
                        <div class="liked_goods_page">
                            <ul class="pagination modal">
						<%	
							if(count>0){
								int pageCount = ((count-1)/pageSize)+1;
								int startPage = 1;
								int i;
								
								if(currentPage%5!=0)
										startPage = (int)(currentPage/5)*5+1;
								else
									startPage = currentPage-4;
								int pageBlock = 5;
						
						%>
                                <li><a href="itemList.do?pageNum=1&pageCount=<%=pageCount%>&il_search_brand=<%=il_search_brand%>&il_search_category=<%=il_search_category%>&il_search_grade=<%=il_search_grade%>&il_search_price=<%=il_search_price%>" class="page_fisrt">처음 페이지</a></li>
                                <li><a href="itemList.do?pageNum=<%=startPage-5%>&pageCount=<%=pageCount%>&il_search_brand=<%=il_search_brand%>&il_search_category=<%=il_search_category%>&il_search_grade=<%=il_search_grade%>&il_search_price=<%=il_search_price%>" class="arrow left">&lt;&lt;</a></li>
							<% 	
								for(i = startPage; (i<=startPage+4)&&(i<=pageCount);i++){
							%>
                                <li><a href="itemList.do?pageNum=<%=i%>&pageCount=<%=pageCount%>&il_search_brand=<%=il_search_brand%>&il_search_category=<%=il_search_category%>&il_search_grade=<%=il_search_grade%>&il_search_price=<%=il_search_price%>"
                                	<% if(i==currentPage){ %> 
                                			class = "active num"
                                	<%}else{%>
                                			class="num"
                                	<%}%> ><%= i%></a></li>
								<%
									}
								%>  
                                <li><a href="itemList.do?pageNum=<%=startPage+5%>&pageCount=<%=pageCount%>&il_search_brand=<%=il_search_brand%>&il_search_category=<%=il_search_category%>&il_search_grade=<%=il_search_grade%>&il_search_price=<%=il_search_price%>" class="arrow right">&gt;&gt;</a></li>
                                <li><a href="itemList.do?pageNum=<%=pageCount%>&pageCount=<%=pageCount%>&il_search_brand=<%=il_search_brand%>&il_search_category=<%=il_search_category%>&il_search_grade=<%=il_search_grade%>&il_search_price=<%=il_search_price%>" class="page_last">끝 페이지</a></li>
						<%
							}
						%>
                            </ul>
                        	<br/><br/><br/>
                        </div>
                     </center>
				</article>
			</div>
		</div>
    </section>

    <footer id="footer">
    </footer>
</body>
</html>