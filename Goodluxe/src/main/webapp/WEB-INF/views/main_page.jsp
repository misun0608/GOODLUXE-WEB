<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.DecimalFormat"%>

<%
	ArrayList<HashMap<String, Object>> productList 
	= (ArrayList<HashMap<String, Object>>)request.getAttribute("productList");
	
	ArrayList<HashMap<String, Object>> productList_view 
	= (ArrayList<HashMap<String, Object>>)request.getAttribute("productList_view");
	
	String entity1 = (String)productList_view.get(0).get("entity_number");
	String entity2 = (String)productList_view.get(1).get("entity_number");
	String entity3 = (String)productList_view.get(2).get("entity_number");
	String entity4 = (String)productList_view.get(3).get("entity_number");
	String entity5 = (String)productList_view.get(4).get("entity_number");
	String entity6 = (String)productList_view.get(5).get("entity_number");

	String fancy_img1 = (String)productList_view.get(0).get("pb_main_img_stored");
	String fancy_img2 = (String)productList_view.get(1).get("pb_main_img_stored");
	String fancy_img3 = (String)productList_view.get(2).get("pb_main_img_stored");
	String fancy_img4 = (String)productList_view.get(3).get("pb_main_img_stored");
	String fancy_img5 = (String)productList_view.get(4).get("pb_main_img_stored");
	String fancy_img6 = (String)productList_view.get(5).get("pb_main_img_stored");
	
/* 	
String entity1,entity2,entity3,entity4,entity5,entity6,entity7,entity8;

	String fancy_img1,fancy_img2,fancy_img3,fancy_img4,fancy_img5,fancy_img6,fancy_img7,fancy_img8;

	
	if(productList_view != null) {
		entity1 = (String)productList_view.get(0).get("entity_number");
		entity2 = (String)productList_view.get(1).get("entity_number");
		entity3 = (String)productList_view.get(2).get("entity_number");
		entity4 = (String)productList_view.get(3).get("entity_number");
		entity5 = (String)productList_view.get(4).get("entity_number");
		entity6 = (String)productList_view.get(5).get("entity_number");

		fancy_img1 = (String)productList_view.get(0).get("pb_main_img_stored");
		fancy_img2 = (String)productList_view.get(1).get("pb_main_img_stored");
		fancy_img3 = (String)productList_view.get(2).get("pb_main_img_stored");
		fancy_img4 = (String)productList_view.get(3).get("pb_main_img_stored");
		fancy_img5 = (String)productList_view.get(4).get("pb_main_img_stored");
		fancy_img6 = (String)productList_view.get(5).get("pb_main_img_stored");

	} 
*/

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
	
    <!-- main_page  -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/main_page.css" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/main_page.js"></script>

</head>
<body>
    <header id="header"></header>

    <nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

    <section id="container">
        <br>
        <div id="main">
			<article class="mp_1st">
				<video src="${pageContext.request.contextPath}/resources/img/video/taking_pictures.mp4" class="main_video"
					autoplay loop poster="${pageContext.request.contextPath}/resources/img/md_img/loading.png"></video>
			</article>
			<div class="mp_section_area">
				<article class="mp_2nd">
					<div class="main_images">
						<div class="main_image_right">
							<a href="./mdDetail.do?entity_number=<%=entity1%>" class="main_image_link_right"><img
								src="/Goodluxe/image/<%= fancy_img1%>" alt="img1" class="main_image"></a>
						</div>
						<div class="main_image_area1 main_image_left">
							<a href="./mdDetail.do?entity_number=<%=entity1%>" class="main_image_link1"><img
								src="/Goodluxe/image/<%= fancy_img1%>" alt="img1" class="main_image"></a>
						</div>
						<div class="main_image_area2 main_image_left">
							<a href="./mdDetail.do?entity_number=<%=entity2%>" class="main_image_link2"><img
								src="/Goodluxe/image/<%= fancy_img2%>" alt="img2" class="main_image"></a>
						</div>
						<div class="main_image_area3">
							<a href="#" class="main_image_link3"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md_black.png" alt="" class="main_image"></a>
						</div>
						<div class="main_image_area4 main_image_left">
							<a href="#" class="main_image_link4"><img
								src="" alt="img3" class="main_image"></a>
						</div>
						<div class="main_image_area5 main_image_left">
							<a href="./mdDetail.do?entity_number=<%=entity3%>" class="main_image_link5"><img
								src="/Goodluxe/image/<%= fancy_img3%>" alt="img4" class="main_image"></a>
						</div>
						<div class="main_image_area6 main_image_left">
							<a href="#" class="main_image_link6"><img
								src="" alt="img5" class="main_image"></a>
						</div>
						<div class="main_image_area7">
							<a href="#" class="main_image_link7"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md_black.png" alt="" class="main_image"></a>
						</div>
						<div class="main_image_area8 main_image_left">
							<a href="./mdDetail.do?entity_number=<%=entity4%>" class="main_image_link8"><img
								src="/Goodluxe/image/<%= fancy_img4%>" alt="img6" class="main_image"></a>
						</div>
						<div class="main_image_area9 main_image_left">
							<a href="./mdDetail.do?entity_number=<%=entity5%>" class="main_image_link9"><img
								src="/Goodluxe/image/<%= fancy_img5%>" alt="img7" class="main_image"></a>
						</div>
						<div class="main_image_area10 main_image_left">
							<a href="./mdDetail.do?entity_number=<%=entity6%>" class="main_image_link10"><img
								src="/Goodluxe/image/<%= fancy_img6%>" alt="img8" class="main_image"></a>
						</div>
						<div class="main_image_area11">
							<a href="#" class="main_image_link11"><img
								src="${pageContext.request.contextPath}/resources/img/md_img/md_black.png" alt="" class="main_image"></a>
						</div>
					</div>
				</article>
				<article class="mp_3rd">
				
					<%
						for(int i = 0; i<productList.size(); i++){
							HashMap<String,Object>  productHM = new HashMap <String, Object>();	
							productHM = (HashMap<String,Object>)productList.get(i);
							String img_name = (String)productHM.get("pb_main_img_stored");
							String brand_name = (String)productHM.get("pd_brand");
							String product_name = (String)productHM.get("pb_md_name");
							int product_price_nonshaped = Integer.parseInt((productHM.get("sale_price")).toString());
							DecimalFormat df = new DecimalFormat(",###");
							String product_price_shaped = df.format(product_price_nonshaped);
							String entity_number = (String)productHM.get("entity_number");
					%>
						<a href="./mdDetail.do?entity_number=<%=entity_number%>">
							<div class="mp_card">
								<div class="mp_md_img">
									<img src="/Goodluxe/image/<%= img_name%>" alt="md_img"
										class="mp_md_img_path">
								</div>
								<div class="mp_md_info">
									<div class="mp_md_brand"><%= brand_name %></div>
									<div class="mp_md_name"><%= product_name %></div>
									<div class="mp_md_price"><%= product_price_shaped %> 원</div>
								</div>
							</div>
						</a> 	
					<%
						}
					%>
				</article>
				<article class="mp_4th">
					<a href="http://localhost:8080/goodluxe/itemList.do?il_search_brand=all&il_search_category=all&il_search_grade=all&il_search_price=all" class="more_btn">MORE</a>
				</article>
			</div>
		</div>
    </section>

    <footer id="footer">
    </footer>
</body>
</html>