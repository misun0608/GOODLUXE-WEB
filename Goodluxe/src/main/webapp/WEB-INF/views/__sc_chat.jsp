<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="center_chat_img">
    <img src="${pageContext.request.contextPath}/resources/img/icons/chat_available.png" style="width: 100px; height: 100px;">
</div>
<div class="center_chat_content">
    1:1 채팅 상담 가능 시간은<br/><span style="font-weight: 600;">평일 AM 10:00 ~ PM 6:00</span> 입니다.<br/>
    ><button onclick="popup()" class="center_chat_btn">1:1 상담 시작</button>
    <script type="text/javascript">
	
									function popup(){
 
									var url = "chat.do";
 
									var name = "chat";
 
									window.open(url,name,"width=1000,heightght=1000,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50");
 
									}
									</script>
</div>