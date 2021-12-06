<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
var idck = 0;
$(function() {
//idck 버튼을 클릭했을 때 
$("#idck").click(function() {
    
    //proid 를 param.
    var pro_id = $("#pro_id").val().trim(); 
    
    $.ajax({
        async: true,
        type : 'POST',
        data : {"pro_id":pro_id},
        url : "/shop/idcheck",
        dataType : "json",
        success : function(data) {
            if (data.cnt > 0) {
                alert("상품번호가 존재합니다. 다른 상품번호를 입력해주세요.");
                $("#pro_id").val("");    
            } else if(pro_id.length==0){
                 alert("필수 정보입니다.");
            } else {
                alert("사용가능한 상품번호입니다.");
                //아이디가 중복하지 않으면  idck = 1 
                idck = 1;
            }
        }
    })
});
});
</script>
<script type="text/javascript">
////
var fileArr;
var fileInfoArr=[];
//썸네일 클릭시 삭제.
function fileRemove(index) {
    console.log("index: "+index);
    fileInfoArr.splice(index,1);
 
    var imgId="#img_id_"+index;
    $(imgId).remove();
    console.log(fileInfoArr);
}

//썸네일 미리보기.
function previewImage(targetObj, View_area) {
    var files=targetObj.files;
    fileArr=Array.prototype.slice.call(files);
    
    var preview = document.getElementById(View_area); //div id
    var ua = window.navigator.userAgent;
 
    //ie일때(IE8 이하에서만 작동)
    if (ua.indexOf("MSIE") > -1) {
        targetObj.select();
        try {
            var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
            var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);
 
 
            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error가 있으면 delete
            }
 
            var img = document.getElementById(View_area); //이미지가 뿌려질 곳
 
            //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + View_area)) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + View_area;
                info.innerHTML = e.name;
                preview.insertBefore(info, null);
            }
        }
        //ie가 아닐때(크롬, 사파리, FF)
    } else {
        var files = targetObj.files;
        for ( var i = 0; i < files.length; i++) {
            var file = files[i];
            fileInfoArr.push(file);
 
            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
            if (!file.type.match(imageType))
                continue;
            // var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
            // if (prevImg) {
            //     preview.removeChild(prevImg);
            // }
 
            var span=document.createElement('span');
            span.id="img_id_" +i;
            span.style.width = '100px';
            span.style.height = '100px';
            preview.appendChild(span);
 
            var img = document.createElement("img");
            img.className="addImg";
            img.classList.add("obj");
            img.file = file;
            img.style.width='inherit';
            img.style.height='inherit';
            img.style.cursor='pointer';
            const idx=i;
            img.onclick=()=>fileRemove(idx);   //이미지를 클릭했을 때.
            span.appendChild(img);
 
            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                var reader = new FileReader();
                reader.onloadend = (function(aImg) {
                    return function(e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            } else { // safari is not supported FileReader
                //alert('not supported FileReader');
                if (!document.getElementById("sfr_preview_error_"
                    + View_area)) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + View_area;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }
}

</script>
<body>
<div class="well" style="width:550px; margin-left: 10px;">
<form action="update" method="post" enctype="multipart/form-data">
	<caption><b>상품정보수정</b></caption>

	<input type="hidden" name="currentPage" value="${currentPage}">
	
	
	<table class="table table-bordered" style="width: 500px;">
		<c:forEach var="a" items="${list}">
		<input type="hidden" name="idx" value="${a.joindto.idx}">
		<input type="hidden" name="color" value="${a.color}">
		<tr>
			<th bgcolor="#ddd" width="120">상품코드</th>
			<td>
				<input type="text" name="pro_id" class="form-control" id="pro_id"
				style="width:200px; float:left;" required="required" value="${a.pro_id}">
				<button type="button" class="btn btn-dark" id="idck" style="margin-left: 3px;">중복확인</button>
				<br>
				<b style="font-size: 0.8em; color:red; margin-left: 5px;">*상품코드 변경시에만 중복확인</b>
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">상품명</th>
			<td>
				<input type="text" name="pro_name" class="form-control"
				style="width:200px;" required="required" value="${a.joindto.pro_name}">
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">가 격</th>
			<td>
				<input type="text" name="price" class="form-control"
				style="width:200px;" required="required" value="${a.joindto.price}">
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">재고</th>
			<td>
				<input type="text" name="stock" class="form-control"
				style="width:200px;" required="required" value="${a.joindto.stock}">
			</td>			
		</tr>
		<tr>
			<th bgcolor="#ddd" width="120">상품분류</th>
			<td>
		  <select name="pro_sub" required="required" class="form"
		  style="width:200px;">
            <option value="상의">상의</option>
            <option value="하의">하의</option>
            <option value="아우터">아우터</option>
            <option value="신발">아우터</option>
          </select>
			</td>			
		</tr>
		<th bgcolor="#ddd" width="120">상품사진</th>
            <td>
				<label for="img_upload">
				<img src="../photo/photo_add.png" style="width:100px; height:100px; cursor: pointer;"> </label>
				<input type="file" name="upload" id="img_upload" onchange="previewImage(this,'View_area')" style="display: none;" multiple>
				<span id='View_area' style='position:relative; color: black; border: 0px solid black;'>
				</span>
				
			</tr>
		<tr>
			<th bgcolor="#ddd" width="120">상품설명</th>
			<td>
				<input type="textarea" name="pro_content" class="form-control"
				style="width: 350px; height: 150px;" required="required" value="${a.joindto.pro_content}">
			</td>			
		</tr>
		</c:forEach>
		<tr>
			<td colspan="2" align="center">
			<button type="submit" class="btn btn-dark"
			style="width: 100px;">수정</button>
			<button type="button" class="btn btn-default"
				style="width:100px;" onclick="history.back()">이전</button>
			<button type="submit" class="btn btn-secondary"
			style="width: 100px;" onclick="location.href='adminmain?currentPage=${currentPage}'">관리자목록</button>
			</td>
		</tr>
	</table>
</form>
	  </div>

	
	
		<div class="container-fluid">
		<div style="margin: 10px;">
			<button data-toggle="collapse" href="#collapseExample2"
				aria-controls="collapseExample2"
				class="btn btn-large-warning">>상품 옵션(색상) 입력</button>
		</div>
		<div class="collapse" id="collapseExample2" style="width: 550px;">
			<div class="well">
				<form action="update2" method="post" enctype="multipart/form-data">
					<b>색상 옵션 추가</b>
					<input type="hidden" name="currentPage" value="${currentPage}">
					<table class="table table-bordered" style="width: 500px;">
					
				<c:forEach var="j" items="${list}">
					<input type="hidden" name="idx" value="${j.num}">
						<tr>
							<th bgcolor="#ddd" width="120">상품아이디</th>
							<td>
									<select name="pro_id" required="required" class="form">
											<option value="${j.pro_id}">${j.pro_id}</option>
									</select>
								</td>
						</tr>
						
						<tr>
							<th bgcolor="#ddd" width="120">색상</th>
							<td><input type="text" name="color" class="form-control"
								style="width: 200px;" required="required" value="${j.color}"></td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="2" align="center">
						<button type="submit" class="btn btn-dark" style="width: 100px;">수정</button>

					</table>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>