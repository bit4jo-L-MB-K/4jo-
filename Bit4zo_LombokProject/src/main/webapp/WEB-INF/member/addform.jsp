<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Rubik&display=swap" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		//이메일 선택 이벤트
		$("#selemail").change(function() {
			if ($(this).val() == "-") {
				$("#email2").val('');//지정된 메일 지우기
				$("#email2").foucs();//포커스 주기
			} else {
				$("#email2").val($(this).val());
			}
		});
		
		//아이디 입력후 포커스가 벗어날때 체크
		$("#id").blur(function(){
			var id=$(this).val().trim();//입력값 앞뒤 공백 제거
			if(id.length==0){
				alert("아이디를 입력해주세요");
				return; 
			}
			$.ajax({
				type:"get",
				dataType:"json",
				data:{"id":id},
				url:"idcheck",
				success:function(data){
					if(data.check==1){
						$("b.idmsg").html("<font color='red'>이미 등록된 아이디입니다</font>");
						$("#id").val("");
						$("#id").focus();
					}else{
						$("b.idmsg").html("<font color='blue'>사용 가능한 아이디입니다</font>");
					}
				}
			});
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
			alert("비밀번호는 8자리 이상으로 해주세요");
			f.pass.value = "";
			f.pass2.value = "";
			return false;
		}
		return true;

	}
</script>

<style type="text/css">
#formposition{
	display: inline-block;
	border-style: solid;
   	border-width: thin 0px;
}

</style>
</head>
<body>
<div align="center">
	<h6 style="font-family: Rubik; font-size: 20pt; margin-top: 50px;">Join Lombok</h6>
	<form action="insert" method="post" class="form-inline" name="memberfrm" style=" margin-top: 50px; margin-bottom: 50px;" onsubmit="return check(this)" id="formposition">
		<table class="table" style="width: 900px;">
			<tr>
				<th width="100" bgcolor="#ffffff" style="font-size: 10pt;">아이디</th>
				<td>
					<input type="text" name="id" id="id" maxlength="15" class="form-control" required="required" style="width: 150px;">
					<b class="idmsg"></b>
				</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#ffffff" style="font-size: 10pt;">비밀번호</th>
				<td>
					<input type="password" name="pass" class="form-control" required="required" style="width: 150px;" placeholder="비밀번호">
				</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#ffffff" style="font-size: 10pt;">비밀번호 확인</th>
				<td>
					<input type="password" name="pass2" class="form-control" required="required" style="width: 150px;" placeholder="비밀번호 확인">
				</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#ffffff" style="font-size: 10pt;">이름</th>
				<td>
					<input type="text" name="name" class="form-control" required="required" style="width: 150px;">
				</td>
			</tr>
			<tr>
				<th width="120" style="font-size: 10pt;">주소</th>
				<td>
					<input type="text" name="addrnum" id="userZipcode" placeholder="" readonly class='box'  style="width: 100px;"/>
                    <input type="button" value="우편 번호" onclick="findAddr()" style="height: 25px; line-height: 25px; vertical-align: top; padding:0"><br>
					
					<input type="text" name="addr" id="addr1" placeholder="주소를 입력하세요" readonly class='box' style="width: 300px;"/><br>
					<input type="text" name="addrdetail" id="addr2" placeholder="상세 주소를 입력하세요" style="width: 500px;"/><br>
				</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#ffffff" style="font-size: 10pt;">성별</th>
				<td>
					<select id="selegender" class="form-control" name="selegender">
						<option value="x">선택안함</option>
						<option value="man">남성</option>
						<option value="woman">여성</option>
					</select>			
				</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#ffffff" style="font-size: 10pt;">생년월일</th>
				<td>
					<input type="date" name="birth" class="form-control" required="required" style="width: 200px;">
				</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#ffffff" style="font-size: 10pt;">핸드폰</th>
				<td>
					<select id="hp" class="form-control" name="hp1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					<b>-</b>
					<input type="text" name="hp2"  class="form-control" required="required" style="width: 80px;">
					<b>-</b>
					<input type="text" name="hp3"  class="form-control" required="required" style="width: 80px;">			
				</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#ffffff" style="font-size: 10pt;">키/몸무게(cm/kg)</th>
				<td>
					<input type="text" name="height" class="form-control"
					required="required" style="width: 80px;">
					<input type="text" name="weight" class="form-control"
					required="required" style="width: 80px;">		
				</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#ffffff" style="font-size: 10pt;">이메일</th>
				<td>
					<input type="text" name="email1"  class="form-control" required="required" style="width: 80px;">	
					<b>@</b>
					<input type="text" name="email2" id="email2" class="form-control" required="required" style="width: 150px;">	
					<select id="selemail" class="form-control">
						<option value="-">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="nate.com">네이트</option>
						<option value="gmail.com">구글</option>
						<option value="hanmail.net">다음</option>
					</select>	
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<button type="submit" class="btn btn-success"
					style="width: 100px;">회원가입</button>
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