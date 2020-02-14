$(document).ready(function(){
    var $search_area = $('.search_area');

    // 검색창 클릭
    $('.search_icon').on('click',function(){
        $search_area.css({'display':'block'});
        $search_area.stop().animate({'width':'1080px'},500);
    });
    // 검색창 닫기
    $('.search_close_icon').on('click',function(){
        $search_area.fadeOut(500);
        // $search_area.css({'display':'none'});
        $search_area.animate({'width':'0px'},100);
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

    // 로그인
    $('.login_btn').on('click',function(){
        $('.login_bg').css({'display':'none'});
        $('.topmenu').removeClass('on');
        $('.member_menu').addClass('on');
    })

    // 로그아웃
    $('.logout').on('click', function(){
        $('.topmenu').removeClass('on');
        $('.nonmember_menu').addClass('on');
    });

    // 검색
    $('.search_btn').on('click', function(){
        location.href="search_result.html"
    });
});