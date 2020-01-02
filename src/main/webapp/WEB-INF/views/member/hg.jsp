<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<!-- saved from url=(0043)https://www.gocamping.or.kr/account/join.do -->
<html lang="ko" xml:lang="ko"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="https://www.gocamping.or.kr/img/2018/layout/favicon.ico">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no,email=no,address=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.5, minimum-scale=1.0, user-scalable=yes">
<meta name="author" content="ê³ ìº í">
<meta name="Keywords" content="GOcamping, ê³ ìº í, ëíë¯¼êµ­êµ¬ìêµ¬ìê³ ìº í">
<meta name="description" content="ëíë¯¼êµ­ êµ¬ìêµ¬ì ìº íì¥ ì ë³´ë ê³ ìº íìì ê²ìíì¸ì.">
<meta property="og:type" content="website">
<meta property="og:title" content="ê³ ìº í">
<!--<meta property="og:image" content="/images/common/ci.png">
	<meta property="og:url" content=""/>-->
<meta property="og:description" content="ê³ ìº í">
<title>íêµ­ê´ê´ê³µì¬ ê³ ìº í</title>
 

<link rel="stylesheet" type="text/css" href="./hg_files/style.css">

<script src="./hg_files/jquery-1.11.3.min.js.ë¤ì´ë¡ë"></script>
<script src="./hg_files/jquery-ui.min.js.ë¤ì´ë¡ë"></script>
<script src="./hg_files/jquery-ui.js.ë¤ì´ë¡ë"></script>
<script src="./hg_files/style.js.ë¤ì´ë¡ë"></script>

<script src="./hg_files/maps.js.ë¤ì´ë¡ë"></script><script type="text/javascript" src="./hg_files/maps-geocoder.js.ë¤ì´ë¡ë"></script>
<script src="./hg_files/common.js.ë¤ì´ë¡ë"></script>
<script src="./hg_files/jquery-11.0.min.js.ë¤ì´ë¡ë"></script>
<script src="./hg_files/unitegallery.min.js.ë¤ì´ë¡ë"></script>
<script src="./hg_files/ug-theme-tiles.js.ë¤ì´ë¡ë"></script>
<script src="./hg_files/printThis.js.ë¤ì´ë¡ë"></script>
<link rel="stylesheet" href="./hg_files/unite-gallery.css" type="text/css">

<script>
	function fn_sendSns(sns) {
		var method = "popup";
		var thisUrl = document.URL;
		var snsTitle = "";
		if (sns == 'facebook') {
			var url = "http://www.facebook.com/sharer/sharer.php?u=" + encodeURIComponent(thisUrl);
			window.open(url, "", "width=486, height=286");
		} else if (sns == 'twitter') {
			var url = "http://twitter.com/share?url=" + encodeURIComponent(thisUrl) + "&text=" + encodeURIComponent(snsTitle);
			window.open(url, "tweetPop", "width=486, height=286,scrollbars=yes");
		} else if (sns == 'band') {
			var url = "http://www.band.us/plugin/share?body=" + encodeURIComponent(snsTitle) + "&route=" + encodeURIComponent(thisUrl);
			window.open(url, "shareBand", "width=400, height=500, resizable=yes");
		} else if (sns == 'kstory') {
			var url = "https://story.kakao.com/share?url=" + encodeURIComponent(thisUrl);
			window.open(url, "shareKakao", "width=400, height=500, resizable=yes");
		}
	}
	
	function printThis() {
		$("#contents").printThis({

		});
	}
</script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async="" src="./hg_files/js"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-52705464-2');
</script>
</head>
<body style="">
	<div id="accessibility">
	<a href="https://www.gocamping.or.kr/account/join.do#section1">ë³¸ë¬¸ ë°ë¡ê°ê¸°</a> <a href="https://www.gocamping.or.kr/account/join.do#gnb">ëë©ë´ ë°ë¡ê°ê¸°</a>
</div>

<h1 class="skip">ê³ ìº í í¬í¸ ì¹ì¬ì´í¸ ìëë¤.</h1>

<script>
	// Get cookie function
	function getCookie(name) {
		var cookieName = name + "=";
		var x = 0;
		while (x <= document.cookie.length) {
			var y = (x + cookieName.length);
			if (document.cookie.substring(x, y) == cookieName) {
				if ((lastChrCookie = document.cookie.indexOf(";", y)) == -1)
					lastChrCookie = document.cookie.length;
				return decodeURI(document.cookie.substring(y, lastChrCookie));
			}
			x = document.cookie.indexOf(" ", x) + 1;
			if (x == 0)
				break;
		}
		return "";
	}

	/* setCookie function */
	function setCookie(cname, value, expire) {
		var todayValue = new Date();
		// ì¤ë ë ì§ë¥¼ ë³ìì ì ì¥

		todayValue.setDate(todayValue.getDate() + expire);
		document.cookie = cname + "=" + encodeURI(value) + "; expires=" + todayValue.toGMTString() + "; path=/;";
	}
</script>

<script>
	$(document).ready(function() {
		$(".t_event_btn").click(function() {
			$("#t_event_w").slideUp(300);

			if ($("#blindEvent").is(":checked") == true) {
				setCookie("topEventPopup", "end", 1);
			}
		});

		var result = getCookie('topEventPopup');
		if (result == 'end') {
			return false;
		} else {
			$("#t_event_w").show();
		}
	});
