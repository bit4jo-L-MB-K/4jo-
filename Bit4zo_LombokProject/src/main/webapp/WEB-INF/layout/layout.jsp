<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>L@MB@K</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${root}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${root}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${root}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${root}/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${root}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${root}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${root}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${root}/css/style.css" type="text/css">
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!-- Page Preloder -->
<div id="preloder">
	<div class="loader"></div>
</div>

<div class="layout">
	<div class="header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="main">
		<tiles:insertAttribute name="main"/>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>


    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->

    <!-- Js Plugins -->
    <script src="${root}/js/jquery-3.3.1.min.js"></script>
    <script src="${root}/js/bootstrap.min.js"></script>
    <script src="${root}/js/jquery.nice-select.min.js"></script>
    <script src="${root}/js/jquery.nicescroll.min.js"></script>
    <script src="${root}/js/jquery.magnific-popup.min.js"></script>
    <script src="${root}/js/jquery.countdown.min.js"></script>
    <script src="${root}/js/jquery.slicknav.js"></script>
    <script src="${root}/js/mixitup.min.js"></script>
    <script src="${root}/js/owl.carousel.min.js"></script>
    <script src="${root}/js/main.js"></script>
</body>
</html>