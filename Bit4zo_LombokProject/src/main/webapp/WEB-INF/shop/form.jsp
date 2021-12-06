<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
</head>
<style>
 .mydiv {
        border: 0px solid #735e5e;
        width: 750px;
        height:500px;
        overflow:scroll;
   }
   
   .msg{
		font-size: 8pt;
	}
   
</style>
<body>
<div>
  <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="breadcrumb__text">
                        <h4>AddProduct</h4>
                        <div class="breadcrumb__links">
                            <a href="${root}/shop/adminmain">AdminMain</a>
                            <span>ProductAdd</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    	<div class="col-lg-5">
<div style="float:left;">
<div class="container-fluid" style="width: 700px;">
<div style="margin-left:50px; margin-top: 30px;">
<button data-toggle="collapse" href="#collapseExample" aria-controls="collapseExample"
class="btn btn-large-warning">>상품 정보 입력</button>
</div>
<div class="collapse" id="collapseExample" style="width:550px;  margin-top: 20px;">
<div class="well">
	<form action="insert" method="post" enctype="multipart/form-data">
		<b>상품정보입력</b>
		<table class="table table-bordered" style="width: 500px;">
			<tr>
				<th bgcolor="#ddd" width="120">상품코드</th>
				<td><input type="text" name="pro_id" id="pro_id"
					style="width: 200px; float:left;" required="required" class="form-control id">
			<button type="button" class="btn btn-dark" id="idck" style="margin-left: 3px;">중복확인</button></td>
			</tr>
			<tr>
				<th bgcolor="#ddd" width="120">상품명</th>
				<td><input type="text" name="pro_name"
					style="width: 200px;" required="required" class="form-control"></td>
			</tr>
			<tr>
				<th bgcolor="#ddd" width="120">가 격</th>
				<td><input type="text" name="price"
					style="width: 200px;" required="required" class="form-control"></td>
			</tr>
			<tr>
				<th bgcolor="#ddd" width="120">재고</th>
				<td><input type="text" name="stock"
					style="width: 200px;" required="required" class="form-control"></td>
			</tr>
			<tr>
				<th bgcolor="#ddd" width="120">상품분류</th>
				<td><select name="pro_sub" required="required"
					style="width: 200px;">
						<option value="반팔">반팔</option>
						<option value="긴팔">긴팔</option>
						<option value="패딩">패딩</option>
						<option value="바지">바지</option>
				</select></td>
			</tr>
			<tr>
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
				<td><textarea name="pro_content" class="form-control"
					style="width: 350px; height: 150px;" required="required" class="form-control"></textarea></td>
			</tr>

			<br>
			<br>

			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-dark" style="width: 100px;">저장</button>
					<button type="submit" class="btn btn-dark" style="width: 150px;"
						onclick="location.href='adminmain'">관리자목록</button>
				</td>
			</tr>
		</table>
	</form>
	  </div>
    </div>
  </div>
	<p style="clear: both;"></p>
	<div class="container-fluid">
		<div style="margin-left: 50px;">
			<button data-toggle="collapse" href="#collapseExample2"
				aria-expanded="true" aria-controls="collapseExample2"
				class="btn btn-large-warning">>상품 옵션(색상) 입력</button>
		</div>
		<div class="collapse" id="collapseExample2" style="width: 550px;  margin-top: 30px;">
			<div class="well">
				<form action="insert2" method="post" enctype="multipart/form-data">
					<b>색상 옵션 추가</b>
					<table class="table table-bordered" style="width: 550px;">
						<tr>
							<th bgcolor="#ddd" width="120">상품아이디</th>
							<td><c:if test="${!empty list}">
									<select name="pro_id" required="required" class="form">
										<c:forEach var="p" items="${list}">
											<option value="${p.pro_id}">${p.pro_id}</option>

										</c:forEach>
									</select>
								</c:if></td>
						</tr>

						<tr>
							<th bgcolor="#ddd" width="120">색상</th>
							<td><select name="color" required="required"
					style="width: 200px;">
						<option value="000000">검정(#000000)</option>
						<option value="FFFFFF">하양(#FFFFFF)</option>
						<option value="F5F5DC">베이지(#F5F5DC)</option>
						<option value="8B0000">빨강(#8B0000)</option>
						<option value="00008B">파랑(#00008B)</option>
				</select></td>
						</tr>

						<input type="hidden" name="s" value="0">
						<input type="hidden" name="m" value="0">
						<input type="hidden" name="l" value="0">

						<tr>
							<td colspan="2" align="center">
								<button type="submit" class="btn btn-dark" style="width: 100px;">저장</button>

								<c:forEach var="j" items="${join}">
									<tr>
										<td>${j.pro_id}</td>
										<td>${j.joindto.pro_name}</td>
										<td>${j.color}</td>
										<td>${j.s}</td>
										<td>${j.m}</td>
										<td>${j.l}</td>
									</tr>
								</c:forEach>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
<br>
<div class="col-lg-7">
	<div>
	<table class="table table-bordered" style="width:750px; margin-left: 50px;">
		<tr bgcolor="#ddd" style="font-size: 0.9em;">
			<th width="30">번호</th>
			<th width="60">상품번호</th>
			<th width="70">상품명</th>
			<th width="60">색상</th>
			<th width="60">가격</th>
			<th width="90">상품분류</th>
			<th width="90">입고날짜</th>
			<th width="70">수정</th>
		</tr>
		<c:if test="${totalCount==0}">
			<tr height="50">
				<td colspan="8" align="center">
					<h3>
						<b>등록된 글이 없습니다</b>
					</h3>
				</td>
			</tr>
		</c:if>
		</table>
		</div>
	<div class='mydiv' id='mydiv' style="margin-left: 50px;">
	<table class="table table-bordered" style="width:100%;">
		<c:if test="${totalCount>0}">
			<c:forEach var="a" items="${list2}">
				<tr>
					<td>${no}</td>
					<c:set var="no" value="${no+1}"/>
					<td>
					<!-- <a href="content?num=${a.num}&currentPage=${currentPage}&key=list"
					style="color: black;"> -->
					<a>${a.pro_id}</a>
					</td>
					<td>${a.joindto.pro_name}</td>
					<td>${a.color}</td>
					<td>${a.joindto.price}</td>
					<td>${a.joindto.pro_sub}</td>
					<td>
						<fmt:formatDate value="${a.joindto.ipgoday}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
	<button type="button" class="btn btn-dark btn-sm"
		onclick="location.href='updateform?idx=${a.joindto.idx}&color=${a.color}'">수정</button>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</div>
</div>
</div>
	<p style="clear: both;"></p>
</body>
</html>