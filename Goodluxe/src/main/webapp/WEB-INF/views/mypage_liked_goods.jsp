<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.DecimalFormat"%>
<%
	ArrayList<HashMap<String, Object>> productList 
	= (ArrayList<HashMap<String, Object>>)request.getAttribute("productList");

	int currentPage = (int)request.getAttribute("currentPage");
	int count = (int)request.getAttribute("count");
	int number = (int)request.getAttribute("number");
	int pageSize = (int)request.getAttribute("pageSize");
		
%>

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

	});
</script>


<!--  my_page_liked_goods   -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage_onlymenu.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage_liked_goods.css" />
<script>
		$(document).ready(function(){
			$("#mypage_menu").load("mypageMenu.do", function(){
				$('.menu_container').children('a').eq(6).children().children('.icon').addClass('selected_menu');
			});
		});
</script>
<script>
	
	function checkAll(){
		var chk_all = document.getElementById("chk_all");
		var input = document.getElementsByTagName("input");
		
		if(chk_all.checked === true){
			for(var i=0; i<input.length; i++){
				if(input[i].type == "checkbox" && input[i].id =="chk_one"&&input[i].checked==false){
					input[i].checked=true;
				}
			}
		}
		if(chk_all.checked === false){
			for(var i=0; i<input.length; i++){
				if(input[i].type == "checkbox" && input[i].id =="chk_one"&&input[i].checked==true){
					input[i].checked=false;
				}
			}
		}
	}

	
	function deleteGoods(form){
		if($("input[type=checkbox][name=chk_one]:checked").length==0){
			alert("삭제할 목록이 없습니다.");
			return;
		}else{
			form.submit();
		}
	}


</script>



</head>
<body>
	<header id="header"></header>

	<nav id="nav_bar"></nav>

	<div class="login_bg" id="login_box"></div>

	<section id="container">
		<br>
		<div id="main">
			  <article class="arti_menu" id="mypage_menu"></article>

			<center>
				<div id="liked_goods_cover">
					<center>
						<div id="liked_goods_cover2">
							<div class="liked_goods_announce">
								<p>
									- 관심 상품이 판매되면 목록에서 자동으로 삭제됩니다.<br /> - 각 상품별로 주문 가능하며, 묶음배송 외
									택배비는 각각 부담됩니다.
								</p>
							</div>
							<br />
							
							<form name = "deleteForm" action="./deleteCheckedGoods.do" >
								<table id="liked_goodslist" border="1">
									<thead>
										<tr class="liked_goods_top_tr">
											<td class="liked_goods_top_td"><input type="checkbox"
												id="chk_all" onclick = "checkAll();"></td>
											<td class="liked_goods_top_td img_td">이미지</td>
											<td class="liked_goods_top_td">상품명</td>
											<td class="liked_goods_top_td">상품구매금액</td>
											<td class="liked_goods_top_td">등급</td>
											<td class="liked_goods_top_td liked_goods_btn_td">선택</td>
										</tr>
									</thead>
									<%if (productList != null) {
										for(int i = 0; i<productList.size(); i++){
											HashMap<String,Object>  productHM = new HashMap <String, Object>();	
											productHM = (HashMap<String,Object>)productList.get(i);
											String img_name = (String)productHM.get("pb_main_img_stored");
											String product_name = (String)productHM.get("pb_md_name");
											int product_price_nonshaped = Integer.parseInt((productHM.get("sale_price")).toString());
											DecimalFormat df = new DecimalFormat("###,###");
											String product_price_shaped = df.format(product_price_nonshaped);
											String product_grade = (String)productHM.get("quality_grade");
											String entity_number = (String)productHM.get("entity_number");
									
									%>
									<tbody>
										<tr>
											<td>
												<input type="checkbox" class="chk" value = "<%=entity_number%>" id = "chk_one" name = "chk_one" ></td>
											<td class="liked_goods_img_td">
												<img src="/Goodluxe/image/<%=img_name %>" alt="샤넬 장지갑" width="150px">
											</td>
											<td><%= product_name %></td>
											<td><%= product_price_shaped %> 원</td>
											<td><%= product_grade %></td>
											<td class="liked_goods_btn_td">
												<input type="button" class="liked_goods_btn" value="주문" onClick = "location.href='orderForm.do?entity_number=<%=entity_number%>'"><br /> 
												<input type="button" class="liked_goods_btn" value="삭제" id = "delete" onClick = "location.href='deleteLikedGoods.do?entity_number=<%=entity_number%>'"></td><!-- onClick = "location.href=''" -->
										</tr>
									
									<%
										} } else { 
									%> 
										<tr>
											<td class="null_td" colspan="6">
											관심 상품이 없습니다.
											</td>
										</tr>
									 
									<% 
									}
									%>
									</tbody>
								</table>
								<div class="liked_goods_btnpart">
									<input type="button"
										class="liked_goods_btn liked_goods_deletebtn" value="선택 상품 삭제" onclick = "deleteGoods(this.form);">
								</div>
							</form>
							
							<!-- 페이징 부분 -->
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
                                <li><a href="myLikedGoods.do?pageNum=1&pageCount=<%=pageCount%>" class="page_fisrt">처음 페이지</a></li>
                                <li><a href="myLikedGoods.do?pageNum=<%=startPage-5%>&pageCount=<%=pageCount%>" class="arrow left">&lt;&lt;</a></li>
							<% 	
								for(i = startPage; (i<=startPage+4)&&(i<=pageCount);i++){
							%>
                                <li><a href="myLikedGoods.do?pageNum=<%=i%>&pageCount=<%=pageCount%>"
                                	<% if(i==currentPage){
                                	%> 
                                			class = "active num"
                                	<%}else{%>
                                			class="num"
                                	<%}%> ><%= i%></a></li>
								<%
									}
								%>  
                                <li><a href="myLikedGoods.do?pageNum=<%=startPage+5%>&pageCount=<%=pageCount%>" class="arrow right">&gt;&gt;</a></li>
                                <li><a href="myLikedGoods.do?pageNum=<%=pageCount%>&pageCount=<%=pageCount%>" class="page_last">끝 페이지</a></li>
						<%
							}
						%>
                            </ul>
                        </div>
                     </center>
				</article>
						</div>
					</center>
				</div>
			</center>
		</div>
	</section>

	<footer id="footer"></footer>
</body>
</html>