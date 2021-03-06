<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객 센터 | LomBok</title>
    <meta name="description" content="Lombok CS center">
    <link rel="icon" type="image/png" href="imgs/at-solid.png"/>
    <script src="https://kit.fontawesome.com/55fa8b84a2.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;700&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../resources/cscenterstyle.css">
<style type="text/css">
#csheader {
  background: url("../photo/home-background.png") center/cover no-repeat;
  padding: 30px;
  text-align: center;
}

.summary a:hover{
	color:#000;
}

a:hover {
	color: #000;
}

#kakao-talk-channel-chat-button{
	display: none;
}
@media screen and (max-width: 1100px){
	.link-list li{
		width: 50%;
	}
	.main__content__aside{
		display: none;
	}
	.main-content__body {
		margin: 0 auto;
	}
	#kakao-talk-channel-chat-button{
		display: block;
		text-align: right;
		bottom: 10px;
		position: sticky;
	}
	.header__title__description{
		display: none;
	}
	.header__title__main{
		text-align: center;
	}
}
</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
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
	
	
    <!-- CS Center Main Content -->
    <section id="main" class="section">
        <div class="main-content">
            <div class="main-container main-content__body">
                <div class="main-content__main">
                    <!-- 고객센터 메뉴 링크 -->
                    <div class="customer-link">
                        <ul class="link-list">
                            <li>
                            	<c:choose>
                            		<c:when test="${sessionScope.loginok!=null}">
                            			<a href="${root}/cscenter/inquiry"><i class="fas fa-envelope-open-text"></i>1:1 문의</a>
                            		</c:when>
                            		<c:otherwise>
                            			<a href="${root}/login/signin"><i class="fas fa-envelope-open-text"></i>1:1 문의</a>
                            		</c:otherwise>
                            	</c:choose>
                            </li>
                            <li><a href="" onClick="window.open('http://pf.kakao.com/_xbHdjb/chat','_blank','width=350,height=520')"><i class="far fa-comments"></i>실시간 채팅</a></li>
                            <li><a href="" class="ready"><i class="fas fa-gift"></i>회원 혜택</a></li>
                            <li><a href="${root}/cscenter/faqlist"><i class="far fa-comment-alt"></i>FAQ</a></li>
                        </ul>
                    </div>
                    
                    
                    <div class="summary summary--faq">
                    	<div class="summary__title" style="display:flex; justify-content: space-between;">FAQ TOP 5
                    	<a href="${root}/cscenter/faqlist" class="summary__more"><p style="text-align: right;">전체보기</p></a>
                    	</div>
                    	<div class="summary__content">
	                    	<c:if test="${totalCount>0}">
	                    		<div class="faq-list__summary" >
									<c:forEach var="f" items="${flist}">
										<div class="faq-item">
											${f.ftitle}
										</div>
									</c:forEach>
								</div>
							</c:if>
                    	</div>
                    </div>
                    
                    
                    <!-- 공지사항 요약 -->
					<div class="summary summary--notice">
						<div class="summary__title" style="display:flex; justify-content: space-between;">공지사항
						 <a href="${root}/cscenter/noticelist" class="summary__more"><p style="text-align: right;">전체보기</p></a>
						 </div>
							<div class="summary__content">
							<c:if test="${totalCount>0}">
								<ul class="notice-list">
									<c:forEach var="n" items="${list}">
										<a href="${root}/cscenter/noticelist">
										<li>[${n.noticetype}] ${n.nsubject}
										<p style="text-align: right;"><fmt:formatDate value="${n.writeday}" pattern="yyyy-MM-dd"/></p>
										</li>
										</a>
									</c:forEach>
							    </ul>
								</c:if>
							</div>
					</div>
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
    </section>
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
<script type="text/javascript">
	$(".ready").click(function(){
		alert("준비중입니다.");
	});
</script>

</html>
