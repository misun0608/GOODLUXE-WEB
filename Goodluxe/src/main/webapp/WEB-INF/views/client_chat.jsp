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
String user = request.getParameter("member_id");


ArrayList<ChatMemberVO> chatlist = (ArrayList<ChatMemberVO>) request.getAttribute("chatlist");
ChatMemberVO chatmembervo = new ChatMemberVO();

long sessionstarttime = session.getCreationTime();
long sessionendtime = session.getLastAccessedTime();
long time = (sessionendtime - sessionstarttime) / 1000;
if (time < 0)
	time = 0;

if (member_isadmin.equals("Y")) {
	session.setMaxInactiveInterval(-1);

}


	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket</title>
	<script type="text/javascript" src="//code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	alert('<%=member_isadmin%>');
	
	var ws;
	var userid = '<%=member_id%>'; //파라미터로 넘겨서 설정할 (내) 아이디
	var user = '<%=user%>' ; // 관리자도 방을 분리시킬 
	function connect() {
		//웹소켓 객체 생성하는 부분
		//핸들러 등록(연결 생성, 메시지 수신, 연결 종료)

		//url 연결할 서버의 경로
		ws = new WebSocket('ws://localhost:8000/goodluxe/broadcasting.do');	

		ws.onopen = function() {
			console.log('연결 생성');
			register();
		};
		ws.onmessage = function(e) {
			console.log('메시지 받음');
			var data = e.data;
			//alert("받은 메시지 : " + data);
			addMsg(data);
		};
		ws.onclose = function() {
			console.log('연결 끊김');
		};
	}

	function addMsg(msg) { //원래 채팅 메시지에 방금 받은 메시지 더해서 설정하기
		var chat = $('#msgArea').val();
		chat = chat + "\n <%=user %> : " + msg;
		$('#msgArea').val(chat);
	}

	function register() { //메시지 수신을 위한 서버에 id 등록하기
		var msg = {
			type : "register", //메시지 구분하는 구분자 - 상대방 아이디와 메시지 포함해서 보냄
			userid : '<%=member_id %>'
		};
		ws.send(JSON.stringify(msg));
	}

	function sendMsg() {
		//var msg = $("#chatMsg").val();
		//ws.send(userid + " : " + msg);
		var msg = {
			type : "chat", //메시지 구분하는 구분자 - 상대방 아이디와 메시지 포함해서 보냄
			target : $("#targetUser").val(),
			message : $("#chatMsg").val()
		};
		ws.send(JSON.stringify(msg));
	};

	//페이지가 로딩되면 connect 실행
	$(function() {
		connect();
		$('#btnSend').on("click", function() {
			var chat =  $("#msgArea").val();
			chat = chat + "\n <%=member_id %> : " + $("#chatMsg").val();
			$("#msgArea").val(chat);
			sendMsg();
			$("#chatMsg").val("");
		})
	});
</script>


<%-- <script type="text/javascript">

	/* $(function() {
		$.getJSON("https://api.ipify.org?format=jsonp&callback=?",
			function(json) {
				var myip = json.ip;
				alert(myip);
			}
		);
	}); */


		var log = function(s) {
			document.getElementById("output").textContent += (s + "\n");
		}
		
		// http 에서 ws 로 프로토콜 변환이 발생한다.
		// 이 변환 작업을 수행하기 위해 handshake interceptor가 필요
		// w = new WebSocket("ws://localhost:8080/springwebsocket/broadcasting");
		w = new WebSocket("ws://localhost:8000/goodluxe/broadcasting.do");
		var userid = '<%=member_id %>';
		/* if(id = 'admin'){
			w = new WebSocket("ws://localhost:8000/goodluxe/broadcasting.do");
		}else{
			w= new WebSocket("ws://"+myip+":8000/goodluxe/broadcasting.do")
		} */
		
		// 직접 호출X, 관련 이벤트가 발생하면 메소드 자동 호출
		w.onopen = function(){
			alert("WebSocket Connected!!!");
			register();
		}
		w.onmessage = function(e) {
			var data = e.data;
			log(e.data.toString());
			addMsg(data);
			// e : 이벤트 객체
		}
		w.onclose = function(e) {
			log("WebSocket closed!!!"+e.getmessage);
		}
		w.onerror = function(e) {
			log("WebSocket error!!!"+e.getmessage);
		}
		
		
		window.onload = function(){
			document.getElementById("send_button").onclick = function(){
				var input = document.getElementById("input").value;
				w.send("<%=member_id%>" + ">" + input);
				document.getElementById("input").value = "";
			}
		}
	</script> --%>
</head>
<body>
<p>(<%=time%> sec.)</p>
	<textarea rows="5" cols="30" id="msgArea">
	</textarea> //채팅 내용 올라갈 화면
	<br> 메시지 : <input type="text" id="chatMsg"> //메시지 보내는 부분
	<% if(member_isadmin.equals("N")){ %>
	<br> 상대 아이디 : <input type="hidden" id="targetUser" value="admin"> // 채팅 상대 아이디 작성 부분
	<% } else{%> 
	<br> 상대 아이디 : <input type="hidden" id="targetUser" value="<%=user %>">
  <%} %> // 채팅 상대 아이디 작성 부분
	<br>
	<input type="button" value="전송" id="btnSend">
</body>
</html>