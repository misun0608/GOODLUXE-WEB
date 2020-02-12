<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table>
    <tr style="width: 100%;">
        <td>
            <div>
                <select name="" id="board_search" style="height: 27px; margin:0px 0 9px 0px">
                    <option value="#search_title">제목</option>
                    <option value="#search_content">내용</option>
                    <option value="#search_id">아이디</option>
                </select>
                <form action="" id="service_notice_search_form" style="display:inline-block">
                    <input type="text" placeholder="게시판 내 검색"
                        style="height: 21px; padding: 0.03em;">
                    <button class="center_search_btn"
                        style="width: 50px; height: 25px;">검색</button>
                </form>
            </div>
        </td>
    </tr>
</table>

<!-- 공지사항 테이블-->
<table class="service_center_table">
    <tr class="service_center_top_tr">
        <!-- 여기 bold 넣는게 좋은지 빼는게 좋은지 컬러 따로 줘서 안넣어도 구분 가능해보임-->
        <td style="width: 110px;">번호</td>
        <td>제목</td>
        <td style="width: 190px;">게시일</td>
    </tr>
    <tr class="service_center_middle_tr">
        <td>2</td>
        <td><a href="board_notice.html">나눔클릭 캠페인 기부금 전달 공지</a></td>
        <td>2019.12.30</td>
    </tr>
    <tr class="service_center_middle_tr">
        <td>1</td>
        <td><a href=#>위탁 판매 수수료 변경 안내</a></td>
        <td>2019.08.11</td>
    </tr>
</table>
<!-- 공지사항 테이블 끝 -->
<br>
<p style="text-align: center; margin-bottom: 2em;">◁ 1 ▷</p>