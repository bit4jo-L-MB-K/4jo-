<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	caption b{
		padding-left: 100px;
	}
</style>
</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data">
	<h5 style="margin-left: 100px;color: silver;"><b>회원 스타일 후기</b></h5>
	<table class="table table-bordered" style="margin-top:10px;margin-left:100px;width: 700px;">
		<tr>
			<th width="100" align="center">제 목</th>
			<td>
				<input type="text" name="subject" class="form-control"
				required="required" autofocus="autofocus">
			</td>
		</tr>
		<tr>
			<!-- <th width="100" align="center">내 용</th> -->
			<td colspan="2">
				<textarea style="width: 700px;height:200px;"
				class="form-control" name="content" required="required"></textarea>
			</td>
		</tr>
		<tr>
			<th width="100">첨부 파일</th>
			<td>
				<input type="file" name="upload" class="form-control" multiple="multiple">
			</td>
		</tr>
	<!-- 	<tr>
			<th width="100" align="center">첨부 파일2</th>
			<td>
				<input type="file" name="upload2">
			</td>
		</tr>
		<tr>
			<th width="100" align="center">첨부 파일3</th>
			<td>
				<input type="file" name="upload3">
			</td>
		</tr> -->
		<tr>
			<th width="100" align="center">UCC URL</th>
			<td>
				<input type="text" name="url">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-default" 
				style="width: 100px;">등록</button>		
			
				<button type="button" class="btn btn-default" style="width: 100px;"
				onclick="location.href='list'">목록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>