</script>
<div id="wrap">

	 <!--<div id="t_event_w" style="display: none;">
		<a href="http://vacation.visitkorea.or.kr/travel/worker/workerMain.do" target="_blank" title="ìì°½ì¼ë¡"><img src="/img/2018/layout/top_banner_190123.jpg" alt="ëíë¯¼êµ­ì 'ì¼íê° ìë ì¶'ì ìí 2019 ê·¼ë¡ì í´ê°ì§ìì¬ì, ì°¸ì¬ê¸°ì/ê·¼ë¡ì ëª¨ì§ê¸°ê° 2.12(í)~3.8(ê¸)" id="banner01"></a>
		<div class="t_event_checkbox">
			<input type="checkbox" id="blindEvent" name="blindEvent" value="y" title="ì¤ëíë£¨ ì´ì§ìê¸°"> <label for="blindEvent">ì¤ë íë£¨ ì´ì§ ìê¸°</label>
		</div>
		<button type="button" class="t_event_btn">
			<span class="skip">ë«ê¸°</span>
		</button>
	</div>-->
	<!-- 2ì°¨ì´ë²¤í¸ -->
		<!--í°ìë²í¼ t_event_btn_fff / ê²ì ë²í¼ t_event_btn -->
	<!--<div id="t_event_w" style="display: none;">
		<a href="/zboard/read.do?searchWrd=&pageIndex=1&lmCode=notice&searchCnd=&searchCate1=&pd_pkid=753"><img src="/img/2018/layout/event2nd_2500X100.jpg" alt="ìº í¼ë¤ìê² ê¼­ ë§ì¶° ìë¡­ê² íìí ëíë¯¼êµ­ êµ¬ìêµ¬ì ê³ ìº í!"></a>
		<div class="t_event_checkbox">
			<input type="checkbox" id="blindEvent" name="blindEvent" value="y" title="ì¤ëíë£¨ ì´ì§ìê¸°"> <label for="blindEvent">ì¤ë íë£¨ ì´ì§ ìê¸°</label>
		</div>
		<button type="button" class="t_event_btn_fff">
			<span class="skip">ë«ê¸°</span>
		</button>
	</div>-->
	<!-- //2ì°¨ì´ë²¤í¸ -->

	<!--S:ë¹ ë¥¸ìë¹ì¤-->
	<div id="lnb_hm">
		<!--layout-->
		<div class="layout2">
			<!--S:ì¢ì¸¡-->
			<ul class="siteLink">
				<li class="home"><a href="https://www.gocamping.or.kr/">ê³ ìº í</a></li>
				<li class="kto"><a href="http://kto.visitkorea.or.kr/kor.kto" target="_blank" title="ìì°½ì´ë¦¼">íêµ­ê´ê´ê³µì¬</a></li>
				<li class="visit_ko"><a href="http://korean.visitkorea.or.kr/" target="_blank" title="ìì°½ì´ë¦¼">ëíë¯¼êµ­ êµ¬ìêµ¬ì</a></li>
				<li class="duru"><a href="http://www.durunubi.kr/" target="_blank" title="ìì°½ì´ë¦¼">ëë£¨ëë¹</a></li>
			</ul>
			<!--//E:ì¢ì¸¡-->
			<!--S:ì°ì¸¡-->
			<dl class="utilMenu">
				<dt class="skip">ì í¸ë©ë´</dt>
				<dd>
					<ul class="list">
						<li class="login"><a href="https://www.gocamping.or.kr/account/login.do">ë¡ê·¸ì¸</a></li>
							<li class="join"><a href="https://www.gocamping.or.kr/account/agree.do">íìê°ì</a></li>
							<li class="join"><a href="https://www.gocamping.or.kr/oprtr/intro.do">ì¬ììì©</a></li>
						<li class="join"><a href="http://lms.coreit.co.kr/" target="_blank">ìì êµì¡</a></li>
						<li class="sitemap"><a href="https://www.gocamping.or.kr/bsite/sitemap/read.do">ì¬ì´í¸ë§µ</a></li>
					</ul>
				</dd>
			</dl>
			<!--//E:ì°ì¸¡-->
		</div>
		<!--//layout-->
	</div>
	<!--//E:ë¹ ë¥¸ìë¹ì¤--><!--HEADER-->
	<header id="header" style="right: 0px">
	<div id="header_in">
		<div class="layout2">
			<!--S:ë¡ê³ ìì­-->
			<div class="logoarea">
				<h1 id="logo">
					<a href="https://www.gocamping.or.kr/"><span class="skip">ëíë¯¼êµ­ êµ¬ìêµ¬ì ê³ ìº í</span></a>
				</h1>
				<!--//E:Logo-->
				<!--S:SNSë²í¼ëª¨ì-->
				<ul class="sns_list">
					<li class="sns00"><a href="https://www.instagram.com/gocamping_official/" target="_BLANK">ê³ ìº í ì¸ì¤íê·¸ë¨</a></li>
					<li class="sns01"><a href="https://www.facebook.com/go2thecamping/" target="_BLANK">ê³ ìº í ê³µìíì´ì¤ë¶</a></li>
					<li class="sns02"><a href="https://blog.naver.com/gocamping_official" target="_BLANK">ê³ ìº í ê³µìë¸ë¡ê·¸</a></li>
					<li class="sns03"><a href="https://www.youtube.com/channel/UCuCBPZUAgFBX0J1EVnkuXPQ" target="_BLANK">ê³ ìº í ê³µìì íë¸</a></li>
				</ul>
				<!--E:SNSë²í¼ëª¨ì-->
				<!--S:íµí©ê²ì-->
				<div class="m_search">
					<form name="totalSearchForm01" action="https://www.gocamping.or.kr/bsite/search/list.do" method="get">
						<fieldset class="totalSearch">
							<legend>íµí©ê²ì</legend>
							<label for="searchKrwd_total" class="skip">íµí©ê²ì</label>
							<input type="text" class="m_search_in" id="searchKrwd_total" name="searchKrwd" style="vertical-align: middle" title="ê²ìì´ ìë ¥ë°ì¤" placeholder="ê²ìì´ë¥¼ ìë ¥íì¸ì.">
							<div class="search_btn">
								<input type="submit" value="ê²ì" title="ìì°½">
							</div>
						</fieldset>
					</form>
				</div>
				<!--//E:íµí©ê²ì-->
				<!--ëª¨ë°ì¼ver-->
				<div class="h_m_mn">
					<a id="open_mn" class="btn_lnb">ë©ë´</a> <a id="open_search" class="btn_search">ê²ì</a>
				</div>
				<!--//ëª¨ë°ì¼ver-->
				<!--ê²ìOPEN-->
				<div class="layer_open_search" style="display: none;" id="open_search_inner">
					<div class="layout">
						<form id="totalSearchForm02" action="https://www.gocamping.or.kr/bsite/search/list.do" role="search" method="get">
							<fieldset>
								<legend class="screen_out">ê²ìì´ ìë ¥í¼</legend>
								<div class="box_search">
									<label for="searchKrwd2" class="skip">ìº íì¥ì ê²ìí´ë³´ì¸ì.</label> 
									<input type="text" id="searchKrwd2" name="searchKrwd" class="campSearch_op" title="ìº íì¥ì ê²ìí´ë³´ì¸ì">
									<button type="submit" class="btn_search">
										<span class="icon_all camp_search">ê²ì</span>
									</button>
									<button class="btn_delete" id="search_delete" type="button" onclick="javascript:layer_close();">
										<span class="camp_search_close">ë«ê¸°</span>
									</button>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
				<!--//ê²ìOPEN-->
			</div>
			<!--//E:ë¡ê³ ìì­-->
		</div>
			<!--S:ìë¨ë©ë´-->
			<!-- ì£¼ìë©ë´:S -->
			<nav id="gnb">
<div class="gnb_in">
	<h2 class="skip">ì£¼ìë©ë´</h2>
	<div class="layout">
		<div class="wrap">
			<ul class="top1menu clearfix">
				<li class="depth1 41"><a href="https://www.gocamping.or.kr/bsite/camp/info/list.do">ìº íGO</a>
							<ul class="top2menu" style="display: none;">
								<li><a href="https://www.gocamping.or.kr/bsite/camp/info/list.do">ìº íì¥ ê²ì</a>
												</li>
									<li>
										<a href="https://www.gocamping.or.kr/bsite/camp/info/list.do?listTy=MAP">ì§ëë¡ ê²ì</a>
									</li>
									<li>
										<ul class="top2menu_in">
											<li><a href="https://www.gocamping.or.kr/camp/recomend/list.do">ì´ë¬ì ì¶ì² ìº íì¥</a></li>
											<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campEvent">ìº íì¥ ì´ë²¤í¸</a></li>
										</ul>
									</li>
								</ul>
						</li>
				<li class="depth1 43"><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campNews">ìº íTalk</a>
							<ul class="top2menu" style="display: none;">
								<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campNews">ìº íìì</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campIstny">ìº í&amp;ì¬ííê¸°</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campSupport">ìº íìí¬í°ì¦</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campExprnc">ìº íë¸íì°</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campFd">ìº ííë¼</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campTour">ìº íê³¼ì¬í</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campGallery">ì¸ììº íì·</a>
												</li>
									</ul>
						</li>
				<li class="depth1 51"><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campScn">ìº ííë¬ì¤</a>
							<ul class="top2menu" style="display: none;">
								<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campScn">ìº íìì­ì¬</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campBegin">ìº íì¥ììíê¸°</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campEopmn">ìº íì¥ë¹ì´ì¼ê¸°</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campSafe">ìì íìº íì¦ê¸°ê¸°</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campSafetyVod">ìº íì¥ ìì ìì¹ ëìì</a>
												</li>
									</ul>
						</li>
				<li class="depth1 53"><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=notice">ê³ ê°ì¼í°</a>
							<ul class="top2menu" style="display: none;">
								<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=notice">ê³µì§ì¬í­</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campCnslt">ìº íìë´</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campRequest">ìº íì¥ì ë³´ ìì ìì²­</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campSttemnt">ë¯¸ë±ë¡ì¼ìì¥ ë¶ë²ììì ê³ </a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campNotice">ìº íì¥ ê³µì§ì¬í­</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=event_noti">ê°ìíì´ë²¤í¸</a>
												</li>
									</ul>
						</li>
				</ul>
		</div>
	</div>
	<div class="wrapBg" style="display: none;"></div>
	<div class="bg_black">
		<span class="skip">í¬ëªë°°ê²½ì´ë¯¸ì§</span>
	</div>
