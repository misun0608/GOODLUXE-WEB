$(document).ready(function(){
    $('.main_image_left').on('mouseenter',function(){
        var mouse_img_src = $(this).children().children().attr('src');
        var mouse_link_src = $(this).children().attr('href');
        $('.main_image_link_right>img').attr('src',mouse_img_src);
        $('.main_image_link_right').attr('href',mouse_link_src);
    });

    var posArr = [];
    var len = $('.mp_3rd').children('a').length / 4;
    var base = -700;

    for(var i = 0; i < len; i++) {
        posArr.push($('.mp_3rd>a').eq(4*i).offset().top);
    }
    posArr.push($('.mp_3rd>a').last().offset().top + $('.mp_3rd>a').last().height());

    $(window).on('scroll',function(){
        var scroll = $(this).scrollTop();

        for(var i = 0; i < len; i++) {
            if(scroll >= posArr[i]+base && scroll < posArr[i+1]+base) {
                $('#navi>li').eq(i).addClass('on');
                $('.mp_3rd>a').eq(4*i).addClass('on');
                $('.mp_3rd>a').eq(4*i+1).addClass('on');
                $('.mp_3rd>a').eq(4*i+2).addClass('on');
                $('.mp_3rd>a').eq(4*i+3).addClass('on');
            }
        }
    });
});