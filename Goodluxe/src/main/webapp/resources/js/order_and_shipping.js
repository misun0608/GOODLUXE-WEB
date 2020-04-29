$(document).ready(function () {

    $('ul.tabs li').click(function () {
      /* $(".select-content").hide(); */
  
      var tab_id = $(this).attr('data-tab');
  
      $('ul.tabs li').removeClass('current');
      $('.tab-content').removeClass('current');
      // 탭추가
      $('a').removeClass('current');
  
      $(this).addClass('current');
      $("#" + tab_id).addClass('current');
      // 탭추가
  
    });
  
    $('.tabs>li>a').on('click',function(){
      $('.tabs>li>a').removeClass('on');
      $(this).addClass('on');
    })
  });
  
  