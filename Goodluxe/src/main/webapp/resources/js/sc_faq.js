$(document).ready(function(){
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
      