</div>
</nav><!-- ì£¼ìë©ë´:E -->
			<!-- S: TM_ì£¼ìë©ë´ -->
			<div class="tm_gnb_w" style="opacity: 1; display: none;">
	<div class="tm_nav_bg">
		<span class="skip">í¬ëªë°°ê²½ì´ë¯¸ì§</span>
	</div>
	<nav id="tm_gnb" style="left: 0">
		<h2>
			<span class="skip">ëª¨ë°ì¼ì© ë©ë´</span>
		</h2>

		<div id="tm_gnb01">
			<ul>

				<li class="tm_sitemap"><a href="https://www.gocamping.or.kr/bsite/sitemap/read.do">ì¬ì´í¸ë§µ</a></li>
				<li class="tm_login"><a href="https://www.gocamping.or.kr/account/login.do">ë¡ê·¸ì¸</a></li>
					</ul>

		</div>
		<div id="tm_gnb00">
			<ul>
				<li class="tm_oprtr3"><a href="https://www.gocamping.or.kr/oprtr/intro.do">ì¬ììì©</a></li>
						<li class="tm_oprtr3"><a href="http://lms.coreit.co.kr/" target="_blank">ìì êµì¡</a></li>
					</ul>
		</div>
		<div id="tm_gnb02">
			<ul>
				<li class="tm_home"><a href="https://www.gocamping.or.kr/"><span class="skip">íì¼ë¡</span></a></li>
				<li class="tm_sns00"><a href="https://www.instagram.com/gocamping_official/" target="_BLANK"><span class="skip">ê³ ìº í ê³µì ì¸ì¤íê·¸ë¨</span></a></li>
				<li class="tm_sns01"><a href="https://www.facebook.com/go2thecamping/" target="_BLANK"><span class="skip">ê³ ìº í ê³µìíì´ì¤ë¶</span></a></li>
				<li class="tm_sns02"><a href="https://blog.naver.com/gocamping_official" target="_BLANK"><span class="skip">ê³ ìº í ê³µìë¸ë¡ê·¸</span></a></li>
				<li class="tm_sns03"><a href="https://www.youtube.com/channel/UCuCBPZUAgFBX0J1EVnkuXPQ" target="_BLANK"><span class="skip">ê³ ìº í ê³µìì íë¸</span></a></li>
			</ul>
		</div>
		<div id="tm_gnb03">
			<ul class="tm_topMenu">
				<!-- <li class="tm_top1m"><a href="#" class="tm_menu1 on"><span>ìº íGO</span></a>
					<ul class="tm_top2m">
						<li><a href="#">ìì¸ê²ì</a>
							<ul class="tm_top3m">
								<li><a href="#">3ì°¨ë©ë´ë¦¬ì¤í¸1</a></li>
								<li><a href="#">3ì°¨ë©ë´ë¦¬ì¤í¸2</a></li>
								<li><a href="#">3ì°¨ë©ë´ë¦¬ì¤í¸3</a></li>
							</ul></li>
						<li><a href="#">íê·¸ê²ì</a></li>
						<li><a href="#">ì§ëê²ì</a></li>
					</ul></li>
				<li class="tm_top1m"><a href="#" class="tm_menu2"><span>ìº íTalk</span></a>
					<ul class="tm_top2m" style="display: none">
						<li><a href="#">ìº íìì</a></li>
						<li><a href="#">ìº ííê¸°</a></li>
						<li><a href="#">ìº íìí¬í°ì¦</a></li>
						<li><a href="#">ìº íë¸íì°</a></li>
					</ul></li>
				<li class="tm_top1m"><a href="#" class="tm_menu3"><span>ìº ííë¬ì¤</span></a>
					<ul class="tm_top2m" style="display: none">
						<li><a href="#">ìì¸ê²ì</a></li>
						<li><a href="#">íê·¸ê²ì</a></li>
						<li><a href="#">ì§ëê²ì</a></li>
					</ul></li>
				<li class="tm_top1m"><a href="#" class="tm_menu4"><span>ê³ ê°ì¼í°</span></a>
					<ul class="tm_top2m" style="display: none">
						<li><a href="#">ìì¸ê²ì</a></li>
						<li><a href="#">íê·¸ê²ì</a></li>
						<li><a href="#">ì§ëê²ì</a></li>
					</ul></li>-->
				<li class="tm_top1m"><a href="https://www.gocamping.or.kr/bsite/camp/info/list.do" class="tm_menu1"><span>ìº íGO</span></a>
							<ul class="tm_top2m" style="display: none;">
								<li><a href="https://www.gocamping.or.kr/bsite/camp/info/list.do">ìº íì¥ ê²ì</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/bsite/camp/info/list.do?listTy=MAP">ì§ëë¡ ê²ì</a></li>
									<li><a href="https://www.gocamping.or.kr/camp/recomend/list.do">ì´ë¬ì ì¶ì² ìº íì¥</a></li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campEvent">ìº íì¥ ì´ë²¤í¸</a></li>
								</ul>
						</li>
				<li class="tm_top1m"><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campNews" class="tm_menu2"><span>ìº íTalk</span></a>
							<ul class="tm_top2m" style="display: none;">
								<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campNews">ìº íìì</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campIstny">ìº í&amp;ì¬ííê¸°</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campSupport">ìº íìí¬í°ì¦</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campExprnc">ìº íë¸íì°</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campFd">ìº ííë¼</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campTour">ìº íê³¼ì¬í</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campGallery">ì¸ììº íì·</a>
												</li>
									</ul>
						</li>
				<li class="tm_top1m"><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campScn" class="tm_menu3"><span>ìº ííë¬ì¤</span></a>
							<ul class="tm_top2m" style="display: none;">
								<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campScn">ìº íìì­ì¬</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campBegin">ìº íì¥ììíê¸°</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campEopmn">ìº íì¥ë¹ì´ì¼ê¸°</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campSafe">ìì íìº íì¦ê¸°ê¸°</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campSafetyVod">ìº íì¥ ìì ìì¹ ëìì</a>
												</li>
									</ul>
						</li>
				<li class="tm_top1m"><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=notice" class="tm_menu4"><span>ê³ ê°ì¼í°</span></a>
							<ul class="tm_top2m" style="display: none;">
								<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=notice">ê³µì§ì¬í­</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campCnslt">ìº íìë´</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campRequest">ìº íì¥ì ë³´ ìì ìì²­</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campSttemnt">ë¯¸ë±ë¡ì¼ìì¥ ë¶ë²ììì ê³ </a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campNotice">ìº íì¥ ê³µì§ì¬í­</a>
												</li>
									<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=event_noti">ê°ìíì´ë²¤í¸</a>
												</li>
									</ul>
						</li>
				</ul>
		</div>
	</nav>
	<div class="tm_gnb_close" style="cursor: pointer;">
		<button type="button">
			<span class="skip">ëª¨ë°ì¼ì© ë©ë´ ë«ê¸°</span>
		</button>
	</div>
</div><!-- E: TM_ì£¼ìë©ë´ -->
			<!--//E:ìë¨ë©ë´-->
	</div>
	 
</header><!--//E:HEADER-->

	<div id="s_contanier">
		<!--ìë¨íì´íìì­-->
			<div id="sub_title_wrap">
				<div class="layout">
					<h2>
						<span class="skip">ìë¸íì´í ìì­</span>
					</h2>
					<!--íì´í-->
					<div class="s_title">
						</div>
					<!--//íì´í-->
				</div>
				<div class="s_bg_w">
					<!-- s_bg_02~05 ìº íGo, ìº íTalk, ìº ííë¬ì¤, ê³ ê°ì¼í°, ë§ì´íì´ì§ -->
					<div class="s_bg_02"></div>
						</div>
			</div>
			<!--//ìë¨íì´íìì­-->
			<!--Location-->
			<!--//Location-->
		<section id="section1" style="right: 0px">
	<h2 class="skip">ë³¸ë¬¸ìì­ìëë¤.</h2>
		<!--ì½íì¸ ë°ì¤-->
		<div id="cont_inner">
			<div class="sub_layout layout">
				<article>
						<header class="title_w">
							<h2 class="title"><span class="skip">íì´íìì­ìëë¤.</span>
								</h2>
							<ul class="share">
								<li class="sns">
									<button type="button" class="sns_share">
										<span class="skip">SNSê³µì </span>
									</button>
									<div class="share_sns_list" style="display: none;">
										<ul>
											<li><button type="button" class="ssns_list01">
													<span class="skip">ë«ê¸°</span>
												</button></li>
											<li><button type="button" class="ssns_list02" onclick="fn_sendSns(&#39;facebook&#39;); return false;">
													<span class="skip">íì´ì¤ë¶</span>
												</button></li>
											<li><button type="button" class="ssns_list03" onclick="fn_sendSns(&#39;twitter&#39;); return false;">
													<span class="skip">í¸ìí°</span>
												</button></li>
											<li><button type="button" class="ssns_list04" onclick="fn_sendSns(&#39;band&#39;); return false;">
													<span class="skip">ë¸ë¡ê·¸</span>
												</button></li>
											<li><button type="button" class="ssns_list05" onclick="fn_sendSns(&#39;kstory&#39;); return false;">
													<span class="skip">ì¹´ì¹´ì¤ì¤í ë¦¬</span>
												</button></li>
										</ul>
									</div>
								</li>
								<li class="bookmark"><a href="javascript:CreateBookmarkLink(&#39;&#39;, &#39;íì¬íì´ì§&#39;);" id="favorite" title="ì¦ê²¨ì°¾ê¸°"><span class="skip">ì¦ê²¨ì°¾ê¸°</span></a></li>
								<li class="link"><a href="https://www.gocamping.or.kr/account/join.do#" onclick="copy_trackback(this.href); return false;"><span class="skip">ë§í¬ ë³µì¬íê¸°</span></a></li>
								<li class="print"><a href="https://www.gocamping.or.kr/account/join.do#none" onclick="printThis(); return false;"><span class="skip">ì¸ìíê¸°</span></a></li>
							</ul>
						</header>
					</article>
					 
				<!--ë´ì©ìì-->
				<div id="contents">
					<script>
	$(function() {
		alertResMsg("");
	});
</script>

