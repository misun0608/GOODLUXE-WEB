$(document).ready(function () {
	console.log('들어오나');
  $('ul.inquiry_tabs li').click(function () {

    var tab_id = $(this).attr('data-tab');
    console.log(tab_id);

    $('ul.inquiry_tabs li').removeClass('current');
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

