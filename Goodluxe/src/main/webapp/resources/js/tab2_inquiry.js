$(document).ready(function(){

	$('ul.tabs li').click(function(){
        $(".select-content").hide();

		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
        $("#"+tab_id).addClass('current');
    });

    $(".select-content").val("val2");
    // $(".select-content").not(':first').hide();
    $(".select-content").on(':first',function(){6
      var ready_link = $(':first').val();
      var select_num = $(this).prop('selectedIndex');
      $('ul.tabs li').eq(select_num).addClass("activeClass").siblings().removeClass('activeClass');
      // $(".select-content").hide();
      $(ready_link).show();
      console.log(ready_link);
    });

    // $(".select-content").ready(':first'.hide(){
    //     var select_first = $(this).prop('selectedIndex');
    //     $('ul.tabs li').eq(select_first).addClass("activeClass").siblings().removeClass('activeClass');
    //     $(".select-content").hide();
    //     $(':first').show();
    //     console.log(':first');
    // });

      // 모바일 화면에서 select로 메뉴 바뀜
    $("select#tabmenu").on("change",function(){
        var select_link = $("select#tabmenu").val();
        var select_num = $(this).prop('selectedIndex');
        $('ul.tabs li').eq(select_num).addClass("activeClass").siblings().removeClass('activeClass');
        $(".select-content").hide();
        $(select_link).show();
        console.log(select_link);
      });

      // FAQ 테이블 제목 클릭시 내용 보이도록 하는 기능(토글)
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
      