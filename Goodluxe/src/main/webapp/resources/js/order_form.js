// 이메일 입력 선택
function emailAddr() {
    if (order_input_form.email_select.value == 'etc') {
        order_input_form.email2.readOnly = false;
        order_input_form.email2.value = '';
        order_input_form.email2.focus();
        }
        else {
            order_input_form.email2.value = order_input_form.email_select.value;
        }
    }

// 우편번호 주소검색
function openZipSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			$('[name=order_zipcode]').val(data.zonecode); // 우편번호 (5자리)
			$('[name=order_addr1]').val(data.address);	// 기본주소
			$('[name=order_addr2]').val(data.buildingName);	// 상세주소
			$('[name=order_addr2]').focus();
			console.log(data);
		}
	}).open();
}


// 배송지 선택
function reset_shipping_value(){
	var selected_radio = $('input[name="location_radio"]:checked').val();
	
	if(selected_radio == 'new_address'){
		$('#order_receipt').val('');
		$('#order_receipt').focus();
		$('#order_zipcode').val('');
		$('#order_addr1').val('');
		$('#order_addr2').val('');
		$('#order_phone1').val('');
		$('#order_phone2').val('');
		$('#order_phone3').val('');
		$('#order_email1').val('');
		$('#order_email2').val('');
		$('#email_select').find('option:first').prop('selected', true);
		$('#order_message').val('');
	}else if(selected_radio == 'member_address'){
		var order_name = '<%=member_email1 %>';
		console.log(order_name);
		$('#order_receipt').val(order_name);
	}
}

// 처음에 카카오페이 내용 뜨게
jQuery(function($){
	$('#check_method_kakao').show();
	$('#check_method_account').hide();
})

// 결제수단 선택
function choose_pay_method(){
	var select = $('input[name="order_pay_system"]:checked').val();	
	if(select == '카카오페이'){
		$('#check_method_kakao').show();
		$('#check_method_account').hide();
	}else if(select == '무통장입금'){
		$('#check_method_kakao').hide();
		$('#check_method_account').show();
	}
}

// 정보 입력 확인
function chk_d_info(){
	var b = true;
	if(b){b = chk_d_name();}
	if(b){b = chk_d_addr();}
	if(b){b = chk_d_phon();}
	return b;
}

function chk_d_name(){
	if($('#order_receipt').val() == '') {
		alert('수취인명을 입력해주세요.');
		return false;
	}
	return true;
}

function chk_d_addr(){
	if($('#order_zipcode').val() == '' | $('#order_addr1').val() == ''){
		alert('배송지 주소를 입력해주세요.');
		return false;
	}
	return true;
}

function chk_d_phon(){
	if($('#order_phone1').val().length != 3 | $('#order_phone2').val().length < 3 | $('#order_phone3').val().length != 4) {
		alert('연락처를 정확히 입력해주세요.');
		return false;
	}
	return true;
}


function check_order_refund_info(){
	var orb = document.order_input_form.order_refund_bank.value;
	if(orb == '') {
		alert('환불 은행을 선택해주세요.');
		return false;
	}
	if($('#order_refund_account').val() == '') {
		alert('환불 계좌를 입력해주세요.');
		return false;
	}
	return true;
}

