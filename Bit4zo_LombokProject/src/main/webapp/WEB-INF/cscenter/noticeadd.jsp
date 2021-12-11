<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 추가</title>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	th {
        width: 100px;
        height: 50px;
    }
</style>
</head>
<body>
    <form action="ninsert" method="post">
		<table class="table table-bordered" style="width: 700px; margin: 10px auto 30px auto;">
			<h1 style="text-align: center; font-size: 25px;">공지사항 추가 게시판</h1>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="noticetype" id="noticetype" class="select" style="height: 30px;">
						<option value="공지">공지</option>
						<option value="안내">안내</option>
						<option value="점검">점검안내</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
				<input type="text" name="nsubject" class="form-text" style="width: 500px; height: 30px;" required="required">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="ncontent" style="width: 500px; height: 100px;" 
					onfocus="textCheck('#inquiryContent',5000);" class="form-text" required="required"></textarea>
				</td>
			</tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-default">공지사항 추가하기</button>
                    <button type="button" class="btn btn-default" onclick="location.href='/cscenter/csmain'">목록</button>
                </td>
            </tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	//category 선택 이벤트
	/* $("#noticetype").change(function(){
		$("#noticetype").val($(this).val());
	}); */
</script>
</html>