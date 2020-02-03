$(document).ready(function(){
	// 로그인 관련 변수
    var speed1 = 450;
    var speed2 = 450;
    // 로그인창 열기
    $('body').on('click','li.login',function(){
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
    // 로그인창 닫기
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
    // 로그인 정보 입력창
    $('.input_login').on('focusout',function(){
        if($(this).val() != '') {
            $(this).siblings('label').addClass('color');
        } else {
            $(this).siblings('label').removeClass('color');
        }
    });
    // 로그인 하기
    $('.login_btn').on('click',function(){
        $('.login_bg').css({'display':'none'});
        $('.topmenu').removeClass('on');
        $('.member_menu').addClass('on');
    });
    // 로그아웃 하기
    $('body').on('click','.logout', function(){
//        $('.topmenu').removeClass('on');
//        $('.nonmember_menu').addClass('on');
    	location.href="mypageOAS.do";
    });
    
    $('.joinform4_login_btn').on('click', function(){
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

    // 알림 클릭 시 창 열고 닫기
    $('html').on('click', function(e) {
        if( $(e.target).is('.notice_btn') ) {
            if( $('.notice_content').css('display') == 'none' ) {
                $('.notice_content').css({'display':'block'});
            } else {
                $('.notice_content').css({'display':'none'});
            }
        } else if ( !$(e.target).is('.notice_content *') && ($('.notice_content').css('display') == 'block') ) {
            $('.notice_content').css({'display':'none'});
        }
    });
    
	//    var $search_area = $('.search_area');
    // 검색창 클릭
    $('body').on('click','.search_icon',function(){
    	console.log($('.search_area'));
        var nav_length = $('.nav_area').width();
        var nav_height = $('.nav_area').height();
        $('.search_area').css({'height':nav_height});
        $('.search_area').css({'display':'block'});
        $('.search_area').stop().animate({'width':nav_length},500);
    });
    // 검색창 닫기
    $('body').on('click','.search_close_icon',function(){
    	$('.search_area').fadeOut(500);
    	$('.search_area').animate({'width':'0px'},100);
    });
    // 검색
    $('body').on('click','.search_btn', function(){
        location.href="search_result.html";
    });
});