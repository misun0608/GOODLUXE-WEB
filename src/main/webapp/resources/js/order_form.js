// 이메일 입력 선택
function emailAddr() {
    if (shipping_info_form.email_select.value == 'etc') {
        shipping_info_form.email2.readOnly = false;
        shipping_info_form.email2.value = '';
        shipping_info_form.email2.focus();
        }
        else {
            shipping_info_form.email2.value = shipping_info_form.email_select.value;
        }
    }