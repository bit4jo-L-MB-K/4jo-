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
<b>상품 정보 입력</b>
	<table class="table table-bordered" style="width: 700px;">
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
			<td colspan="2" align="center">
			<button type="submit" class="btn btn-info"
			style="width: 100px;">저장</button>
			<button type="submit" class="btn btn-info"
			style="width: 100px;" onclick="location.href='list'">목록</button>
			</td>
		</tr>
	</table>
</form>
<div style='width:50%; float:left;'>
<form action="insert2" method="post" enctype="multipart/form-data">
   <b>상품정보입력</b>
   <table class="table table-bordered" style="width: 500px;">
<tr>
<th bgcolor="#ddd" width="120">상품아이디</th>
<td>
<c:if test="${!empty list}" >
   <select name="pro_id" required="required" class="form">
      <c:forEach var="p" items="${list}">
         <option value="${p.pro_id}">${p.pro_id}</option>
      </c:forEach>
   </select>
</c:if>
</td>
</tr>  
      <tr>
         <th bgcolor="#ddd" width="120">색상</th>
         <td>
            <input type="color" name="color" class="form-control"
            style="width:200px;" required="required">
         </td>         
      </tr>
      <tr>
         <th bgcolor="#ddd" width="120">s 재고</th>
         <td>
            <input type="text" name="s" class="form-control"
            style="width:200px;" required="required">
         </td>         
      </tr>
      <tr>
         <th bgcolor="#ddd" width="120">m 재고</th>
         <td>
            <input type="text" name="m" class="form-control"
            style="width:200px;" required="required">
         </td>         
      </tr>
      <tr>
         <th bgcolor="#ddd" width="120">l 재고</th>
         <td>
            <input type="text" name="l" class="form-control"
            style="width:200px;" required="required">
         </td>         
      </tr>
      <tr>
         <td colspan="2" align="center">
         <button type="submit" class="btn btn-info"
         style="width: 100px;">저장</button>
</table>
</form>
</div>
<p style=clear:both;></p>

</body>
</html>