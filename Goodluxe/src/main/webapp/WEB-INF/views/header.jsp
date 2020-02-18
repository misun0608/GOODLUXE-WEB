<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String mem_id = (String) session.getAttribute("member_id");
	System.out.println("member_id session = "+ mem_id);
	String mem_class = (String) session.getAttribute("member_class");
	String mem_isadmin = (String) session.getAttribute("member_isadmin");
%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/header.js"></script>



<script>
	var alarm_number;
	function connect(){
		w = new WebSocket("ws://localhost:8080/goodluxe/broadcasting2.do");

		w.onopen = function(){
		}
		w.onmessage = function(e){       
			alarm_number = e.data.toString();
			console.log("알람 수신");
			alarm_arrived();
		}
		w.onclose = function(e){
		}
		w.onerror = function(e){ 
		}
	}
	window.onload = function(){
		<%
		if(session.getAttribute("member_id") !=null){
		%>
			connect();
		<%
			}
		%>
			
	}
	
</script>
<script>
	//알람 반짝이 보여주기
	function alarm_arrived(){
		$('#alarm_spot').show();
	}
	
	//알람 반짝이 끄기
	function alarm_off(){
		$('#alarm_spot').hide();
	}
	
	
	$(document).ready(function(){
		var count = 1;
		
		function login_alarm_check(){
			if(mem_id != null && mem_isadmin =="N"){
				jQuery.ajax({
					url : '/goodluxe/afterLoginCheckAlarm.do',
	                type : 'POST',
	                dataType : "json",
	                contentType : 'application/x-www-form-urlencoded; charset=UTF-8', //https://thiago6.tistory.com/11 참고 
	            	success: function (data) {
	            		if(data.result=="notzero"){
	            		}
	            		else if(data.result=="iszero"){
	            		}
	                },
	                error:function() {
	                   alert("insert ajax통신 실패!!!");
	                }
	             });
	           
			}
		}
		//login_alarm_check();
		
		//알람 클릭시 
		$('#notice_btn').click(function(event){
			alarm_off();
			var count = 1;
			$('#alarm_box').empty();//얘는 좀더 고려를 해보도록 하자
			jQuery.ajax({
				url:'/goodluxe/getAlarmContent.do',
				type:'POST',
				dataType : "json",
				contentType:'application/x-www-form-urlencoded; charset=UTF-8',
				success: function(data){
					var alarm_box = '';
					$.each(data, function(index, item){
						if(item.alarm_number == "isNULL"){
							alarm_box += '<li>';
							alarm_box += '아직 알람을 받지 않으셨군요. 관심가는 상품에 좋아요를 눌러보세요 :D';
							alarm_box += '</li>';
							//어떻게 하지......ㅠㅠ
						}else{
							alarm_box += '<li>';
							alarm_box += ' <a href="preChgReadStatus.do?entity_number='+item.entity_number;
								if(item.alarm_read == 'N'){	alarm_box += '&alarm_read=N&alarm_number='+item.alarm_number+'" class="notice_list on" >';}
								else if(item.alarm_read == 'Y'){ alarm_box += '&alarm_read=Y&alarm_number='+item.alarm_number+'" class="notice_list">'; }
							alarm_box += item.alarm_content;
							alarm_box += '</a>';
							alarm_box += '</li>';
						}
						console.log("alarm_box:" + alarm_box);
						//$('#alarm_box').append(alarm_box);
					});
					alarm_box += '<ul id = "hidden_alarm_box" class = "hidden_alarm_box"></ul>'
					alarm_box += '<li><a href="getMoreAlarmContent.do" class="notice_more notice_list" id = "more_alarm" > <p id = "more_view">지난 알림 더보기</p></a>';
					alarm_box +='<a><p id = "stop_view" style = "display:none;">더 이상 알람이 없습니다.</p></a></li>';
					$('#alarm_box').append(alarm_box);
				},
				error:function(){
					alert("리스트 ajax통신 실패!!!");
				}
			});
		});
		
		
		$(document).on('click','#more_alarm',function(event) { //얘가 바로 동적 버튼!!!
			count++;
			var fivecontent = 0;
			params = {count:count};
			jQuery.ajax({
				url : '/goodluxe/getMoreAlarmContent.do',
				data : params,
                type : 'POST',
                dataType : "json",
                contentType : 'application/x-www-form-urlencoded; charset=UTF-8', //https://thiago6.tistory.com/11 참고 
            	success: function (data) {
            		$.each(data, function(index, item){
            			fivecontent++;
            			var hidden_alarm_box = '';
						if(item.alarm_number == "isNULL"){
							
							$('#more_alarm').hide();
						}else{
							hidden_alarm_box += '<li>';
							hidden_alarm_box += ' <a href="preChgReadStatus.do?entity_number='+item.entity_number+'"';
								if(item.alarm_read == 'N'){ hidden_alarm_box +=  '&alarm_read=N&alarm_number='+item.alarm_number+'" class="notice_list on" id = "chg_read_Status">';}
								else if(item.alarm_read == 'Y'){ hidden_alarm_box += '&alarm_read=Y&alarm_number='+item.alarm_number+'" class="notice_list">'; }
							hidden_alarm_box += item.alarm_content;
							hidden_alarm_box += '</a>';
							hidden_alarm_box += '</li>';
						}
						console.log("hidden_alarm_box:" + hidden_alarm_box);
						$('#hidden_alarm_box').append(hidden_alarm_box);
					});
            		if(fivecontent!=5){
						$('#stop_view').show();
						$('#more_view').hide();
					}
                },
                error:function() {
                   alert("insert ajax통신 실패!!!");
                }
             });
             // 기본 이벤트 제거
             event.preventDefault();
          });
		

		//$(document).on('click','#chg_read_Status',function(event) {
			
		//});
		
	});
	
