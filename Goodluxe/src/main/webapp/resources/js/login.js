$(document).ready(function(){

});

// 로그인 관련 변수
var speed1 = 450;
var speed2 = 450;
var $li_login = $('li.login');
var $login_bg = $('.login_bg');
var $login_top = $('.login_top');
var $login_right = $('.login_right');
var $login_bottom = $('.login_bottom');
var $login_left = $('.login_left');
var $login_area = $('.login_area');
var $login_close = $('.login_close');
var $input_login = $('.input_login');
var $login_btn = $('.login_btn');
var $topmenu = $('.topmenu');
var $membermenu = $('.member_menu');
var $logout = $('.logout');

// 로그인창 열기
$li_login.on('click',function(){
	$login_bg.css({'display':'block'});
	$login_top.animate({'width':'100%'},speed1,function(){
		$login_right.animate({'height':'100%'},speed2);
    });
	$login_bottom.animate({'width':'100%'},speed1,function(){
		$login_left.animate({'height':'100%'},speed2
        );
		$login_area.fadeIn(speed2*2);
    });
});
// 로그인창 닫기
$login_close.on('click',function(){
	$input_login.val('');
	$login_top.animate({'width':'0%'},speed1);
	$login_right.animate({'height':'0%'},speed1);
	$login_bottom.animate({'width':'0%'},speed1);
    $login_left.animate({'height':'0%'},speed1);
    $login_area.fadeOut(speed1*2, function(){
    	$login_bg.css({'display':'none'});
    });
});
// 로그인 정보 입력창
$input_login.on('focusout',function(){
    if($(this).val() != '') {
        $(this).siblings('label').addClass('color');
    } else {
        $(this).siblings('label').removeClass('color');
    }
});
// 로그인 하기
$login_btn.on('click',function(){
	$login_bg.css({'display':'none'});
	$topmenu.removeClass('on');
	$membermenu.addClass('on');
});
// 로그아웃 하기
$logout.on('click', function(){
//    $('.topmenu').removeClass('on');
//    $('.nonmember_menu').addClass('on');
	location.href="mypageOAS.do";
});