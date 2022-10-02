<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">

<title>Insert title here</title>

</head>
<body>
	
	<div class="container-fluid px-4 my-2">
		<h4 style="text-align: center; padding-top: 1.2em;">쿠폰 리스트</h4><br>
		
		<c:if test="${!empty adminInfo}">
	<a href="./writeCouponPage"><button type="button" 
        class="btn btn-outline" style="color: #ff6500; font-size: 0.8em;" disabled> 쿠폰 생성</button></a>
	</c:if>	

	<hr>
	<c:forEach items="${couponList }" var="data">
   <div class="card my-4" style="text-align: left;">
   <div class="card-body">
   	<h4 class="card-title" style="color:white; font-weight: bold; font-size: 1em; color: #ff6500; margin-top: 0.5em;">${data.coupon_name }</h4>
   	<div class="row">
      <div class="col">
     <p class="card-subtitle" style="font-size: 2em;">${data.coupon_amount }원</p>
    <span class="card-text" style="font-size: 0.8em;"><fmt:formatDate value="${data.coupon_start_date}" pattern="yyyy-MM-dd"/> ~</span>
    <span class="card-text" style="font-size: 0.8em;"><fmt:formatDate value="${data.coupon_end_date }" pattern="yyyy-MM-dd"/></span>
    </div>
		<div class="col" style="margin-bottom: 1em;">
	<a href="./deleteCouponProcess?coupon_no=${data.coupon_no }">
	<button type="button" class="btn btn-outline-danger" style="font-size: 0.7em; float: right;">삭제</button></a>
  			</div>
  		</div>
  		</div>
	</div>
</c:forEach>
</div>

	
	

	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>