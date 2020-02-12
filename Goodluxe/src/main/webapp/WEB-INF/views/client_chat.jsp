<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("member_id")==null) {
		out.println("<script>");
		out.println("location.href='loginForm.do'");
		out.println("</script>");
	}
	String member_id = (String)session.getAttribute("member_id");
	String member_name = (String)session.getAttribute("member_name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket</title>
	<script type="text/javascript" src="//code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">

	$(function() {
		$.getJSON("https://api.ipify.org?format=jsonp&callback=?",
			function(json) {
				var myip = json.ip;
				alert(myip);
			}
		);
	});


		var log = function(s) {
			document.getElementById("output").textContent += (s + "\n");
		}
		
		// http 에서 ws 로 프로토콜 변환이 발생한다.
		// 이 변환 작업을 수행하기 위해 handshake interceptor가 필요
		// w = new WebSocket("ws://localhost:8080/springwebsocket/broadcasting");
		
		var id = '<%=member_id %>';
		if(id = 'admin'){
		w = new WebSocket("ws://localhost:8000/goodluxe/broadcasting.do");
		}else{
			w= new WebSocket("ws://"+myip+":8000/goodluxe/broadcasting.do")
		}
		
		// 직접 호출X, 관련 이벤트가 발생하면 메소드 자동 호출
		w.onopen = function(){
			alert("WebSocket Connected!!!");
		}
		w.onmessage = function(e) {
			log(e.data.toString());
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
	</script>
</head>
<body>
	<input type="text" id="input" placeholder="input message..." size="55">
	<button id="send_button">Send</button>
	대화명 : <%=member_id %>
	<p/>
	<textarea id="output" readonly rows="30" cols="80"></textarea>
</body>
</html>