<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.Timestamp,com.spring.goodluxe.voes.*" %>
<%
	InquireVO qPost = (InquireVO) request.getAttribute("qPost");
	String member_id = (String)session.getAttribute("member_id");
	String member_isadmin = (String)session.getAttribute("member_isadmin");
%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="viewport" content="user-scalable=no,width=device-width, initial-scale=1.0" />
	
	<title>GOODLUXE :: 굿럭스</title>
	
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-header.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goodluxe-footer.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script>
		$(document).ready(function(){
			$("#header").load("header.do");
			$("#nav_bar").load("navBar.do");
			$("#login_box").load("loginBox.do");
			$("#footer").load("footer.do");
		});
	</script>
	
	<!-- sc_qboard_write -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board_detail.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board_detail.js"></script>
    <script>
    	$(document).ready(function(){
    		loadComment();
    	});
    
    	$(document).on('click','.comment_write_btn',function(e){
    		if(!login_chk("<%=member_id%>")){ return; }
    		if(!content_chk($('.comment_write_form').children('textarea').val())){ return; }
    		
    		var params = $('.comment_write_form').serialize();
    		
    		$.ajax({
    			url : 'insertComment.do',
    			type : 'POST',
    			data : params,
    			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
    			dataType : 'json',
    			success : function(retVal) {
    				if(retVal.message == "덧글 등록 성공") {
	    				loadComment();
    				} else {
    					alert('덧글 등록에 실패하였습니다.');
    				}
    			},
    			error : function() {
    				alert('현재 서버와의 통신이 원활하지 않습니다.');
    			}
    		});
    		$('.comment_write_form').children('textarea').val('');
    		e.preventDefault();
    	});
    	
    	$(document).on('click','.reply_write_btn',function(e){
    		if(!login_chk("<%=member_id%>")){ return; }
    		var form_name = ".comment_write_form" + $(this).attr('form_index');
    		if(!content_chk($(form_name).find('.write_content').val())){ return; }
    		var params = $(form_name).serialize();

    		$.ajax({
    			url : 'insertComment.do',
    			type : 'POST',
    			data : params,
    			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
    			dataType : 'json',
    			success : function(retVal) {
    				loadComment();
    			},
    			error : function() {
    				alert('현재 서버와의 통신이 원활하지 않습니다.');
    			}
    		});
    		
    		e.preventDefault();
    	});
    	
    	$(document).on('click','.reply_update_btn',function(e){
    		var form_name = ".comment_write_form" + $(this).attr('form_index');
    		if(!content_chk($(form_name).find('.updated_content').val())){ return; }
    		var params = $(form_name).serialize();
    		
    		$.ajax({
    			url : 'updateComment.do',
    			type : 'POST',
    			data : params,
    			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
    			dataType : 'json',
    			success : function(retVal) {
    				loadComment();
    			},
    			error : function() {
    				alert('현재 서버와의 통신이 원활하지 않습니다.');
    			}
    		});
    		
    		e.preventDefault();
    	});
    	
    	$(document).on('click','.comm_del_btn',function(e){
    		var form_name = ".comment_write_form" + $(this).attr('form_index');
    		var params = $(form_name).serialize();
    		
    		$.ajax({
    			url : 'deleteComment.do',
    			type : 'POST',
    			data : params,
    			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
    			dataType : 'json',
    			success : function(retVal) {
    				loadComment();
    			},
    			error : function() {
    				alert('현재 서버와의 통신이 원활하지 않습니다.');
    			}
    		});
    		
    		e.preventDefault();
    	});
    	
    	
    	
    	function login_chk(m_id){
    		if(m_id == "null" || m_id == ""){
    			alert('로그인 후 이용해주세요.');
    			return false;
    		}
    		return true;
    	}
    	
    	function content_chk(comment_content){
    		if(comment_content == "") {
    			alert('덧글 내용을 입력해주세요.');
    			return false;
    		}
    		return true;
    	}
    	
    	function loadComment(){
    		$('.comment_area').empty();
    		
    		$.ajax({
    			url : 'loadComment.do',
    			type : 'POST',
    			data : {'inquire_number' : <%=qPost.getInquire_number()%>},
    			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
    			dataType : 'json',
    			success : function(data) {
    				if(data != null) {
    					$.each(data, function(index, comment){
    						var output = '';
    						output += '<form name="comm_write_form' + index + '" class="comment_write_form' + index + '">';
    						output += '<input type="hidden" name="inquire_number" value=' + comment.inquire_number + ' >';
    						output += '<table class="detail_comment_table" style="border: 1px solid #d7d7d7;">';
    						output += '<tr>';
    						if(comment.comment_ref_level > 0) {
    							output += '<td class="detail_re_comment_td_icon"><img src="${pageContext.request.contextPath}/resources/img/icons/re_comment.png" style="width: 10px;"></td>';
    							output += '<td class="detail_re_comment_td_id">&nbsp;' + comment.member_id + '&nbsp;';
	    						if(comment.comment_ref_level > 1) {    							
	    							output += '<span class="detail_re_re_comment">@' + comment.comment_ref_writer + '님에 대한 답글</span>';
	    						}
    						} else {
	    						output += '<td class="detail_comment_td_id">&nbsp;' + comment.member_id + '&nbsp;';
    						}
    						output += '</td>';
    						if(comment.comment_ref_level > 0) {
	    						output += '<td class="detail_re_comment_td_btn" rowspan="2">';
    						} else {
    							output += '<td class="detail_comment_td_btn" rowspan="2">';
    						}
    						output += '<input type="button" class="detail_re_comment_btn comm_reply_btn" form_index='+ index +' value="답글"><br>';
    						if(comment.member_id == "<%=member_id%>") {
    							output += '<input type="button" class="detail_re_comment_btn comm_update_btn" form_index='+ index +' value="수정"><br>';
    						}
    						if(comment.member_id == "<%=member_id%>" || "<%=member_isadmin%>" == "Y") {
    							output += '<input type="button" class="detail_re_comment_btn comm_del_btn" form_index='+ index +' value="삭제">';
    						}
    						output += '</td></tr>';
    						output += '<tr>';
    						if(comment.comment_ref_level > 0) {
    							output += '<td class="detail_re_comment_td_icon"></td>';
    							output += '<td class="detail_re_comment_td_content">' + comment.comment_content + '</td></tr>';
    						} else {
    							output += '<td class="detail_comment_td_content">' + comment.comment_content + '</td></tr>';
    						}
    						output += '<tr class="tr_comment_write comm_write_form' + index + '">';
    						if(comment.comment_ref_level > 0) {
    							output += '<td></td>';
    						}
    						output += '<td class="td_comment_write">';
    						output += '<input type="hidden" name="member_id" value="<%=member_id%>">';
    						output += '<input type="hidden" name="comment_ref" value=' + comment.comment_ref + ' >';
    						output += '<input type="hidden" name="comment_ref_step" value=' + comment.comment_ref_step + ' >';
    						output += '<input type="hidden" name="comment_ref_level" value=' + comment.comment_ref_level + ' >';
    						output += '<input type="hidden" name="comment_ref_writer" value=' + comment.member_id + ' >';
    						output += '<textarea class="td_detail_comment_text write_content" name="comment_content" cols="90" rows="2"></textarea>';
    						output += '</td><td>';
    						output += '<input type="button" class="td_detail_comment_btn reply_write_btn" form_index=' + index + ' value="답글 달기">';
    						output += '</td></tr>';
    						output += '<tr class="tr_comment_write comm_update_form' + index + '">';
    						if(comment.comment_ref_step > 0) {
    							output += '<td></td>';
    						}
    						output += '<td class="td_comment_write">';
    						output += '<input type="hidden" name="comment_number" value=' + comment.comment_number + ' >';
    						output += '<textarea class="td_detail_comment_text updated_content" name="updated_content" cols="90" rows="2">'+ comment.comment_content.replace(/<br\/>/gi, "\r\n") +'</textarea>';
    						output += '</td><td>';
    						output += '<input type="button" class="td_detail_comment_btn reply_update_btn" form_index=' + index + ' value="댓글 수정">';
    						output += '</td></form></tr>';
    						output += '</table>';
    						$('.comment_area').append(output);
    					});
    				}
    			},
    			error : function() {
    				alert('현재 서버와의 통신이 원활하지 않습니다.');
    			}
    		});
    	}
    </script>
