<%@page import="com.spring.goodluxe.voes.Chat_recordVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.util.*"%>
<%@page import="com.spring.goodluxe.voes.ChatMemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("member_id") == null) {
		out.println("<script>");
		out.println("location.href='loginForm.do'");
		out.println("</script>");
	}
	String member_id = (String) session.getAttribute("member_id");
	String member_name = (String) session.getAttribute("member_name");
	String member_isadmin = (String) session.getAttribute("member_isadmin");
	String user = (String) request.getAttribute("member_id");
	String chat_room = (String) request.getAttribute("chat_room");

	ArrayList<ChatMemberVO> chatlist = (ArrayList<ChatMemberVO>) request.getAttribute("chatlist");
	ChatMemberVO chatmembervo = new ChatMemberVO();
	ArrayList<Chat_recordVO> chatrecord = (ArrayList<Chat_recordVO>) request.getAttribute("chatrecord");

	long sessionstarttime = session.getCreationTime();
	long sessionendtime = session.getLastAccessedTime();
	long time = (sessionendtime - sessionstarttime) / 1000;
	if (time < 0)
		time = 0;

	if (member_isadmin.equals("Y")) {
		session.setMaxInactiveInterval(-1);
	}
%>
<script type="text/javascript" src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
var sock = null;
var id = '${member_id}';
var member_isadmin = '${member_isadmin}';
var chat_room = '${chat_room}';
$(document).ready(function() {
   $("#textID").focus(); // 처음 접속시, 메세지 입력창에 focus 시킴
   
   
   //서버로 접속할때는 localhost로 설정해줘야됨 (관리자)
   // 본인의 서버로 접속할경우, admin으로 들어가야만 채팅이 가능하다.
   if(member_isadmin=='Y'){
      ws = new WebSocket("ws://localhost:8080/goodluxe/broadcasting.do");
   }
   
   // 그 외 회원은 admin을 제외한 다른 아이디로 접속 시, 채팅참여가 가능하다.
   else{
      ws = new WebSocket("ws://localhost:8080/goodluxe/broadcasting.do");   
   }
   
   
   //서버로 메세지 보낼때
   ws.onopen = function() {
	//처음 접속 시에만 채팅방에 추가함(현재 방정보도 같이 출력)	   
      	$("#output").append("<b>채팅방에 참여했습니다.</b> : "+"<br>");
      	var chat_room = $("#room").val();
		
	<%-- 	var list = new list();
			list.add(<%=chatrecord %>);
			
		for(var i=0; i < list.size(); i++){
			$("#output").append("<b style='color:blue'>["+list.get(i).member_id()+"]</b> : "+list.get(i).chat_message()+"<br>");
			
		} --%>
		/* 
      	$.ajax({//ajax 호출 JQuery.ajax== 
			url:'/goodluxe/chat_room.do', //수행하고자 하는 url 형식, port번호 다음부터 경로가 일치하도록 작성 (컨트롤러 참조)
			type:'GET',  //데이터 보낼 때 방식 사용
			data: {
				chat_room : chat_room
			}, //서버로 보낼 데이터 타입
			contentType: 'application/x-www-form-urlencoded;charset=utf-8',
			dataType: 'json', //결과 값을 받아올 때 (응답받을 때 ) 서버에서 보내줄 데이터 타입
			success : function(data){	

				var jsondata = JSON.stringify(data);
				
				
				$.each(data.chatlist, function(i,chatlist){
					$("#output").append("<b style='color:blue'>["+chatlist[i].member_id+"]</b> : "+chatlist[i].chat_message+"<br>");
				})
				
				alert(jsondata);
				},
				  error: function (request, status, error){  
				      var msg = "ERROR<br><br>"
				      msg += request.status + "<br>" + request.responseText + "<br>" + error;
				      console.log(msg);                    
				    }
				
		}); */
      	
		
      	//보내기 버튼 눌렀을때
      	$("#buttonMessage").click(function() {
         	var msg = $('input[name=chatInput]').val().trim("!%/"); //메시지
         
         	var room = $("#room").val().trim("!%/"); //방이름(전체단톡방이면 all)
         
         	//메시지 보낼때
         	if(msg !=""){
         		//소켓으로 메세지 전달
            	ws.send(msg+"!%/"+room);
            	$("#output").append("<i class='user icon'></i>"+"<b style='color:blue'>[${member_id}]</b> : "+msg+"<br>");
            
            	$("#output").scrollTop(99999999); //글 입력 시 무조건 하단으로 보냄
            	$("#textID").val(""); //입력창 내용지우기
            	$("#textID").focus(); //입력창 포커스 획득
         	}
         	//귓속말
         	else if(wisper !="" && msg !=""){
         		//본인에게 보낼경우
            	if($("#userId").val()==wisper){
               	alert("본인에게는 보낼 수 없습니다.");
               	$("#wisper").focus();
            	}
         	}
      	});
      	//엔터키 입력처리
      	$("#textID").keypress(function(event) {
         	if(event.which == "13"){
            	event.preventDefault();
            	
            	var msg = $('input[name=chatInput]').val().trim("!%/"); //메시지
                
             	var room = $("#room").val().trim("!%/"); //방이름
             
             	
             	//메시지 보낼때
             	if(msg !=""){
             		//소켓으로 메세지 전달
             		
                	ws.send(msg+"!%/"+room);
                	$("#output").append("<i class='user icon'></i>"+"<b style='color:blue'>[${member_id}]</b> : "+msg+"<br>");
                
                	$("#output").scrollTop(99999999); //글 입력 시 무조건 하단으로 보냄
                	$("#textID").val(""); //입력창 내용지우기
                	$("#textID").focus(); //입력창 포커스 획득
             	}
         	}
      	}); 
   	}
	//서버로 부터 받은 메세지 보내주기
   	ws.onmessage = function(message) {
		
    	//메세지 
      	var jsonData = JSON.parse(message.data);
    	
      	if(jsonData.message !=null){
        	$("#output").append(jsonData.message+"<br>");
        	$("#output").scrollTop(99999999);
      	}
      	
      	//접속자리스트
      	var jsonData2 = JSON.parse(message.data);
      	if(jsonData2.list !=null){
         	$("#listPeople").html(jsonData2.list);
      	}
      	
      	//방 정보
      	var jsonData3 = JSON.parse(message.data);
      	if(jsonData3.room !=null){
      		//alert(jsonData3.room);
			var roomSplit = jsonData3.room.split(',');
      		
			var str = "<div class='item'><div class='content'>"+
			"<b title='전체채팅방입니다' class= 'chatRoom' "+
			"onclick=\"moveRoom('all',0,10000,'null')\">"+
			"전체 채팅방</b> (총 "+roomSplit[0]+"명 참여)</div></div>";
			
			for( i=1; i<roomSplit.length; i++){
				var spl = roomSplit[i].split("/");
				
				if(spl[0] =='방이 존재하지 않습니다.'){
					str += "<div class='item'><div class='content'><b title='방이존재하지않습니다'>"+spl[0]+"</b></div></div>";
				}
				else{
					//방이름 : spl[0] , 남은인원수 : spl[1] , 전체인원수:spl[2], 방내용:spl[3]
					str += "<div class='item'><div class='content'><b title='"+spl[3]+"' class='chatRoom' "+
					"onclick=\"moveRoom('"+spl[0]+"','"+spl[1]+"','"+spl[2]+"','"+spl[4]+"')\"> "
					+spl[0]+"</b> ("+spl[1]+"/"+spl[2]+")</div></div>";
				}
			}
			$("#getRoomList").html(str);
      	}
	};   
   	//닫힐때
   	ws.onclose = function(event) {};
});
</script>


