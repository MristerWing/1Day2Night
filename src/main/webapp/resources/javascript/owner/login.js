function login(root) {
    var params = { owner_key : $("#owner_key").val(),
                    user_num : }
    var url = root + "/owner/loginOk.do";
    $.ajax({
        type: "POST",
        url: "url",
        async: false,
        data: "data",
        dataType: "dataType",
        success: function (response) {
            
        }
    });
}
