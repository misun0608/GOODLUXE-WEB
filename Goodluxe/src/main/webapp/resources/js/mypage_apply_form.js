$(document).ready(function(){

});

function add_list(){
    var b = true;
    if(b) { b = check_brand(); }
    if(b) { b = check_category(); }
    if(b) { b = check_amn(); }
    if(b) { b = check_ahp(); }
    if(b) { b = check_aby(); }
    if(b) { b = check_abp(); }
    if(b) { b = check_abs(); }
    if(b) { b = check_amp(); }
    if(b) { b = check_smethod(); }
    if(b) { b = check_dmethod(); }
    if(b) { b = check_info(); }
    if(b) { document.write_form.submit(); }
    
}

function check_brand(){
    if(document.write_form.selected_brand.value == "") {
        alert("브랜드를 선택해주세요.");
        return false;
    } else if(document.write_form.selected_brand.length != 1) {
        var cnt = 0;
        for(i = 0; i <document.write_form.selected_brand.length; i++ ){
            if(document.write_form.selected_brand.options[i].selected) {
                cnt++;
            }
        }
        if(cnt != 1) {
            alert("브랜드는 하나만 선택하실 수 있습니다.");
            return false;
        }
    }
    return true;
}

function check_category(){
    if(document.write_form.selected_category.value == "") {
        alert("카테고리를 선택해주세요.");
        return false;
    } else if(document.write_form.selected_category.length != 1) {
        var cnt = 0;
        for(i = 0; i <document.write_form.selected_category.length; i++ ){
            if(document.write_form.selected_category.options[i].selected) {
                cnt++;
            }
        }
        if(cnt != 1) {
            alert("카테고리는 하나만 선택하실 수 있습니다.");
            return false;
        }
    }
    return true;
}

function check_amn(){
    if(document.write_form.ap_md_name.value == "") {
        alert("상품명을 입력해주세요.");
        return false;
    }
    return true;
}

function check_ahp(){
    if(document.write_form.ap_hope_price.value == "") {
        alert("판매희망가를 입력해주세요.");
        return false;
    }
    return true;
}

function check_aby(){
    if(document.write_form.ap_buy_year.value == "") {
        alert("구매연도를 입력해주세요.");
        return false;
    }
    return true;
}

function check_abp(){
    if(document.write_form.ap_buy_price.value == "") {
        alert("구매가격을 입력해주세요.");
        return false;
    }
    return true;
}

function check_abs(){
    if(document.write_form.ap_buy_store.value == "") {
        alert("구매매장을 입력해주세요.");
        return false;
    }
    return true;
}

function check_amp(){
    if(document.write_form.ap_md_pictures.files.length < 3) {
        alert("제품 사진을 최소 3장 이상 업로드해주세요.");
        return false;
    }
    return true;
}

function check_smethod(){
    if(document.write_form.smethod.value == "") {
        alert("판매방법을 선택해주세요.");
        return false;
    }
    return true;
}

function check_dmethod(){
    if(document.write_form.dmethod.value == "") {
        alert("배송방법을 선택해주세요.");
        return false;
    }
    return true;
}

function check_info(){
    var info = "브랜드 : " + document.write_form.selected_brand.value
                + "\n카테고리 : " + document.write_form.selected_category.value
                + "\n상품명 : " + document.write_form.ap_buy_store.value
                + "\n판매희망가 : " + document.write_form.ap_hope_price.value
                + "\n구매연도 : " + document.write_form.ap_buy_year.value
                + "\n구매가격 : " + document.write_form.ap_buy_price.value
                + "\n구매매장 : " + document.write_form.ap_buy_store.value
                + "\n판매방법 : " + document.write_form.smethod.value
                + "\n배송방법 : " + document.write_form.dmethod.value
                + "\n\n위의 정보로 판매신청을 하시겠습니까?"
    var c = confirm(info);
    return c;
}