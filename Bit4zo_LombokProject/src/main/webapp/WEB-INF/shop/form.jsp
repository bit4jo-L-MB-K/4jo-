<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dokdo&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data">
	<table class="table table-bordered" style="width: 700px;">
		<caption><b>상품 정보 입력</b></caption>
		<tr>
			<th bgcolor="#ddd" width="120">상품코드</th>
			<td>
				<input type="text" name="pro_id" class="form-control"
				style="width:200px;" required="required">
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">상품명</th>
			<td>
				<input type="text" name="pro_name" class="form-control"
				style="width:200px;" required="required">
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">단 가</th>
			<td>
				<input type="text" name="price" class="form-control"
				style="width:200px;" required="required">
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">재 고</th>
			<td>
				<input type="text" name="stock" class="form-control"
				style="width:200px;" required="required">
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">분 류</th>
			<td>
				<select name="pro_sub" 
				style="width:50px;" required="required">
					<option value="반팔">반팔</option>
					<option value="긴팔">긴팔</option>
					<option value="패딩">패딩</option>
					<option value="바지">바지</option>
				</select>
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">사 진</th>
			<td>
				<input type="file" name="upload" class="form-control"
				style="width:300px;" required="required">
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">내 용</th>
			<td>
				<textarea style="width: 490px; height: 150px;" name="pro_content" class="form-control"
				style="width:200px;" required="required"></textarea>
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">색깔</th>
			<td>
				<input type="text" name="color" class="form-control"
				style="width:200px;" required="required">
			</td>			
		</tr>
		
		<tr>
			<th bgcolor="#ddd" width="120">s</th>
			<td>
				<input type="text" name="s" class="form-control"
				style="width:200px;" required="required">
			</td>			
		</tr>
		
		<tr>
			<th bgcolor="#ddd" width="120">m</th>
			<td>
				<input type="text" name="m" class="form-control"
				style="width:200px;" required="required">
			</td>			
		</tr>
		
		<tr>
			<th bgcolor="#ddd" width="120">l</th>
			<td>
				<input type="text" name="l" class="form-control"
				style="width:200px;" required="required">
			</td>			
		</tr>
		<tr>
			<td colspan="2" align="center">
			<button type="submit" class="btn btn-info"
			style="width: 100px;">저장</button>
			<button type="submit" class="btn btn-info"
			style="width: 100px;" onclick="location.href='list'">목록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>