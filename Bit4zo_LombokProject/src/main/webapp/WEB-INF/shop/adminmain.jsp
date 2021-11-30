<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>AdminMain</h4>
                        <div class="breadcrumb__links">
                            <a href="${root}/">Home</a>
                            <span>AdminMain</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <section>
   					 <div class="sidebar">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseOne">관리자 목록</a>
                                    </div>
                                    <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div>
                                                <ul class="nice-scroll">
                                                    <li><a onclick="location.href='addform'">상품추가</a></li>
                                                    <li><a href="#">재고관리</a></li>
                                                    <li><a href="#">회원목록</a></li>
                                                    <li><a href="#">회원관리</a></li>
                                                    <li><a onclick="location.href='list'">상품메인으로</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                </div></section>
                             <p style="clear: both;"></p>
	<section>
	<caption><b>관리자 페이지</b></caption>
	<div class="alert alert-info">
	<b>총 ${totalCount} 개의 상품이 있습니다</b>
	</div>
	<table class="table table-bordered">
		<tr>
			<td align="center" colspan="9">
				<button type="button" class="btn btn-default"
				style="width:100px;" onclick="location.href='addform'">추가</button>
				
				<button type="button" class="btn btn-default"
				style="width:100px;" onclick="location.href='list'">샵리스트</button>
			</td>
		</tr>
		<tr bgcolor="#ddd">
			<th width="40">번호</th>
			<th width="70">상품번호</th>
			<th width="70">상품명</th>
			<th width="80">색상</th>
			<th width="50">가격</th>
			<th width="70">상품분류</th>
			<th width="80">입고날짜</th>
			<th width="80">수정/삭제</th>
		</tr>
		
		<c:if test="${totalCount==0}">
			<tr height="50">
				<td colspan="5" align="center">
					<h3>
						<b>등록된 글이 없습니다</b>
					</h3>
				</td>
			</tr>
		</c:if>
		<c:if test="${totalCount>0}">
			<c:forEach var="a" items="${list}">
				<tr>
					<td>${no}</td>
					<c:set var="no" value="${no-1}"/>
					<td>
					<!-- <a href="content?num=${a.num}&currentPage=${currentPage}&key=list"
					style="color: black;"> -->
					<a>${a.pro_id}</a>
					</td>
					<td>${a.joindto.pro_name}</td>
					<td>${a.color}</td>
					<td>${a.joindto.price}</td>
					<td>${a.joindto.pro_sub}</td>
					<td>
						<fmt:formatDate value="${a.joindto.ipgoday}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
	<button type="button" class="btn btn-info btn-sm"
		onclick="location.href='updateform?idx=${a.joindto.idx}&color=${a.color}'">수정</button>
	<button type="button" class="btn btn-danger btn-sm"
		onclick="location.href='delete?idx=${a.joindto.idx}&color=${a.color}&currentPage=${currentPage}&key=list'">삭제</button>
					</td>
				</tr>
			</c:forEach>
			
		</c:if>
	
	</table>
	
	<!-- 페이징 -->
	<c:if test="${totalCount>0}">
		<div style="width: 100%; text-align: center;">
			<ul class="pagination">
				<!-- 이전 -->
				<c:if test="${startPage>1}">
					<li><a href="adminmain?currentPage=${startPage-1}">이전</a></li>
				</c:if>
				<c:forEach var="pp" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage==pp}">
						<li class="active"><a href="adminmain?currentPage=${pp}">${pp}</a></li>
					</c:if>
					<c:if test="${currentPage!=pp}">
						<li><a href="adminmain?currentPage=${pp}">${pp}</a></li>
					</c:if>
				</c:forEach>

				<!-- 다음 -->
				<c:if test="${endPage<totalPage}">
					<li><a href="adminmain?currentPage=${endPage+1}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</c:if>
	</section>
	<p style="clear: both;"></p>
</body>
</html>