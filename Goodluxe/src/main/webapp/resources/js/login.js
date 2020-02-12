$(document).ready(function(){
    var speed1 = 450;
    var speed2 = 450;
    $('.input_login').on('focusout',function(){
        if($(this).val() != '') {
            $(this).siblings('label').addClass('color');
        } else {
            $(this).siblings('label').removeClass('color');
        }
    });

    $('li.login').on('click',function(){
        $('.login_bg').css({'display':'block'});
        $('.login_top').animate({'width':'100%'},speed1,function(){
            $('.login_right').animate({'height':'100%'},speed2);
        });
        $('.login_bottom').animate({'width':'100%'},speed1,function(){
            $('.login_left').animate({'height':'100%'},speed2
            );
            $('.login_area').fadeIn(speed2*2);
        });
    });
    // $('li.login').on('click',function(){
    //     $('.login_bg').css({'display':'block'});
    //     $('.login_top').animate({'width':'100%'},speed1,function(){
    //         $('.login_right').animate({'height':'100%'},speed2,function(){
    //             $('.login_bottom').animate({'width':'100%'},speed1,function(){
    //                 $('.login_left').animate({'height':'100%'},speed2
    //                 );
    //                 $('.login_area').fadeIn(speed2*2);
    //             });
    //         });
    //     });
    // });

    $('.login_close').on('click',function(){
        $('.input_login').val('');
        $('.login_top').animate({'width':'0%'},speed1);
        $('.login_right').animate({'height':'0%'},speed1);
        $('.login_bottom').animate({'width':'0%'},speed1);
        $('.login_left').animate({'height':'0%'},speed1);
        $('.login_area').fadeOut(speed1*2, function(){
            $('.login_bg').css({'display':'none'});
        });
    });
});

