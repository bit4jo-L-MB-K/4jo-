<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<table class="table table-bordered inq__content">
	<tr>
		<td>
			<h3><b>${idto.ititle}</b>
				<span style="font-size: 14pt; color:gray; float: right;">
					<fmt:formatDate value="${idto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
				</span>			
			</h3>
			<span>작성자:${idto.name}(${idto.myid})</span>
			
			<c:if test="${idto.uploadfile!='no'}">
				<span style="float: right;">
					<b>${idto.uploadfile}</b>
				</span>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<c:if test="${qupload==true}">
				<img src="../photo/${idto.uploadfile}" style="max-width: 400px;">
			</c:if>
			<br><br>
			<pre style="background-color: #fff; border:0px;">${idto.icontent}</pre>
			<br>
			<b>댓글<span class="acount"></span></b>
		</td>
	</tr>
</table>
</body>
</html>