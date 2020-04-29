<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.Timestamp,com.spring.goodluxe.*" %>
<%@page import="com.spring.goodluxe.voes.InquireVO"%>

<%
	ArrayList<InquireVO> qbList = (ArrayList<InquireVO>) request.getAttribute("qbList");
	String member_id = (String)session.getAttribute("member_id");
	String member_isadmin = (String)session.getAttribute("member_isadmin");
%>

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
        <td><%= i+1 %></td>
        <td>
	         	<a href="scQBoardDetail.do?inquire_number=<%=inVO.getInquire_number()%>" class="qb_title" writer_id="<%=inVO.getMember_id()%>" qb_public="<%=inVO.getInquire_public()%>">
        		<% if(inVO.getInquire_public().equals("private")) { %>
        		<img src="" alt="[비밀글]">
        		<% } %>
        		<%=inVO.getInquire_title() %>
        		&nbsp;&nbsp;
        		[<%=inVO.getInquire_comment() %>]
        	</a>
        </td>
        <td><%=inVO.getMember_id() %></td>
        <td><%=write_date %></td>
    </tr>
    <%		}	
    	} %>
</table>
<br>
<p style="text-align: center; margin-bottom: 2em;">◁ 1 ▷</p>