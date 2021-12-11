<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	.amod,.adel{
		cursor: pointer;
		font-size: 0.6em;
		color: gray;
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
	//댓글 삭제
	$(document).on("click","span.adel",function(){
		var idx=$(this).attr("idx");
		var a=confirm("해당 댓글을 삭제할까요");
		if(a==true){
			$.ajax({
				type:"get",
				dataType:"text",
				url:"adelete",
				data:{"idx":idx},
				success:function(data){						
					list();
				}
			});
		}
	});

	//댓글 수정시 다이얼로그
	$(document).on("click","span.amod",function(){
		idx=$(this).attr("idx");
		$.ajax({
			type:"get",
			dataType:"json",
			url:"adata",
			data:{"idx":idx},
			success:function(data){						
				$("#ucontent").val(data.content);
			}
		});
		$("#myModal").modal();	
		
	});

	//댓글 수정
	$(document).on("click","#btnaupdate",function(){
		var content=$("#ucontent").val();
		//alert(idx+","+content);
		$.ajax({
			type:"post",
			dataType:"text",
			url:"aupdate",
			data:{"idx":idx,"content":content},
			success:function(data){						
				list();
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
				s+="<b>"+dto.myid+"</b>:"+"<pre style='background-color: white;'>"+dto.content+"</pre>";
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

<table class="table table-bordered inq__content" style="width: 700px; margin: 10px auto 30px auto;">
	<tr>
		<td>
			<h3><b>${idto.ititle}</b>
				<span style="font-size: 14pt; color:gray; float: right;">
					<fmt:formatDate value="${idto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
				</span>			
			</h3>
			<span>작성자 : &nbsp;${idto.myid}</span>
			
			
			
			<c:if test="${idto.uploadfile!='no'}">
				<span style="float: right;">
					<a href="download?clip=${idto.uploadfile}">
						<span class="glyphicon glyphicon-download-alt"></span>
						<b>${idto.uploadfile}</b>
					</a>
				</span>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<c:if test="${bupload==true}">
				<!-- <h4>업로드 파일이 이미지 입니다</h4> -->
				<img src="../photo/${idto.uploadfile}" style="max-width: 400px;">
			</c:if>
			<br><br>
			<pre style="background-color: #fff; border:0px;">${idto.icontent}</pre>
			<br>
			<b>답변<span class="acount"></span></b>
		</td>
	</tr>
	
	<!-- 댓글 -->
	<!-- 손님은 댓글x -->
	
	<tr>
		<td>
			<div class="alist"></div>
			<input type="hidden" id="num" value="${idto.num}">
			<c:if test="${sessionScope.loginok!=null && sessionScope.myid =='admin'}">
			<div class="aform">
				<div class="form-inline">
				<!-- 	<input type="text" class="form-control" style="width: 500px; height: 100px;"
					placeholder="댓글을 입력하세요" id="content"> -->
					<textarea id="content" style="width: 600px; height: 100px;" cols="40" row="5" placeholder="답변을 입력하세요" onfocus="textCheck('#inquiryContent',2000);" class="form-text"></textarea>
					&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-info" style="width: 60px;" 
					id="btnansweradd">등록</button>
				</div>
			</div>
			</c:if>
		</td>
	</tr>
	
	<tr>
		<td align="right">
			<!-- 로그인 중일때만 글쓰기 가능-->
			<%-- <c:if test="${sessionScope.loginok!=null}">
				<button type="button" class="btn btn-default" style="width: 80px;"
				onclick="location.href='form'">글쓰기</button>
			</c:if>  --%>
			
			<button type="button" class="btn btn-default" style="width: 80px;"
			onclick="location.href='inqlist?currentPage=${currentPage}'">목록</button>
			
			<!-- 로그인 중이면서 세션의 아이디와 같은 아이디로 쓴글에만 수정, 삭제 버튼 보이게하기 -->
			<%-- <c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid}">
				<button type="button" class="btn btn-default" style="width: 80px;"
				onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage}'">수정</button>
				<button type="button" class="btn btn-default" style="width: 80px;"
				onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage}'">삭제</button>
			</c:if> --%>
		</td>
	</tr>
</table>
<!-- 수정 다이얼로그 -->
 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog" style="opacity: 1; top:230px;">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">댓글수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <input type="text" id="ucontent" class="form-control">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"
          id="btnaupdate">수정</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>