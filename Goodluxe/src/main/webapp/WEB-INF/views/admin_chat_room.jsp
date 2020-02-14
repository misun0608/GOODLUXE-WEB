<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="com.spring.goodluxe.voes.ChatVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("member_isadmin")=="N") {
		out.println("<script>");
		out.println("location.href='loginForm.do'");
		out.println("</script>");
	}	
	
	
	
	String member_id = (String)session.getAttribute("member_id");
	String member_name = (String)session.getAttribute("member_name");
	ArrayList<ChatVO> chatlist = (ArrayList)request.getAttribute("chatlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<table border="1" align="center">
			<tr>
				<td align="center">순번</td>
				<td align="center">회원 아이디</td>
				<td align="center">마지막 시간의 메시지</td>
				<td align="center">입장버튼</td>
			</tr>
			<%for(int i=0; i<chatlist.size(); i++){ %>
			<tr>
				<%-- <td align="center"><%=i+1 %></td>
				<td align="center"><%=chatlist.get(i).getMember_id()%></td>
				<td align="center"><%=chatlist.get(i).getMessage_time()%><br /><%=chatlist.get(i).getMember_message() %></td>
				<td align="center"><a href="client_chat.do?<%=chatlist.get(i).getMember_id() %>" ><button type="button" Style="font-size:125%; width:100%; height:50px;">입장</button></a></td> --%>
				<td align="center"><a href="client_chat.do?member_id=skyjaejin" ><button type="button" Style="font-size:125%; width:100%; height:50px;">입장</button></a></td> 
				<td align="center"><a href="chat.do" ><button type="button" Style="font-size:125%; width:100%; height:50px;">입장</button></a></td> 
			</tr>
				<%} %>
				
		</table>
	</form>
</body>
<%-- 
<!-- 세팅 부분 init -->
<input type="hidden" id="userId" value="${login.id}">  <!-- 유저아이디  -->
<input type="hidden" id="room" value="${room}"> <!-- 현재 유저가 접속한 방이름 -->

<!-- 방 이름 / 방 만들기 / 방 나가기  --> 
<table style="width: 900px; background-image:url('image/chatBackGround.jpg');">

<tr>
	<td align="center" style="width: 600px; color: white">
		<!-- 방이름 출력 -->
		<h2>방이름 :
		<c:if test="${room =='all'}"><b> 전체 채팅방 </b></c:if> <c:if test="${room !='all'}"><b> ${room} </b></c:if>
		</h2> 
	</td> 
	
	<td align="center" style="width: 300px">
		<!-- 방만들기 / 방나가기 버튼 -->
			
			<input type="button" class="ui button " value="방 만들기" id="createRoom">
			&nbsp;&nbsp;     
			<input type="button" class="ui button " value="전체 채팅방으로 이동" id="backBtn">
	</td> 
</tr>
</table>
<!-- 채팅방 구현하기위한 테이블 -->
<table align="center" style="height: 600px; width: 900px; margin: 0; padding: 0;" class="ui blue table"> 
<!-- 왼쪽 채팅창 출력 -->
<col width="200px"> <!-- 귓속말 영역 -->
<col width="400px"> <!-- 메세지 입력 영역 -->
<!-- 오른쪽 리스트 출력영역 -->
<col width="300px"> <!-- 보내기 영역 -->

<tr height="600px;">
    <!-- 채팅내용 출력 --> 
	<td style="width: 550px" colspan="2"> 
	
		<div style="width: 100%; height: 550px; overflow-y:scroll; overflow-x:inherit;" class="ui message" id="output">
		</div>  
	</td > 
	<!-- 채팅방 목록 -->  
	<td style="width: 300px">
   	<!-- 채팅방 -->
   	<form action="MoveChatRoom.do" method="post" id="moveChatForm">
   	<input type="hidden" name="roomName" value="">
   	
   	<div class="ui message blue" style="width: 300px; height: 100px; overflow-y:scroll; overflow-x:inherit;" id="room">
		<!-- 전체 채팅방 -->
		<div class="ui celled list" id="getRoomList">
			<div class="item">
				<div class="content">
				<b title="전체채팅방입니다">전체 채팅방</b>  
				</div>
			</div> 
		</div>
	</div> 				   			
	</form> 	 
		<input type="text" class="ui input blue"  style="width: 200px; height: 32px" placeholder="방 제목" id="searchRoomText">   
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="검색" class="ui primary button" style="width: 80px; height: 30px" id="searchRoomBtn">		
	  
   	<!-- 방만들기 form이용 --> 
    
	<form action="createChatRoom.do" method="post" id="createForm">
   		<!-- hidden 정보  -->
   		<input type="hidden" id="chkRoomName" value=""> <!-- 방 제목 중복 확인 여부 -->
   		
   	<!-- 방 만들기 버튼 클릭 시, 보여짐 -->
   	<div style="width:300px; height: 500px; display: none;" class="ui message" id="showCreateRoom"> 
		
		<!-- 방만들기 테이블 -->
    	<table style="width: 100%;height: 100%">
      	<col width="80px">
      	<!-- 방제목 -->
      	<tr style="padding: 1px; margin: 1px">  
         	<th>방제목</th>
         	<td> 
         		<input type="text" name="name" placeholder="방이름" size="8" class="ui message"
         		style="font-weight: bold; width: 100%; height: 15px"> 
         	</td>
      	</tr>
      	
      	<!-- 비밀번호 -->
      	<tr>
         	<th>비밀번호</th>
         	<td>
         		<input type="text" name="pwd" placeholder="방 비밀번호" size="8" class="ui message"
         		style=" font-weight: bold; width: 100%; height: 15px" title="작성하지않을시 공개방으로 생성됩니다">
         	</td>
      	</tr>
      	
      	<!-- 참여 인원 -->
      	<tr>
         	<th>참여인원</th>
         	<td>
         		<a href="#none"><img src="image/paging/arrow_back.gif" onclick="count_back()" width="13px" title="1명 감소"></a>
         		
           		<input type="text" name="totalcount" value="4" size="2" readonly="readonly" 
           		id="count" class="ui message" style="height: 15px; font-weight: bold;">
           		 
           		<a href="#none"><img src="image/paging/arrow_next.gif" onclick="count_next()" width="13px" title="1명 증가"></a>
           
         	</td>
      	</tr>
      	<!-- 내용 입력 -->
      	<tr>
         	<th>내용</th>
         	<td>
         		<input type="text" name="content" placeholder="내용" class="ui message"
         		style="font-weight: bold; width: 100%; height: 15px"> 
         	</td>	
      	</tr>
      	<!-- 버튼 처리 -->
      	<tr>
         	<td colspan="2">
            	<input type="button" id="submitBtn" value="방만들기" class="ui primary button">         
            	<input type="button" id="backBtn" value="돌아가기" class="ui button">
         	</td>
      	</tr>
      	</table>
    	  
   	</div>
   	</form>
   
   	<!-- 채팅 참여자 출력 -->
   	<div style="width: 100%; height: 400px; overflow-y:scroll;" class="ui message" id="listPeople">
   	</div>
	</td>
</tr>
<!-- 입력 창 -->
<tr height="100px;">
	<!-- 귓속말할 대상의 아이디 입력 -->
   	<td>
   		<input type="text" id="wisper"   value="" style="width: 100%; height: 100%; font-weight: bold;" 
   		class="ui message" name="who" placeholder="귓속말">
   	</td>
   	
   	<!-- 보낼 메세지 입력 -->
   	<td>
   		<input type="text" id="textID" size="50"  value="" style="width: 100%; height: 100%; font-weight: bold;" 
   		class="ui message blue" name="chatInput" placeholder="내용 입력">
   	</td>
   	
   	<!-- 보내기 버튼 -->
   	<td>
   		<input type="button" value="보내기"  
   		id="buttonMessage" style="width:100%; height: 100%" class="ui primary button" >
   	</td>
</tr>
</table>
</html> --%>