<script>
	function checkDupId() {
		if ($("#me_id").val() == "") {
			alert("ìì´ëë¥¼ ìë ¥í´ì£¼ì¸ì.");
			$("#me_id").focus();
			return false;
		}

		var meId = $("#me_id").val();

		var submitObj = new Object();
		submitObj.me_id = meId;

		$.ajax({
			url : "/account/getIdCnt.do",
			type : "POST",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(submitObj),
			dataType : "json",
			async : false
		}).done(function(resMap) {
			if (resMap.res == "ok") {
				if (resMap.idCnt == 0 && meId != "temp_999999") {
					if (confirm("ì¬ì©ê°ë¥í ìì´ëìëë¤. ì¬ì©íìê² ìµëê¹?")) {
						$("#me_id").attr("readonly", "readonly");
						$("#idCntRes").val("true");
					}
				} else {
					$("#idCntRes").val("");
					alert("ì¬ì© ë¶ê°ë¥í ìì´ëìëë¤.");
				}
			}
		}).fail(function(e) {
			alert("FAIL - " + e);
		}).always(function() {

		});
	}

	function checkDupNickName() {
		if ($("#me_nickname").val() == "") {
			alert("ëë¤ìì ìë ¥í´ì£¼ì¸ì.");
			$("#me_nickname").focus();
			return false;
		}

		var meNickname = $("#me_nickname").val();

		var submitObj = new Object();
		submitObj.me_nickname = meNickname;

		$.ajax({
			url : "/account/getNicknameCnt.do",
			type : "POST",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(submitObj),
			dataType : "json",
			async : false
		}).done(function(resMap) {
			if (resMap.res == "ok") {
				if (resMap.nicknameCnt == 0) {
					if (confirm("ì¬ì©ê°ë¥í ëë¤ììëë¤. ì¬ì©íìê² ìµëê¹?")) {
						$("#me_nickname").attr("readonly", "readonly");
						$("#nicknameCntRes").val("true");
					}
				} else {
					$("#nicknameCntRes").val("");
					alert("ì¬ì© ë¶ê°ë¥í ëë¤ììëë¤.");
				}
			}
		}).fail(function(e) {
			alert("FAIL - " + e);
		}).always(function() {

		});
	}

	function checkDupEmail() {
		var regExpEm = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		if ($("#me_email").val() == "") {
			alert("ì´ë©ì¼ì ìë ¥í´ì£¼ì¸ì.");
			$("#me_email").focus();
			return false;
		}

		var meEmail = $("#me_email").val();

		if (!regExpEm.exec(meEmail)) {
			alert("ì´ë©ì¼ íìì ì í©íì§ ììµëë¤.");
			$("#me_email").focus();
			return false;
		}

		var submitObj = new Object();
		submitObj.me_email = meEmail;

		$.ajax({
			url : "/account/getEmailCnt.do",
			type : "POST",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(submitObj),
			dataType : "json",
			async : false
		}).done(function(resMap) {
			if (resMap.res == "ok") {
				if (resMap.emailCnt == 0) {
					if (confirm("ì¬ì©ê°ë¥í ì´ë©ì¼ìëë¤. ì¬ì©íìê² ìµëê¹?")) {
						$("#me_email").attr("readonly", "readonly");
						$("#emailCntRes").val("true");
					}
				} else {
					$("#emailCntRes").val("");
					alert("ì¬ì© ë¶ê°ë¥í ì´ë©ì¼ìëë¤.");
				}
			}
		}).fail(function(e) {
			alert("FAIL - " + e);
		}).always(function() {

		});
	}
	
	function getCertKey(){
		
		var emailCntRes = $("#emailCntRes").val();
		var meEmail = $("#me_email").val();
		
		if(meEmail == ""){
			alert("ì´ë©ì¼ì ìë ¥í´ì£¼ì¸ì.");
			$("#me_email").focus();
			return false;	
		}else if(emailCntRes!="true"){
			alert("ì´ë©ì¼ ì¤ë³µíì¸ì í´ì£¼ì¸ì.");
			return false;
		}else{
			$.ajax({
				url : "/account/getCertKey.do",
				type : "POST",
				data : "me_email=" + meEmail,
				dataType : "json",
				async : false
			}).done(function(resMap) {
				
				$('#cnv_cert_key').val(resMap.cert_key);
				$('#cert_tr').show();
				alert("ë©ì¼ì´ ë°ì¡ëììµëë¤.")
				
			}).fail(function(e) {
				alert("FAIL - " + e);
			}).always(function() {
	
			});
		}
		
	}
	
	function checkCertKey(){
		
		var certKey = $("#cert_key").val();
		var cnvCertKey = $("#cnv_cert_key").val();
		
		if(certKey.length!=6){
			alert("ì¸ì¦ë²í¸ë 6ìë¦¬ ìëë¤.");
			$("#cert_key").focus();
		}else{
			$.ajax({
				url : "/account/checkCertKey.do",
				type : "POST",
				data : "cert_key=" + certKey + "&cnv_cert_key=" + cnvCertKey,
				dataType : "json",
				async : false
			}).done(function(resMap) {
				
				if(resMap.result){
					alert("ì¸ì¦ëììµëë¤.");
					$('#cert_res').val("true");
					return false;
				}else{
					alert("ì¸ì¦ë²í¸ê° ì¼ì¹íì§ ììµëë¤.");
					$("#cert_key").focus();
					return false;
				}
				
			}).fail(function(e) {
				alert("FAIL - " + e);
			}).always(function() {
	
			});
		}
		
	}

	function validateForm(obj) {
		var returnChk = true;
		var resultObj = [ {} ];
		var etcObj = [ {} ];
		var regExpPw = /(?=.*?[a-z])(?=.*?[0-9])/;

		$(".join_form_box").find(":input").each(function(index, value) {
			var id = value.id;
			var type = value.type;
			if (id != "" && id != null) {
				if (type == "text" || type == "password" || type == "hidden" || type == "checkbox") {
					resultObj.push({
						"type" : type,
						"id" : id
					});
				} else {
					etcObj.push({
						"type" : type,
						"id" : id
					});
				}
			}
		});

		resultObj.forEach(function(obj) {
			if (returnChk) {
				var chkVal = "";
				var chkText = "";
				if (obj.type == "checkbox") {
					chkVal = $("#" + obj.id).prop("checked");
					chkText = $("#" + obj.id).parents("p").find("label").text();
				} else {
					chkVal = $("#" + obj.id).val();
					chkText = $("#" + obj.id).parents("tr").find("th").text().replace("(*)", "");
				}

				if (chkText!="ì¸ì¦ë²í¸" && (chkVal == "" || chkVal == false)) {
					var returnMsg = obj.type == "hidden" ? "ë(ì) ì¤ë³µíì¸ì íììëë¤." : "ë(ì) íììëë¤.";
					alert(chkText + returnMsg);
					$("#" + obj.id).focus();
					returnChk = false;
				}
			}
		});

		if ("EMAIL" == "EMAIL") {
			if (returnChk) {
				var mePwd = $("#me_pwd").val();
				var rePwd = $("#re_password").val();
				var certRes = $("#cert_res").val();

				if (!regExpPw.exec(mePwd) || mePwd.length <= 5) {
					alert("ë¹ë°ë²í¸ê° íìì ì í©íì§ ììµëë¤.");
					$("#me_pwd").focus();
					returnChk = false;
				} else if (mePwd != rePwd) {
					alert("ë¹ë°ë²í¸ê° ì¼ì¹íì§ ììµëë¤.");
					returnChk = false;
				}else if(certRes != "true"){
					alert("ì´ë©ì¼ ì¸ì¦ì í´ì£¼ì¸ì.");
					returnChk = false;
				}
			}
		}

		if (returnChk) {
			if (confirm("ë±ë¡íìê² ìµëê¹?")) {
				returnChk = true;
			} else {
				returnChk = false;
			}
		}

		return returnChk;
	}
</script>

<script>
	$(document).ready(function() {
// 		$("#check_agree").click(function() {
// 			if ($(this).is(":checked")) {
// 				$('html, body').animate({
// 					scrollTop : $(".form_cont").offset().top
// 				}, 400);
// 			}
// 		});
	});
</script>

<div class="login_title_w">
	<h2 class="title">íìê°ì</h2>
	<span class="s_tt">ì´ë©ì¼ íìê°ìì ì´ë©ì¼ ì¸ì¦ì íìì¼ë§ íìê°ìì´ ìë£ë©ëë¤.</span>
</div>

