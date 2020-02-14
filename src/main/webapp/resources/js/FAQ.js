$(document).ready(function(){

	$('ul.tabs li').click(function(){
        $(".select-content").hide();

		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
        $("#"+tab_id).addClass('current');
    });

    $(".select-content").not(':first').hide();
    $("select#tabmenu").on("change",function(){
        var select_link = $("select#tabmenu").val();
        var select_num = $(this).prop('selectedIndex');
        $('ul.tabs li').eq(select_num).addClass("activeClass").siblings().removeClass('activeClass');
        $(".select-content").hide();
        $(select_link).show();
        console.log(select_link);
      });

      // FAQ 테이블 클릭시 내용 보이도록 하는 기능
    $(".faq").on("click",function(){
        var obj = $(this);
        if( obj.hasClass("table-plus") ){
          obj.hide();
          obj.next().show();            
          obj.parent().parent().next().show();
        }else{
           obj.hide();
           obj.prev().show();
           obj.parent().parent().next().hide();
        }
      });
    });
      