<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*" %>
<%@ page import = "com.spring.goodluxe.voes.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DecimalFormat" %>

<%
	/* 회원 정보 */
	MemberVO memberVO = (MemberVO)request.getAttribute("mvo");

	String order_name = memberVO.getMember_name(); // 이름
	String order_zipcode = memberVO.getMember_zipcode(); // 우편번호
	String order_addr1 = memberVO.getMember_addr1(); // 기본주소
	
	// 휴대폰 번호 추출
	String phone = memberVO.getMember_phone();
	String member_phone1 = phone.substring(0,3);
	String member_phone2 = phone.substring(3,7);
	String member_phone3 = phone.substring(7,11);
	
	// 이메일 추출
	String email = memberVO.getMember_email();
	int idx = email.indexOf("@");
	String member_email1 = email.substring(0, idx); // @ 앞부분 추출
	String member_email2 = email.substring(idx+1); // @ 뒷 부분 추출
	
	/* 제품 정보 */
	ProductVO productVO = (ProductVO)request.getAttribute("pvo");
	ProductBoardVO pbVO = (ProductBoardVO)request.getAttribute("pbvo");
	
	int sale_price = productVO.getSale_price();
	
	// 배송비
	int delivery_fee;
	if(sale_price >=500000){ delivery_fee = 0; }
	else{ delivery_fee = 5000; }
	
	int total_price = sale_price + delivery_fee; // 합계
	int expected_point = (int)(sale_price * 0.001); // 적립금
	
	// 쿠폰 리스트
	ArrayList<CouponVO> coupon_list = (ArrayList<CouponVO>)request.getAttribute("coupon_list");
	
	// 콤마
	DecimalFormat df3 = new DecimalFormat(",###");
	String sale_price_format = df3.format(sale_price);
	String delivery_format = df3.format(delivery_fee);
%>

