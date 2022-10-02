<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
</head>

  <body class="bg-light">
	<div class="container-fluid px-3">

 	<div class="row mt-3">
		<div class="col fs-1">
			<a href="./adminMainPage"><i class="bi bi-arrow-left-square" style="color: #ff6500;"></i></a>
		</div>
	</div>
	
	<select id="qqq" class="form-select" aria-label="Default select example" name="selectAnswerState" onchange="isAnswered(this.value)">
		<option value="" selected disabled hidden>--답변여부선택--</option>
		<option id="all" value="all">전체보기</option>
		<option id="notAnswered" value="notAnswered">답변대기</option>
		<option id="answered" value="answered">답변완료</option>
	</select>

   <c:forEach items="${dataList }" var="data">
   <c:if test="${data.helpQnaVo.help_qna_answer_content == null }">
		<div class = "row border rounded bg-white my-3 py-2 mx-0">
			<div class="col" onclick="location.href='./helpQnaBoardViewPage?help_qna_no=${data.helpQnaVo.help_qna_no }'">
				<div class = "row">
					<div class = "col" style="font-size: 0.9rem;">
					  <span class="ms-1">${data.helpQnaTypeVo.help_qna_type_name }</span>
					  <span class="ms-1"><fmt:formatDate value="${data.helpQnaVo.help_qna_writedate }"/></span>
					</div>
			        <div class="col-4 text-end text-secondary" style="font-size: 0.8rem; align-self: center;">
			          <c:choose>
				      	<c:when test="${data.helpQnaVo.help_qna_answer_content == null }">
						  <span class="p-1 me-1" style="color:#757575; background-color: #EAEDEF; font-size: 0.7rem; border-radius: 0.5rem;">답변대기</span>
						</c:when>  	
						<c:otherwise>
					  	  <span class="p-1 me-1" style="color: white; background-color: #ff6500; font-size: 0.7rem; border-radius: 0.5rem;">답변완료</span>
						</c:otherwise>
					  </c:choose>
			        </div>
				</div>
				<div class = "row">
					<div class = "col" style="font-size: 0.9rem;">
						${data.customerVo.customer_nick }
					</div>
				</div>
				<div class = "row">
					<div class = "col" style="font-weight: bold; font-size: 1.2rem;">
						${data.helpQnaVo.help_qna_title }
					</div>
				</div>
				<div class = "row">
					<div class = "col">
						${data.helpQnaVo.help_qna_content }
					</div>
				</div>
			</div>
		</div>
		</c:if>
	</c:forEach>

<!-- <!-- 	페이지
	<nav aria-label="...">
	  <ul class="pagination">
	    <li class="page-item disabled">
	      <a class="page-link" style="color:#ff6500;">&lt;</a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#" style="color:#ff6500;">1</a></li>
	    <li class="page-item active" aria-current="page">
	      <a class="page-link" href="#" style="background-color:#ff6500; border-color:#ff6500;">2</a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#" style="color:#ff6500;">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" style="color:#ff6500;">&gt;</a>
	    </li>
	  </ul>
	</nav> -->
	
</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>