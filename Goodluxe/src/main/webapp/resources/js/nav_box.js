$(document).ready(function(){
	var $search_area = $('.search_area');
  // 검색창 클릭
  $('.search_icon').on('click',function(){
  	console.log($search_area);
      var nav_length = $('.nav_area').width();
      var nav_height = $('.nav_area').height();
      $search_area.css({'height':nav_height});
      $search_area.css({'display':'block'});
      $search_area.stop().animate({'width':nav_length},500);
  });
  // 검색창 닫기
  $('body').on('click','.search_close_icon',function(){
	  $search_area.fadeOut(500);
	  $search_area.animate({'width':'0px'},100);
  });
});