<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>


<script type="text/javascript">
	$(function() {
		//이메일 선택 이벤트
		$("#selemail").change(function() {
			if ($(this).val() == "-") {
				$("#domain").val('');//지정된 메일 지우기
			} else {
				$("#domain").val($(this).val());
			}
		});
		
		//아이디 입력후 포커스가 벗어날때 체크
		$("#id").blur(function(){
			var id=$(this).val().trim();//입력값 앞뒤 공백 제거
			$.ajax({
				type:"get",
				dataType:"json",
				data:{"id":id},
				url:"idcheck",
				success:function(data){
					if(data.check==1){
						$("#idmsg").html("<font color='red'>이미 사용중인 아이디입니다.</font>");
						$("#id").val("");
					}else{
						if(id.length==0){
							$("#idmsg").html("<font color='red'>필수 정보입니다.</font>");
						} else {
							$("#idmsg").html("<font color='green'>멋진 아이디네요!</font>");
						}
					}
				}
			});
		});
		
		$("#pass").blur(function() {
			var pass = $(this).val();
			if(pass.length < 8){
				if(pass.length == 0){
					$("#passmsg").html("<font color='red'>필수 정보입니다.</font>");
				} else {
					$("#passmsg").html("<font color='red'>비밀번호를 8자리 이상 입력해주세요</font>");
				}
			} else {
				$("#passmsg").html("&nbsp;");
			}
		});
		
		$("#pass2").blur(function() {
			var pass1 = $("#pass").val();
			var pass2 = $(this).val();
			if(pass1 != pass2){
				if(pass2.length == 0){
					$("#passcheckmsg").html("&nbsp;")
				} else {
					$("#passcheckmsg").html("<font color='red'>비밀번호가 일치하지 않습니다.</font>");
				}
			} else {
				if(pass2.length == 0){
					$("#passcheckmsg").html("&nbsp;")
				} else {
					$("#passcheckmsg").html("<font color='green'>비밀번호가 일치합니다.</font>");
				}
			}
		});
		
		$("#name").blur(function() {
			var name = $("#name").val();
			if(name.length == 0){
				$("#namemsg").html("<font color='red'>필수 정보입니다.</font>");
			} else {
				$("#namemsg").html("&nbsp;")
			}
		});
		/////////////////////////////////////////////이메일//////
		
		$("#sendMail").click(function() {// 메일 입력 유효성 검사
			var mail = $("#mail").val(); //사용자의 이메일 입력값. 
			
			if (mail == "") {
				alert("메일 주소가 입력되지 않았습니다.");
			} else {
				mail = mail+"@"+$("#domain").val(); //셀렉트 박스에 @뒤 값들을 더함.
				$.ajax({
					type : 'post',
					dataType :'json',
					url : '/member/CheckMail',
					data : {mail:mail},
					success:function(data){
						console.log(data);
						key = data;
					}
				});
				alert("인증번호가 전송되었습니다.") 
				isCertification=true; //추후 인증 여부를 알기위한 값
				$("#compare").on("propertychange change keyup paste input", function() {
					if ($("#compare").val() == key) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
						$("#compare-text").html("<font color='green'>인증코드가 일치합니다.</font>");
						isCertification = true;  //인증 성공여부 check
					} else {
						$("#compare-text").html("<font color='red'>인증코드가 일치하지 않습니다.</font>");
						isCertification = false; //인증 실패
					}
				});
			}
		});
		
		$("#submit-btn").click(function submitCheck(){
			if(isCertification==false){
				alert("메일 인증이 완료되지 않았습니다.");
				return false;
			}else
				true;
		});
	});

	function check(f) {
		if (f.id.value.length == 0) {
			alert("아이디를 입력해주세요");
			return false;//action이 호출되지 않는다
		}
		if (f.pass.value != f.pass2.value) {
			alert("비밀번호가 서로 다릅니다");
			f.pass.value = "";
			f.pass2.value = "";
			return false;//action이 호출되지 않는다
		}
		if (f.pass.value.length < 8) {
			$("#passmsg").html("<font color='red'>비밀번호를 8자리 이상 입력해주세요</font>");
			$("#pass").val("");
			$("#pass").focus();
			return false;
		}
		return true;

	}
</script>

