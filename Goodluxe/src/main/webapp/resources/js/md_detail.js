$(document).ready(function(){
    $('.detail_main_image_left').on('click',function(){
        var link = $(this).children().children().attr('src');
        console.log(link);
        $('.detail_main_image_link_right>img').attr('src', link);
    });
});