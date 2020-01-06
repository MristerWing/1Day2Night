<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
    <title>Ample Admin Template - The Ultimate Multipurpose admin template</title>
    <!-- Bootstrap Core CSS -->
    <link href="${root}/resources/css/admin/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="${root}/resources/css/admin/sidebar-nav.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="${root}/resources/css/admin/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${root}/resources/css/admin/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="${root}/resources/css/admin/default.css" id="theme" rel="stylesheet">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

	<!-- jQuery -->
   <script src="${root}/resources/javascript/admin/jquery.min.js"></script>
   <!-- /#wrapper -->
   <!-- Bootstrap Core JavaScript -->
   <script src="${root}/resources/javascript/admin/bootstrap.min.js"></script>
   <!-- Menu Plugin JavaScript -->
   <script src="${root}/resources/javascript/admin/sidebar-nav.min.js"></script>
   <!--slimscroll JavaScript -->
   <script src="${root}/resources/javascript/admin/jquery.slimscroll.js"></script>
   <!--Wave Effects -->
   <script src="${root}/resources/javascript/admin/waves.js"></script>
   <!-- Custom Theme JavaScript -->
   <script src="${root}/resources/javascript/admin/custom.min.js"></script>
</head>

<body class="fix-header">
    <!-- ============================================================== -->
    <!-- Preloader -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Wrapper -->
    <!-- ============================================================== -->
    <div id="wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <nav class="navbar navbar-default navbar-static-top m-b-0">
            <div class="navbar-header">
                <div class="top-left-part">
                    <!-- Logo -->
                    <a class="logo" href="${root}/">
                        <!-- Logo icon image, you can use font-icon also --><b>
                        <!--This is dark logo icon--><!--This is light logo icon--><img src="${root}/resources/images/ODTN.png" alt="home" class="light-logo" style="width: 210px; margin-top: -55px;" />
                     </b>
                      </a>
                </div>
                <!-- /Logo -->
                <ul class="nav navbar-top-links navbar-right pull-right">
                </ul>
            </div>
            <!-- /.navbar-header -->
            <!-- /.navbar-top-links -->
            <!-- /.navbar-static-side -->
        </nav>
        <!-- End Top Navigation -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav slimscrollsidebar">
                <div class="sidebar-head">
                    <h3><span class="fa-fw open-close"><i class="ti-close ti-menu"></i></span> <span class="hide-menu">Navigation</span></h3>
                </div>
                <ul class="nav" id="side-menu">
                    <li style="padding: 158px 0 0;">
                        <a href="${root}/admin/list.do" class="waves-effect" style="background-color: black; color: white;"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>회원관리</a>
                    </li>
                    <li>
                        <a href="${root}/admin/boardList.do" class="waves-effect"><i class="fa fa-user fa-fw" aria-hidden="true"></i>게시판 관리</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Left Sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page Content -->
        <!-- ============================================================== -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">관리자 페이지</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li class="active">게시판 관리</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title" style="color: red;">게시판 관리</h3>
                            	<script type="text/javascript">
		                           	function moveurl(url) { 
		                           	    location.href = url;
		                           	}
                            	</script>
                              <form name="move" method="get">
		                         <select name=url onchange="moveurl(this.value)">
		                        	<option value="${root}/admin/boardList.do">캠핑소식</option>
		                        	<option value="${root}/admin/boardreview.do" selected="selected">캠핑후기</option>
		                        	<option value="${root}/admin/boardQnA.do">캠핑문의</option>
		                     	</select>
		                      </form>
     							<jsp:include page="./boardreviewtable.jsp" flush="true">
     								<jsp:param name="test" value="test"/>
     							</jsp:include>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    
</body>

</html>