<form id="joinForm" action="https://www.gocamping.or.kr/account/join_action.do" method="post" onsubmit="return validateForm(this);"><input id="me_cert_ty" name="me_cert_ty" type="hidden" value="EMAIL"><input id="me_cert_key" name="me_cert_key" type="hidden" value=""><!--ë¡ê·¸ì¸ ìë ¥í¼-->
	<div class="join_form_box">
		<section class="email_agree">
			<h2 class="skip">íìê°ì</h2>
			<p class="agree_check">
				<input type="checkbox" class="check_id" id="check_agree"><label for="check_agree">ê°ì¸ì ë³´ ìì§ ë° ì´ì© ëì</label>
			</p>
			<p class="join_tt">ì´ì©ì½ê´</p>
			<section>
				<h2 class="skip">ì´ì©ì½ê´</h2>
				<div class="cont">
					<h2>ì  1 ì¥ ì´ ì¹</h2>
					<h3>ì  1 ì¡° (ëª©ì )</h3>
					<p>ë³¸ ì½ê´ì íêµ­ê´ê´ê³µì¬ ê³ ìº í(ì´í "ê³ ìº í")ì´ ì ê³µíë ìë¹ì¤(ì´í "ìë¹ì¤")ì ì´ì©ê³¼ ê´ë ¨íì¬ ì´ì©ìì ê¶ë¦¬, ìë¬´ ë° ì±ìì¬í­ ê·¸ë¦¬ê³  ê¸°í íìí ì¬í­ì ê·ì íë ê²ì ëª©ì ì¼ë¡ í©ëë¤.</p>

					<h3>ì  2 ì¡° (ì½ê´ì í¨ë ¥ ë° ë³ê²½)</h3>
					<p>ì½ê´ì ë´ì©ì ìë¹ì¤ íë©´ì ê²ìíê³  ì´ì©ìê° ëìí¨ì¼ë¡ì¨ í¨ë ¥ì´ ë°ìí©ëë¤. ê³ ìº íì í©ë¦¬ì ì¸ ì¬ì ê° ë°ìë  ê²½ì°ìë ì´ ì½ê´ì ë³ê²½í  ì ìì¼ë©°, ì½ê´ì´ ë³ê²½ëë ê²½ì°ìë ìµìí 7ì¼ì ì ê³µì§í©ëë¤. ëí ìë¡ì´ ìë¹ì¤ê° ê°ì¤ë  ê²½ì°, ë³ëì ëªìë ì¤ëªì´ ìë í ì´ ì½ê´ì ë°ë¼ ì ê³µë©ëë¤.</p>
					<ul>
						<li>â  ë³¸ ì½ê´ì ê³ ìº íì´ ìë¹ì¤ íë©´ì íµí´ ê²ìíê³  ì´ì©ìê° ì´ì ëìí¨ì¼ë¡ì¨ í¨ë ¥ì ë°ìí©ëë¤.</li>
						<li>â¡ ê³ ìº íì "ì½ê´ì ê·ì  ë±ì ê´í ë²ë¥ ", "ì ê¸°íµì ì¬ìë²ë ¹", "ì ë³´íµì ë§ ì´ì©ì´ì§ ë° ì ë³´ë³´í¸ ë±ì ê´í ë²ë¥ ", "ê°ì¸ì ë³´ë³´í¸ë²" ë± ê´ë ¨ ë²ë ¹ì ìë°íì§ ìë ë²ììì ì´ ì½ê´ì ë´ì©ì ìì íê±°ë ë³ê²½í  ì ììµëë¤.</li>
						<li>â¢ ê³ ìº íì´ ì½ê´ì ê°ì í  ê²½ì°ìë ê¸°ì¡´ì½ê´ê³¼ ê°ì ì½ê´ ë° ê°ì ì½ê´ì ì ì©ì¼ìì ê°ì ì¬ì ë¥¼ ëªìíì¬ ííì½ê´ê³¼ í¨ê» ê·¸ ì ì©ì¼ì 7ì¼ ì ë¶í° ì ì©ì¼ ì´í ìë¹í ê¸°ê° ëì, ê°ì  ë´ì©ì´ íììê² ë¶ë¦¬í ê²½ì°ìë ê·¸ ì ì©ì¼ì 30ì¼ ì ë¶í° ì ì©ì¼ ì´í ìë¹í ê¸°ê° ëì ê°ê° ì´ë¥¼ ìë¹ì¤ ííì´ì§ì
							ê³ ì§í©ëë¤.</li>
						<li>â£ ê³ ìº íì´ ì í­ì ë°ë¼ íììê² ê³ ì§íë©´ì ê³ ì§ì¼ë¡ë¶í° ê°ì ì½ê´ ìíì¼ 7ì¼ íê¹ì§ ê±°ë¶ìì¬ë¥¼ íìíì§ ìëíë©´ ì¹ì¸í ê²ì¼ë¡ ë³¸ë¤ë ë»ì ëªííê² ê³ ì§íìììë ìì¬íìê° ìë ê²½ì°ìë ë³ê²½ë ì½ê´ì ì¹ì¸í ê²ì¼ë¡ ë´ëë¤. íìì´ ê°ì ì½ê´ì ëìíì§ ìì ê²½ì° íìì ì 6ì¡° ì 1í­ì ê·ì ì
							ë°ë¼ ì´ì©ê³ì½ì í´ì§í  ì ììµëë¤.</li>
					</ul>

					<h3>ì  3 ì¡° (ì©ì´ì ì ì)</h3>
					<p>ì´ ì½ê´ìì ì¬ì©íë ì©ì´ì ì ìë ë¤ìê³¼ ê°ìµëë¤.</p>
					<ul>
						<li>â  ì´ì©ì: ê³ ìº íì´ ì ê³µíë ìë¹ì¤ë¥¼ ë°ë íì ë° ë¹íì
						</li><li>â¡ íì: ê³ ìº íê³¼ ìë¹ì¤ ì´ì©ê³ì½ì ì²´ê²°íê³  ì´ì©ì ìì´ë(ID)ë¥¼ ë¶ì¬ ë°ì ê°ì¸ì´ë ë²ì¸ ëë ë²ì¸ì ì¤íë ë¨ì²´</li>
						<li>â¢ ë¹íì: íìì ê°ìíì§ ìê³  ê³ ìº íì´ ì ê³µíë ìë¹ì¤ë¥¼ ì´ì©íë ì</li>
						<li>â£ ìì´ë(ID): íììë³ê³¼ íìì ìë¹ì¤ ì´ì©ì ìíì¬ íìì´ ì¤ì íê³  ê³ ìº íì´ ì¹ì¸íë ë¬¸ì ëë ì«ìì ì¡°í©</li>
						<li>â¤ ë¹ë°ë²í¸: íìì ë¹ë° ë³´í¸ë¥¼ ìí´ íì ìì ì´ ì¤ì í ë¬¸ì ëë ì«ìì ì¡°í©</li>
						<li>â¥ í´ì§: ê³ ìº í ëë íìì´ ìë¹ì¤ ê°íµ í ì´ì©ê³ì½ì í´ì½íë ê²</li>
					</ul>

					<h2>ì  2 ì¥ íìì ê°ì ë° ê´ë¦¬</h2>
					<h3>ì  4 ì¡° (íìê°ì)</h3>
					<p>ì´ì©ìë íìê°ìì ì ì²­íë ¤ë©´ ì½ê´ì ë´ì©ì ëíì¬ ëìë¥¼ í ë¤ì íìê°ìì ì²­ì íê³ , ê³ ìº íì ì´ë¬í ì ì²­ì ëíì¬ ì¹ëí¨ì¼ë¡ì¨ íìê°ìì´ ë©ëë¤.</p>

					<h3>ì  5 ì¡° (íìì ë³´ì ë³ê²½)</h3>
					<p>íìì ê°ì¸ì ë³´ê´ë¦¬íë©´ì íµíì¬ ì¸ì ë ì§ ë³¸ì¸ì ê°ì¸ì ë³´ë¥¼ ì´ëíê³  ìì í  ì ììµëë¤. íìì ì´ì©ì ì²­ ì ê¸°ì¬í íìì ë³´ê° ë³ê²½ëìì ê²½ì° ìì ì´ ì§ì  ì¨ë¼ì¸ì¼ ë¡ ìì í´ì¼ íë©°, ë³ê²½íì§ ìì ì ë³´ë¡ ì¸í´ ë°ìëë ë¬¸ì ì ì±ìì íììê² ììµëë¤.</p>

					<h3>ì  6 ì¡° (íì íí´ ë° ìê²©ìì¤, ìë¹ì¤ ì´ì©ì í ë±)</h3>
					<p>íìì ê°ì¸ì ë³´ê´ë¦¬íë©´ì íµíì¬ ì¸ì ë ì§ ë³¸ì¸ì ê°ì¸ì ë³´ë¥¼ ì´ëíê³  ìì í  ì ììµëë¤. íìì ì´ì©ì ì²­ ì ê¸°ì¬í íìì ë³´ê° ë³ê²½ëìì ê²½ì° ìì ì´ ì§ì  ì¨ë¼ì¸ì¼ ë¡ ìì í´ì¼ íë©°, ë³ê²½íì§ ìì ì ë³´ë¡ ì¸í´ ë°ìëë ë¬¸ì ì ì±ìì íììê² ììµëë¤.</p>
					<ul>
						<li>â  íìì íí´ë¥¼ í¬ë§í  ê²½ì° íí´ë¥¼ ìì²­í  ì ìì¼ë©°, ê³ ìº íì ê´ë ¨ë² ë±ì´ ì íë ë°ì ë°ë¼ ì´ë¥¼ ì²ë¦¬í©ëë¤. íìì´ ìë°ì ì¼ë¡ ê³ì½ì í´ì§í  ê²½ì°, ê³ ìº íì ê´ë ¨ë² ë° ê°ì¸ì ë³´ì·¨ê¸ë°©ì¹¨ì ë°ë¼ íìì ë³´ë¥¼ ì­ì í©ëë¤. íìì´ ë¤ì ê° í¸ì ì¬ì ì í´ë¹íë ê²½ì°, ê³ ìº íì íììê²©ì ì í ë°
							ì ì§ìí¬ ì ììµëë¤.
							<ul>
								<li>1. ê°ì ì ì²­ ìì íì ë´ì©ì ë±ë¡í ê²½ì°</li>
								<li>2. ë¤ë¥¸ ì¬ëì ìë¹ì¤ ì´ì©ì ë°©í´íê±°ë íì¸ì ëªìë¥¼ í¼ìíê±°ë ê·¸ ì ë³´ë¥¼ ëì©íë ë± ì ì ê±°ë ë° ì ë³´íµì ìë¹ì¤ ì´ì©ì§ìë¥¼ ìííë ê²½ì°</li>
								<li>3. ì ê³µëë ì ë³´ë¥¼ ë³ê²½íë ë± ê³ ìº íì ì´ìì ë°©í´í ê²½ì°</li>
								<li>4. ë²ë ¹ê³¼ ë³¸ ì½ê´ì´ ê¸ì§íê±°ë ë¯¸íììì ì í´íë íìë¥¼ íë ê²½ì°</li>
							</ul>
						</li>
						<li>â¡ ê³ ìº íì íììê²© ë° ìë¹ì¤ ì´ì©ì ì í, ì ì§ ìí¨ í, ê·¸ ì¬ì ê° ìì ëì§ ìëíë ê²½ì° íììê²©ì ìì¤ìí¬ ì ììµëë¤.</li>
					</ul>

					<h2>ì  3 ì¥ ìë¹ì¤ ì´ì©</h2>
					<h3>ì  7 ì¡° (ìë¹ì¤ì êµ¬ë¶)</h3>
					<p>ê³ ìº íì´ ì´ì©ììê² ì ê³µíë ìë¹ì¤ë ê¸°ë³¸ìë¹ì¤ì ë¶ê°ìë¹ì¤ ë±ì¼ë¡ êµ¬ë¶ íë©°, ìë¹ì¤ì ì¢ë¥ì ë´ì© ë±ì ê³ ìº íì´ ê³µì§ë ìë¹ì¤ ì´ì©ìë´ìì ë³ëë¡ ì íë ë°ì ìí©ëë¤.</p>

					<h3>ì  8 ì¡° (ìë¹ì¤ì ì´ì©ìê°)</h3>
					<p>ê³ ìº íì´ ì´ì©ììê² ì ê³µíë ìë¹ì¤ë ê¸°ë³¸ìë¹ì¤ì ë¶ê°ìë¹ì¤ ë±ì¼ë¡ êµ¬ë¶ íë©°, ìë¹ì¤ì ì¢ë¥ì ë´ì© ë±ì ê³ ìº íì´ ê³µì§ë ìë¹ì¤ ì´ì©ìë´ìì ë³ëë¡ ì íë ë°ì ìí©ëë¤.</p>
					<ul>
						<li>â  ìë¹ì¤ë ì°ì¤ë¬´í´ 1ì¼ 24ìê° ì ê³µí¨ì ìì¹ì¼ë¡ íë©°, ê³ ìº íì´ ìë¬´ì, ì´ìì, ê¸°ì ìì ì´ì ë¡ ìë¹ì¤ì ì ë¶ ëë ì¼ë¶ê° ì¼ì ì¤ì§ë  ì ìì¼ë©°, ì´ ê²½ì° ë´ì©ì ì¬ì ì ê³µì§í©ëë¤.</li>
						<li>â¡ ê³ ìº íì ìë¹ì¤ ë³ë¡ ì´ì© ê°ë¥í ìê°ì ë³ëë¡ ì í  ì ìì¼ë©° ì´ ê²½ì° ê·¸ ë´ì©ì ì¬ì ì ê³µì§í©ëë¤.</li>
					</ul>

					<h3>ì  9 ì¡° (ìë¹ì¤ ë³ê²½)</h3>
					<p>ê³ ìº íì ìë¹í ì´ì ê° ìë ê²½ì°ì ìë¬´ì, ì´ìì, ê¸°ì ìì íìì ë°ë¼ ì ê³µíê³  ìë ì ë¶ ëë ì¼ë¶ ìë¹ì¤ë¥¼ ë³ê²½ ë° ì¤ë¨ í  ì ìì¼ë©°, ì´ ê²½ì° ê·¸ ë´ì©ì ì¬ì ì ê³µì§í©ëë¤.</p>

					<h2>ì  4 ì¥ ìë¬´ ë° ì±ì</h2>
					<h3>ì  10 ì¡° (ê³ ìº íì ìë¬´)</h3>
					<p>ê³ ìº íì´ ì´ì©ììê² ì ê³µíë ìë¹ì¤ë ê¸°ë³¸ìë¹ì¤ì ë¶ê°ìë¹ì¤ ë±ì¼ë¡ êµ¬ë¶ íë©°, ìë¹ì¤ì ì¢ë¥ì ë´ì© ë±ì ê³ ìº íì´ ê³µì§ë ìë¹ì¤ ì´ì©ìë´ìì ë³ëë¡ ì íë ë°ì ìí©ëë¤.</p>
					<ul>
						<li>â  ê³ ìº íì ê´ë ¨ë²ê³¼ ì´ ì½ê´ìì ê¸ì§íê±°ë ë¯¸íììì ë°íë íìë¥¼ íì§ ìì¼ë©°, ê³ìì ì´ê³  ìì ì ì¼ë¡ ìë¹ì¤ë¥¼ ì ê³µíê¸° ìíì¬ ìµì ì ë¤íì¬ ë¸ë ¥í©ëë¤.</li>
						<li>â¡ ê³ ìº íì ìë¹ì¤ì ê´ë ¨í íìì ë¶ë§ì¬í­ì´ ì ìëë ê²½ì° ì´ë¥¼ ì¦ì ì²ë¦¬íì¬ì¼ íë©°, ì¦ì ì²ë¦¬ê° ê³¤ëí ê²½ì° ê·¸ ì¬ì ì ì²ë¦¬ ì¼ì ì í´ë¹ íììê² íµì§íì¬ì¼ í©ëë¤.</li>
						<li>â¢ ê³ ìº íì ìë¹ì¤ì ì ê³µê³¼ ê´ë ¨íì¬ ìê² ë íìì ê°ì¸ì ë³´ë¥¼ ë³¸ì¸ì ì¹ë ìì´ ì 3ììê² ëì¤, ë°°í¬íì§ ìê³ , ì´ë¥¼ ë³´í¸íê¸° ìíì¬ ë¸ë ¥í©ëë¤. íìì ê°ì¸ì ë³´ë³´í¸ ë° ì¬ì©ì ëí´ìë ê´ë ¨ë² ë° ê°ì¸ì ë³´ì·¨ê¸ë°©ì¹¨ì ë°ë¦ëë¤.</li>
					</ul>

					<h3>ì  11 ì¡° (íìì ìë¬´)</h3>
					<p>íìì ë¤ì íìë¥¼ íì¬ìë ì ë©ëë¤.</p>
					<ul>
						<li>â  ì ì²­ ëë ë³ê²½ ì íìë´ì©ì ë±ë¡</li>
						<li>â¡ íì¸ì ì ë³´ëì©</li>
						<li>â¢ ê³ ìº íì´ ê²ìí ì ë³´ì ë³ê²½</li>
						<li>â£ ê³ ìº íì´ ì í ì ë³´ ì´ì¸ì ì ë³´(ì»´í¨í° íë¡ê·¸ë¨ ë±) ë±ì ì¡ì  ëë ê²ì</li>
						<li>â¤ ê³ ìº íê³¼ ê¸°í ì 3ìì ì ìê¶ ë± ì§ì ì¬ì°ê¶ì ëí ì¹¨í´</li>
						<li>â¥ ê³ ìº í ë° ê¸°í ì 3ìì ëªìë¥¼ ìììí¤ê±°ë ìë¬´ë¥¼ ë°©í´íë íì</li>
						<li>â¦ ì¸ì¤ ëë í­ë ¥ì ì¸ ë©ìì§, íì, ìì±, ê¸°í ë¯¸íììì ë°íë ì ë³´ë¥¼ ìë¹ì¤ì ê³µê° ëë ê²ìíë íì</li>
						<li>â§ ê³ ìº íì ëì ìì´ ìë¦¬ë¥¼ ëª©ì ì¼ë¡ ìë¹ì¤ë¥¼ ì¬ì©íë íì</li>
						<li>â¨ ê¸°í ë¶ë²ì ì´ê±°ë ë¶ë¹í íì</li>
					</ul>

					<h3>ì  12 ì¡° (ìë ê¸ì§)</h3>
					<p>íìì ìë¹ì¤ì ì´ì©ê¶í, ê¸°í ì´ì© ê³ì½ì ì§ìë¥¼ íì¸ìê² ìë, ì¦ì¬í  ì ìì¼ë©°, ì´ë¥¼ ë´ë³´ë¡ ì ê³µí  ì ììµëë¤.</p>

					<h3>ì  13 ì¡° (ê²ìë¬¼ì ëí ê¶ë¦¬ ë° ì±ì)</h3>
					<p>íìì ìë¹ì¤ì ì´ì©ê¶í, ê¸°í ì´ì© ê³ì½ì ì§ìë¥¼ íì¸ìê² ìë, ì¦ì¬í  ì ìì¼ë©°, ì´ë¥¼ ë´ë³´ë¡ ì ê³µí  ì ììµëë¤.</p>
					<ul>
						<li>â  ê²ìë¬¼ì ëí ì ìê¶ì í¬í¨í ëª¨ë  ê¶ë¦¬ ë° ì±ìì ì´ë¥¼ ê²ìí íììê² ìì¼ë©°, ê³ ìº íì ìë¹ì¤ ë´ì ê²ì¬í  ê¶ë¦¬ë¥¼ ê°ìµëë¤.</li>
						<li>â¡ ê³ ìº íì íìì´ ìë¹ì¤ì ê²ì, ê²ì¬íê±°ë ìë¹ì¤ë¥¼ íµí´ ì ì¡, ìì í ë´ì©ë¬¼ ë° ê·¸ ê²°ê³¼ì ëíì¬ ì±ìì§ì§ ìì¼ë©°, ìëì¬í­ì í´ë¹íë ê²½ì° ê²ìë¬¼ì ììë¡ ì­ì í  ì ììµëë¤.
							<ul>
								<li>1. íì¸ì ë¹ë°©íê±°ë, íë¼ì´ë²ìë¥¼ ì¹¨í´íê±°ë, ëªìë¥¼ ìììí¤ë ë´ì©ì¸ ê²½ì°</li>
								<li>2. ê³µê³µì§ì ë° ë¯¸íììì ìë°ëë ë´ì©ì¸ ê²½ì°</li>
								<li>3. ìë¹ì¤ì ìì ì ì¸ ì´ìì ì§ì¥ì ì£¼ê±°ë ì¤ ì°ë ¤ê° ìë ê²½ì°</li>
								<li>4. ë²ì£íìì ê´ë ¨ëë¤ê³  íë¨ëë ë´ì©ì¸ ê²½ì°</li>
								<li>5. ê³ ìº íì ì§ì ì¬ì°ê¶, íì¸ì ì§ì ì¬ì°ê¶ ë± ê¸°í ê¶ë¦¬ë¥¼ ì¹¨í´íë ë´ì©ì¸ ê²½ì°</li>
								<li>6. í¹ì ì íì ì ì  ë± ê¸°í ìì©ëª©ì ì¼ë¡ ê²ìëë ë´ì©ì¸ ê²½ì°</li>
								<li>7. ìë ¥ë ì ë³´ë¥¼ ë¬´ë¨ ê°ì¡°íë ê²½ì°</li>
								<li>8. í íìì íì ID, ë¹ë°ë²í¸ë¥¼ ëì©íë ê²½ì°</li>
								<li>9. ê²ìíì ëª©ì ì ë§ì§ ìë ì¬ì´ë² ìì ë° ëë°° ëª©ì ì ë´ì©ì¸ ê²½ì°</li>
								<li>10. ê¸°í ê´ê³ë²ë ¹ì ìë°ëë¤ê³  íë¨ëë ê²½ì°</li>
							</ul>
						</li>
					</ul>

					<h3>ì  14 ì¡° (ì±ìì í)</h3>
					<ul>
						<li>â  ê³ ìº íì ì²ì¬ì§ë³ ëë ì´ì ì¤íë ë¶ê°í­ë ¥ì¼ë¡ ì¸íì¬ ìë¹ì¤ë¥¼ ì ê³µí  ì ìë ê²½ì°ìë ìë¹ì¤ ì ê³µì ê´í ì±ìì ì§ì§ ììµëë¤.</li>
						<li>â¡ ê³ ìº íì íìì ê·ì±ì¬ì ë¡ ì¸í ìë¹ì¤ ì´ì©ì ì¥ì ì ëíì¬ë ì±ìì ì§ì§ ììµëë¤.</li>
						<li>â¢ ê³ ìº íì íìì´ ìë¹ì¤ì ê´ë ¨íì¬ ê²ì¬í ì ë³´, ìë£, ì¬ì¤ì ì ë¢°ë, ì íì± ë±ì ë´ì©ì ê´íì¬ë ì±ìì ì§ì§ ììµëë¤.</li>
						<li>â£ ê³ ìº íì íì ê° ëë íìê³¼ ì 3ì ìí¸ê°ì ìë¹ì¤ë¥¼ ë§¤ê°ë¡ íì¬ ê±°ë ë±ì í ê²½ì°ìë ì±ìì ì§ì§ ììµëë¤.</li>
					</ul>

					<h3>ì  15 ì¡° (ë¶ìì í´ê²°)</h3>
					<p>ë³¸ ì½ê´ì ëíë¯¼êµ­ë²ë ¹ì ìíì¬ ê·ì ëê³  ì´íëë©°, ìë¹ì¤ ì´ì©ê³¼ ê´ë ¨íì¬ ê³ ìº íê³¼ íìê°ì ë°ìí ë¶ìì ëí´ìë ë¯¼ì¬ìì¡ë²ìì ì£¼ìì§ë¥¼ ê´í íë ë²ìì í©ìê´í ë¡ í©ëë¤.</p>

					<h3>ì  16 ì¡° (ê·ì ì ì¤ì©)</h3>
					<p>ë³¸ ì½ê´ì ëªìëì§ ìì ì¬í­ì ëí´ìë ê´ë ¨ë²ë ¹ì ìíê³ , ë²ì ëªìëì§ ìì ë¶ë¶ì ëíì¬ë ê´ìµì ìí©ëë¤.</p>

				</div>

				<h2 class="skip">ì´ì©ì½ê´</h2>
			</section>

			<p class="join_tt">ê°ì¸ì ë³´ ìì§ ë° íì©ì´ì©ì ê´í ëì</p>
			<section>
				<h2 class="skip">ì´ì©ì½ê´</h2>
				<div class="cont">
					<h3>1. ëª©ì : ì¬íì ë³´ ìë¹ì¤, ì¨ë¼ì¸ íì ê´ë¦¬</h3>
					<h3>2. ìì§í­ëª©:</h3>
					<ul style="padding-top: 0">
						<li>- íì: ì±ëª, ìì´ë, ë¹ë°ë²í¸, ì´ë©ì¼</li>
					</ul>

					<h3>3. ìì§ë°©ë²: ííì´ì§ íì ê°ì</h3>
					<h3>4. ê°ì¸ì ë³´ ë³´ì Â·ì´ì©ê¸°ê°: <span class="txt_underline">ëìì¼ë¡ë¶í° ëìì² í(ì§ê¶í´ì§)ì ê¹ì§</span></h3>
					<h3>â» ìì ê°ì¸ì ë³´ ìì§â§ì´ì©ì ëí ëìë¥¼ ê±°ë¶í  ê¶ë¦¬ê° ììµëë¤. ê·¸ë¬ë ëìë¥¼ ê±°ë¶í  ê²½ì° ê³ ìº í ííì´ì§ ì´ì©ì ì íì ë°ì ì ììµëë¤.</h3>
				</div>

			</section>
			<section class="input_form">
				<h2 class="skip">ì´ë©ì¼ íìê°ì ìììë ¥</h2>
				<div class="form_cont">
					<!--ì¼ë°ê²ìí_ì°ê¸°-->
					<h3 class="icon_h3">íìê°ì</h3>
					<div class="board_form">
						<table class="table_form">
							<caption>
								<strong>ì´ë©ì¼ íìê°ì</strong>
								<p>ì´ë©ì¼ íìê°ì ììì ìë ¥íë íë¡ ìì´ë, ì´ë¦, ëë¤ì, ì´ë©ì¼, ë¹ë°ë²í¸, ë¹ë°ë²í¸íì¸ ë´ì©ì¼ë¡ ëëì´ ìë ¥í©ëë¤.</p>
							</caption>
							<tbody>
								<tr>
											<th scope="row" class="gray w20"><label for="me_id">ìì´ë(*)</label></th>
											<td class="w80"><input id="me_id" name="me_id" class="overcheck" placeholder="ìì´ëë¥¼ ìë ¥íì¸ì." type="text" value=""><button type="button" class="btn_black" onclick="checkDupId(); return false;">ì¤ë³µíì¸</button> <input type="hidden" id="idCntRes" name="idCntRes" value=""></td>
										</tr>
									<tr>
									<th scope="row" class="gray w20"><label for="me_name">ì´ë¦(*)</label></th>
									<td class="w80"><input id="me_name" name="me_name" class="txt" placeholder="ì´ë¦ì ìë ¥íì¸ì." type="text" value=""></td>
								</tr>
								<tr>
									<th scope="row" class="gray"><label for="me_nickname">ëë¤ì(*)</label></th>
									<td><input id="me_nickname" name="me_nickname" class="overcheck" placeholder="ëë¤ìì ìë ¥íì¸ì." type="text" value=""><button type="button" class="btn_black" onclick="checkDupNickName(); return false;">ì¤ë³µíì¸</button> <input type="hidden" id="nicknameCntRes" name="nicknameCntRes" value=""></td>
								</tr>
								<tr>
									<th scope="row" class="gray"><label for="me_email">ì´ë©ì¼(*)</label></th>
									<td>
										<input id="me_email" name="me_email" class="overcheck" placeholder="ì´ë©ì¼ì ìë ¥íì¸ì." type="text" value=""><button type="button" class="btn_black" onclick="checkDupEmail(); return false;">ì¤ë³µíì¸</button> <input type="hidden" id="emailCntRes" name="emailCntRes" value="">
								<button type="button" class="btn_black" onclick="getCertKey(); return false;">ì¸ì¦íê¸°</button> <input type="hidden" id="emailCntRes" name="emailCntRes" value="N">
								</td>
								</tr>
								<tr style="display:none;" id="cert_tr">
									<th scope="row" class="gray"><label for="cert_key">ì¸ì¦ë²í¸</label></th>
									<td>
										<input type="hidden" id="cert_res" name="cert_res">
										<input type="hidden" id="cnv_cert_key" name="cnv_cert_key">
										<input type="text" name="cert_key" id="cert_key" class="txt30" maxlength="6" placeholder="ì¸ì¦ë²í¸ë¥¼ ìë ¥íì¸ì.">
										<button type="button" class="btn_black" onclick="checkCertKey(); return false;">íì¸</button> 
									</td>
								</tr>
								<tr>
											<th scope="row" class="gray w20"><label for="me_pwd">ë¹ë°ë²í¸(*)</label></th>
											<td class="w80"><input id="me_pwd" name="me_pwd" class="txt" placeholder="ë¹ë°ë²í¸ë¥¼ ìë ¥íì¸ì." type="password" value="" maxlength="12"><h4 class="icon_h4_">ìë¬¸,ì«ì ì¡°í©(6~12ì ì´ë´)</h4></td>
										</tr>
										<tr>
											<th scope="row" class="gray w20"><label for="re_password">ë¹ë°ë²í¸ íì¸(*)</label></th>
											<td class="w80"><input type="password" name="me_pwd_check" id="re_password" class="txt" placeholder="ë¹ë°ë²í¸ íì¸." maxlength="12"></td>
										</tr>
									</tbody>
						</table>
					</div>
					<!-- ì¶ê° Tipë°ì¤ -->
					<!-- <div class="tip_box2 mb_20">
							<p>Notice</p>
							<ul>
								<li>ìº íì¥ ì´ììë¡ ê°ì ì ì¹ì¸í ì´ì©ì´ ê°ë¥í©ëë¤.</li>
							</ul>
						</div> -->
					<!-- // -->
					<h5 class="icon_h5_ mt_30">ì´ë©ì¼ íìê°ìì ì´ë©ì¼ ì¸ì¦ì íìì¼ë§ íìê°ìì´ ìë£ë©ëë¤.</h5>
						<h5 class="icon_h5_ mt_10">ìë íìê°ì ë²í¼ì ëë¥´ì  í ìë ¥íì  ì´ë©ì¼ ì£¼ììì ì¸ì¦ ë©ì¼ì íì¸ íì¬ ì£¼ìê¸° ë°ëëë¤.</h5>
					<p class="btn_join">
						<button type="submit" class="btn_black">íìê°ì</button>
					</p>
					<!--//ì´ë©ì¼íìê°ì_ì°ê¸°-->
				</div>
			</section>
		</section>
	</div>
	<!--//ë¡ê·¸ì¸ ìë ¥í¼-->
