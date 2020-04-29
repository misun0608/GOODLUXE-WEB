<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.Timestamp,com.spring.goodluxe.voes.*" %>

<%
	ArrayList<InquireVO> qbList = (ArrayList<InquireVO>) request.getAttribute("qbList");
	String member_id = (String)session.getAttribute("member_id");
	String member_isadmin = (String)session.getAttribute("member_isadmin");

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
		
		$(".scmt").load("scMenu.do", function(){
			$('.scmt').children('a').eq(1).addClass('current');
		});
		
	});
</script>

<!-- sc_qboard -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/service_center.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pagination.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pagination.js"></script>
<script>
	$(document).ready(function(){
		$('.qb_title').on('click',function(e){
			if($(this).attr('qb_public') == "private") {
				var w_id = $(this).attr('writer_id');
				var m_id = "<%=member_id%>";
	
				if(w_id != m_id && "<%=member_isadmin%>" != "Y") {
					alert('비밀글입니다.');
					e.preventDefault();
				}
			}
		});
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

                    <div id="center_tab-2" class="center_tab-content current">
                    	<table style="width: 100%">
						    <tr style="width: 100%;">
						        <td>
						            <div>
						                <select name="" id="service_center_board_search" style="height: 27px;margin: 0px 0 9px 0;">
						                    <option value="#search_title">제목</option>
						                    <option value="#search_content">내용</option>
						                    <option value="#search_id">아이디</option>
						                </select>
						                <form action="" id="service_board_search_form" style="display:inline-block">
						                    <input type="text" placeholder="게시판 내 검색" style="height: 21px;">
						                    <button class="center_search_btn"
						                        style="width: 50px; height: 26px;">검색</button>
						                </form>
						            </div>
						        </td>
						        <td style="float: right;">
						            <a href="scWrite.do"><button class="center_search_btn"
						                    style="width: 65px; height: 27px; margin-top: 2px;">글 작성</button></a>
						        </td>
						    </tr>
						</table>
						<table class="service_center_table">
						    <tr class="service_center_top_tr">
						        <td style="width: 110px;">번호</td>
						        <td>제목</td>
						        <td>작성자</td>
						        <td style="width: 190px;">게시일</td>
						    </tr>
						    <% 
						    	if(qbList == null || qbList.size() == 0) {
						    %>
						    <tr class="service_center_middle_tr">
						    	<td colspan="4" style="padding:50px;">게시글이 존재하지 않습니다.</td>
						    </tr>
						    <% } else { 
						    		for(int i = 0; i < qbList.size(); i++) {
						    			InquireVO inVO = qbList.get(i);
						    			String write_date = inVO.getInquire_date().toString();
						    			write_date = write_date.split(" ")[0];
						    %>
						    <tr class="service_center_middle_tr">
						        <td><%= number %></td>
						        <td>
							         	<a href="scQBoardDetail.do?inquire_number=<%=inVO.getInquire_number()%>" class="qb_title" writer_id="<%=inVO.getMember_id()%>" qb_public="<%=inVO.getInquire_public()%>">
						        		<% if(inVO.getInquire_public().equals("private")) { %>
						        		<img src="${pageContext.request.contextPath}/resources/img/icons/lock.png" alt="[비밀글]" style="width:10px; vertical-align: middle;">
						        		<% } %>
						        		<%=inVO.getInquire_title() %>
						        		&nbsp;&nbsp;
						        		[<%=inVO.getInquire_comment() %>]
						        	</a>
						        </td>
						        <td><%=inVO.getMember_id() %></td>
						        <td><%=write_date %></td>
						    </tr>
						    <%		number-- ;}	
						    	} %>
						</table>
						<br>
						<article class="sc_pagination">
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
	                                <li><a href="scQBoard.do?pageNum=1&pageCount=<%=pageCount%>%>" class="page_fisrt">처음 페이지</a></li>
	                                <li><a href="scQBoard.do?pageNum=<%=startPage-5%>&pageCount=<%=pageCount%>%>" class="arrow left">&lt;&lt;</a></li>
								<% 	
									for(i = startPage; (i<=startPage+4)&&(i<=pageCount);i++){
								%>
	                                <li><a href="scQBoard.do?pageNum=<%=i%>&pageCount=<%=pageCount%>"
	                                	<% if(i==currentPage){ %> 
	                                			class = "active num"
	                                	<%}else{%>
	                                			class="num"
	                                	<%}%> ><%= i%></a></li>
									<%
										}
									%>  
	                                <li><a href="scQBoard.do?pageNum=<%=startPage+5%>&pageCount=<%=pageCount%>" class="arrow right">&gt;&gt;</a></li>
	                                <li><a href="scQBoard.do?pageNum=<%=pageCount%>&pageCount=<%=pageCount%>" class="page_last">끝 페이지</a></li>
							<%
								}
							%>
	                            </ul>
	                        	<br/><br/><br/>
	                        </div>
	                     </center>
					</article>
                    </div>
                    <br/><br/><br/>
                </div>
            </section>
        </div>
    </section>

	<footer id="footer"></footer>
</body>

</html>