</script>


<div class="header">
    <div class="header_bg">
        <div class="header_area">
			<%
				if (mem_id == null) {
			%>
            <ul class="topmenu nonmember_menu on">
                <li class="cs"><a href="SC.do">고객센터</a></li>
                <li class="singin"><a href="joinform.do">회원가입</a></li>
                <li class="login">
                    <a href="#">로그인</a>
                </li>
            </ul>
			<%
				} else {
					if (mem_isadmin.equals("Y")) {
			%>
            <ul class="topmenu member_menu on">
            	<li class="cs"><a href="SC.do">고객센터</a></li>
            	<li class="logout"><a href="logout.do">로그아웃</a></li>
                <li class="admin_page_link"><a href="admin_main.do">관리자페이지</a></li>
            </ul>
			<%
					} else if (mem_class.equals("Y") || mem_class.equals("B") || mem_id != null) {
			%>
            <ul class="topmenu member_menu on">
                <li class="cs"><a href="SC.do">고객센터</a></li>
                <li class="logout"><a href="logout.do">로그아웃</a></li>
                <li class="mypage"><a href="mypageOAS.do?member_id=<%=mem_id%>">마이페이지</a></li>
                <li class="notice">
                    <img src="${pageContext.request.contextPath}/resources/img/icons/notice.png" id = "alarm_spot" style = "display:none">
                    <a href="#" class='notice_btn' id = "notice_btn">알림</a>
                    <ul class="notice_content" id = "alarm_box">
                        
                    </ul>
                </li>
            </ul>
			<%
				}
				}
			%>
            <div class="m_menu_icon">
                <!-- <img src="${pageContext.request.contextPath}/resources/img/icons/list-menu_gold.png" alt="mobile_menu"> -->
                <img src="${pageContext.request.contextPath}/resources/img/icons/list-menu_white.png" alt="mobile_menu">
            </div>
            <div class="logo"><a href="./mainPage.do">GOODLUXE</a></div>
        </div>
    </div>
</div>
