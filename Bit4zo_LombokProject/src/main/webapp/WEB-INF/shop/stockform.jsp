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
 <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>StockEdit</h4>
                        <div class="breadcrumb__links">
                            <a href="${root}/shop/adminmain">AdminMain</a>
                            <span>StockEdit</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
    </section>
		<div style="margin-top: 30px;"></div>
		<div>
			<div class="well" style="width: 550px; margin-left: 30px;">
				<form action="update3" method="post" enctype="multipart/form-data">
				<input type="hidden" name="currentPage" value="${currentPage}">
					<b>재고관리</b>
					<table class="table table-bordered" style="width: 550px; margin-top: 20px;">
					<c:forEach var="a" items="${list}">
		<input type="hidden" name="num" value="${a.num}">
						<tr>
							<th bgcolor="#ddd" width="120">상품아이디</th>
							<td>${a.pro_id}</td>
						</tr>

						<tr>
							<th bgcolor="#ddd" width="120">색상</th>
							<td>${a.color_name}</td>
			</tr>
			<tr>
				<th bgcolor="#ddd" width="120">사이즈</th>
				<td>${a.c_size}</td>
			</tr>
			<tr>
				<th bgcolor="#ddd" width="120">수량</th>
				<td><input type="text" name="su" class="form-control"
					style="width: 80px;" required="required" class="form" value="${a.su}"></td>
			</tr>
				<tr>
					</c:forEach>
					
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-dark" style="width: 100px;">저장</button>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
</div>

	<p style="clear: both;"></p>
	</div>
</body>
</html>