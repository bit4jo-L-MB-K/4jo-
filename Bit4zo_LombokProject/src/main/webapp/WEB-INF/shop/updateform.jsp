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
<body>
<div>
<div class="container-fluid">
<div style="margin:10px;">
<button data-toggle="collapse" href="#collapseExample" aria-controls="collapseExample"
class="btn btn-large-warning">>상품 정보 입력</button>
</div>
<div class="collapse" id="collapseExample" style="width:550px;">
<div class="well">
<form action="update" method="post" enctype="multipart/form-data">
	<caption><b>상품정보수정</b></caption>

	<input type="hidden" name="currentPage" value="${currentPage}">
	
	
	<table class="table table-bordered" style="width: 500px;">
		<c:forEach var="a" items="${list}">
		<input type="hidden" name="idx" value="${a.joindto.idx}">
		<input type="hidden" name="color" value="${a.color}">
		<tr>
			<th bgcolor="#ddd" width="120">상품코드</th>
			<td>
				<input type="text" name="pro_id" class="form-control"
				style="width:200px;" required="required" value="${a.pro_id}">
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">상품명</th>
			<td>
				<input type="text" name="pro_name" class="form-control"
				style="width:200px;" required="required" value="${a.joindto.pro_name}">
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">가 격</th>
			<td>
				<input type="text" name="price" class="form-control"
				style="width:200px;" required="required" value="${a.joindto.price}">
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">재고</th>
			<td>
				<input type="text" name="stock" class="form-control"
				style="width:200px;" required="required" value="${a.joindto.stock}">
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">상품분류</th>
			<td>
		  <select name="pro_sub" required="required" class="form"
		  style="width:200px;">
            <option value="상의">상의</option>
            <option value="하의">하의</option>
            <option value="아우터">아우터</option>
            <option value="신발">아우터</option>
          </select>
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">상품사진</th>
			<td>
				<input type="file" name="upload" class="form-control" multiple="multiple">
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">상품설명</th>
			<td>
				<input type="text" name="pro_content" class="form-control"
				style="width:200px;" required="required" value="${a.joindto.pro_content}">
			</td>			
		</tr>
		</c:forEach>
		<tr>
			<td colspan="2" align="center">
			<button type="submit" class="btn btn-info"
			style="width: 100px;">수정</button>
			<button type="button" class="btn btn-default"
				style="width:100px;" onclick="history.back()">이전</button>
			<button type="submit" class="btn btn-warning"
			style="width: 100px;" onclick="location.href='adminmain?currentPage=${currentPage}'">관리자목록</button>
			</td>
		</tr>
	</table>
</form>
	  </div>
    </div>
  </div>
	
	
		<div class="container-fluid">
		<div style="margin: 10px;">
			<button data-toggle="collapse" href="#collapseExample2"
				aria-controls="collapseExample2"
				class="btn btn-large-warning">>상품 옵션(색상) 입력</button>
		</div>
		<div class="collapse" id="collapseExample2" style="width: 550px;">
			<div class="well">
				<form action="update2" method="post" enctype="multipart/form-data">
					<b>색상 옵션 추가</b>
					<input type="hidden" name="currentPage" value="${currentPage}">
					<table class="table table-bordered" style="width: 500px;">
					
				<c:forEach var="j" items="${list}">
					<input type="hidden" name="idx" value="${j.num}">
						<tr>
							<th bgcolor="#ddd" width="120">상품아이디</th>
							<td>
									<select name="pro_id" required="required" class="form">
											<option value="${j.pro_id}">${j.pro_id}</option>
									</select>
								</td>
						</tr>
						
						<tr>
							<th bgcolor="#ddd" width="120">색상</th>
							<td><input type="text" name="color" class="form-control"
								style="width: 200px;" required="required" value="${j.color}"></td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="2" align="center">
						<button type="submit" class="btn btn-info" style="width: 100px;">수정</button>

					</table>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>