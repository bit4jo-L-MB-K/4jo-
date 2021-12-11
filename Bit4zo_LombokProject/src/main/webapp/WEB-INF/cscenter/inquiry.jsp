<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의 | Lombok</title>
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

a:hover {
	text-decoration: none;
}

.email-form__input {
	padding-top: 2px;
}
</style>
<script type="text/javascript">
	$(function(){
		$("i.photo").click(function(){
			$("#photo").trigger("click");
		});
	});
	
	/* 이미지 미리보기 함수 */
	function setDetailImage(event){
		for(var image of event.target.files){
			var reader =new FileReader();
			
			reader.onload = function(event){
				var img = document.createElement("img");
				img.setAttribute("src",event.target.result);
				img.setAttribute("class","inquiry-photo");
				document.querySelector("div#images_container").appendChild(img).style.margin='0 5px';
			};
			
			console.log(image);
			reader.readAsDataURL(image);
		}
	}
</script>
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
            <h3 class="main-conent__title">1:1 문의</h3>
        </div>
        <div class="inquiry-wrap">
            <form action="qinsert" id="registrationForm" method="post" enctype="multipart/form-data">
                <div class="inquiry-layout">
                    <div class="inquiry-layout__left">
                        <h3 class="form-title">문의 유형<span class="form-title__required">*</span></h3>
                        <div class="type-form">
                            <span class="type-form__state form-select">
                                <select name="itype" class="select">
                                    <option value="회원정보">회원정보</option>
                                    <option value="상품">상품</option>
                                    <option value="주문/결제">주문/결제</option>
                                    <option value="배송">배송</option>
                                    <option value="취소/반품">취소/반품</option>
                                    <option value="쿠폰/마일리지">쿠폰/마일리지</option>
                                    <option value="매장재고/상품예약">매장재고/상품예약</option>
                                </select>
                            </span>
                        </div>
                        <h3 class="form-title">작성자<span class="form-title__required">*</span></h3>
                        <div class="write-name">
                            <div class="write-name__input input-block">
                                <input type="text" class="form-text" name="myid">
                            </div>
                        </div>
                    </div>
                    <div class="inquiry-layout__right">
                        <h3 class="form-title">휴대전화<span class="form-title__required">*</span></h3>
                        <div class="phone-form">
                            <div class="phone-form__input input-block">
                                <input type="text" name="hp" value="" placeholder="-없이 숫자만 입력해 주세요" class="form-text">
                            </div>
                        </div>
                        <h3 class="form-title">이메일<span class="form-title__required">*</span></h3>
                        <div class="email-form">
                            <div class="email-form__input input-block">
                                <input type="text" name="email" value="" placeholder="이메일" class="form-text">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="inquiry-title">
                    <h3 class="form-title">제목
                        <span class="form-title__required">*</span>
                    </h3>
                    <div class="input-block">
                        <input type="text" name="ititle" id="inquiryTitle" onfocus="textCheck('#inquiryTitle',30);" class="form-text">
                    </div>
                </div>
                <div class="inquiry-content">
                    <h3 class="form-title">내용<span class="form-title__required">*</span></h3>
                    <textarea id="inquiryContent" name="icontent" cols="40" row="5" placeholder="접수하신 문의 내용에 계좌번호 등의 개인정보가 포함된 경우, 임의 삭제될 수 있습니다." onfocus="textCheck('#inquiryContent',2000);" class="form-text"></textarea>
                </div>
				<div class="inquiry-photo" style="margin: 10px 0;">
					<input type="file" name="upload" id="photo" multiple="multiple" style="visibility: hidden; display: none;" onchange="setDetailImage(event)">
					<i class="fas fa-plus-square photo" style="display:flex; font-size: 90px; color: #bdbdbd; cursor: pointer;">
						<!-- 이미지 미리보기  -->
						<div id="images_container" style="min-width: 90px; min-height: 90px; max-width:90px; max-height:90px; display: flex;" ></div>
					</i>
				</div>                
                
                <div class="inquiry-agreement">
                    <label class="form-checkbox">
                        <input type="checkbox" autocomplete="off" class="checkbox" required="required">
                        <span class="name">1:1문의 상담을 위한 개인정보 수집이용에 동의합니다.</span>
                    </label>
                </div>
                <div class="button-inquiry">
                    <button type="submit" class="form-button">1:1 문의하기</button>
                </div>
            </form>
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
                                </c:choose>
                                </li>
                                <li class="menu__item">
                                <c:choose>
                                	<c:when test="${sessionScope.loginok!=null}">
                                		<a href="${root}/cscenter/inqlist"><i class="far fa-envelope"></i>나의 질문</a>
                                	</c:when>
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
</body>
</html>