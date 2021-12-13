<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://kit.fontawesome.com/55fa8b84a2.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;700&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/cscenterstyle.css">
<style type="text/css">
#csheader {
  background: url("../photo/home-background.png") center/cover no-repeat;
  padding: 30px;
  text-align: center;
}
a:hover{
	text-decoration: none;
}
.summary {
    margin-top: 40px;
    display: inline-block;
    width: 770px;
}

.summary a:hover{
	color:#000;
}

a:hover {
	color: #000;
}
.menu__item a {
	text-decoration: none;
}

.sidebar-menu__item-menu a {
	text-decoration: none;	
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
<script type="text/javascript">
$(function(){
	num=$("#num").val();
	loginok="${sessionScope.loginok}";
	myid="${sessionScope.myid}";
	//alert(loginok+","+myid);
	list(); //처음시작시 댓글 전체 출력
	
	$("#btnansweradd").click(function(){
		var content=$("#content").val();
		if(content.trim().length==0){
			alert("댓글 내용을 입력해주세요");
			return;
		}
		
		$.ajax({
			type:"post",
			dataType:"text",
			url:"ainsert",
			data:{"num":num,"content":content},
			success:function(data){
				//alert("성공");
				//댓글 목록 가져오기
				list();
				
				//입력창 지우기
				$("#content").val("");
				$("#content").focus();
			}
		});
	});
	
});

function list(){
	//alert(num);
	$.ajax({
		type:"get",
		dataType:"json",
		url:"alist",
		data:{"num":num},
		success:function(data){
			$("span.acount").text(data.length);
			var s="";
			$.each(data, function(i,dto) {
				s+="<b>"+dto.myid+"</b>:"+dto.content;
				s+="<span class='day'>"+dto.writeday+"</span>";
				if(loginok=="yes" && myid==dto.myid){
					s+="<span class='glyphicon glyphicon-pencil amod' idx='"+dto.idx+"'></span>";
					s+="&nbsp;";
					s+="<span class='glyphicon glyphicon-trash adel' idx='"+dto.idx+"'></span>";
				}
					
				s+="<br>";
			});
			$("div.alist").html(s);
		}

	});
}
</script>

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

    <section id="main" class="section">
        <div class="main-content">
            <div class="main-container main-content__body">
                <div class="main-content__main">
    <!-- 나의 질문 관리자만 보기 -->
    <c:if test="${sessionScope.loginok!=null && sessionScope.myid == 'admin'}">
                    <table class="table" style="width: 100%;">
                    <h6 style="border-bottom: 1px solid black; margin-bottom: 20px; padding-bottom: 10px; font-size: 15px;">고객 1대1 문의 목록</h6>
						<tr bgcolor="#e9f0ea">
							<th width="50">번호</th>
							<th width="150">회원 아이디</th>
							<th width="150">문의유형</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: right;">작성일</th>
						</tr>
		<c:forEach var="i" items="${list}">
			<tr>
				<td align="center">${no}</td>
				<c:set var="no" value="${no-1}"/>
				<td>${i.myid}</td>
				<td>${i.itype}</td>
				<td>
					<a href="content?num=${i.num}&currentPage=${currentPage}&key=list"
					style="color:black;">
					${i.ititle}</a>
					<!-- 댓글 갯수 -->
					<c:if test="${i.acount>0}">
						<span style="color:red;">
							[${i.acount}]
						</span>
					</c:if>
					<c:if test="${i.uploadfile!='no'}">
						<span class="glyphicon glyphicon-paperclip" style="color:gray;"></span>
					</c:if>
				</td>
				<td style="text-align: right;">
					<fmt:formatDate value="${i.writeday}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
</table>
</c:if>

   <!-- 나의 질문 나만 보기 -->
    <c:if test="${sessionScope.loginok!=null && sessionScope.myid != 'admin'}">
                    <table class="table" style="width: 100%; border-top: 1px solid black;">
                    <h6 style="margin-bottom: 20px; padding-bottom: 15px; font-size: 15px; border-bottom: 1px solid gray;">내 질문</h6>
						<tr bgcolor="#e9f0ea">
							<!-- <th width="70">번호</th> -->
							<th width="150">회원 아이디</th>
							<th width="150">문의유형</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: right;">작성일</th>
						</tr>
		<c:forEach var="i" items="${list}">
			<c:if test="${sessionScope.loginok!=null && sessionScope.myid == i.myid}">
			<tr>
				<%-- <td align="center">${no}</td> --%>
				<%-- <c:set var="no" value="${no-1}"/> --%>
				<td width="150">${i.myid}</td>
				<td width="150">${i.itype}</td>
				<td style="text-align: center;">
					<a href="content?num=${i.num}&currentPage=${currentPage}&key=list"
					style="color:black;">
					 ${i.ititle}
					</a>
					<!-- 댓글 갯수 -->
					<c:if test="${i.acount>0}">
						<span style="color:gray;">
							<%-- [${i.acount}] --%> [답변 완료]
						</span>
					</c:if>
					<c:if test="${i.uploadfile!='no'}">
						<span class="glyphicon glyphicon-paperclip" style="color:gray;"></span>
					</c:if>
				</td>
				<td style="text-align: right;">
					<fmt:formatDate value="${i.writeday}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			</c:if>
		</c:forEach>
</table>
</c:if>




<%-- <div class="summary faq-contents tab-content current" id="tab-main" style="margin-top: 0;">
	<c:if test="${sessionScope.loginok!=null && sessionScope.myid == 'admin'}">
	<h6 style="border-bottom: 1px solid black; margin-bottom: 20px; padding-bottom: 10px; display: none;">내 질문</h6>
	</c:if>
	<c:if test="${sessionScope.loginok!=null && sessionScope.myid != 'admin'}">
	<h6 style="border-bottom: 1px solid black; margin-bottom: 20px; padding-bottom: 10px;">내 질문</h6>
	</c:if>
	<section id="myinq">
		
	<c:if test="${totalCount==0}">
			<p class="notext" ><i class="fas fa-exclamation-triangle notext"></i></p>
			<h2 class="notext">결과가 없습니다</h2>
		</c:if>
	
		<c:if test="${totalCount>0}">
			<c:forEach var="m" items="${list}">
			<c:if test="${sessionScope.loginok!=null && sessionScope.myid == m.myid}">
				<div class="panel-question">
		            <div class="panel-heading">
		            + <span style="color:orange; margin-right: 10px;">[${m.itype}]</span> ${m.ititle}
		            <c:if test="${m.acount>0}">
						<span style="color:gray;">
							[${m.acount}] <b>[답변 완료]</b>
						</span>
					</c:if>
		            <p style="text-align: right;"><fmt:formatDate value="${m.writeday}" pattern="yyyy-MM-dd"/></p>
		            </div>
		            <c:if test="${sessionScope.loginok!=null && sessionScope.myid == m.myid}">
		            <button type="button" class="btn btn-info btn-xs"
						onclick="location.href='inqupdateform?num=${m.num}'">수정</button>
					<button type="button" class="btn btn-danger btn-xs del" 
						onclick="location.href='inqdelete?num=${m.num}&currentPage=${currentPage}'">삭제</button>
					</c:if>
		            <div class="panel-body" id="thisone">
		            <pre style="border: 0px;">${m.icontent}</pre>
		           	<!-- 댓글 뿌리고 싶은데.. -->
           			<c:forEach var="a" items="${alist}">
           				<c:if test="${a.myid=='admin'}">
           					${a.content}
           				</c:if>
           			</c:forEach>
		           	
		           </div>
	       		</div>
			</c:if>
			</c:forEach>
		</c:if>
    </section>                    	
</div> --%>
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
</html>