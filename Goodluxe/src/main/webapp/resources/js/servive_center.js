$(document).ready(function(){

  /* 고객센터 탭 메뉴 실행 부분*/
	$('ul.service_center_menu_tabs li').click(function(){
        $(".select-content").hide();

		var tab_id = $(this).attr('data-tab');

		$('ul.service_center_menu_tabs li').removeClass('current');
		$('.center_tab-content').removeClass('current');

		$(this).addClass('current');
        $("#"+tab_id).addClass('current');
    });

    /* 얘가 없으면 새로고침 시 첫 화면(선택되어 있는 화면)이 안뜸 */
    $(".select-content").val("val2");
    $(".select-content").not(':first').hide();
    $(".select-content").on(':first',function(){
      var ready_link = $(':first').val();
      var select_num = $(this).prop('selectedIndex');
      $('ul.tabs li').eq(select_num).addClass("activeClass").siblings().removeClass('activeClass');
      // $(".select-content").hide();
      $(ready_link).show();
    });

      // 모바일 화면에서 select로 메뉴 선택 시 아래 화면 바뀜(FAQ 테이블 등)
    $("select#tabmenu").on("change",function(){
        var select_link = $("select#tabmenu").val();
        var select_num = $(this).prop('selectedIndex');
        $('ul.tabs li').eq(select_num).addClass("activeClass").siblings().removeClass('activeClass');
        $(".select-content").hide();
        $(select_link).show();
        console.log(select_link);
      });

      // FAQ 테이블 제목 클릭시 내용 보이도록 하는 기능(토글)
    $(".center_faq").on("click",function(){
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
      