<!-- 방이동 처리함수 -->
<script type="text/javascript">

function moveRoom(room,remaincount,totalcount,pwd) {
   
	var currentRoom = $("#room").val(); //현재자신이있는방
	if(room == currentRoom){
	   //들어가고자하는방 = 현재자신의방
	   alert("현재 선택하신 방에 있습니다.");
	}
	//방 이동 처리
	else{
		if(remaincount<totalcount){
		      $("[name='roomName']").val(room);               
		      $("#moveChatForm").attr("target","_self").submit();   
		   }
		      
		}
		}
	   
	/* } */
/* }; */
</script>


<script>
//방나가기
$("#backBtn").click(function() {
	location.href = "chat.do";
});
</script>


<!-- 인원수 증가, 감소 버튼 클릭시, 실행되는 스크립트 -->
<script type="text/javascript">
function count_back() { 
    var count = $("#count").val();
    count = (Number(count)-1);
    if(count>=2){
       $("#count").val(count);
    }
};
function count_next() {
    var count = $("#count").val();
    count = (Number(count)+1);
    if($("#count").val()<3){
       $("#count").val(count);
    }
};
</script>


<!-- 접속자 명단에서 아이디 클릭 시 귓속말에 바로 세팅 -->
<script type="text/javascript">
function insertWisper(id) {
	if($("#userId").val() == id){
		alert("본인에게는 귓속말을 할 수 없습니다.");
	}
	else{
			$("#wisper").val(id);	
		}
}

</script>
<script type="text/javascript">
$("#wisper").click(function() {
	$("#wisper").val("");
});
</script>