</head>

<body class="">
    <header id="header"></header>
    <nav id="nav_bar"></nav>
    <div class="login_bg" id="login_box"></div>
    
    <section id="container">
        <br />
        <div id="main">
            <section class="center_detail_container">
                <div class="center_detail_main">
		            <p style="text-align: left; margin: 18px 0 16px 14px;font-size: 24px;font-weight:none;">| 고객센터</p>
		            <br /><br />
		            <h3 class="center_detail_text_head">[ 문의 글 상세보기 ]</h3>
		
		            <!-- 문의글 테이블 -->
		            <section class="center_detail_container2">
		                <table class="center_detail_table">
		                    <tbody style="text-align: left; border: 1px solid #d7d7d7;">
		                        <tr style="border: 1px solid #d7d7d7;">
		                            <td class="center_detail_td_title">제　목</td>
		                            <td class="detail_table_content"><%=qPost.getInquire_title() %></td>
		                        </tr>
		                        <tr style="border: 1px solid #d7d7d7;">
		                            <td class="center_detail_td_title">작성자</td>
		                            <td class="detail_table_content"><%=qPost.getMember_id() %></td>
		                        </tr>
		                        <tr style="border: 1px solid #d7d7d7;">
		                            <td class="center_detail_td_title">등록일</td>
		                            <%
		                            String write_date = qPost.getInquire_date().toString();
		                            write_date = write_date.split("\\.")[0];
		                            %>
		                            <td class="detail_table_content" rowspan="1"><%=write_date %></td>
		                        </tr>
		                        <tr style="border: 1px solid #d7d7d7;">
		                            <td class="detail_table_content" colspan="2"><%=qPost.getInquire_content() %></td>
		                        </tr>
		                    </tbody>
		                </table>
		            </section>
		
		            <!-- 문의글 아래 버튼 -->
		            <section class="center_detail_container3" style="font-size: 13px;">
		                <table class="center_detail_table">
		                    <tr>
		                        <!-- 작성자가 당사자일 경우, 목록/수정/삭제 버튼 모두 보임. 당사자가 아닐 경우 목록만 보임. admin일 경우 목록/삭제 보임(삭제도 보여도 되나?)-->
		                        <td style="text-align: left;">
		                        	<input type="button" class="center_detail_btn" onClick="location.href='scQBoard.do';" style="background-color: white;" value="목록">
		                        </td>
		                        <td style="text-align: right;">
		                        <% if( member_id != null && member_id.equals(qPost.getMember_id()) ) { %>
		                        	<input type="button" onClick="location.href='inquireDelete.do?inquire_number=<%=qPost.getInquire_number() %>'" class="center_detail_btn" style="background-color: white;" value="삭제">
		                            <input type="button" onClick="location.href='inquireUpdateForm.do?inquire_number=<%=qPost.getInquire_number() %>'" class="center_detail_btn" style="background-color: white;" value="수정">
		                        <% } else if( member_id !=null && member_isadmin.equals("Y") ) { %>
		                        	<button class="center_detail_btn" style="background-color: white;">삭제</button>
		                        <% } %>
		                        </td>
		                    </tr>
		                </table>
		            </section>

                    <!-- 댓글 달기 부분 -->
                    <section class="center_detail_table">
                        <form class="comment_write_form" name="comment_write_form">
                        	<input type="hidden" name="inquire_number" value="<%=qPost.getInquire_number() %>">
                            <input type="hidden" name="member_id" value="<%=member_id%>">
                            <textarea class="detail_comment_text" name="comment_content" ></textarea>
                            &nbsp;
                            <input type="button" class="detail_comment_btn comment_write_btn" value="댓글 달기">
                        </form>
                    </section>
                    
                    <!-- 달려 있는 댓글/답글 부분 -->
                    <section class="center_detail_container2 comment_area">
                        <table class="detail_comment_table" style="border: 1px solid #d7d7d7;">
                            <tr>
                                <td class="detail_comment_td_id">Admin</td>
                                <td class="detail_comment_td_btn" rowspan="2">
                                    <!--admin : 수정 필요없을 듯, 댓글 당사자 : 수정/삭제(답댓 없어도 되지 않을까), 다른 고객 : 답댓글만-->
                                    <input type="button" class="detail_re_comment_btn comm_reply_btn" form_index=1 value="답글"><br>
                                    <input type="button" class="detail_re_comment_btn comm_update_btn" form_index=1 value="수정"><br>
                                    <input type="button" class="detail_re_comment_btn comm_del_btn" form_index=1 value="삭제">
                                </td>
                            </tr>
                            <tr>
                                <td class="detail_comment_td_content">안녕하세요^^ 고객님<br>
                                    반품을 원하시는 경우<br>
                                    상품 받아보신 날짜 7일이내로(주말/공휴일제외) 보내주시면됩니다
                                </td>
                            </tr>
                            <tr class="tr_comment_write comm_write_form1">
                                <form name="comm_write_form1">
                                <td class="td_comment_write">
                                        <input type="hidden" name="member_id">
                                        <input type="hidden" name="comment_ref">
                                        <input type="hidden" name="comment_ref_step">
                                        <input type="hidden" name="comment_ref_level">
                                        <textarea class="td_detail_comment_text" name="comment_content" cols="90" rows="2"></textarea>
                                    </td>
                                    <td>
                                        <input type="submit" class="td_detail_comment_btn reply_write_btn" value="답글 달기">
                                    </td>
                                </form>
                            </tr>
                            <tr class="tr_comment_write comm_update_form1">
                                <form name="comm_update_form1">
                                    <td class="td_comment_write">
                                        <input type="hidden" name="comment_number">
                                        <textarea class="td_detail_comment_text" name="comment_content" cols="90" rows="2">기존내용</textarea>
                                    </td>
                                    <td>
                                        <input type="button" class="td_detail_comment_btn reply_update_btn" value="댓글 수정">
                                    </td>
                                </form>
                            </tr>
                        </table>
                        <!--댓글에 대한 답글 달릴 경우-->
                        <table class="detail_comment_table">
                            <tr>
                                <td class="detail_re_comment_td_icon"><img src="${pageContext.request.contextPath}/resources/img/icons/re_comment.png" style="width: 10px;"></td>
                                <td class="detail_re_comment_td_id">&nbsp;MJx2</td>
                                <td class="detail_re_comment_td_btn" rowspan="2">
                                    <input type="button" class="detail_re_comment_btn comm_reply_btn" form_index=2 value="답글"><br>
                                    <input type="button" class="detail_re_comment_btn comm_update_btn" form_index=2 value="수정"><br>
                                    <input type="button" class="detail_re_comment_btn comm_del_btn" form_index=2 value="삭제">
                                </td>
                            </tr>
                            <tr>
                                <td class="detail_re_comment_td_icon"></td>
                                <td class="detail_re_comment_td_content">아하<br />그렇군요
                                </td>
                            </tr>
                            <tr class="tr_comment_write comm_write_form2">
                                <td></td>
                                <form name="comm_write_form2">
                                <td class="td_comment_write">
                                        <input type="hidden" name="member_id">
                                        <input type="hidden" name="comment_ref">
                                        <textarea class="td_detail_comment_text" name="comment_content" cols="90" rows="2"></textarea>
                                    </td>
                                    <td>
                                        <input type="submit" class="td_detail_comment_btn" value="답글 달기">
                                    </td>
                                </form>
                            </tr>
                            <tr class="tr_comment_write comm_update_form2">
                                <td></td>
                                <form name="comm_update_form2">
                                    <td class="td_comment_write">
                                        <input type="hidden" name="comment_number">
                                        <textarea class="td_detail_comment_text" name="comment_content" cols="90" rows="2">기존내용</textarea>
                                    </td>
                                    <td>
                                        <input type="submit" class="td_detail_comment_btn" value="댓글 수정">
                                    </td>
                                </form>
                            </tr>
                        </table>

                        <table class="detail_comment_table">
                            <tr>
                                <td class="detail_re_comment_td_icon"><img src="${pageContext.request.contextPath}/resources/img/icons/re_comment.png" style="width: 10px;"></td>
                                <td class="detail_re_comment_td_id">&nbsp;Admin&nbsp;<span class="detail_re_re_comment">@MJx2님에 대한 답글</span>
                                </td>
                                <td class="detail_re_comment_td_btn" rowspan="2">
                                    <!--admin : 수정 필요없을 듯, 댓글 당사자 : 수정/삭제(답댓 없어도 되지 않을까), 다른 고객 : 답글만-->
                                    <input type="button" class="detail_re_comment_btn comm_reply_btn" form_index=3 value="답글"><br>
                                    <input type="button" class="detail_re_comment_btn comm_update_btn" form_index=3 value="수정"><br>
                                    <input type="button" class="detail_re_comment_btn comm_del_btn" form_index=3 value="삭제">
                                </td>
                            </tr>
                            <tr>
                                <td class="detail_re_comment_td_icon"></td>
                                <td class="detail_re_comment_td_content">아하<br />그렇군요
                                </td>
                            </tr>
                            <tr class="tr_comment_write comm_write_form3">
                                <td></td>
                                <form name="comm_write_form3">
                                <td class="td_comment_write">
                                        <input type="hidden" name="member_id">
                                        <input type="hidden" name="comment_ref">
                                        <textarea class="td_detail_comment_text" name="comment_content" cols="90" rows="2"></textarea>
                                    </td>
                                    <td>
                                        <input type="submit" class="td_detail_comment_btn" value="답글 달기">
                                    </td>
                                </form>
                            </tr>
                            <tr class="tr_comment_write comm_update_form3">
                                <td></td>
                                <form name="comm_update_form3">
                                    <td class="td_comment_write">
                                        <input type="hidden" name="comment_number">
                                        <textarea class="td_detail_comment_text" name="comment_content" cols="90" rows="2">기존내용</textarea>
                                    </td>
                                    <td>
                                        <input type="submit" class="td_detail_comment_btn" value="댓글 수정">
                                    </td>
                                </form>
                            </tr>
                        </table>

                        <form name="comm_write_form4" class="comment_write_form4">
                        <table class="detail_comment_table">
                            <tr>
                                <td class="detail_re_comment_td_icon"><img src="${pageContext.request.contextPath}/resources/img/icons/re_comment.png" style="width: 10px;"></td>
                                <td class="detail_re_comment_td_id">&nbsp;2xjm</td>
                                <td class="detail_re_comment_td_btn" rowspan="2">
                                    <input type="button" class="detail_re_comment_btn comm_reply_btn" form_index=4 value="답글"><br>
                                    <input type="button" class="detail_re_comment_btn comm_del_btn" form_index=4 value="삭제">
                                </td>
                            </tr>
                            <tr>
                                <td class="detail_re_comment_td_icon"></td>
                                <td class="detail_re_comment_td_content">오 반품도 가능하군요<br />신기하네요
                                </td>
                            </tr>
                            <tr class="tr_comment_write comm_write_form4">
                                <td></td>
                               	<td class="td_comment_write">
                                       <input type="hidden" name="member_id">
                                       <input type="hidden" name="comment_ref">
                                       <input type="hidden" name="comment_ref_step">
                                       <input type="hidden" name="comment_ref_level">
                                       <input type="hidden" name="comment_ref_writer">
                                       <textarea class="td_detail_comment_text" name="comment_content" cols="90" rows="2"></textarea>
                                 </td>
                                 <td>
                                     <input type="submit" class="td_detail_comment_btn reply_write_btn" form_index=4 value="답글 달기">
                                 </td>
                            </tr>
                            <tr class="tr_comment_write comm_update_form4">
                                <td></td>
                                <form name="comm_update_form4">
                                    <td class="td_comment_write">
                                        <input type="hidden" name="comment_number">
                                        <textarea class="td_detail_comment_text" name="comment_content" cols="90" rows="2">기존내용</textarea>
                                    </td>
                                    <td>
                                        <input type="submit" class="td_detail_comment_btn" value="댓글 수정">
                                    </td>
                                </form>
                            </tr>
                        </table>
                        </form>

                        <table class="detail_comment_table" style="border: 1px solid #d7d7d7;">
                            <tr>
                                <td class="detail_comment_td_id">2xjm</td>
                                <td class="detail_comment_td_btn" rowspan="2">
                                    <input type="button" class="detail_re_comment_btn comm_reply_btn" form_index=5 value="답글"><br>
                                    <input type="button" class="detail_re_comment_btn comm_del_btn" form_index=5 value="삭제">
                                </td>
                            </tr>
                            <tr>
                                <td class="detail_comment_td_content">곧 학원 가야하네요<br>
                                    아악!!
                                </td>
                            </tr>
                            <tr class="tr_comment_write comm_write_form5">
                                <form name="comm_write_form5">
                                <td class="td_comment_write">
                                        <input type="hidden" name="member_id">
                                        <input type="hidden" name="comment_ref">
                                        <textarea class="td_detail_comment_text" name="comment_content" cols="90" rows="2"></textarea>
                                    </td>
                                    <td>
                                        <input type="submit" class="td_detail_comment_btn" value="답글 달기">
                                    </td>
                                </form>
                            </tr>
                            <tr class="tr_comment_write comm_update_form5">
                                <form name="comm_update_form5">
                                    <td class="td_comment_write">
                                        <input type="hidden" name="comment_number">
                                        <textarea class="td_detail_comment_text" name="comment_content" cols="90" rows="2">기존내용</textarea>
                                    </td>
                                    <td>
                                        <input type="submit" class="td_detail_comment_btn" value="댓글 수정">
                                    </td>
                                </form>
                            </tr>
                        </table>

                    </section>
                    <br /><br /><br />
                </div>
            </section>
        </div>
    </section>

	<footer id="footer"></footer>
</body>

</html>