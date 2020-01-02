/*영상보기 탭메뉴*/
$(document).ready(function() {
	$('.tabLink').click(function(){
		var tab_id = $(this).attr('data-type');
		$('.tabLink').removeClass('on');
		$('.tCont').removeClass('on');
		$(this).addClass('on');
		$("#"+tab_id).addClass('on');
	})
});

/*캠핑장상세검색 리스트페이지 > 상단 상세검색 영역 모바일버전에서는 열고닫기 기능으로 제공*/ 
 $(document).ready(function(){ //DOM이 준비되고
    $('.form_openTT').click(function(){ // #toggleButton2를 클릭하면
        // $('.form_w').toggle(); // #moreMenu2를 알아서 토.글!
        if ($(".form_w").is(":visible")) {
        	$(".form_w").slideUp();
        } else {
        	$(".form_w").slideDown();
        }
    });
});
 

$(document).ready(function() {
	/*게시판 첨부파일 열고닫기*/
	$(".file_down").find(".file_open").click(function() {console.log($(".file_down").find(".file_list").is(":visible"));
		if ($(".file_down").find(".file_list").is(":visible")) {
			$(".file_down").find(".file_list").slideUp();
			$(".file_down").find(".file_open").empty();
			$(".file_down").find(".file_open").html("열기");
		} else {
			$(".file_down").find(".file_list").slideDown();
			$(".file_down").find(".file_open").empty();
			$(".file_down").find(".file_open").html("닫기");
		}
	});
});

/*레이어팝업*/
$(function(){
  /*$('.pop_close2').click(function(){
    $('.popup_layer').hide();
  });*/
});

/*top버튼클릭시 상단으로*/
$( document ).ready( function() {
	$( window ).scroll( function() { 
		if ( $( this ).scrollTop() > 200 ) { 
			$( '.btn_top' ).fadeIn(); 
		} 
		else { 
			$( '.btn_top' ).fadeOut(); 
			} 
		} ); 
	
	$( '.btn_top' ).click( function() { 
		$( 'html, body' ).animate( { scrollTop : 0 }, 400 ); 
		return false; 
		} ); 
	} );
 

/**/

function detailSearchForm() {
	$(".folder_w").hide();

	if ($("html").width() < 828) {
		$(".detail_search_w").find("ul").find("li").each(function() {
			$(this).find(".tm_ver").removeClass("f_open");
			$(this).find(".tm_ver").addClass("f_close");
		});

		$(".detail_search_w").find("ul").find("li").eq(0).find(".folder_w").slideDown();
		$(".detail_search_w").find("ul").find("li").eq(0).find(".tm_ver").removeClass("f_close");
		$(".detail_search_w").find("ul").find("li").eq(0).find(".tm_ver").addClass("f_open");
	} else {
		$(".detail_search_w").find("ul").find("li").each(function() {
			$(this).find(".folder_w").show();
			$(this).find(".tm_ver").removeClass("f_close");
			$(this).find(".tm_ver").addClass("f_open");
		});
	}
}

$(window).resize(function() {
	//detailSearchForm(); // 리사이즈될때 실행
});

