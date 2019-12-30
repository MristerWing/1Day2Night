<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
    <head>
        <link
            rel="stylesheet"
            href="../resources/css/owner/register.css"
            type="text/css"
            media="all"
        />
    </head>
    <body>
        <div class="main-content top"></div>
        <div class="owner">
            <div class="register">
                <div class="container content-area">
                    <div class="register-area border rounded mx-auto">
                        <label class="main-text mx-auto">사업자 등록</label>
                        <input
                            type="text"
                            id="owner_id"
                            class="mx-auto"
                            placeholder="사업자번호 입력"
                        />
                        <button
                            type="button"
                            class="mx-auto btn btn-primary"
                            data-toggle="modal"
                            data-target="#checkModal"
                            id="modalButton"
                        >
                            확인하기
                        </button>
                        <button
                            class="mx-auto btn btn-primary"
                            disabled="disabled"
                            id="okButton"
                        >
                            다음
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div
            class="modal fade"
            id="checkModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="checkLabel"
            aria-hidden="true"
        >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="checkLabel">
                            사업자 번호 확인중
                        </h5>
                        <button
                            type="button"
                            class="close"
                            data-dismiss="modal"
                            aria-label="Close"
                        >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="progress">
                            <div
                                class="progress-bar progress-bar-striped progress-bar-animated"
                                role="progressbar"
                                aria-valuenow="75"
                                aria-valuemin="0"
                                aria-valuemax="100"
                            ></div>
                        </div>
                        <button
                            class="mx-auto btn btn-primary"
                            disabled="disabled"
                            id="checkProButton"
                        >
                            확인중
                        </button>
                    </div>
                    <script type="text/javascript">
                        $("#checkModal").on("show.bs.modal", function() {
                            var persent = 0;
                            var progressTime = setTimeout(function() {
                                $(
                                    "#checkModal > div > div > div.modal-body > div > div"
                                ).css("width", persent + "%");
                                persent += 33.3;
                                var check = setTimeout(function() {
                                    $(
                                        "#checkModal > div > div > div.modal-body > div > div"
                                    ).css("width", "100%");

                                    if ($("#owner_id").val() == 1) {
                                        $("#checkProButton")
                                            .text("확인완료")
                                            .removeAttr("disabled");
                                        $("#checkButton").attr("disabled");
                                        $("#okButton").removeAttr("disabled");
                                    } else {
                                        $("#checkProButton")
                                            .text("확인")
                                            .removeAttr("disabled");
                                        $("#okButton").attr("disabled", "disabled");
                                    }
                                }, 3000);
                            }, 1000);
                        });
                        $("#checkModal").on("hidden.bs.modal", function() {
                            $(
                                "#checkModal > div > div > div.modal-body > div > div"
                            ).css("width", "0%");
                        });
                    </script>
                </div>
            </div>
        </div>
    </body>
</html>
