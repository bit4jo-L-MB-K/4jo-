<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<style>
 .mydiv {
        border: 0px solid #735e5e;
        width: 750px;
        height:500px;
        overflow:scroll;
   }
   
</style>
<body>
<div class="All">
<div style="float:left;">
<div class="container-fluid" style="width: 700px;">
<div style="margin:10px;">
<button data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"
class="btn btn-large-warning">>상품 정보 입력</button>
</div>
<div class="collapse" id="collapseExample" style="width:550px;">
<div class="well">
	<form action="insert" method="post" enctype="multipart/form-data">
		<b>상품정보입력</b>
		<table class="table table-bordered" style="width: 500px;">
			<tr>
				<th bgcolor="#ddd" width="120">상품코드</th>
				<td><input type="text" name="pro_id" class="form-control"
					style="width: 200px;" required="required"></td>
			</tr>
			<tr>
				<th bgcolor="#ddd" width="120">상품명</th>
				<td><input type="text" name="pro_name" class="form-control"
					style="width: 200px;" required="required"></td>
			</tr>
			<tr>
				<th bgcolor="#ddd" width="120">가 격</th>
				<td><input type="text" name="price" class="form-control"
					style="width: 200px;" required="required"></td>
			</tr>
			<tr>
				<th bgcolor="#ddd" width="120">재고</th>
				<td><input type="text" name="stock" class="form-control"
					style="width: 200px;" required="required"></td>
			</tr>
			<tr>
				<th bgcolor="#ddd" width="120">상품분류</th>
				<td><select name="pro_sub" required="required" class="form"
					style="width: 200px;">
						<option value="상의">상의</option>
						<option value="하의">하의</option>
						<option value="아우터">아우터</option>
						<option value="신발">신발</option>
				</select></td>
			</tr>
			<tr>
				<th bgcolor="#ddd" width="120">상품사진</th>
				<td><input multiple="multiple" type="file" name="upload"
					class="form-control"></td>
			</tr>
			<tr>
				<th bgcolor="#ddd" width="120">상품설명</th>
				<td><input type="text" name="pro_content" class="form-control"
					style="width: 200px;" required="required"></td>
			</tr>

			<br>
			<br>

			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info" style="width: 100px;">저장</button>
					<button type="submit" class="btn btn-info" style="width: 150px;"
						onclick="location.href='adminmain'">관리자목록</button>
				</td>
			</tr>
		</table>
	</form>
	  </div>
    </div>
  </div>
	<p style="clear: both;"></p>
	
	<div class="container-fluid">
		<div style="margin: 10px;">
			<button data-toggle="collapse" href="#collapseExample2"
				aria-expanded="false" aria-controls="collapseExample2"
				class="btn btn-large-warning">>상품 옵션(색상) 입력</button>
		</div>
		<div class="collapse" id="collapseExample2" style="width: 550px;">
			<div class="well">
				<form action="insert2" method="post" enctype="multipart/form-data">
					<b>색상 옵션 추가</b>
					<table class="table table-bordered" style="width: 500px;">
						<tr>
							<th bgcolor="#ddd" width="120">상품아이디</th>
							<td><c:if test="${!empty list}">
									<select name="pro_id" required="required" class="form">
										<c:forEach var="p" items="${list}">
											<option value="${p.pro_id}">${p.pro_id}</option>

										</c:forEach>
									</select>
								</c:if></td>
						</tr>

						<tr>
							<th bgcolor="#ddd" width="120">색상</th>
							<td><input type="text" name="color" class="form-control"
								style="width: 200px;" required="required"></td>
						</tr>

						<input type="hidden" name="s" value="0">
						<input type="hidden" name="m" value="0">
						<input type="hidden" name="l" value="0">

						<tr>
							<td colspan="2" align="center">
								<button type="submit" class="btn btn-info" style="width: 100px;">저장</button>

								<c:forEach var="j" items="${join}">
									<tr>
										<td>${j.pro_id}</td>
										<td>${j.joindto.pro_name}</td>
										<td>${j.color}</td>
										<td>${j.s}</td>
										<td>${j.m}</td>
										<td>${j.l}</td>
									</tr>
								</c:forEach>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
	<div>
	<caption><b>상품 목록</b></caption>
	<table class="table table-bordered" style="width:750px;">
		<tr bgcolor="#ddd" style="font-size: 0.9em;">
			<th width="30">번호</th>
			<th width="60">상품번호</th>
			<th width="70">상품명</th>
			<th width="60">색상</th>
			<th width="60">가격</th>
			<th width="90">상품분류</th>
			<th width="90">입고날짜</th>
			<th width="70">수정</th>
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
		</table>
		</div>
	<div class='mydiv' id='mydiv'>
	<table class="table table-bordered" style="width:100%;">
		<c:if test="${totalCount>0}">
			<c:forEach var="a" items="${list2}">
				<tr>
					<td>${no}</td>
					<c:set var="no" value="${no+1}"/>
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
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</div>
</div>

	<p style="clear: both;"></p>
</body>
</html>