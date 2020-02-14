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

  $('.step').click(function () {
    var tab = $(this).attr('data-tab');
    $('.step').removeClass('show');
    $('.tab').removeClass('show');
    $(this).addClass('show');
    $("#" + tab).addClass('show');
  });

  $('.tabs>li>a').on('click',function(){
    $('.tabs>li>a').removeClass('on');
    $(this).addClass('on');
  })
});

