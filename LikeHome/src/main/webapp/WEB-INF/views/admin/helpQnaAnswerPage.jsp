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

</head>
<h1>Q&A 답변 달기 - 관리자</h1>
<body>
<form action="./updateQnaAnswer" method="post">
<table class="table">
    <div class="row">
      <th class="col">제목</th>
    </div>
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
      <textarea name="help_qna_answer_content" placeholder="답변을 입력해주세요"></textarea>
    </div>
<input type="hidden" name="help_qna_no" value=${data.helpQnaVo.help_qna_no }>
<br>
<button onclick="location.href='../main/helpQnaBoardPage'" type="submit" class="btn btn-primary"  >답변 저장</button>
    
</form>
<button onclick="location.href='../main/helpQnaBoardPage'" type="button" class="btn btn-primary" style="float:right" >목록으로</button>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>