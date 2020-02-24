<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <!--
        viewport meta 태그
        * user-scalable=no : 화면확대, 축소 불가능
        * width=device-width : 화면 너비=장치 너비
        * initial-scale=1.0 : 초기 확대 비율
    -->
    <meta name="viewport" content="user-scalable=no,width=device-width, initial-scale=1.0" />
    <title> 기본 페이지 </title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/chat_view_customer.css" />
	<script type="text/javascript" src="./resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="./resources/js/jquery.easing.1.3.js"></script> 

</head>
<body class="">
   <!--<section class = "unavailable">
        <div class = "screen_size  screen_size_unavailable">
            <img src="img/icons/chat_available.png">
            <br/>
            <div class = "chat_info_letters">
                <p class = "chat_sorry">죄송합니다.</p>
                <p class = "chat_nottime">지금은 상담가능 시간이 아닙니다.</p>
                <p class = "chat_chatting_service">1:1 채팅 상담은</p>
                <p class = "chat_dateandtime">월-금 10:00AM~06:00PM</p>
                <p class = "chat_available">에 가능합니다.</p>
            </div>    
        </div>
    </section>
 -->
      <section class = "available">
        <div class = "screen_size screen_size_available">
            <div class = "chatting_header">
                <p class = "is_ing">●상담종료</p>
                <p class = "is_ing">상담중</p><p class = "dot">●</p>
                <p class = "chatting_title"> 
                    GOODLUXE 고객센터<br/>
                    
                </p>
            </div>
            
            <div class = "chatting_content">
                <!--채팅패턴1시작-->
                <div class = "received_chats">
                    <div class = "received_chats_img">
                        <img src = "img/chat_user/chat_admin.png">
                    </div>
                    <div class = "received_chats_msg">
                        <p>안녕안녕 잘지내?안녕안녕 잘지내?안녕안녕 잘지내?안녕안녕 잘지내?안녕안녕 잘지내?안녕안녕 잘지내?안녕안녕 잘지내?</p>
                    </div>
                </div>
                <div class = "outgoing_chats">
                    <div class = "outgoing_chats_img">
                        <img src = "img/chat_user/chat_customer.png">
                    </div>
                    <div class = "outgoing_chats_msg">
                        <p>안녕안녕</p>
                    </div>
                </div> 
                <!--채팅패턴1끝-->
               
            
            </div>
           
            <div class = "send_chatting">
                <textarea class = "chat_write"></textarea>
                <a href = "#">
                    <div class = "send_btn">
                        <!-- <img src = "img/icons/paper_plane.png"> -->
                        <p class = "send_letter">전송</p>
                    </div>
                </a>
            </div>   
            <div class = "finish_chatting">
                <button>상담종료</button>
            </div>
        </div>
    </section>
    
</body>
</html>
