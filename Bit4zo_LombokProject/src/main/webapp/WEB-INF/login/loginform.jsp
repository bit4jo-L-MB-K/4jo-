<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<style type="text/css">
#formposition{
	display: inline-block;
	border-style: solid;
   	border-width: thin 0px; 

}
</style>
</head>
<body>
<div align="center">
	<form action="loginsuccess" method="post" id="formposition" class="form-inline" style="margin-top: 200px; margin-bottom: 200px;">
		<table class="table" style="width: 300px;">
			<tr>
				<td colspan="2" align="center">
					<input type="checkbox" name="cbsave" ${sessionScope.saveok==null?"":"checked"}>아이디 저장
				</td>			
			</tr>
			<tr>
				<th width="100" bgcolor="#ffffff" style="font-size: 30pt;">ID</th>
				<td>
					<input type="text" name="id" class="form-control" autofocus="autofocus" required="required" style="width: 120px;" value="${sessionScope.saveok==null?"":sessionScope.myid}">
				</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#ffffff" style="font-size: 20pt;">PW</th>
				<td>
					<input type="password" name="pass" class="form-control" required="required" style="width: 120px;">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-default" style="width: 100px;">로그인</button>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" class="btn btn-default" style="width: 100px;" onclick="location.href='${root}/member/form'">회원가입</button>
				</td>
			</tr>
		</table>	
	</form>
</div>
</body>
</html>