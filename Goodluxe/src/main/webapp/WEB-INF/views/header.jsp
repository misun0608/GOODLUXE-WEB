<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String mem_id = (String) session.getAttribute("member_id");
	String mem_class = (String) session.getAttribute("member_class");
	String mem_isadmin = (String) session.getAttribute("member_isadmin");
%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/header.js"></script>

<div class="header">
    <div class="header_bg">
        <div class="header_area">
			<%
				if (mem_id == null) {
			%>
            <ul class="topmenu nonmember_menu on">
                <li class="cs"><a href="#">고객센터</a></li>
                <li class="singin"><a href="#">회원가입</a></li>
                <li class="login">
                    <a href="#">로그인</a>
                </li>
            </ul>
			<%
				} else {
					if (mem_isadmin.equals("Y")) {
			%>
            <ul class="topmenu member_menu on">
            	<li class="logout"><a href="logout.do">로그아웃</a></li>
                <li class="admin_page_link"><a href="#">관리자페이지</a></li>
            </ul>
			<%
					} else if (mem_class.equals("Y") || mem_class.equals("B")) {
			%>
            <ul class="topmenu member_menu on">
                <li class="cs"><a href="#">고객센터</a></li>
                <li class="logout"><a href="logout.do">로그아웃</a></li>
                <li class="mypage"><a href="mypageOAS.do?member_id=<%=mem_id%>">마이페이지</a></li>
                <li class="notice">
                    <img src="${pageContext.request.contextPath}/resources/img/icons/notice.png">
                    <a href="#" class='notice_btn'>알림</a>
                    <ul class="notice_content">
                        <li>
                            <a href="#" class="notice_list on">
                                '생로랑 모노그램 카바스백' 제품을 구매할 수 있습니다 :D<br>
                                이 기회를 놓치지 마세요!
                            </a>
                        </li>
                        <li>
                            <a href="search_result.html" class="notice_list on">
                                '생로랑 모노그램 카바스백' 제품이 판매 완료되었습니다 ㅠㅠ..<br>
                                Saint Laurent 의 다른 제품을 보시겠어요?
                            </a>
                        </li>
                        <li>
                            <a href="#" class="notice_list">
                                '생로랑 모노그램 카바스백' 최고 경매가가 갱신되었습니다.<br>
                                경매 진행 상황을 확인하세요!
                            </a>
                        </li>
                        <li>
                            <a href="#" class="notice_list">
                                '생로랑 모노그램 카바스백' 경매 종료 하루 전입니다.<br>
                                경매 진행 상황을 확인하세요!
                            </a>
                        </li>
                        <li>
                            <a href="#" class="notice_list">
                                '생로랑 모노그램 카바스백' 경매 종료까지 한 시간 남았습니다.<br>
                                경매 진행 상황을 확인하세요!
                            </a>
                        </li>
                        <li>
                            <a href="#" class="notice_more notice_list" >
                                지난 알림 더보기
                            </a>
                        </li>
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
