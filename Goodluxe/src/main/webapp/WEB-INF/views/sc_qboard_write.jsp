<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board_write_edit.css" />
    <script>
    	function chk_wf(){
    		var b = true;
    		if(b){ b = chk_title(); }
    		if(b){ b = chk_content(); }
    		if(b){ set_inquire_public(); document.qb_write_form.submit(); }
    		//if(b){ document.qb_write_form.submit(); }
    	}
    	
    	function chk_title(){
    		if(document.qb_write_form.inquire_title.value == "") {
    			alert("제목을 입력해주세요.");
    			return false;
    		}
    		return true;
    	}
    	
    	function chk_content(){
    		if(document.qb_write_form.inquire_content.value == "") {
    			alert("내용을 입력해주세요.");
    			return false;
    		}
    		return true;
    	}
    	
    	function set_inquire_public(){
    		if(document.qb_write_form.secret.checked){
    			document.qb_write_form.inquire_public.setAttribute('value','private');
    		} else {
    			document.qb_write_form.inquire_public.setAttribute('value','public');
    		}
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
            <section class="center_write_container">
                <div class="center_write_main">
                    <p style="text-align: left; margin: 18px 0 16px 14px;font-size: 24px;font-weight:none;">| 고객센터</p>
                    <br/><br/><h3 class="center_write_table_h3">[ 문의 글쓰기 ]</h3>

                    <form action="inquireInsert.do" name="qb_write_form">
                        <div class="center_write_container2">
                            <table class="center_write_table">
                                <tbody style="text-align: left;">
                                    <tr class="center_write_tr_title">
                                        <td class="center_write_td_title" style="font-size: 13px;">제　목</td>
                                        <td>
                                            <textarea class="center_write_text_title" name="inquire_title" id="" rows="1"></textarea>
                                        </td>
                                    </tr>
                                    <tr class="center_write_tr_content">
                                        <td class="center_write_td_content" style="font-size: 13px;">내　용</td>
                                        <td><textarea class="center_write_text_content" name="inquire_content" id=""></textarea></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="center_write_container3" style="font: 13px;">
                        	<input type="hidden" name="inquire_public">
                            <input type="checkbox" name="secret" class="secret" value="secret" style="font-size: 13px;">
                            비밀글
                        </div>
                        <div class="container4">
                            <div style="text-align: center;">
                                <button onClick="location.href='scQBoard.do'; return false;" class="center_write_btn"
                                    style="background-color: white; border-color: darkgray ;">취소</button>
                                <input type="button" class="center_write_btn"
                                    style="background-color: #8FB0CA; color: white;" value="등록" onClick="chk_wf();">
                            </div>
                        </div>
                    </form>
            </section>
        </div>
    </section>

    <footer id="footer"></footer>
</body>

</html>