<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="viewport"
	content="user-scalable=no,width=device-width, initial-scale=1.0" />
	
	<title>GOODLUXE :: 굿럭스</title>
	
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean"
	rel="stylesheet">
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
	
	<!-- order_form -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order_form.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/order_form.js"></script>
	<!-- 우편번호 찾기 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 결제 api 연동 -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- 배송지 선택 -->
	<script>
	function set_shipping_value(){
		var order_name = '<%=order_name %>';
		var order_zipcode = '<%=order_zipcode %>';
		var order_addr1 = '<%=order_addr1 %>';
		var order_addr2 = '<%=memberVO.getMember_addr2() %>';
		var order_phone1 = '<%=member_phone1 %>';
		var order_phone2 = '<%=member_phone2 %>';
		var order_phone3 = '<%=member_phone3 %>';
		var order_email1= '<%=member_email1 %>';
		var order_email2= '<%=member_email2 %>';
		$('#order_receipt').val(order_name);
		$('#order_zipcode').val(order_zipcode);
		$('#order_addr1').val(order_addr1);
		$('#order_addr2').val(order_addr2);
		$('#order_phone1').val(order_phone1);
		$('#order_phone2').val(order_phone2);
		$('#order_phone3').val(order_phone3);
		$('#order_email1').val(order_email1);
		$('#order_email2').val(order_email2);
		$('#order_message').val('');
		$('#order_message').focus();
	}
	
 	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 결제 예정 금액 계산
	$(document).ready(function() {
		var order_product_price = <%=sale_price %>;	// 총주문금액
		var delivery = <%=delivery_fee %>	// 배송비
		var used_point = $('#using_point').val();
		var used_point_num = parseInt($('#using_point').val().replace(/\,/g,''));
		var used_coupon_num = parseInt($('#using_coupon').val().replace(/\,/g,''));
		var used_coupon = $('#using_coupon').val();
		$('#using_point').val('0');	// 적립금 초기화
		$('#final_price').val('<%=total_price %>');
		$('#final_price2').val(numberWithCommas('<%=total_price %>') + '원');
		
		var previous = '';
		// 쿠폰 계산
		$('#coupon_select').focus(function(){
			previous = $("#coupon_select option:selected").text();
		}).on('change', function(){
			$('#coupon_select').trigger("blur");
			if(delivery == 0){
				alert('배송비가 무료인 상품입니다.');
				$('#coupon_select').find('option:first').prop('selected', true);
			}else {
				var pay_money = 0;
				if($("#coupon_select option:selected").text() == '가입 무료배송 쿠폰'){
					$('#using_coupon').val(delivery);
				}else if($("#coupon_select option:selected").text() != '가입 무료배송 쿠폰'){
					$('#using_coupon').val(0);
				}
					used_coupon = $('#using_coupon').val();
					used_point = $('#using_point').val();
					pay_money = (order_product_price + delivery - used_point - used_coupon);
					
					$('#final_price').val(pay_money);
					$('#final_price2').val(numberWithCommas(pay_money)+'원');
			}
		});
	
		// 적립금 계산
		$('#order_used_point').on('keyup', function(){
			// 적립금 input에 숫자만 입력 가능
			$(this).val($(this).val().replace(/[^0-9]/g,""));
			
			var have_point = parseInt(<%=memberVO.getMember_point() %>);
			used_point = $('#order_used_point').val();
			
			if($('#order_used_point').val() == ''){
				$('#using_point').val(0);
				$('#order_used_point').val(0);
				pay_money = (order_product_price + delivery - used_point - used_coupon);
				$('#final_price').val(pay_money);
				$('#final_price2').val(numberWithCommas(pay_money)+'원');
				return;
			}
			
			if(used_point > have_point) {
				alert('보유 포인트가 부족합니다.');
				$('#order_used_point').val('');
				return;
			}
	
			used_point = $('#order_used_point').val();
			
			if(order_product_price < used_point){
				alert('결제금액을 초과해서 적립금을 사용하실 수 없습니다');
				$('#order_used_point').val('');
				return;
			}

			if(used_point >= 5000){
				$('#using_point').val(used_point);
				pay_money = (order_product_price + delivery - used_point - used_coupon);
				$('#final_price').val(pay_money);
				$('#final_price2').val(numberWithCommas(pay_money)+'원');
			}

		});
		
		$('#order_used_point').on('focusout',function(){
			used_point = $('#order_used_point').val();
			if(used_point != '' && used_point < 5000) {
				alert('5,000P부터 사용 가능합니다.');
				$('#order_used_point').val('');
				return;
			}
		});
			
	   $('#payment_click').click(function(){
		   if(!chk_d_info()) {
			   return;
		   }
		   
	      var select2 = $('input[name="order_pay_system"]:checked').val();
	      var order_phone = ($('input[name=order_phone1]').val() + $('input[name=order_phone2]').val() + $('input[name=order_phone3]').val());
	      $('input[name=order_phone]').val(order_phone);
			
	      if(select2 == '카카오페이'){
	         // 카카오페이일경우 submit을 못하기때문에 input에 적혀있는 데이터 하나하나 저장
	         var order_receipt = $('input[name=order_receipt]').val();
	         var order_zipcode = $('input[name=order_zipcode]').val();
	         var order_addr1 = $('input[name=order_addr1]').val();
	         var order_addr2 = $('input[name=order_addr2]').val();
	         var order_product_price = $('input[name=order_product_price]').val();
	         var order_ship_fee = $('input[name=order_ship_fee]').val();
	         var order_used_point = $('input[name=order_used_point]').val();
	         var order_used_coupon = $('#coupon_select').val();
	         var order_pay_system = $('input[name=order_pay_system]').val();
	         var order_message = $('textarea[name=order_message]').val();
	         var order_pay_price = $('input[name=order_pay_price]').val();
	         var member_point = $('input[name=member_point]').val();
	         var entity_number = $('input[name=entity_number]').val();
	         
	         var order_number = create_order_num();
	          
	         IMP.init('imp78724107'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	         IMP.request_pay({
	             pg : 'kakaopay',
	             pay_method : 'card',
	             merchant_uid : 'merchant_' + new Date().getTime(),
	             name : 'GOODLUXE:결제테스트',
	             amount : $('#final_price').val(),
	             buyer_email : '<%=email%>',
	             buyer_name : '<%=order_name%>',
	             buyer_tel : '<%=phone%>',
	             buyer_addr : '<%=order_addr1%>',
	             buyer_postcode : '<%=order_zipcode%>'
	                     }, function(rsp) {
	                  if (rsp.success) {
	                     //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	                     jQuery.ajax({
	                        url : "/goodluxe/insertKakaoOrder.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
	                        type : 'POST',
	                        dataType : 'json',
	                        data : {
	                           imp_uid : rsp.imp_uid,
	                           'order_number' : order_number,
	                           'order_receipt' : order_receipt,
	                           'order_zipcode' : order_zipcode,
	                           'order_addr1' : order_addr1,
	                           'order_addr2' : order_addr2,
	                           'order_phone' : order_phone,
	                           'order_product_price' : order_product_price,
	                           'order_ship_fee' : order_ship_fee,
	                           'order_used_point' : order_used_point,
	                           'order_used_coupon' : order_used_coupon,
	                           'order_pay_system' : order_pay_system,
	                           'order_message' : order_message,
	                           'order_pay_price' : order_pay_price,
	                           'member_point' : member_point, // 이거랑
	                           'entity_number' : entity_number, // 이거는 왜 전달해주는 거지..
	                           'pb_number' : <%=pbVO.getPb_number()%> // 추가..
	                        //기타 필요한 데이터가 있으면 추가 전달
	                        },
	                        success:function(data) {
	                           // 성공시 이동할 페이지하기
	                           location.href='insertOrderDone.do?order_number='+order_number+'&entity_number='+entity_number;
	                        }
	                     });
	                  } else {
	                     var msg = '결제에 실패하였습니다.';
	                     msg += '\nMESSAGE : ' + rsp.error_msg;
	                     // 실패시 이동할 페이지 추가하기
	                     location.href='orderForm.do?entity_number='+entity_number;
	                     alert(msg);
	                  }
	               });
	         
	      }else if(select2 == '무통장입금'){
	    	  if(!check_order_refund_info()) {
	    		  return false;
	    	  }
	          var form = document.order_input_form;
	    	  var order_number = create_order_num();
	    	  $('#of_order_number').val(order_number);
	          form.submit();
	      }
	   });
	   
		function create_order_num(){
	         var dt = new Date();
	         var Year = dt.getFullYear();        
	         var Month = "" + (dt.getMonth()+1);
	         var Day = "" + dt.getDate();            
	         if(Month.length < 2) Month = "0" + Month;
	         if(Day.length < 2) Day = "0" + Day;
	         var Today = Year.toString() + Month + Day;
	          
	          // 6자리 난수
	          var result = Math.floor(Math.random() * 1000000)+100000;
	          if(result>1000000){
	             result = result - 100000;
	          }

	          var order_number = Today + result;
	          return order_number;
		}
	});
	</script>
