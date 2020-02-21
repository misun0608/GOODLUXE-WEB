<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat,java.sql.Timestamp,com.spring.goodluxe.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%
	HashMap<String,Object> theProduct = (HashMap<String,Object>)request.getAttribute("theProduct");
	String main_img = (String)theProduct.get("pb_main_img_stored");
	String detail_img1 = (String)theProduct.get("pb_detail_img1_stored");
	String detail_img2 = (String)theProduct.get("pb_detail_img2_stored");
	String detail_img3 = (String)theProduct.get("pb_detail_img3_stored");
	String brand_name = (String)theProduct.get("pd_brand");
	String pb_md_name = (String)theProduct.get("pb_md_name");
	String quality_grade = (String)theProduct.get("quality_grade");
	String pb_detail = (String)theProduct.get("pb_detail");
	String entity_number=(String)theProduct.get("entity_number");
	String saleStatus = (String)theProduct.get("pb_sale_status");
	
	int product_price = Integer.parseInt((theProduct.get("sale_price")).toString());
	DecimalFormat df = new DecimalFormat(",###");
	String product_price_shaped = df.format(product_price);
	
	String expected_point = df.format(product_price/1000);
	
	String shipping_coast = "5000원";
	if(product_price >= 500000){
		shipping_coast = "무료";
	}else{
		shipping_coast = "5,000원";
	}
	
	request.setAttribute("entity_number",entity_number);
	
	ArrayList<HashMap<String, Object>> recommandList
	= (ArrayList<HashMap<String, Object>>)request.getAttribute("recommandList");
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
	
	<!-- md_detail -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/md_detail.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/md_detail.js"></script>
	<script type="text/javascript">
		 	$(document).ready(function(){
		 		function setBtnColor(){
		 			$.ajax({   
		 				url:'/goodluxe/checkAlreadyLiked.do?entity_number=<%=entity_number%>',
		 				type:'POST',
		 				contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		 				success:function(data){
		 					if (data==1){
		 						//이미 좋아요를 누른사람
		 						$('#heartImg').attr("src","${pageContext.request.contextPath}/resources/img/icons/heart2.png");		
		 					}
		 					else{
		 						//좋아요를 누른적이 없는사람
		 						$('#heartImg').attr("src","${pageContext.request.contextPath}/resources/img/icons/heart.png");
		 					}
		 				},
		 				error:function(){
		 					alert("서버와 통신에 실패하였습니다.");
		 				}
		 			});
		 		}
		 		
		 		$('#likebtn').on('click',function(event){
		 			jQuery.ajax({
			 			url:$(this).attr("href"),
			 			type:'GET',
			 			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			 			success: function (data) {
			 				if (data==1){
		 						//좋아요 눌러짐
		 						$('#heartImg').attr("src","${pageContext.request.contextPath}/resources/img/icons/heart2.png");		
		 					} else if(data==0){
		 						//좋아요 취소됨
		 						$('#heartImg').attr("src","${pageContext.request.contextPath}/resources/img/icons/heart.png");
		 					} else if(data==-1) {
		 						alert('로그인 후 이용해주세요!');
		 					}
			 			},
			 			error:function() {
	  	                 	alert("리스트 ajax통신 실패!!!");
	 	                }
		 			});
		 			event.preventDefault(); //디폴트 이벤트 해제
		 		});
		 		setBtnColor();
		 });
		</script>
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
						<a class="detail_main_image_link_right"> <img
							src="/Goodluxe/image/<%=main_img %>" alt="가방"
							class="md_detail_main_image">
						</a>
					</div>
					<div class="md_detail_thumbnail_images">
						<div class="detail_main_image_area1 detail_main_image_left">
							<a class="main_image_link1"> <img
								src="/Goodluxe/image/<%=main_img %>" alt="가방"
								class="md_detail_thumbnail_image">
							</a>
						</div>
						<div class="detail_main_image_area2 detail_main_image_left">
							<a class="main_image_link2"> <img
								src="/Goodluxe/image/<%=detail_img1 %>" alt="가방"
								class="md_detail_thumbnail_image">
							</a>
						</div>
						<div class="detail_main_image_area3 detail_main_image_left">
							<a class="main_image_link3"> <img
								src="/Goodluxe/image/<%=detail_img2 %>" alt="가방"
								class="md_detail_thumbnail_image">
							</a>
						</div>
						<div class="detail_main_image_area4 detail_main_image_left">
							<a class="main_image_link4"> <img
								src="/Goodluxe/image/<%=detail_img3 %>" alt="가방"
								class="md_detail_thumbnail_image">
							</a>
						</div>
					</div>
				</div>
				<div id="md_detail_textarea">
					<div class="md_detail_textarea_align">
						<div class="md_detail_textarea2 md_detail_brand"><%=brand_name%></div>
						<div class="md_detail_textarea2 md_detail_name"><%=pb_md_name%></div>

						<hr id="name_line">
						<div class="md_detail_table">
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 가격 </span> <span
									class="md_detail_cell md_detail_price"> <%=product_price_shaped%>원 </span>
							</div>
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 적립포인트 </span> <span
									class="md_detail_cell md_detail_point"> <%=expected_point%>P </span>
							</div>
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 배송비 </span> <span
									class="md_detail_cell md_detail_delivery_fee"> <%=shipping_coast %> </span>
							</div>
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 배송일 </span> <span
									class="md_detail_cell md_detail_d_period"> 결제일로부터 3일 이내
									배송 </span>
							</div>
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 제품등급 </span> <span
									class="md_detail_cell md_detail_grade"> <%=quality_grade %> </span>
							</div>
							<div class="md_detail_row">
								<span class="md_detail_cell md_detail_title"> 배송구분 </span> <span
									class="md_detail_cell md_detail_delivery_domestic"> 본
									상품은 국내배송만 가능합니다 </span>
								<hr id="name_line">
							</div>
							<div class="md_detail_textarea2 md_detail_btnpart">
								<%if(!saleStatus.equals("거래진행중")){ %>
								<a href = "orderForm.do?entity_number=<%=entity_number%>">
									<div class="buybtn buybtn2"><p class = "buybtn_letter">구매하기</p></div>
								</a>
								<%}else{%>
									<div class="cantbuybtn"><p class = "cantbuyletter">거래진행중인 상품입니다.</p></div>
								<%}%>
								<a href = "#">
									<div class="notibtn">
										<img src="${pageContext.request.contextPath}/resources/img/icons/bell.png" alt="알림" width="16px" class = "notice_Img">
										<p class = "notice_letter">알림</p>
									</div>
								</a>
								<a href="mdDetailLike.do?entity_number=<%=entity_number%>" id="likebtn" >
									<div class="likebtn" >
										<img id="heartImg"  alt="좋아요" width="16px" class = "like_Img">
										<p class = "like_letters">좋아요</p>
									</div>
								</a>
								 
								
							</div>
						</div>
					</div>
				</div>


				<div class="md_detail_bottom">
					<!-- 제품 상세설명 -->
					<br/>
					<div class="md_detail_explanation">
						<h3 class="md_detail_explanation_title">상품상세</h3>
						<br />
						<p class="md_detail_explanation_article">
							<%= pb_detail%>
						</p>
					</div>
					<br/><br/>
					<!-- 연관 제품 -->
					<div class="related_item_area">
						<h3 class="related_item_title">Related Items</h3>
						<div class="related_item_list">
							
							<%
							for( int j = 0; j < recommandList.size() ; j++) {
								HashMap<String,Object>  productHM = new HashMap <String, Object>();	
								productHM = (HashMap<String,Object>)recommandList.get(j);
								String main_img_recommand = (String)productHM.get("pb_main_img_stored");
								String brand_name_recommand = (String)productHM.get("pd_brand");
								String product_name_recommand = (String)productHM.get("pb_md_name");
								String entity_recommand = (String)productHM.get("entity_number");
								int product_price_nonshaped_recommand = Integer.parseInt((productHM.get("sale_price")).toString());
								DecimalFormat df_recommand = new DecimalFormat("###,###");
								String product_price_shaped_recommand = df_recommand.format(product_price_nonshaped_recommand);
							%>
								<div class="related_item">
									<a href="./mdDetail.do?entity_number=<%= entity_recommand%>"> 
									<img src="/Goodluxe/image/<%= main_img_recommand%>" alt="">
										<div class="related_item_info">
											<div class="related_item_brand"><%=brand_name_recommand %></div>
											<div class="related_item_name"><%= product_name_recommand %></div>
											<div class="related_item_price"><%= product_price_shaped_recommand %> 원</div>
										</div>
									</a>
								</div>
							<%} %>
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