<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객 센터 | Lombok</title>
<meta name="description" content="Lombok CS center">
<link rel="icon" type="image/png" href="imgs/at-solid.png"/>
<script src="https://kit.fontawesome.com/55fa8b84a2.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;700&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../resources/cscenterstyle.css">
<style type="text/css">
#csheader {
  background: url("../photo/home-background.png") center/cover no-repeat;
  padding: 30px;
  text-align: center;
}
.pagination a:hover {
	color:blue;
}

a:hover {
	text-decoration: none;
	
}

.panel-heading { padding: 0; }
.panel-heading a { padding: 10px 15px; display:block; text-decoration: none; }

</style>
</head>
<body>
<!-- CS Center Header -->
<a href="${root}/cscenter/csmain">
    <section id="csheader">
        <h1 class="header__title__main">LomBok CS center</h1>
        <h1 class="header__title__description">고객님, 궁금하신점을 해결해 드릴게요.</h1>
    </section>
</a>

<div class="main-content">
<div class="main-container main-content__body">
    <div class="main-content__main main-content__main__inquiry">
        <div class="main-content__header">
            <h3 class="main-conent__title">공지사항</h3>
        </div>
        
<!-- 공지사항 리스트 출력 -->
  <div class="panel-group" id="accordion">
	<c:if test="${totalCount==0}">
		<h1><b>결과가 없습니다</b></h1>	
	</c:if>
    <c:if test="${totalCount>0}">
    	
		<c:forEach var="n" items="${list}" varStatus="status">
			<div class="panel panel-default">
		      <div class="panel-heading">
		        <h4 class="panel-title">
		          <a data-toggle="collapse" data-parent="#accordion" href="#collpase${n.num}">[${n.noticetype}] ${n.nsubject} <p style="text-align: right;"><fmt:formatDate value="${n.writeday}" pattern="yyyy-MM-dd"/></p></a>
		        </h4>
		        
		      </div>
		     <%--  ${fn:length(list)-status.index  --%>
		     <c:set var="count" value="${length-status.index }"/>
		      <div id="collpase${count}" class="${count eq n.num?'panel-collapse collapse in':'panel-collapse collapse'}" style="display:none;">
		        <div class="panel-body">${n.ncontent}</div>
		  
		      </div>
		    </div>
		</c:forEach>
	</c:if> 
  </div> 

      
<!-- 페이징 -->
	<c:if test="${totalCount>0}">
		<div style="width: 800px; text-align: center;">
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
    </div>
    <!-- FAQ Menu side -->
    <div class="main__content__aside">
        <!-- Menu -->
        <ul class="sidebar-menu">
            <li class="sidebar-menu__item-menu">
                <p class="menu__title">FAQ</p>
                <ul class="menu__list">
                    <li class="menu__item"><a href=""><i class="fas fa-truck"></i>배송</a></li>
                    <li class="menu__item"><a href=""><i class="far fa-credit-card"></i>주문/결제</a></li>
                    <li class="menu__item"><a href=""><i class="fas fa-retweet"></i>취소/반품/교환</a></li>
                    <li class="menu__item"><a href=""><i class="far fa-file-alt"></i>영수증/세금계산서</a></li>
                    <li class="menu__item"><a href=""><i class="far fa-user"></i>회원정보/서비스</a></li>
                    <li class="menu__item"><a href=""><i class="fas fa-ticket-alt"></i>쿠폰/마일리지</a></li>
                    <li class="menu__item"><a href=""><i class="far fa-question-circle"></i>기타</a></li>
                </ul>
            </li>
            <li class="sidebar-menu__item-menu">
                <p class="menu__title">1:1 문의</p>
                <ul class="menu__list">
                    <li class="menu__item"><a href="${root}/cscenter/inquiry"><i class="fas fa-envelope-open-text"></i>1:1 문의</a></li>
                </ul>
            </li>
            <li class="sidebar-menu__item-menu">
                <p class="menu__title">실시간 채팅</p>
                <ul class="menu__list">
                    <li class="menu__item"><a href=""><i class="far fa-comments"></i>실시간 채팅</a></li>
                </ul>
            </li>
            <li class="sidebar-menu__item-menu">
                <p class="menu__title">공지사항</p>
                <ul class="menu__list">
                    <li class="menu__item"><a href="${root}/cscenter/noticelist"><i class="fas fa-bullhorn"></i>공지사항</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
</div>
</body>

</html>