<body>

	<!-- 세팅 부분 init -->
	<input type="hidden" id="userId" value="${member_id}">
	<!-- 유저아이디  -->
	<input type="hidden" id="room" value="${room}">
	<!-- 현재 유저가 접속한 방이름 -->

	<!-- 방 이름 / 방 만들기 / 방 나가기  -->
	<table
		style="width: 900px;">

		<tr>
			<td align="center" style="width: 600px; background-color:#b8e1d4;">
				<!-- 방이름 출력 -->
				<h2 >
					<!-- 방이름 :<b>${room}</b> -->
					<p>GOODLUXE 고객센터</p>
					<p>${room} 고객님</p>
				</h2>
			</td>

			<td align="center" style="width: 300px; " >
			</td>
		</tr>
	</table>
	<!-- 채팅방 구현하기위한 테이블 -->
	<table align="center"
		style="height: 600px; width: 900px; margin: 0; padding: 0;"
		class="ui blue table">
		<!-- 왼쪽 채팅창 출력 -->
		<col width="200px">
		<!-- 귓속말 영역 -->
		<col width="400px">
		<!-- 메세지 입력 영역 -->
		<!-- 오른쪽 리스트 출력영역 -->
		<col width="300px">
		<!-- 보내기 영역 -->

		<tr height="600px; ">
		
		
			<!-- 채팅내용 출력 -->
			<td style="width: 550px; background-color:#b8e1d4;" colspan="2">

				<div
					style="width: 100%; height: 550px; overflow-y: scroll; overflow-x: inherit;"
					class="ui message" id="output"></div>
			</td>
			<!-- 채팅방 목록 -->
			<td style="width: 300px; ">
				<!-- 채팅 참여자 출력 -->
				<div style="width: 100%; height: 400px; overflow-y: scroll;"
					class="ui message" id="">
					<table id="chatroomlist" border="1">

			<tr>
				<th>순서</th>
				<th>번호</th>
				<th>아이디</th>
				<th>방이름</th>
			</tr>


			<!-- <form action="MoveChatRoom.do" method="post" id="moveChatForm"> -->

			<%
				int i = 0;
				for (i = 0; i < chatlist.size(); i++) {
					ChatMemberVO vo = chatlist.get(i);
			%>

			<!-- 관리자 해당 회원 행 클릭 시 방 바꿔주자  -->
			<tr>
				<td><%=i + 1%></td>
				<td><%=vo.getChat_num()%></td>
				<td name="member_id"><%=vo.getMember_id()%>***</td>
				<td name="roomName"><%=vo.getChat_room()%></td>
				<td><a href="MoveChatRoom.do?roomName=<%=vo.getChat_room()%>"><button
							type="button">들어가기</button></a></td>
			</tr>
			<%
				}
			%>
		</table>
					</div>
			</td>
			</tr>
		<!-- 입력 창 -->
		<tr height="100px;">

			<!-- 보낼 메세지 입력 -->
			<td colspan="2"><input type="text" id="textID" size="50"
				value="" style="width: 100%; height: 100%; font-weight: bold;"
				class="ui message blue" name="chatInput" placeholder="내용 입력">
			</td>

			<!-- 보내기 버튼 -->
			<td><input type="button" value="보내기" id="buttonMessage"
				style="width: 100%; height: 100%" class="ui primary button">
			</td>
		</tr>
	</table>

	<div id="container">
		<script type="text/javascript">
	var chat_room = '${chat_room}';
	
  	$.ajax({//ajax 호출 JQuery.ajax== 
		url:'/goodluxe/chatroomlist.do', //수행하고자 하는 url 형식, port번호 다음부터 경로가 일치하도록 작성 (컨트롤러 참조)
		type:'GET',  //데이터 보낼 때 방식 사용
		data: {
			chat_room : chat_room
		}, //서버로 보낼 데이터 타입
		contentType: 'application/x-www-form-urlencoded;charset=utf-8',
		dataType: 'json', //결과 값을 받아올 때 (응답받을 때 ) 서버에서 보내줄 데이터 타입
		success : function(data){	

			var jsondata = JSON.stringify(data);
			
			
			$.each(data.chatlist, function(i,chatlist){
				$("#output").append("<b style='color:blue'>["+chatlist[i].member_id+"]</b> : "+chatlist[i].chat_message+"<br>");
			})
			
			//alert(jsondata);
			},
			  error: function (request, status, error){  
			      var msg = "ERROR<br><br>"
			      msg += request.status + "<br>" + request.responseText + "<br>" + error;
			      console.log(msg);                    
			    }
			
	});
	
	</script>
		
		<!-- 	</form> -->


	</div>
</body>
</html>




