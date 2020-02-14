<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table style="width: 100%">
    <tr style="width: 100%;">
        <td>
            <div>
                <select name="" id="service_center_board_search" style="height: 27px;margin: 0px 0 9px 0;">
                    <option value="#search_title">제목</option>
                    <option value="#search_content">내용</option>
                    <option value="#search_id">아이디</option>
                </select>
                <form action="" id="service_board_search_form" style="display:inline-block">
                    <input type="text" placeholder="게시판 내 검색" style="height: 21px;">
                    <button class="center_search_btn"
                        style="width: 50px; height: 26px;">검색</button>
                </form>
            </div>
        </td>
        <td style="float: right;">
            <a href="board_write.html"><button class="center_search_btn"
                    style="width: 65px; height: 27px; margin-top: 2px;">글 작성</button></a>
        </td>
    </tr>
</table>
<table class="service_center_table">
    <tr class="service_center_top_tr">
        <td style="width: 110px;">번호</td>
        <td>제목</td>
        <td>작성자</td>
        <td style="width: 190px;">게시일</td>
    </tr>
    <tr class="service_center_middle_tr">
        <td>2</td>
        <td><a href=#>어제 주문했는데 배송 언제 오나요? [2]</a></td>
        <td>Jiye123</td>
        <td>2020.01.11</td>
    </tr>
    <tr class="service_center_middle_tr">
        <td>1</td>
        <td><a href="board_detail.html">반품 문의입니다 [1]</a></td>
        <td>MJx2</td>
        <td>2020.01.11</td>
    </tr>
</table>
<br>
<p style="text-align: center; margin-bottom: 2em;">◁ 1 ▷</p>