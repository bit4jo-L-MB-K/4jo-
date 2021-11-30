<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.gaipdiv{
		margin-top: 25px;
		margin-bottom: 120px;
	}
	.btnlogin{
		height: 51px;
		width: 400px;
		border: 1px solid black;
		border-radius: 5px;
		background: black;
		color: white;
	}
	.welcometxt{
		font-size: 16pt;
		font-weight: bold;
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
                        <h4>Sign up</h4>
                        <div class="breadcrumb__links">
                            <a href="${root}/">Home</a>
                            <a href="${root}/login/signin">Sign in</a>
                            <span>Sign up</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

<div align="center" class="gaipdiv">
	<table class="gaiptb">
		<span><img src="${root}/lombok_logo.png"></span>
		<tr>
			<td align="center" class="welcometxt">LOMBOK 가입을 환영합니다!</td>
		</tr>
		<tr>
			<td>
				<br>
				<button type="button" onclick="location.href='${root}/login/signin'" class="btnlogin">로그인 하기</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>