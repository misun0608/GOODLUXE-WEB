$(document).ready(function(){
	
});

var $html = $('html');
var $notice_content = $('.notice_content');
// 알림 클릭 시 창 열고 닫기
$('html').on('click', function(e) {
    if( $(e.target).is('.notice_btn') ) {
        if( $notice_content.css('display') == 'none' ) {
            $notice_content.css({'display':'block'});
        } else {
        	$notice_content.css({'display':'none'});
        }
    } else if ( !$(e.target).is('.notice_content *') && ($notice_content.css('display') == 'block') ) {
    	$notice_content.css({'display':'none'});
    }
});