</head>

<body>
    <header id="header"></header>
    <nav id="nav_bar"></nav>
    <div class="login_bg" id="login_box"></div>
    
	<section id="container">
		<br>
		<div id="main">
			<article class = "of_1st of_arti_area">
                <h2 class="of_1st_title">| 주문서 작성</h2>

                <h3 class = "of_2nd_title">[ 주문내역 ]</h3>

                <table class = "of_1st_table">
                    <tr>
                        <th>이미지</th>
                        <th>상품정보</th>
                        <th>판매</th>
                        <th>적립금</th>
                        <th>배송비</th>
                        <th>합계</th>
                    </tr>
                    <tr>
                        <td><img src = "/Goodluxe/image/<%=pbVO.getPb_main_img_stored()%>"></td>
						<td><%=productVO.getPd_name() %></td>
						<td>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=sale_price %>" />원
						</td>
						<td>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=expected_point %>" />P
						</td>
						<td>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=delivery_fee %>" />원
						</td>
						<td>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=total_price %>" />원
						</td>
                    </tr>
                    <tr>
						<td colspan="6">상품 구매금액 
						<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=sale_price %>" />원 
						+ 배송비 <fmt:formatNumber type="number" maxFractionDigits="3" value="<%=delivery_fee %>" />원
						 = 합계 <fmt:formatNumber type="number" maxFractionDigits="3" value="<%=total_price %>" />원</td>
					</tr>
                </table>
            </article>
            <form action="insertOrder.do" name="order_input_form" method="post">
                <article class = "of_2nd of_arti_area">
                    <h3 class = "of_2nd_title">[ 배송 정보 ]</h3>
                    <table class = "of_2nd_table">
                        <tr>
                            <td>배송지 선택</td>
                            <td>
                                <input type="radio" id="same_addr" name="location_radio" value="member_address" onclick="set_shipping_value()" checked>
								<label for="same_addr">회원 정보와 동일</label>
								<input type="radio" id="new_addr" name="location_radio" value="new_address" onclick="reset_shipping_value()">
								<label for="new_addr">새로운 배송지</label>
                            </td>
                        </tr>
                        <tr>
                            <td>받으시는 분 *</td>
                            <td>
								<input type="text" value="<%=memberVO.getMember_name() %>" id="order_receipt" name="order_receipt" class="receiving" required>
								<input type="hidden" value="<%=productVO.getEntity_number() %>" name="entity_number">
								<input type="hidden" value="<%=pbVO.getPb_number() %>" name="pb_number">
							</td>
                        </tr>
                        <tr>
                            <td>주소 *</td>
                            <td>
								<input type="button" value="우편번호" class="zipcode_button" onclick="openZipSearch()">
								<input type="text" value="<%=memberVO.getMember_zipcode() %>" id="order_zipcode" name="order_zipcode" readonly="readonly" class="zipcode" required><br />
								<input type="text" value="<%=memberVO.getMember_addr1() %>" id="order_addr1" name="order_addr1" placeholder=" 기본주소" class="addr" readonly required><br />
								<input type="text" value="<%=memberVO.getMember_addr2() %>" id="order_addr2" name="order_addr2" placeholder=" 상세주소" class="addr" required>
							</td>
                        </tr>
                        <tr>
                            <td>휴대전화 *</td>
                            <td><input type="tel" id="order_phone1" name="order_phone1" value="<%=member_phone1%>" maxlength="3">
                                &nbsp;-&nbsp;
                                <input type="tel" id="order_phone2" name="order_phone2" value="<%=member_phone2%>" maxlength="4" required>
                                &nbsp;-&nbsp;
                                <input type="tel" id="order_phone3" name="order_phone3" value="<%=member_phone3%>" maxlength="4" required>
								<input type="hidden" name="order_phone" id="order_phone" value="">
							</td>
                        </tr>
                        <tr>
                            <td>이메일</td>
							<td class="grey_letter">
								<input type="text" id="order_email1" class="email" name="email1" value="<%=member_email1%>" STYLE="ime-mode: inactive">
								&nbsp;&nbsp;@&nbsp;&nbsp; 
								<input type="text" id="order_email2" class="email" name="email2" value="<%=member_email2%>" readonly="readOnly" size="10">
								<select id="email_select" name="email_select" onChange="emailAddr();">
									<option value="" selected disabled>-이메일 선택-</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="empas.com">empas.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="etc">직접입력</option>
                                </select>
                            </td>
                        </tr>
						<tr>
							<td>배송메세지</td>
							<td><textarea id="order_message" name="order_message"></textarea></td>
						</tr>
                    </table> 
                </article>
                <article class = "of_3rd of_arti_area">
					<h3 class = "of_2nd_title">[ 할인 정보 ]</h3>
					<table class="of_3rd_table">
						<tr>
							<td>쿠폰</td>
							<td>
								<select id="coupon_select" name="order_used_coupon">
									<option value="없음" selected>사용 하실 쿠폰을 선택하세요!</option>
									<%
									for(int i=0; i<coupon_list.size(); i++){
										CouponVO cvo = (CouponVO)coupon_list.get(i);
									%>
									<option value="<%=cvo.getCoupon_number() %>"><%=cvo.getCoupon_type() %></option>
									<%
									}
									%>
								</select>
							</td>
							<td>사용가능 쿠폰 : <%=coupon_list.size() %>장</td>
						</tr>
						<tr>
							<td class="order_title_td">적립금</td>
							<td>
								<input type="text" id="order_used_point" style= background: transparent;>&nbsp;P
							</td>
							<td>보유 적립금 : 
							<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=memberVO.getMember_point() %>" />P<br />
							<input type="hidden" name="member_point" value="<%=memberVO.getMember_point() %>">
								<p class="point_restriction">5,000P부터 사용 가능합니다</p>
							</td>
						</tr>
					</table>
                </article>
                <article class="of_4th of_arti_area">
                    <h3 class="of_2nd_title">[ 결제 예정 금액 ]</h3>
					<table class="of_4th_table">
						<tr>
							<th>총 주문 금액</th>
							<th>배송비</th>
							<th>적립금 사용</th>
							<th>쿠폰 사용</th>
							<th>총 결제 예정 금액</th>
						</tr>
						<tr>
							<td>
								<input type="text" id="order_product_price" name="order_product_price" readonly value="<%=sale_price %>" dir="rtl"/>원
							</td>
							<td>
								+ <input type="text" id="order_ship_fee" name="order_ship_fee" readonly value="<%=delivery_fee %>" dir="rtl"/>원
							</td>
							<td>
							- <input type="text" name="order_used_point" id="using_point" readonly  dir="rtl">원
							</td>
							<td>
							- <input type="text" id="using_coupon" readonly dir="rtl">원
							</td>
							<td>
							= <input type="text" name="order_pay_price" id="final_price" readonly  dir="rtl">원
							</td>
						</tr>
					</table>
                </article>
                <article class = "of_5th of_arti_area">
                    <h3 class="of_2nd_title">[ 결제 수단 ]</h3>
					<table class="of_5th_table">
						<tr>
							<td class="checksys_how">
								<input type="radio" id="order_pay_system" name="order_pay_system" value="카카오페이" onclick="choose_pay_method()" checked>
								<label for="order_pay_system">카카오페이</label> 
								<input type="radio" id="order_pay_system2" name="order_pay_system" value="무통장입금" onclick="choose_pay_method()">
								<label for="order_pay_system2">무통장입금</label>
							</td>
							<td class="check_confirm" rowspan="2">결제 최종금액 <br /><br />
							<input type="text" id="final_price2" class="final_price" readonly style="border:none; background: transparent;" dir="rtl">
								<br /><br />
								<input type="button" id="payment_click" class="payment_btn" value="결 제 하 기">
							</td>
						</tr>
						<tr>
							<td class="check_sys_info">
								<div id="check_method_kakao">
									고객님의 휴대폰을 이용하여 카카오페이로 결제해주세요
								</div>
								<div id="check_method_account" class="cma">
									환불계좌를 입력해주세요<br />
									<select name="order_refund_bank" required>
										<option value="" selected>은행 선택</option>
										<option value="KEB하나은행">KEB하나은행</option>
										<option value="SC제일은행">SC제일은행</option>
										<option value="경남은행">경남은행</option>
										<option value="광주은행">광주은행</option>
										<option value="국민은행">국민은행</option>
										<option value="농협(단위농협)">농협(단위농협)</option>
										<option value="농협(중앙회)">농협(중앙회)</option>
										<option value="대구은행">대구은행</option>
										<option value="산업은행">산업은행</option>
										<option value="상호저축은행">상호저축은행</option>
										<option value="부산은행">부산은행</option>
										<option value="산업은행">산업은행</option>
										<option value="상호저축은행">상호저축은행</option>
										<option value="새마을금고">새마을금고</option>
										<option value="카카오뱅크">카카오뱅크</option>
									</select>
									<input type="text" name="order_refund_account" id="order_refund_account" class="refund_input" placeholder="환불 계좌번호를 입력해주세요" required>
								</div>
							</td>
						</tr>
					</table>
					<input type="hidden" name="order_number" id="of_order_number">
                </article>
            </form>
		</div>
	</section>

	<footer id="footer"></footer>
</body>

</html>