</form></div>
				<!--//ë´ì©ì¢ë£-->
			</div>
		</div>
		<!--//ì½íì¸ ë°ì¤-->
	</section>
 
	</div>

	<footer id="footer">
	<!--íë¨ê°ì¸ì ë³´ ë§í¬ìì­-->
	<div class="f_info_w">
		<div class="layout">
			<div class="f_logo">
				<span class="skip">ëíë¯¼êµ­ êµ¬ìêµ¬ì ê³ ìº í</span>
			</div>
			<ul class="f_menu">
				<li class="privacy"><a href="https://www.gocamping.or.kr/bsite/cntnts/read.do?cntnts_idx=7">ê°ì¸ì ë³´ì²ë¦¬ë°©ì¹¨</a></li>
				<li><a href="https://www.gocamping.or.kr/bsite/cntnts/read.do?cntnts_idx=8">ì ìì°í¸ë¬´ë¨ìì§ê±°ë¶</a></li>
				<li><a href="https://www.gocamping.or.kr/bsite/cntnts/read.do?cntnts_idx=9">ìº íì¥ ë±ë¡ìë´</a></li>
				<li><a href="https://www.gocamping.or.kr/zboard/list.do?lmCode=campSttemnt">ë¯¸ë±ë¡ì¼ìì¥ë¶ë²ììì ê³ </a></li>
			</ul>
			<ul class="f_sns_w">
				<li class="sns00">
					<a href="https://www.instagram.com/gocamping_official/" target="_BLANK" title="ê³ ìº íì¸ì¤íê·¸ë¨ ë°ë¡ê°ê¸°">ê³ ìº í ì¸ì¤íê·¸ë¨</a>
				</li>
				<li class="sns01">
					<a href="https://www.facebook.com/go2thecamping/" target="_BLANK" title="ê³ ìº í ê³µì íì´ì¤ë¶ ë°ë¡ê°ê¸°">ê³ ìº í ê³µì íì´ì¤ë¶</a>
				</li>
				<li class="sns02">
					<a href="https://blog.naver.com/gocamping_official" target="_BLANK" title="ê³ ìº í ê³µì ë¸ë¡ê·¸ ë°ë¡ê°ê¸°">ê³ ìº í ê³µì ë¸ë¡ê·¸</a>
				</li>
				<li class="sns03">
					<a href="https://www.youtube.com/channel/UCuCBPZUAgFBX0J1EVnkuXPQ" target="_BLANK" title="ê³ ìº í ê³µì ì íë¸ ë°ë¡ê°ê¸°">ê³ ìº í ê³µì ì íë¸</a>
				</li>
			</ul>
			<div class="btn_top" style="display: block;">ìë¨ì¼ë¡</div>
		</div>
	</div>
	<!--//íë¨ê°ì¸ì ë³´ ë§í¬ìì­-->
	<!--íë¨ì£¼ììì­&ë°ë¡ê°ê¸° ë§í¬-->
	 
	<div class="f_link_w">
		
		<div class="layout">
			<!--íë¨ì£¼ì-->
			<div class="f_addr">
				<address class="addr">
					<div>ê°ìë ìì£¼ì ì¸ê³ë¡ 10 (ë°ê³¡ë 1914-6) íêµ­ê´ê´ê³µì¬</div>
					<div>TEL : 02-6450-0909</div>
					<div>EMAIL : <a href="mailto:webmaster@gocamping.or.kr" class="f_mail">webmaster@gocamping.or.kr</a></div>
				</address>
				<p class="copyright">
					Copyrights(c) 2018 <span>KOREA TOURISM ORGANIZATION</span> ALL RIGHTS RESERVED.
				</p>
			</div>
			<!--//f_addr-->
			<!--//íë¨ì£¼ì--> 
			<div class="f_link2"><button type="button" onclick="location.href=&#39;https://www.gocamping.or.kr/locgov/account/login.do&#39;" target="_blank">ì§ìì²´ê³µë¬´ì</button></div>
			<div class="f_link"> 
				<div class="dropdown">
					<button class="f_link_tt dropbtn" onclick="myFunction()">ê´ë ¨ì¬ì´í¸</button>
					<div id="myDropdown" class="dropdown-content" style="display: none;">
						<a href="http://kto.visitkorea.or.kr/kor.kto" target="_BLANK">íêµ­ê´ê´ê³µì¬</a>
						<a href="http://korean.visitkorea.or.kr/kor/bz15/addOn/main/publish/index.jsp" target="_BLANK">ëíë¯¼êµ­ êµ¬ìêµ¬ì</a>
						<a href="http://www.durunubi.kr/" target="_BLANK">ëë£¨ëë¹</a>
						<a href="http://www.smartoutbound.or.kr/main/main.do" target="_BLANK">ì§êµ¬ì´ì¤ë§í¸ì¬í</a>
						<a href="http://korean.visitkorea.or.kr/kor/tt/pr_gallery/new_photo_gallery/main/main.jsp" target="_BLANK">ê´ê´ì¬ì§ ê°¤ë¬ë¦¬</a>
					  </div>
				</div>
			</div>
			<!--//f_link-->
			 
		</div>
	</div>
	<!--//íë¨ì£¼ììì­&ë°ë¡ê°ê¸° ë§í¬-->
</footer> 
</div></body></html>