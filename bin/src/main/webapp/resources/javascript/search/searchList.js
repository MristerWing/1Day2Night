$(function() {
    var normalSerarch = new FileReader();
    normalSerarch.innerText = normalSerarch.result;

    // 일반검색

    // 태그로 이동
    $(".tag_link_btn").click(function() {
        $(".search #layout-1").attr("style", "display: none;");
        $(".search #layout-3").attr("style", "display: block;");
    });

    // 상세검색으로 이동
    $(".de_btn01").click(function() {
        $(".search #layout-1").attr("style", "display: none;");
        $(".search #layout-2").attr("style", "display: block;");
    });

    // 태그 상세검색이동
    $("#layout-3 > div.tagSearch_btn_wrap > a.btn_detail").click(function() {
        $(".search #layout-3").attr("style", "display: none;");
        $(".search #layout-1").attr("style", "display: block;");
    });

    // 상세검색

    // 닫기
    $("#campSearchForm3 > div > ul > li.detail_btn_w > button.exit.button").click(
        function() {
            $(".search #layout-2").attr("style", "display: none;");
            $(".search #layout-1").attr("style", "display: block;");
        }
    );
});

