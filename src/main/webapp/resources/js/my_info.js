// 이메일 입력 선택
function emailAddr() {
    if (member_my_info_form.email_select.value == 'etc') {
        member_my_info_form.email2.readOnly = false;
        member_my_info_form.email2.value = '';
        member_my_info_form.email2.focus();
        }
        else {
            member_my_info_form.email2.value = member_my_info_form.email_select.value;
        }
    }