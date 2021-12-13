<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq 수정게시판</title>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<form action="fupdate" method="post">
	<input type="hidden" name="num" value="${fdto.num}">
	
		<table class="table table-bordered" style="width: 770px; margin: 0 auto;">
			<h2 style="text-align: center; font-size: 25px;">자주묻는 질문 수정하기</h2>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="faqtype" class="select" style="height: 30px;" id="faqtype">
                        <option value="배송" ${fdto.faqtype=='배송'?"selected":""}>배송</option>
                        <option value="주문/결제" ${fdto.faqtype=='주문/결제'?"selected":""}>주문/결제</option>
                        <option value="취소/반품/교환" ${fdto.faqtype=='취소/반품/교환'?"selected":""}>취소/반품/교환</option>
                        <option value="영수증/세금계산서" ${fdto.faqtype=='영수증/세금계산서'?"selected":""}>영수증/세금계산서</option>
                        <option value="회원정보/서비스" ${fdto.faqtype=='회원정보/서비스'?"selected":""}>회원정보/서비스</option>
                        <option value="쿠폰/마일리지" ${fdto.faqtype=='쿠폰/마일리지'?"selected":""}>쿠폰/마일리지</option>
                        <option value="기타" ${fdto.faqtype=='기타'?"selected":""}>기타</option>
                    </select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
				<input type="text" name="ftitle" class="form-text" style="width: 600px; height: 30px;"
				required="required" value="${fdto.ftitle}">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="fcontent" style="width: 600px; height: 100px;" 
					onfocus="textCheck('#inquiryContent',5000);" class="form-text" required="required">${fdto.fcontent}</textarea>
				</td>
			</tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-default">수정</button>
                    <button type="reset" class="btn btn-default" style="width: 100px;">다시하기</button>
                    <button type="button" class="btn btn-default" onclick="history.back()">이전</button>
                </td>
            </tr>
		</table>
	</form>
</body>
</html>