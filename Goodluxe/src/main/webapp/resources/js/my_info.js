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
//우편번호 주소검색
function openZipSearch() {
   new daum.Postcode({
      oncomplete: function(data) {
         $('[name=order_zipcode]').val(data.zonecode); // 우편번호 (5자리)
         $('[name=order_addr1]').val(data.address);   // 기본주소
         $('[name=order_addr2]').val(data.buildingName);   // 상세주소
         $('[name=order_addr2]').focus();
         console.log(data);
      }
   }).open();
}