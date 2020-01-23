$(document).ready(function(){
    var event_arr = [];
    var event_len = $('.navi>li').length;
    var base = -200;

    for (var i = 0; i < event_len; i++) {
        event_arr.push($('.ep_1st>a').eq(i).children().offset().top);
    }
    event_arr.push($('.ep_1st>a').last().children().offset().top  + $('.ep_1st>a').last().children().height());
    // console.log(event_arr);

    $(window).on('scroll',function(){
        var scroll = $(this).scrollTop();
        $('.navi>li').removeClass('on');

        for(var i = 0; i < event_len; i++) {
            if(scroll >= event_arr[i]+base && scroll < event_arr[i+1]+base) {
                $('.navi>li').eq(i).addClass('on');
            } else if (scroll < event_arr[0]+base) {
                $('.navi>li').eq(0).addClass('on');
            }
        }
    });

    $('.navi>li').on('click',function(){
        var i = $(this).index();
        var event_target = $('.ep_1st>a').eq(i).children().offset().top;
        $('html,body').stop().animate({scrollTop:event_target},1000);
    })

});