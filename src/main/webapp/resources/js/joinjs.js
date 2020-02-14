$(document).ready(function () {

    // 체크박스 전체선택 및 전체해제
    $('#chk_all').on('click', function () {
        if ($("#chk_all").is(":checked")) {
            $(".chk").prop("checked", true);
        }
        else {
            $(".chk").prop("checked", false);
        }
    });

    // 한개의 체크박스 선택 해제시 전체선택 체크박스도 해제
    $(".chk").click(function () {
        if ($("input[name='chk']:checked").length == 3) {
            $("#chk_all").prop("checked", true);
        } else {
            $("#chk_all").prop("checked", false);
        }
    });
});