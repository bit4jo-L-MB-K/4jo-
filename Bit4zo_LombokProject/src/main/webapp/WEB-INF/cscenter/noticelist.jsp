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

/* .panel-heading { padding: 0; }
.panel-heading a { padding: 10px 15px; display:block; text-decoration: none; } */

/* 아코디언 디자인 */
.panel-question {
  margin-bottom: 20px;
  background-color: #fff;
  
  
}

.panel-heading {
  font-weight: bold;
  padding: 5px;
  /* background-color: #333;
  color: #fff; */
  background-color: white;
  color:#4f4f4f;
  border-top: 1px solid black;
  cursor: pointer;
  
}

.panel-body {
  padding: 15px;
  display: none;
  background-color: #f8f8f8;
}

.active .panel-body{
    display: block;
}


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
<c:if test="${sessionScope.loginok!=null && myid=='admin'}">
	<button type="button" class="btn btn-default" style="margin-left: 360px;" onclick="location.href='noticeadd'">공지사항 쓰기</button>
    <button type="button" class="btn btn-default" onclick="location.href='faqadd'">faq 쓰기</button>
</c:if>
<div class="main-content">
<div class="main-container main-content__body">
    <div class="main-content__main main-content__main__inquiry">
        <div class="main-content__header">
            <h3 class="main-conent__title">공지사항</h3>
        </div>
        
        <div class="summary faq-contents tab-content current nlist">
        <!-- <h6 style="border-bottom: 1px solid black; margin-bottom: 20px; padding-bottom: 10px;">공지사항</h6> -->
		<section id="faq">
			<c:if test="${totalCount==0}">
				<p class="notext" ><i class="fas fa-exclamation-triangle notext"></i></p>
				<h2 class="notext">결과가 없습니다</h2>
			</c:if>
			<c:if test="${totalCount>0}">
				<c:forEach var="n" items="${list}">
					<div class="panel-question">
			            <div class="panel-heading">
			            <span style="color:orange; margin-right: 10px;"><i class="fas fa-bullhorn"></i></span>[${n.noticetype}] &nbsp;&nbsp;${n.nsubject}
			            <p style="text-align: right;"><fmt:formatDate value="${n.writeday}" pattern="yyyy-MM-dd"/></p>
			            </div>
			            <c:if test="${sessionScope.loginok!=null && myid=='admin'}">
				            <button type="button" class="btn btn-info btn-xs"
								onclick="location.href='noticeupdateform?num=${n.num}'">수정</button>
							<button type="button" class="btn btn-danger btn-xs del" 
								onclick="location.href='ndelete?num=${n.num}&currentPage=${currentPage}'">삭제</button>
						</c:if>
							
			            <div class="panel-body" id="thisone">
				            <pre style="border: 0px;">${n.ncontent}</pre>
			            </div>
	       			 </div>
				</c:forEach>
			</c:if>
	      </section>                    	
	      </div>
        
<!-- 공지사항 리스트 출력 부트스트랩 아코디언-->
 <%--  <div class="panel-group" id="accordion">
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
		        <button type="button" class="btn btn-info btn-xs"
				onclick="location.href='noticeupdateform?num=${n.num}'">수정</button>
					
				<button type="button" class="btn btn-danger btn-xs del" 
				onclick="location.href='ndelete?num=${n.num}'">삭제</button>
		      </div>
		      ${fn:length(list)-status.index 
		     <c:set var="count" value="${length-status.index}"/>
		  			<b>${count}:${n.num}</b>
		      <div id="collpase${count}" class="${count eq n.num?'panel-collapse collapse in':'panel-collapse collapse'}" style="display:none;">
		        <div class="panel-body">${n.ncontent}</div>
		      </div>
		    </div>
		</c:forEach>
	</c:if> 
  </div>  --%>

      
<!-- 페이징 -->
	<%-- <c:if test="${totalCount>0}">
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
	</c:if> --%>
    </div>
    
<!-- FAQ Menu side -->
                <div class="main__content__aside">
                    <!-- Menu -->
                    <ul class="sidebar-menu">
                        <li class="sidebar-menu__item-menu">
                            <p class="menu__title"><a href="${root}/cscenter/faqlist">FAQ<a></a></p>
                            <ul class="menu__list">
                                <li class="menu__item"><a href="${root}/cscenter/faqlist"><i class="fas fa-truck"></i>배송</a></li>
                                <li class="menu__item"><a href="${root}/cscenter/faqlist"><i class="far fa-credit-card"></i>주문/결제</a></li>
                                <li class="menu__item"><a href="${root}/cscenter/faqlist"><i class="fas fa-retweet"></i>취소/반품/교환</a></li>
                                <li class="menu__item"><a href="${root}/cscenter/faqlist"><i class="far fa-file-alt"></i>영수증/세금계산서</a></li>
                                <li class="menu__item"><a href="${root}/cscenter/faqlist"><i class="far fa-user"></i>회원정보/서비스</a></li>
                                <li class="menu__item"><a href="${root}/cscenter/faqlist"><i class="fas fa-ticket-alt"></i>쿠폰/마일리지</a></li>
                                <li class="menu__item"><a href="${root}/cscenter/faqlist"><i class="far fa-question-circle"></i>기타</a></li>
                            </ul>
                        </li>
                        <li class="sidebar-menu__item-menu">
                            <p class="menu__title">1:1 문의</p>
                            <ul class="menu__list">
                                <li class="menu__item">
                                <c:choose>
                                	<c:when test="${sessionScope.loginok!=null}">
                               			 <a href="${root}/cscenter/inquiry"><i class="fas fa-envelope-open-text"></i>1:1 문의</a>
                                	</c:when>
                                	<c:otherwise>
                                		<a href="${root}/login/signin"><i class="fas fa-envelope-open-text"></i>1:1 문의</a>
                                	</c:otherwise>
                                </c:choose>
                                </li>
                                <li class="menu__item">
                                <c:choose>
                                	<c:when test="${sessionScope.loginok!=null}">
                                		<a href="${root}/cscenter/inqlist"><i class="far fa-envelope"></i>나의 질문</a>
                                	</c:when>
                                	<c:otherwise>
                                		<a href="${root}/login/signin"><i class="far fa-envelope"></i>나의 질문</a>
                                	</c:otherwise>
                                </c:choose>
                                
                                </li>
                            </ul>
                        </li>
                        <li class="sidebar-menu__item-menu">
                            <p class="menu__title">실시간 채팅</p>
                            <ul class="menu__list">
                                <li class="menu__item">
                                <a href="#" onClick="window.open('http://pf.kakao.com/_xbHdjb/chat','_blank','width=350,height=520')"><i class="far fa-comments"></i>실시간 채팅</a>
                                </li>
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

<div
  id="kakao-talk-channel-chat-button"
  data-channel-public-id="_xbHdjb"
  data-title="consult"
  data-size="large"
  data-color="yellow"
  data-shape="pc"
  data-support-multiple-densities="true"
></div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');
			$('.tab-content').removeClass('current');
			
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');  
		});
		
	});
	
	var panelQuestion = document.querySelectorAll('.panel-question');
	
	for(var i=0; i<panelQuestion.length; i++){
		panelQuestion[i].addEventListener('click',function(){

	    //closeAll();
	    //this.classList.add('active');
	    this.classList.toggle('active');
	    });

	}
</script>	

<script>
  window.kakaoAsyncInit = function() {
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
    });
  };
  
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://developers.kakao.com/sdk/js/kakao.channel.min.js';
    fjs.parentNode.insertBefore(js, fjs);
  })(document, 'script', 'kakao-js-sdk');
</script>
</html>