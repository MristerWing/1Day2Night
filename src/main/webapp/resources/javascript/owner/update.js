function makeCheckBoxs(allArray, data, id) {
    var selected = data.replace(/ /gi, "").split(/,|\+/);
    //console.log(id, selected);
    for (var i = 0; i < allArray.length; i++) {
        var checked = "";
        if (selected.some(x => x == allArray[i])) {
            checked = "checked";
        }
        var labelfor = i + 1;
        $("#" + id).append(
            "<div class='form-check-inline'>" +
                "<br>" +
                "<label class='form-check-label' for='" +
                id +
                "-checkbox" +
                labelfor +
                "'>" +
                "<input type='checkbox' class='form-check-input' id='" +
                id +
                "-checkbox" +
                labelfor +
                "' name='" +
                id +
                "' value='" +
                allArray[i] +
                "' " +
                checked +
                ">" +
                allArray[i] +
                "</label>" +
                "</div>"
        );
    }
}

function returnForm(root) {
    const form = $("#inputForm");

    /* 히든타입 추가해야할 목록
     *
     * camp_type
     * tag
     * location_type
     * operation_type
     * operation_period
     * operation_day
     * content_modified_date 백엔드 처리
     * main_facilities
     */

    var hiddenArray = [
        { campType: "camp_type" },
        { tag: "tag" },
        { loc: "location_type" },
        { oper: "operation_type" },
        { opPeriod: "operation_period" },
        { opDay: "operation_day" },
        { mainFacilities: "main_facilities" }
    ];

    for (var index of hiddenArray) {
        // 체크박스 값 가져오기
        //console.log(Object.keys(index)[0], index);
        var str = "";
        var key = Object.keys(index)[0];
        $("input[name=" + key + "]:checked").each(function() {
            str += $(this).val() + ",";
        });
        $("input[name=" + index[key] + "]").remove();
        form.append(
            "<input type='hidden' name='" +
                index[key] +
                "' value='" +
                str +
                "'></input>"
        );
    }

    form.append(
        "<input type='hidden' name='" +
            "site_size" +
            "' value='" +
            $("input[name=siteWidth]").val() +
            " X " +
            $("input[name=siteHeight]").val() +
            " · " +
            $("input[name=siteNumbers]").val() +
            "개" +
            "'></input>"
    );

    console.log(hiddenArray);

    /* ajax이용 비동기파일처리 요구
     * mainImage ->
     * main_image
     *
     * subImage ->
     * sub_image1
     * sub_image2
     * sub_image3
     */

    var formData = new FormData(form[0]);

    /*    $.ajax({
        type: "POST",
        url: root + "/owner/ownerUpdateFile.json",
        enctype: "multipart/form-data",
        cache: false,
        processData: false,
        contentType: false,
        data: formData,
        dataType: "json",
        success: function(response) {}
    });*/

    console.log(form[0]);
    console.log($("#inputForm input[name=mainImage]"));
    console.log($("#inputForm input[name=subImage]"));

    form.submit();
}
