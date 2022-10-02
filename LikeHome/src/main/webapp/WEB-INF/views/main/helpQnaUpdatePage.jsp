<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">

</head>
<h1>Q&A 게시글 수정</h1>

<body>
<form action="./updateHelpQnaBoard" method="post">
	<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">제목</label>
  <input type="text" name="help_qna_title" class="form-control" value=${data.helpQnaVo.help_qna_title } >
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
  <textarea class="form-control" name="help_qna_content" rows="3" >${data.helpQnaVo.help_qna_content }</textarea>
  <input type="hidden" name="help_qna_no" value=${data.helpQnaVo.help_qna_no }>
</div>
<button onclick="location.href='./helpQnaBoardPage'" type="submit" class="btn btn-primary" style="float:right">수정 완료</button>
</form>
<button onclick="location.href='./helpQnaBoardPage'" type="button" class="btn btn-primary" >작성 취소</button>


<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>