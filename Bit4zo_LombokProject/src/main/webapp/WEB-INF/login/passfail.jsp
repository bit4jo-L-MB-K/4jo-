<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.logindiv{
		margin-bottom: 100px;
	}
	.logintxt{
		width: 400px;
		height: 51px;
		border: 1px solid gray;
		border-radius: 5px;
	}
	.loginbtn{
		width: 400px;
		height: 51px;
		border: 1px solid gray;
		border-radius: 5px;
		background: black;
		color: white;
	}
	.alogin:hover{
		color: aqua;
	}
	#loginmsg{
		color: red;
	}
</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Sign in</h4>
                        <div class="breadcrumb__links">
                            <a href="${root}/">Home</a>
                            <span>Sign in</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

<div align="center" class="logindiv">
	<form action="login" method="post">
		<span><img src="${root}/lombok_logo.png"></span>
		<table class="logintb">
			<tr>
				<td>
					<input type="text" id="id" name="id" class="logintxt" required="required" placeholder="&nbsp;아이디" value="${sessionScope.saveok==null?"":sessionScope.myid}">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" id="pass" name="pass" class="logintxt" required="required" placeholder="&nbsp;비밀번호">
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="cbsave" ${sessionScope.saveok==null?"":"checked"}>아이디 저장
					<br>
					<b id="loginmsg" class="msg">아이디 또는 비밀번호가 잘못 입력 되었습니다.</b>
				</td>			
			</tr>
			<tr>
				<td align="center">
					<button type="submit" class="loginbtn" id="loginbtn">로그인</button>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<span>LOMBOK이 처음이시라면 <a class="alogin" href="${root}/member/signup">회원가입</a></span>
				</td>
			</tr>
		</table>	
	</form>
</div>
</body>
</html>