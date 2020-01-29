<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script>
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
                    <input type="text" class="input_login">
                    <span class="highlight"></span>
                    <label>아이디</label>
                </div>
                <div class="group">
                    <input type="password" class="input_login">
                    <span class="highlight"></span>
                    <label>비밀번호</label>
                </div>
            </div>
            <a href="#" class="find_login_data">아이디/비밀번호 찾기</a>
            <input type="button" class="login_btn" value="로그인">
            
        </form>
        <div class="login_line">
            <hr>
            <span>or</span>
            <hr>
        </div>
        <div class="login_icons">
            <a href="#"><img src="${pageContext.request.contextPath}/resources/img/icons/google.png" alt="google" class="login_icon"></a>
            <a href="#"><img src="${pageContext.request.contextPath}/resources/img/icons/kakao.png" alt="kakao" class="login_icon"></a>
            <a href="#"><img src="${pageContext.request.contextPath}/resources/img/icons/naver.png" alt="naver" class="login_icon"></a>
        </div>
        <div class="anonymous">
            <span>계정이 없으신가요?</span>
            <a href="#">회원가입</a>
        </div>
    </div>
</div>