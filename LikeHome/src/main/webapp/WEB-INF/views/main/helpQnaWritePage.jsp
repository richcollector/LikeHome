<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">

</head>
<h1>Q&A 작성</h1>

<body>
<form action="./helpQnaWriteProcess" method="post">
<div class="mb-3">
	<select name="">
		<option value="">문의 유형 선택</option>
		<c:forEach items="${helpQnaTypeList }" var="type">
			<option name="help_qna_type_no" value="${type.help_qna_type_no }">${type.help_qna_type_name }</option>
		</c:forEach>
	</select>
</div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">제목</label>
  <input type="text" name="help_qna_title" class="form-control" placeholder="제목을 입력해주세요">
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
  <textarea class="form-control" name="help_qna_content" rows="3" placeholder="내용을 입력해주세요"></textarea>
  <input type="hidden" name="customer_no" value=${customerInfo.customer_no }>
</div>
<button onclick="location.href='./helpQnaBoardPage'" type="submit" class="btn btn-primary" style="float:right">글쓰기</button>
</form>
<button onclick="location.href='./helpQnaBoardPage'" type="button" class="btn btn-primary" >작성 취소</button>


<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>