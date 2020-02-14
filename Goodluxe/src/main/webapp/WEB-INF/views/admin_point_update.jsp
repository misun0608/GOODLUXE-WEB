<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="viewport" content="user-scalable=no,width=device-width, initial-scale=1.0" />
	<title></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_point_update.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>

<script>
function nullcheck(){
    var member_id = document.getElementById("member_id").value;
    var point_amount = document.getElementById("point_amount").value;
    
    if(member_id==""){
       alert("아이디를 입력하세요");
       return false;
    }
    
    if(point_amount==""){
        alert("적립금을 입력하세요");
        return false;
    }
}

$(document).ready(function(){
	// 포인트 입력창
    $('.input_point').on('focusout',function(){
        if($(this).val() != '') {
            $(this).siblings('label').addClass('color');
        } else {
            $(this).siblings('label').removeClass('color');
        }
    });
	
	// 한글 특수문자 입력 금지
	$("#member_id").on("keyup", function() { 
    	$(this).val($(this).val().replace(/[^0-9a-z]/g,"")); 
    });
	
	// 숫자만 입력
	$("#point_amount").on("keyup", function() {
    	$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	// 적립 / 회수 버튼 눌렀을 때
	$('.point_btn').on('click', function(){
		// 빈칸인지 확인
		nullcheck();
		
		window.opener.name="parentPage";	// 부모창의 이름 설정
		document.point_form.target="parentPage";	// 타겟을 부모창으로 설정
		
		var btnvalue = $(this).val();
		
		$('#btn_value').val(btnvalue);
		document.getElementById('point_form').submit();
		self.close();
	});
});
</script>
</head>
<body>
	<br />
	<br />
	<br />
	<br />
	<div class="">
		<form action="./admin_point_insert.do" id="point_form" name="point_form">
			<div class="point_data">
				<div class="group">
					<input type="text" id="member_id" name="member_id" class="input_point"> <span
						class="highlight"></span> <label>아이디</label>
				</div>
				<div class="group">
					<input type="text" id="point_amount" name="point_amount" class="input_point">
					<span class="highlight"></span> <label>적립금</label>
				</div>
				<input type="hidden" id="btn_value" name="btn_value" value="">
			</div>

			<input type="button" id="point_btn1" class="point_btn" value="적립">
			<input type="button" id="point_btn2" class="point_btn point_btn_back" value="회수">
		</form>
	</div>

</body>
</html>