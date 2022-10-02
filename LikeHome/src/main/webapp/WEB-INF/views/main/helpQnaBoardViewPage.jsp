<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<style type="text/css">
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
		body {
			font-family : pretendard;
			color: #404040;
		}
</style>

<script type="text/javascript">


function QnaAnswerRegister(){
	
	var help_qna_answer_content = document.getElementById("QnaAnswerContentInput").value;
	var help_qna_no = document.getElementById("helpQnaNO").value;
	
	if(!confirm("답변은 등록 후 수정이 불가합니다. 정말 등록 하시겠습니까?")){
		
	} else {
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var QnaAnswerBox = document.getElementById("QnaAnswerBox");
				QnaAnswerBox.innerText = result.data.helpQnaVo.help_qna_answer_content;
				
				var QnaAnswerRegisterBox = document.getElementById("QnaAnswerRegisterBox");
				QnaAnswerRegisterBox.innerHTML = "";
				
			}
		}
		xhr.open("post" , "../admin/QnaAnswerRegisterProcess"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("help_qna_answer_content=" + help_qna_answer_content + "&help_qna_no=" + help_qna_no); //AJAX로 리퀘스트함..
		
	}

}

</script>
</head>
  <body>
	<div class="container-fluid px-3">

	<!-- 뒤로가기 -->
	<div class="row mt-3">
		<div class="col fs-1">
			<a href="../admin/helpQnaBoardPage"><i class="bi bi-arrow-left-square" style="color: #ff6500;"></i></a>
		</div>
	</div>

<table class="table">
    <tr>
      <th class="col">작성자</th>
    </tr>
</table>
<div class="row">
      <div class="col">${data.customerVo.customer_nick }</div>
    </div>
<br>
<table class="table">
    <tr>
      <th class="col">제목</th>
    </tr>
</table>
<div class="row">
      <div class="col">${data.helpQnaVo.help_qna_title }</div>
    </div>
<br>
<table class="table">
    <tr>
      <th class="col">내용</th>
    </tr>
</table>
<div class="row">
      <div class="col">${data.helpQnaVo.help_qna_content }</div>
    </div>
<br>
<table class="table">
    <tr>
      <th class="col">답변</th>
    </tr>
</table>
<div class="row">
      <div class="col" id="QnaAnswerBox">${data.helpQnaVo.help_qna_answer_content }</div>
</div>
    

<c:if test="${authority == 0 && !empty customerInfo && customerInfo.customer_no == data.customerVo.customer_no && data.helpQnaVo.help_qna_answer_content == null }">
	<button onclick="location.href='./helpQnaUpdatePage?help_qna_no=${data.helpQnaVo.help_qna_no}'" type="button" class="btn btn-primary"  >수정</button>
</c:if>
<c:if test="${authority == 0 && !empty customerInfo && customerInfo.customer_no == data.customerVo.customer_no }">
	<button onclick="location.href='./deleteHelpQnaBoard?help_qna_no=${data.helpQnaVo.help_qna_no}'" type="button" class="btn btn-primary"  >삭제</button>
</c:if>

<c:if test="${authority == 2 && data.helpQnaVo.help_qna_answer_content == null}">
 <div id="QnaAnswerRegisterBox">
	<textarea class="form-control mb-2" id="QnaAnswerContentInput" name="help_qna_answer_content" placeholder="답변 내용을 입력 해주세요."></textarea>
	<button class="btn btn-outline-light form-control" style="color:#ff6500; border-color: #ff6500;" onclick="QnaAnswerRegister()">답변 작성</button>
	<input type="hidden" id="helpQnaNO" value="${data.helpQnaVo.help_qna_no }">
 </div>
</c:if>

</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>