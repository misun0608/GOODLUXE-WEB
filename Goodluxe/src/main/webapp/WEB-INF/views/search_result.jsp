<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.spring.goodluxe.voes.ProductBoardVO"%>
<%@ page import="com.spring.goodluxe.voes.ProductVO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	ArrayList<HashMap<String, Object>> productList = (ArrayList<HashMap<String, Object>>) request
			.getAttribute("productList");
	
	int currentPage = (int) request.getAttribute("currentPage");
	int count = (int) request.getAttribute("count");
	int number = (int) request.getAttribute("number");
	int pageSize = (int) request.getAttribute("pageSize");
	String search_content = (String)request.getAttribute("search_content");
	String orderbywhat = (String)request.getAttribute("orderbywhat");
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
    
    <!--  search_result   -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/goodluxe-search_result.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/item_list_doesntExist.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/pagination.css" />
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/pagination.js"></script>


</head>
<body>
    <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

    <section id="container">
        <br>
        <div id="main">
			<div class="sr_section_area">
				<article class="sr_first">
					<span>'<%= search_content %>'에 대한 검색 결과</span> <span><%=count%> 개의 상품이 검색되었습니다</span>
				</article>
				
				<article class="sr_second">
					<ul>
						<li class="sort on"><a href="searchResult.do?search_content=<%=search_content%>&orderbywhat=recently">최신순</a></li>
						<li class="sort_split"><a href="#">|</a></li>
						<li class="sort"><a href="searchResult.do?search_content=<%=search_content%>&orderbywhat=popular">인기순</a></li>
						<li class="sort_split"><a href="#">|</a></li>
						<li class="sort"><a href="searchResult.do?search_content=<%=search_content%>&orderbywhat=highprice">높은 가격순</a></li>
						<li class="sort_split"><a href="#">|</a></li>
						<li class="sort"><a href="searchResult.do?search_content=<%=search_content%>&orderbywhat=lowprice">낮은 가격순</a></li>
					</ul>
				</article>
				
				<article class = "search_none">
					<%
						if(count == 0){
					%>
						<div class = "research_none_div">
							<p class = "research_none_p1">검색 결과가 없습니다.</p>
						</div>
					<%
						}
					%>
				</article>
				
				<article class="sr_third">
				
				<%
						for (int j = 0; j <productList.size(); j++) {
							HashMap<String,Object>  productHM = new HashMap <String, Object>();	
							productHM = (HashMap<String,Object>)productList.get(j);
							String img_name = (String)productHM.get("pb_main_img_stored");
							String brand_name = (String)productHM.get("pd_brand");
							String product_name = (String)productHM.get("pb_md_name");
							int product_price_nonshaped = Integer.parseInt((productHM.get("sale_price")).toString());
							DecimalFormat df = new DecimalFormat(",###");
							String product_price_shaped = df.format(product_price_nonshaped);
							String entity_number = (String)productHM.get("entity_number");
							String saleStatus = (String)productHM.get("pb_sale_status");
					%>
					<a href="./mdDetail.do?entity_number=<%=entity_number%>">
						<%
						if(saleStatus.equals("거래진행중")){ %>
							<div  class = "dealing_now">
								<span>거래 진행중인 <br/> 상품입니다.</span>
							</div>	
						<% } %>
						<div class="card">
							<div class="md_img">
								<img src="/Goodluxe/image/<%= img_name%>" alt="md_img"
									class="md_img_path">
							</div>
							<div class="md_info">
								<div class="md_brand"><%= brand_name %></div>
								<div class="md_name"><%= product_name %></div>
								<div class="md_price"><%= product_price_shaped %> 원</div>
							</div>
						</div>
					</a>


					<%
						number--;
						}
					%>

				
				</article>
				
				<article class="4th_arti">
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
				                               		 <li><a href="searchResult.do?pageNum=1&pageCount=<%=pageCount%>&search_content=<%=search_content%>&orderbywhat=<%=orderbywhat%>" class="page_fisrt">처음 페이지</a></li>
				                               		 <li><a href="searchResult.do?pageNum=<%=startPage - 5%>&pageCount=<%=pageCount%>&search_content=<%=search_content%>&orderbywhat=<%=orderbywhat%>" class="arrow left">&lt;&lt;</a></li>
								<% 	
									for(i = startPage; (i<=startPage+4)&&(i<=pageCount);i++){
								%>
				                              			<li><a href="searchResult.do?pageNum=<%=i%>&pageCount=<%=pageCount%>&search_content=<%=search_content%>&orderbywhat=<%=orderbywhat%>"
				                                				<% if(i==currentPage){%> 
				                                					class = "active num"
				                                				<%}else{%>	
				                                					class="num"
				                                				<%}%> ><%= i%></a></li>
									<%}%>  
				                             	   	<li><a href="searchResult.do?pageNum=<%=startPage + 5%>&pageCount=<%=pageCount%>&search_content=<%=search_content%>&orderbywhat=<%=orderbywhat%>" class="arrow right">&gt;&gt;</a></li>
				                                		<li><a href="searchResult.do?pageNum=<%=pageCount%>&pageCount=<%=pageCount%>&search_content=<%=search_content%>&orderbywhat=<%=orderbywhat%>" class="page_last">끝 페이지</a></li>
								<%
								}
								%>
				                           	</ul>
							<br /><br /><br />
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