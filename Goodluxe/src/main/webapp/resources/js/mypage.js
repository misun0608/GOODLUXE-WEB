$(document).ready(function(){
    var isActive = false;

    $('.the_card').on('mouseenter',function(){
        if(!isActive) {
            isActive = true;
            $(this).stop().css({'transform':'rotateY(180deg)'});
            setTimeout(function(){
                isActive = false;
            },100);
        }
    });
    $('.the_card').on('mouseleave',function(){
        if(!isActive) {
            isActive = true;
            $(this).stop().css({'transform':'rotateY(0deg)'});
            // setTimeout(function(){
                isActive = false;
            // },300);
        }
    })
});