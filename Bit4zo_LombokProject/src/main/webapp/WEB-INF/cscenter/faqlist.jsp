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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../resources/cscenterstyle.css">
    <script src="main.js" defer></script>
<style type="text/css">
#csheader {
  background: url("../photo/home-background.png") center/cover no-repeat;
  padding: 30px;
  text-align: center;
}


a:hover {
	text-decoration: none;
	
}

.link-list li{
	height : 70px;
	line-height: 70px;
	width: 25%;
}

.summary {
    margin-top: 40px;
    display: inline-block;
    width: 770px;
}
.faq-contents a {
	text-decoration: none;
}


/* For below 1044px screen width */
@media screen and (max-width: 1044px) {
	.link-list li{
		height : 70px;
		line-height: 70px;
		width: 50%;
	}
	
	.main__content__aside{
		display: none;
	}
	
	.main-content__body {
		margin: 0 auto;
	}

}

.tab-content {
	display: none;
}
.tab-content.current {
	display: inline-block;
}
.tab-link a {
	cursor: pointer;
}

/* .tab-link a:active {
	background-color: black;
	color: white;
} */

.notext {
	text-align: center;
	color: #716f73;
}

.notext i {
	font-size: 50px;
	
}

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
  border-bottom: 1px solid gray;
  padding-bottom: 30px;
  cursor: pointer;
  
}

.panel-body {
  padding: 15px;
  display: none;
  background-color: #f8f8f8;
  border-bottom: 1px solid gray;
}

