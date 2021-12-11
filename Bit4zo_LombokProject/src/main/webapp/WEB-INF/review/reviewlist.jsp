<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
   href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap"
   rel="stylesheet">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	/* 수정, 삭제 버튼 css */
	button.delbtn, button.modbtn {
	   border: 0;
	   outline: 0;
	   background: white;
	   color: #AAAAAA;
	   font-size: 9pt;
	}
	
	/* 수정, 삭제 버튼 hover */
	button.delbtn:hover, button.modbtn:hover {
	   text-decoration: underline;
	   font-weight: bold;
	   color: red;
	}
	
</style>
</head>
<body>
<!-- 스타일 후기 테이블 -->
   <h4 style="margin-left: 200px;">
      <b>스타일후기</b>
   </h4>
    <button type="button" class="btn btn-default"
       style="width: 150px;margin-left: 750px;margin-bottom: 5px;font-size: 12px;"
       onclick="location.href='form'">스타일후기 작성하기</button>

   <br>

   <table class="table"
      style="width: 700px; margin-left: 200px;">
      <c:if test="${totalCount==0}">
         <tr height="50">
            <td colspan="5" align="center" height="150">
               <h4 style="margin-top: 50px;">
                  <b>등록된 스타일 후기가 없습니다.</b>
               </h4>
            </td>
         </tr>
      </c:if>
      <c:if test="${totalCount>0}">
         <c:forEach var="a" items="${list}">
            <tr>
               <td><img src="../photo/ip.PNG" style="max-width: 40px;">
               <span style="font-size: 12pt;font-weight: bold;">${a.myid}</span> 
               <br> 
                   <span style="font-size: 9pt; color: #AAAAAA;margin-left: 40px;">
                     <fmt:formatDate value="${a.writeday}" pattern="yyyy년MM월dd일" />
               </span>
               <!-- 로그인중이면서 세션의 아이디와 같은 아이디로 쓴글에만 수정, 삭제 버튼 보이게하기 -->
                  <c:if test="${sessionScope.loginok!=null and sessionScope.myid==a.myid}">
                     <button type="button" class="modbtn" style="margin-left: 460px;"
                        onclick="location.href='updateform?num=${a.num}&currentPage=${currentPage}'">수정</button>
                     <span style="color: #AAAAAA; font-weight: bold;">|</span>
                     <button type="button" class="delbtn"
                        onclick="location.href='delete?num=${a.num}&currentPage=${currentPage}'"
                        data-toggle="modal" data-target="#myModal">삭제</button>
                  </c:if>
     			<br>
               <pre style="background-color: #fff; border: 0px; font-weight: bold; font-size: 12pt; margin-top: 10px;">${a.content}</pre>
                  <c:if test="${a.uploadfile!='no'}">
                     <img src="../image/${a.uploadfile}" style="max-width: 150px;"><br>
                  </c:if> 
                  </td>
            </tr>
         </c:forEach>
      </c:if>
   </table>
   

<!--  페이징  -->
<c:if test="${totalCount>0}">
   <div style="width: 700px; text-align: center;">
      <ul class="pagination">
         <!-- 이전 -->
         <c:if test="${startPage>1}">
            <li><a href="list?currentPage=${startPage-1}">이전</a></li>
         </c:if>

         <c:forEach var="pp" begin="${startPage}" end="${endPage}">
            <c:if test="${currentPage==pp}">
               <li class="active"><a href="list?currentPage=${pp}">${pp}</a></li>
            </c:if>
            <c:if test="${currentPage!=pp}">
               <li><a href="list?currentPage=${pp}">${pp}</a></li>
            </c:if>
         </c:forEach>
         <!-- 다음 -->
         <c:if test="${endPage<totalPage}">
            <li><a href="list?currentPage=${endPage+1}">다음</a></li>
         </c:if>
      </ul>
   </div>
</c:if>
	   <br>
	   <br>
	   

  
   <!-- 댓글 목록 출력-->
   	<h4 style="margin-left: 200px;font-weight: bold;">
      	<b>댓글</b>
   	</h4>
	   <table class="table" style="width: 700px; margin-left: 200px;">
	   <c:if test="${totalCount==0}">
         <tr height="50">
            <td colspan="5" align="center" height="150">
               <h4 style="margin-top: 50px;">
                  <b>등록된 댓글이 없습니다.</b>
               </h4>
            </td>
         </tr>
      </c:if>
	      <c:if test="${totalCount>0}">
	      	 <c:forEach var="a2" items="${list2}">
	   			<tr>
	               <td><img src="../photo/dae.PNG" style="max-width: 35px;">
	               <span style="font-size: 12pt;font-weight: bold;">${a2.myid}</span> 
	               <br> 
	               <span style="margin-left: 30px;">${a2.content}</span>
		   		</c:forEach>
		   	</c:if>
	   </table>

	   <!-- 댓글 출력 -->
	<form action="dinsert" method="post">
	   <table class="table" style="width: 700px; margin-left: 200px;">
	   		<tr>
	   			<td>
	   				<div class="form-inline">
		   				<img src="../photo/per.PNG" style="max-width: 35px;">
		   				<input type="text" class="form-control" name="content" style="width: 500px;margin-left: 10px;"
	                        placeholder="댓글을 남겨주세요"><!-- 네임값 어디갓어요 보내는 값도 없긴함 -->
	
	                     <button type="submit" class="btn btn-default" style="width: 60px;margin-left: 10px;">등록</button>
                     </div>
	   			</td>
	   		</tr>
	   	</table>
   </form>
   

</body>
</html>