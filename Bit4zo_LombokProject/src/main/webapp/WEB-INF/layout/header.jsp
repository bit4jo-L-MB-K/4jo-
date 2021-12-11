<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">
                <c:choose>
               <c:when test="${sessionScope.loginok!=null}">
                  <a href="${root}/login/logoutprocess">Sign out</a>
                  <a href="${root}/cscenter/csmain">FAQs</a>
                  
               </c:when>
               <c:otherwise>
                  <a href="${root}/login/signin">Sign in</a>
                  <a href="${root}/cscenter/csmain">FAQs</a>
               </c:otherwise>
            </c:choose>
            </div>
        </div>
        <div class="offcanvas__nav__option">
            <a href="#" class="search-switch"><img src="${root}/img/icon/search.png" alt=""></a>
            <a href="#"><img src="${root}/img/icon/heart.png" alt=""></a>
            <a href="#"><img src="${root}/img/icon/cart.png" alt=""> <span>0</span></a>
            <div class="price">$0.00</div>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__text">
            <c:choose>
                <c:when test="${sessionScope.loginok!=null}">
                   <p>${sessionScope.myid}님 로그인 중</p>
                </c:when>
                <c:otherwise>
                   <p>이번 겨울은 LOMBOK과 함께</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <c:choose>
                               <c:when test="${sessionScope.loginok!=null}">
                                  <p>${sessionScope.myid}님 로그인 중</p>
                               </c:when>
                               <c:otherwise>
                                  <p>이번 겨울은 LOMBOK과 함께</p>
                               </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            <div class="header__top__links">
                                <c:choose>
                                    <c:when test="${sessionScope.loginok!=null}">
                                       <a style="color: pink;" href="${root}/login/logoutprocess">Sign out</a>
                                       <a href="${root}/cscenter/csmain">FAQs</a>
                                       <a href="${root}/member/mypage">MyPage</a>
                                    </c:when>
                                   <c:otherwise>
                                       <a style="color: lightgreen;" href="${root}/login/signin">Sign in</a>
                                       <a href="${root}/cscenter/csmain">FAQs</a>
                                    </c:otherwise>
                              </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="${root}/"><img src="${root}/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="${root}/">HOME</a></li>
                            <li><a href="${root}/shop/list">SHOP</a>
                                <ul class="dropdown" style="text-align: center;">
                                    <li><a href="#">전체</a></li>
                                    <li><a href="#">반팔</a></li>
                                    <li><a href="#">긴팔</a></li>
                                    <li><a href="#">스커트</a></li>
                                    <li><a href="#">바지</a></li>
                                    <li><a href="#">패딩</a></li>
                                    <li><a href="#">코트</a></li>
                                    <li><a href="#">신발</a></li>
                                    
                                </ul>
                            </li>
                            <li><a href="#">LOOK BOOK</a></li>
                            <li><a href="#">EVENT</a>
                                <ul class="dropdown">
                                    <li><a href="#">진행중인 이벤트</a></li>
                                    <li><a href="#">지난 이벤트</a></li>
                                </ul>
                            </li>
                             <c:if test="${sessionScope.loginok!=null && sessionScope.myid.equals('admin')}">
                                <li><a href="${root}/shop/adminmain">ADMIN</a></li>
                               </c:if>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                    
                        <a href="#" class="search-switch"><img src="${root}/img/icon/search.png" alt=""></a>
                        
                        <a href="#"><img src="${root}/img/icon/heart.png" alt=""></a>
                        <a href="#"><img src="${root}/img/icon/cart.png" alt=""> <span>0</span></a>
                        <div class="price">$0.00</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->
</body>
</html>