$(document).ready(function() {
	detailSearchForm(); // 로드될때 실행

	$(".tm_ver button").click(function() {
		var idx = $(this).parent().parent().index();

		$(".detail_search_w").find("ul").find("li").each(function() {
			if ($(this).index() != idx) {
				$(this).find(".folder_w").slideUp();
				$(this).find(".tm_ver").removeClass("f_open");
				$(this).find(".tm_ver").addClass("f_close");
			}
		});

		if ($(this).parent().hasClass("f_open") == true) {
			$(this).parent().find(".folder_w").slideUp();
			$(this).parent().removeClass("f_open");
			$(this).parent().addClass("f_close");
		} else {
			$(this).parent().find(".folder_w").slideDown();
			$(this).parent().removeClass("f_close");
			$(this).parent().addClass("f_open");
		}
	});

	/* 슬라이드01 */
	/*
	 * var bannerAuto = null; var bannerDirect = "left"; var bannerList = $(".tour_list"); var bannerWidth =
	 * bannerList.find("li:first-child").innerWidth(); var bannerTime = 3000; //시간
	 * 
	 * $bannerLeft = $(".owl-nav").find(".left_btn_b"); $bannerRight = $(".owl-nav").find(".right_btn_b");
	 * 
	 * function banner_width() { bannerWidth = bannerList.find("li:first-child").innerWidth(); }
	 * 
	 * bannerAuto = setTimeout(rightBanner, bannerTime)
	 * 
	 * function rightBanner() { banner_width();
	 * 
	 * bannerList.stop().animate({ left : "-=" + bannerWidth }, 1000, function() { var $bannerObj =
	 * bannerList.find("li:first-child").clone(true); bannerList.find("li:first-child").remove(); bannerList.css("left", 0);
	 * bannerList.append($bannerObj); }); if (bannerAuto) clearTimeout(bannerAuto); bannerAuto = setTimeout(rightBanner, bannerTime) }
	 * 
	 * function leftBanner() { banner_width();
	 * 
	 * bannerList.stop().animate({ left : "0px" }, 0, function() { var $bannerObj = bannerList.find("li:last").clone(true);
	 * bannerList.find("li:last").remove(); bannerList.css("left", "0"); bannerList.prepend($bannerObj); }); if (bannerAuto)
	 * clearTimeout(bannerAuto); bannerAuto = setTimeout(rightBanner, bannerTime); }
	 * 
	 * $bannerLeft.click(function() { bannerDirect = "left"; clearTimeout(bannerAuto); leftBanner(); });
	 * 
	 * $bannerRight.click(function() { bannerDirect = "right"; clearTimeout(bannerAuto); rightBanner(); });
	 */

	/* 서브메뉴슬라이드 */
	/*
	 * $(".mngroup").click(function() { if ($(this).find("ul").is(":visible")) { $(this).find("ul").each(function() { $(this).slideUp(); }); }
	 * else { $(this).find("ul").each(function() { $(this).slideDown(); }); } });
	 */

	/* 서브메뉴슬라이드 */
	$(".step").click(function() {
		var idx = $(this).parent().index();

		$(".mngroup").each(function() {
			if (!($(this).index() == idx)) {
				$(this).find("ul").slideUp();
			}
		});

		if ($(".mngroup").eq(parseInt(idx) - 1).find(".menuUl").is(":visible")) {
			$(".mngroup").eq(parseInt(idx) - 1).find(".menuUl").slideUp();
		} else {
			$(".mngroup").eq(parseInt(idx) - 1).find(".menuUl").slideDown();
		}
	});

});

/* 캠핑족을위한꿀팁 */
/*
 * $(document).ready(function() { var bannerAuto = null; var bannerDirect = "left"; var bannerList = $(".tip_list_w ul"); var bannerWidth =
 * bannerList.find("li:first-child").innerWidth(); var bannerTime = 3000; //시간
 * 
 * $bannerLeft = $(".tip_btn_w").find(".preBtn01"); $bannerRight = $(".tip_btn_w").find(".nextBtn01");
 * 
 * function banner_width() { bannerWidth = bannerList.find("li:first-child").innerWidth(); }
 * 
 * bannerAuto = setTimeout(rightBanner, bannerTime)
 * 
 * function rightBanner() { banner_width();
 * 
 * bannerList.stop().animate({ left : "-=" + bannerWidth }, 1000, function() { var $bannerObj =
 * bannerList.find("li:first-child").clone(true); bannerList.find("li:first-child").remove(); bannerList.css("left", 0);
 * bannerList.append($bannerObj); }); if (bannerAuto) clearTimeout(bannerAuto); bannerAuto = setTimeout(rightBanner, bannerTime) }
 * 
 * function leftBanner() { banner_width();
 * 
 * bannerList.stop().animate({ left : "0px" }, 0, function() { var $bannerObj = bannerList.find("li:last").clone(true);
 * bannerList.find("li:last").remove(); bannerList.css("left", "0"); bannerList.prepend($bannerObj); }); if (bannerAuto)
 * clearTimeout(bannerAuto); bannerAuto = setTimeout(rightBanner, bannerTime); }
 * 
 * $bannerLeft.click(function() { bannerDirect = "left"; clearTimeout(bannerAuto); leftBanner(); });
 * 
 * $bannerRight.click(function() { bannerDirect = "right"; clearTimeout(bannerAuto); rightBanner(); }); });
 */

/* select */
$(document).ready(function() {

	var select = $("select.detail_select");

	select.change(function() {
		var select_name = $(this).children("option:selected").text();
		$(this).siblings("label").text(select_name);
	});
});

// 전체메뉴
$(document).ready(function() {
	$("#gnb").hover(function() {
		$(this).find(".top2menu").show();
		$(this).find(".wrapBg").show();
	}, function() {
		$(this).find(".top2menu").hide();
		$(this).find(".wrapBg").hide();
	});

	$(".top2menu").hover(function() {
		$(this).parent().addClass("on");
	}, function() {
		$(this).parent().removeClass("on");
	});

	$(window).resize(function() {
		if ($(window).width() > 983) {
			$(".tm_gnb_w").hide();
			$(".layer_open_search").hide();
		}
	});
});

