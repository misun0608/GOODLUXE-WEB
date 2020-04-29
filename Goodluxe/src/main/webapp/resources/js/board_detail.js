$(document).on('click','.comm_reply_btn', function(){
    var class_name = ".comm_write_form" + $(this).attr('form_index');
    if($(class_name).css('display') == "none") {
        $('.tr_comment_write').hide();
        $(class_name).show();
    } else {
        $(class_name).hide();
    }
});

$(document).on('click','.comm_update_btn', function(){
    var class_name = ".comm_update_form" + $(this).attr('form_index');
    if($(class_name).css('display') == "none") {
        $('.tr_comment_write').hide();
        $(class_name).show();
    } else {
        $(class_name).hide();
    }
});