.active .panel-body{
    display: block;
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
                        <ul class="link-list faq-list tabs">
                            <li class="tab-link current" data-tab="tab-main"><a href="${root}/cscenter/faqlist">전체</a></li>
                            <li class="tab-link" data-tab="tab-deliver"><a>배송</a></li>
                            <li class="tab-link" data-tab="tab-order"><a>주문/결제</a></li>
                            <li class="tab-link" data-tab="tab-cancel"><a>취소/반품/교환</a></li>
                            <li class="tab-link" data-tab="tab-receipt"><a>영수증/세금계산서</a></li>
                            <li class="tab-link" data-tab="tab-meminfo"><a>회원정보/서비스</a></li>
                            <li class="tab-link" data-tab="tab-coupon"><a>쿠폰/마일리지</a></li>
                            <li class="tab-link" data-tab="tab-etc"><a>기타</a></li>
                        </ul>
                    </div>
                    
                    <div class="summary faq-contents tab-content current" id="tab-main">
                    <h6 style="border-bottom: 1px solid black; margin-bottom: 20px; padding-bottom: 10px;">전체</h6>
					<section id="faq">
						<c:if test="${totalCount==0}">
							<p class="notext" ><i class="fas fa-exclamation-triangle notext"></i></p>
							<h2 class="notext">결과가 없습니다</h2>
						</c:if>
						<c:if test="${totalCount>0}">
							<c:forEach var="n" items="${flist}">
								<div class="panel-question">
						            <div class="panel-heading">
						            + <span style="color:orange; margin-right: 10px;">[${n.faqtype}]</span> ${n.ftitle}
						            </div>
						            <c:if test="${sessionScope.loginok!=null && myid=='admin'}">
						            <button type="button" class="btn btn-info btn-xs"
										onclick="location.href='faqupdateform?num=${n.num}'">수정</button>
									<button type="button" class="btn btn-danger btn-xs del" 
										onclick="location.href='fdelete?num=${n.num}&currentPage=${currentPage}'">삭제</button>
									</c:if>
						            <div class="panel-body" id="thisone">
							            <pre style="border: 0px;">${n.fcontent}</pre>
						            </div>
				       			 </div>
							</c:forEach>
						</c:if>
				      </section>                    	
                    </div>
                    
                    <!-- 탭메뉴 -->
                    <div class="summary faq-contents tab-content" id="tab-deliver">
                    <h6 style="border-bottom: 1px solid black; margin-bottom: 20px; padding-bottom: 10px;">배송</h6>
                    <section id="faq">
						<c:if test="${totalCount==0}">
							<p class="notext" ><i class="fas fa-exclamation-triangle notext"></i></p>
							<h2 class="notext">결과가 없습니다</h2>
						</c:if>
						<c:if test="${totalCount>0}">
							<c:forEach var="n" items="${deliverlist}">
								<div class="panel-question">
						            <div class="panel-heading">
						            + <span style="color:orange; margin-right: 10px;">[${n.faqtype}]</span> ${n.ftitle}
						            </div>
						            <c:if test="${sessionScope.loginok!=null && myid=='admin'}">
						            <button type="button" class="btn btn-info btn-xs"
										onclick="location.href='faqupdateform?num=${n.num}'">수정</button>
									<button type="button" class="btn btn-danger btn-xs del" 
										onclick="location.href='fdelete?num=${n.num}&currentPage=${currentPage}'">삭제</button>
									</c:if>
					            <div class="panel-body" id="thisone">
					           <pre style="border: 0px;">${n.fcontent}</pre>
				            </div>
				        </div>
							</c:forEach>
						</c:if>
				      </section>
                    </div>
                    
                    <div class="summary faq-contents tab-content" id="tab-order">
                    <h6 style="border-bottom: 1px solid black; margin-bottom: 20px; padding-bottom: 10px;">주문/결제</h6>
                    	<section id="faq">
						<c:if test="${totalCount==0}">
							<p class="notext" ><i class="fas fa-exclamation-triangle notext"></i></p>
							<h2 class="notext">결과가 없습니다</h2>
						</c:if>
						<c:if test="${totalCount>0}">
							<c:forEach var="n" items="${orderlist}">
								<div class="panel-question">
						            <div class="panel-heading">
						            + <span style="color:orange; margin-right: 10px;">[${n.faqtype}]</span> ${n.ftitle}
						        </div>
						        <c:if test="${sessionScope.loginok!=null && myid=='admin'}">
						            <button type="button" class="btn btn-info btn-xs"
										onclick="location.href='faqupdateform?num=${n.num}'">수정</button>
									<button type="button" class="btn btn-danger btn-xs del" 
										onclick="location.href='fdelete?num=${n.num}&currentPage=${currentPage}'">삭제</button>
								</c:if>
						            <div class="panel-body" id="thisone">
						            <pre style="border: 0px;">${n.fcontent}</pre>
					           		</div>
					        	</div>
							</c:forEach>
						</c:if>
				      </section>
                    </div>
                    <div class="summary faq-contents tab-content" id="tab-cancel">
                    <h6 style="border-bottom: 1px solid black; margin-bottom: 20px; padding-bottom: 10px;">취소/반품/교환</h6>
                    	<section id="faq">
						<c:if test="${totalCount==0}">
							<p class="notext" ><i class="fas fa-exclamation-triangle notext"></i></p>
							<h2 class="notext">결과가 없습니다</h2>	
						</c:if>
						<c:if test="${totalCount>0}">
							<c:forEach var="n" items="${cancellist}">
								<div class="panel-question">
						            <div class="panel-heading">
						            + <span style="color:orange; margin-right: 10px;">[${n.faqtype}]</span> ${n.ftitle}
						            </div>
						            <c:if test="${sessionScope.loginok!=null && myid=='admin'}">
						            <button type="button" class="btn btn-info btn-xs"
										onclick="location.href='faqupdateform?num=${n.num}'">수정</button>
									<button type="button" class="btn btn-danger btn-xs del" 
										onclick="location.href='fdelete?num=${n.num}&currentPage=${currentPage}'">삭제</button>
									</c:if>
					            <div class="panel-body" id="thisone">
					           <pre style="border: 0px;">${n.fcontent}</pre>
				            </div>
				        </div>
							</c:forEach>
						</c:if>
				      </section>
                    </div>
                    
                    <div class="summary faq-contents tab-content" id="tab-receipt">
                    <h6 style="border-bottom: 1px solid black; margin-bottom: 20px; padding-bottom: 10px;">영수증/세금계산서</h6>
                    	<section id="faq">
						<c:if test="${totalCount==0}">
							<p class="notext" ><i class="fas fa-exclamation-triangle notext"></i></p>
							<h2 class="notext">결과가 없습니다</h2>	
						</c:if>
						<c:if test="${totalCount>0}">
							<c:forEach var="n" items="${receiptlist}">
								<div class="panel-question">
						            <div class="panel-heading">
						            + <span style="color:orange; margin-right: 10px;">[${n.faqtype}]</span> ${n.ftitle}
						            </div>
						            <c:if test="${sessionScope.loginok!=null && myid=='admin'}">
						            <button type="button" class="btn btn-info btn-xs"
										onclick="location.href='faqupdateform?num=${n.num}'">수정</button>
									<button type="button" class="btn btn-danger btn-xs del" 
										onclick="location.href='fdelete?num=${n.num}&currentPage=${currentPage}'">삭제</button>
									</c:if>
					            <div class="panel-body" id="thisone">
					           <pre style="border: 0px;">${n.fcontent}</pre>
				            </div>
				        </div>
							</c:forEach>
						</c:if>
				      </section>
                    </div>
                    
                    <div class="summary faq-contents tab-content" id="tab-meminfo">
                    <h6 style="border-bottom: 1px solid black; margin-bottom: 20px; padding-bottom: 10px;">회원정보/서비스</h6>
                    	<section id="faq">
						<c:if test="${totalCount==0}">
							<p class="notext" ><i class="fas fa-exclamation-triangle notext"></i></p>
							<h2 class="notext">결과가 없습니다</h2>
						</c:if>
						<c:if test="${totalCount>0}">
							<c:forEach var="n" items="${meminfolist}">
								<div class="panel-question">
						            <div class="panel-heading">
						            + <span style="color:orange; margin-right: 10px;">[${n.faqtype}]</span> ${n.ftitle}
						            </div>
						            <c:if test="${sessionScope.loginok!=null && myid=='admin'}">
						            <button type="button" class="btn btn-info btn-xs"
										onclick="location.href='faqupdateform?num=${n.num}'">수정</button>
									<button type="button" class="btn btn-danger btn-xs del" 
										onclick="location.href='fdelete?num=${n.num}&currentPage=${currentPage}'">삭제</button>
									</c:if>
					            <div class="panel-body" id="thisone">
					           <pre style="border: 0px;">${n.fcontent}</pre>
				            </div>
				        </div>
							</c:forEach>
						</c:if>
				      </section>
                    </div>
                    
                    <div class="summary faq-contents tab-content" id="tab-coupon">
                    <h6 style="border-bottom: 1px solid black; margin-bottom: 20px; padding-bottom: 10px;">쿠폰/마일리지</h6>
                    	<section id="faq">
						<c:if test="${totalCount==0}">
							<p class="notext" ><i class="fas fa-exclamation-triangle notext"></i></p>
							<h2 class="notext">결과가 없습니다</h2>	
						</c:if>
						<c:if test="${totalCount>0}">
							<c:forEach var="n" items="${couponlist}">
								<div class="panel-question">
						            <div class="panel-heading">
						            + <span style="color:orange; margin-right: 10px;">[${n.faqtype}]</span> ${n.ftitle}
						            </div>
						            <c:if test="${sessionScope.loginok!=null && myid=='admin'}">
						            <button type="button" class="btn btn-info btn-xs"
										onclick="location.href='faqupdateform?num=${n.num}'">수정</button>
									<button type="button" class="btn btn-danger btn-xs del" 
										onclick="location.href='fdelete?num=${n.num}&currentPage=${currentPage}'">삭제</button>
									</c:if>
					            <div class="panel-body" id="thisone">
					            <pre style="border: 0px;">${n.fcontent}</pre>
				            </div>
				        </div>
							</c:forEach>
						</c:if>
				      </section>
                    </div>
                    
                    <div class="summary faq-contents tab-content" id="tab-etc">
                    <h6 style="border-bottom: 1px solid black; margin-bottom: 20px; padding-bottom: 10px;">기타</h6>
                    	<section id="faq">
						<c:if test="${totalCount==0}">
							<p class="notext" ><i class="fas fa-exclamation-triangle notext"></i></p>
							<h2 class="notext">결과가 없습니다</h2>	
						</c:if>
						<c:if test="${totalCount>0}">
							<c:forEach var="n" items="${etclist}">
								<div class="panel-question">
						            <div class="panel-heading">
						            + <span style="color:orange; margin-right: 10px;">[${n.faqtype}]</span> ${n.ftitle}
						            </div>
						            <c:if test="${sessionScope.loginok!=null && myid=='admin'}">
						            <button type="button" class="btn btn-info btn-xs"
										onclick="location.href='faqupdateform?num=${n.num}'">수정</button>
									<button type="button" class="btn btn-danger btn-xs del" 
										onclick="location.href='fdelete?num=${n.num}&currentPage=${currentPage}'">삭제</button>
									</c:if>
					            <div class="panel-body" id="thisone">
					            <pre style="border: 0px;">${n.fcontent}</pre>
				            </div>
				        </div>
							</c:forEach>
						</c:if>
				      </section>
                    </div>
                    
<!-- 페이징 -->
<%-- 	<c:if test="${totalCount>0}">
		<div style="width: 800px; text-align: center;">
			<ul class="pagination">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
				<li><a href="faqlist?currentPage=${startPage-1}">이전</a></li>
			</c:if>
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage==pp}">
					<li class="active"><a href="faqlist?currentPage=${pp}">${pp}</a></li>
				</c:if>
				<c:if test="${currentPage!=pp}">
					<li><a href="faqlist?currentPage=${pp}">${pp}</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 -->
			<c:if test="${endPage<totalPage}">
				<li><a href="faqlist?currentPage=${endPage+1}">다음</a></li>
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
	
	function closeAll(){
	    for(var x=0; x< panelQuestion.length; x++){
			panelQuestion[x].classList.remove('active');
	    }
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