// tablet, mobile
$(function() {
	mobileMenu();
	function mobileMenu() {
		// 검색
		$(".btn_search").bind("click", function() {
			$(".layer_open_search").fadeIn();
		})
		$(".btn_delete").bind("click", function() {
			$(".layer_open_search").fadeOut();
		});
		$("#open_mn").bind("click", function() {
			$(".layer_open_search").fadeOut();
		});

		// 전체메뉴
		$("#open_mn").bind("click", function() {
			$(".tm_gnb_w").fadeIn();
		});
		$(".tm_gnb_close").bind("click", function() {
			$(".tm_gnb_w").fadeOut();
		});
		$(".tm_nav_bg").bind("click", function() {
			$(".tm_gnb_w").fadeOut();
		});

		$(".tm_top1m > a").click(function(e) {
			e.preventDefault();
			$(".tm_top1m > a").not(this).removeClass("on").next().slideUp();
			$(this).toggleClass("on").next().slideToggle();
			$(".tm_top1m > ul").not(this).next().slideUp();
		});
		$(".tm_top2m > a").click(function(e) {
			e.preventDefault();
			$(".tm_top2m > a").not(this).removeClass("on").next().slideUp();
			$(this).toggleClass("on").next().slideToggle();
			$(".tm_top3m").not(this).next().slideUp();
		});
	}
	;
});

/* 메인 상세검색 레이어팝업 띄우기 */

function wrapWindowByMask() {
	// 화면의 높이와 너비를 구한다.
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();

	// 마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	$('.mask_bg').css({
		'width' : maskWidth,
		'height' : maskHeight
	});

	// 애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
	$('.mask_bg').fadeTo("slow", 0.7);

	// 윈도우 같은 거 띄운다.
	$('.layer_detailSearch').show();
}

$(document).ready(function() {
	// 검은 막 띄우기
	$('.btn_dsearch').click(function(e) {
		e.preventDefault();
		wrapWindowByMask();
	});

	// 닫기 버튼을 눌렀을 때
	$('.layer_detailSearch .close').click(function(e) {
		// 링크 기본동작은 작동하지 않도록 한다.
		e.preventDefault();
		$('.mask_bg, .layer_detailSearch').hide();
	});

	// 검은 막을 눌렀을 때
	$('.mask_bg').click(function() {
		$(this).hide();
		$('.layer_detailSearch').hide();
	});
});

$(document).ready(function() {

	$(".list_w").show();
	$(".list_w_open").hide();

	$("#noti_btn_more").click(function() {
		$("#open_list_inner").show();

	});

	$("#noti_closeBtn").click(function() {
		$("#open_list_inner").hide();

	});

	$("#event_btn_more").click(function() {
		$("#open_list_inner2").show();
		$("#open_list_inner").hide();

	});

	$("#event_closeBtn").click(function() {
		$("#open_list_inner2").hide();

	});

});

$(document).ready(function() {
	$(".list_event2").show();
	$("#open_list_inner").hide();
	$(".list_event").show();
	$("#open_list_inner2").hide();

	$(".event_btn_more").click(function() {
		$("#open_list_inner2").show('3000');
	});

	$(".noti_btn_more").click(function() {
		$("#open_list_inner").show('3000');
	});

	$(".noti_closeBtn").click(function() {
		$("#open_list_inner").hide('3000');
	});

	$(".event_closeBtn").click(function() {
		$("#open_list_inner2").hide('3000');
	});

});

/* 상세페이지 내 탭메뉴 */
$(function() {
	$(".tab_content").hide();
	$(".tab_content:first").show();

	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("on").css("color", "#333");
		// $(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
		$(this).addClass("on").css("color", "#fff");
		$(".tab_content").hide()
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).fadeIn()
	});

});

$(document).ready(function() {
	// SNS공유
	$(".sns_share").click(function() {
		$(".share_sns_list").show();
	});
	$(".ssns_list01").click(function() {
		$(".share_sns_list").hide();
	});

	// 하단 관련사이트 슬라이드
	$("#myDropdown").hide();
	$(".dropbtn").click(function() {
		$("#myDropdown").slideToggle(500);
	});

});
/* 18.11.08 모바일 체크 추가 */
function isMobile() {
    return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
}

// 즐겨찾기
function CreateBookmarkLink(url, title) {
	if (isMobile()) {
		alert("모바일에서는 해당 기능을 지원하지 않습니다.");
		return false;
	}

	if (window.sidebar && window.sidebar.addPanel) { // FF ver 23 이하.
		window.sidebar.addPanel(title, url, '');
	} else {
		if (window.external && ('AddFavorite' in window.external)) { // IE
			window.external.AddFavorite(url, title);
		} else { // Others
			alert('확인을 클릭하신 후 주소창에서 <Ctrl+D>를 누르시면 즐겨찾기에 등록됩니다.');
		}
	}
};

// 현재페이지 주소복사
function copy_trackback(address) {
	if (isMobile()) {
		alert("모바일에서는 해당 기능을 지원하지 않습니다.");
		return false;
	}
	var IE = (document.all) ? true : false;
	if (IE) {
		if (confirm("현재 페이지 주소를 복사하시겠습니까?"))
			window.clipboardData.setData("Text", address);
	} else {
		temp = prompt("현재 페이지 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요", address);
	}
}