<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq 추가 게시판</title>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<form action="finsert" method="post">
		<table class="table table-bordered" style="width: 700px; margin: 10px auto 30px auto;">
			<h2 style="text-align: center; font-size: 25px;">자주묻는 질문 추가하기</h2>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="faqtype" class="select" style="height: 30px;" id="faqtype">
                        <option value="배송">배송</option>
                        <option value="주문/결제">주문/결제</option>
                        <option value="취소/반품/교환">취소/반품/교환</option>
                        <option value="영수증/세금계산서">영수증/세금계산서</option>
                        <option value="회원정보/서비스">회원정보/서비스</option>
                        <option value="쿠폰/마일리지">쿠폰/마일리지</option>
                        <option value="기타">기타</option>
                    </select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
				<input type="text" name="ftitle" class="form-text" style="width: 500px; height: 30px;">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="fcontent" style="width: 500px; height: 100px;" 
					onfocus="textCheck('#inquiryContent',5000);" class="form-text"></textarea>
				</td>
			</tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-default">FAQ 추가하기</button>
                    <button type="button" class="btn btn-default" onclick="location.href='/cscenter/csmain'">목록</button>
                </td>
            </tr>
		</table>
	</form>
</body>
</html>