<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script>

<script>
	
	/* Click login button */
 	function onclick_login() {
		var params = $('#login_form').serialize(); // serialize로 문자열형태로? 만듦
		$.ajax({
			url : '/goodluxe/login.do',
			type : 'POST',
			data : params, // 서버로 전달할 데이터
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : "json", // 서버로 보내줄 타입  //응답할 타입은 json으로 하겠다

			success : function(retVal) {
				if (retVal.result == "error_accur") {
					alert("현재 로그인이 불가합니다.\n잠시 후 다시 시도해주세요.")
					location.href = "./mainPage.do";
				} else if (retVal.result == "non-member") {
					alert("존재하지 않는 회원입니다.");
				} else if (retVal.result == "wrong_pw") {
					alert("아이디 또는 비밀번호가 틀립니다.");
				} else if (retVal.result == "email_N") {
					alert("이메일 인증이 완료되어야 사이트 이용이 가능합니다.");
				} else if (retVal.result == "ok") {
					location.href = "./mainPage.do";
				}
			},
			error : function() {
				alert("현재 서버와 통신이 불가합니다.");
			}
		});
	};
</script>

<div class="login_outline">
    <div class="login_top"></div>
    <div class="login_right"></div>
    <div class="login_bottom"></div>
    <div class="login_left"></div>
    <div class="login_area">
        <img src="${pageContext.request.contextPath}/resources/img/icons/cross-out_black.png" alt="close" class="login_close" />
        <div class="login_title">LOGIN</div>
        <form action="" id="login_form">
            <div class="login_data">
                <div class="group">
                    <input type="text" class="input_login" name="member_id">
                    <span class="highlight"></span>
                    <label>아이디</label>
                </div>
                <div class="group">
                    <input type="password" class="input_login" name="member_pw">
                    <span class="highlight"></span>
                    <label>비밀번호</label>
                </div>
            </div>
            <a href="find_data.do" class="find_login_data">아이디/비밀번호 찾기</a>
            <input type="button" class="login_btn" onClick="onclick_login();" value="로그인">
            
        </form>
        <div class="login_line">
            <hr>
            <span>or</span>
            <hr>
        </div>
        <div class="login_icons">
            <a href="#"><img src="${pageContext.request.contextPath}/resources/img/icons/google.png" alt="google" class="login_icon"></a>
<%--             <a href="${kakao_url}"><img src="${pageContext.request.contextPath}/resources/img/icons/kakao.png" alt="kakao" class="login_icon"></a> --%>
            <a href="${kakao_url}"><img src="${pageContext.request.contextPath}/resources/img/icons/kakao.png" alt="kakao" class="login_icon"></a>
            <a href="${naver_url}"><img src="${pageContext.request.contextPath}/resources/img/icons/naver.png" alt="naver" class="login_icon"></a>
        </div>
        <div class="anonymous">
            <span>계정이 없으신가요?</span>
            <a href="joinform.do">회원가입</a>
        </div>
    </div>
</div>