<style type="text/css">
	.jointb{
		width: 460px;
		margin-bottom: 120px;
	}
	.thfriends{
		width: 100px;
		font-size: 10pt;
	}
	.txtfriends{
		width: 460px;
		height: 51px;
		border: 1px solid gray;
		border-radius: 5px;
	}
	.txtemail{
		width: 165px;
		height: 51px;
		border: 1px solid gray;
		border-radius: 5px;
	}
	.selspan{
		display: inline-flex;
		height: 51px;
		border: 1px solid gray;
		border-radius: 5px;
		align-items: center;
	}
	.msg{
		font-size: 8pt;
	}
	.selbox1{
		width: 100px;
		border: 0px;
	}
	.selbox2{
		width: 460px;
		border: 0px;
	}
	.selbox3{
		width: 142px;
		border: 0px;
	}
	.btn1{
		height: 51px;
		width: 120px;
		border: 1px solid gray;
		border-radius: 5px;
		background: black;
		color: white;
		font-size: 10pt;
	}
	.txtfriends2{
		width: 335px;
		height: 51px;
		border: 1px solid gray;
		border-radius: 5px;
	}
	.txtfriendhp{
		width: 142px;
		height: 51px;
		border: 1px solid gray;
		border-radius: 5px;
	}
	.txtfriends3{
		width: 202px;
		height: 51px;
		border: 1px solid gray;
		border-radius: 5px;
	}
	.btn2{
		height: 51px;
		width: 460px;
		border: 1px solid gray;
		border-radius: 5px;
		background: black;
		color: white;
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

<div align="center" class="joindiv">
	<form action="welcome" method="post" onsubmit="return submitCheck();">
		<table class="jointb">
			<span><img src="${root}/lombok_logo.png"></span>
			<tr>
				<th class="thfriends">아이디</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="id" maxlength="15" class="txtfriends" required="required" id="id">
					<br>
					<b id="idmsg" class="msg">&nbsp;</b>
				</td>
			</tr>
			<tr>
				<th class="thfriends">비밀번호</th>
			</tr>
			<tr>
				<td>
					<input type="password" name="pass" required="required" class="txtfriends" placeholder="8자리 이상 입력해주세요" id="pass">
					<br>
					<b id="passmsg" class="msg">&nbsp;</b>
				</td>
			</tr>
			<tr>
				<th class="thfriends">비밀번호 확인</th>
			</tr>
			<tr>
				<td>
					<input type="password" name="pass2" class="txtfriends" required="required" placeholder="비밀번호 확인" id="pass2">
					<br>
					<b id="passcheckmsg" class="msg">&nbsp;</b>
				</td>
			</tr>
			<tr>
				<th class="thfriends">이름</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="name" class="txtfriends" required="required" id="name">
					<br>
					<b id="namemsg" class="msg">&nbsp;</b>
				</td>
			</tr>
			<tr>
				<th class="thfriends">이메일</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="email1" required="required" class="txtemail" id="mail">	
					<b>@</b>
					<input type="text" name="email2" id="domain" required="required" class="txtemail">
					<span class="selspan">
						<select id="selemail" class="selbox1">
							<option value="-">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="nate.com">네이트</option>
							<option value="gmail.com">구글</option>
							<option value="hanmail.net">다음</option>
						</select>
					</span>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" class="btn1" id="sendMail">인증번호 받기</button>
					<input type="text" class="txtfriends2" id="compare" placeholder="인증번호를 입력해주세요">
					<b id="compare-text" class="msg">&nbsp;</b>
					<br>
				</td>
			</tr>
			<tr>
				<th class="thfriends">주소</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="addrnum" class="txtfriends2" id="userZipcode" readonly class='box'/>
                    <input type="button" value="주소 찾기" onclick="findAddr()" class="btn1">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="addr" class="txtfriends" id="addr1" placeholder="주소를 입력하세요" readonly class='box'/>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="addrdetail" id="addr2" class="txtfriends" placeholder="상세 주소를 입력하세요"/>
					<br>
					<br>
				</td>
			</tr>
			<tr>
				<th class="thfriends">성별</th>
			</tr>
			<tr>
				<td>
					<span class="selspan">
						<select class="selbox2" name="selegender">
							<option disabled="disabled" selected="selected">선택</option>
							<option value="man">남성</option>
							<option value="woman">여성</option>
						</select>
					</span>
					<br>
					<br>
				</td>
			</tr>
			<tr>
				<th class="thfriends">생년월일</th>
			</tr>
			<tr>
				<td>
					<input class="txtfriends" type="date" name="birth" required="required">
					<br>
					<br>
				</td>
			</tr>
			<tr>
				<th class="thfriends">핸드폰</th>
			</tr>
			<tr>
				<td>
					<span class="selspan">
						<select id="hp" name="hp1" class="selbox3">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</span>
					<b>-</b>
					<input type="text" name="hp2" required="required" class="txtfriendhp">
					<b>-</b>
					<input type="text" name="hp3" required="required" class="txtfriendhp">
					<br>
					<br>
				</td>
			</tr>
			<tr>
				<th class="thfriends">키/몸무게</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="height" required="required" placeholder="키" class="txtfriends3">
					<b>cm</b>
					<input type="text" name="weight" required="required" placeholder="몸무게" class="txtfriends3">
					<b>kg</b>
					<br>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit" class="btn2" id="submit-btn">회원가입</button>
				</td>
			</tr>
		</table>
	</form>
</div>

	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function findAddr() {
	daum.postcode.load(function() {
		new daum.Postcode({
			oncomplete: function(data){
				var addr = '';

				if (data.userSelectedType == 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunaddress;
				}
				// 우편번호
				document.getElementById('userZipcode').value = data.zonecode;
				// 주소정보
				document.getElementById('addr1').value = addr;
				}
		}).open();
	});
}
</script>
</body>
</html>