<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <h4 style="text-align: center; padding-top: 1.2em;">배송지 관리 </h4><br>
        <a href="./writeAddressPage"><button type="button" 
        class="btn btn-outline" style="color: #feafa2; font-size: 0.7em;" disabled> 배송지 등록</button></a>
     <c:forEach items="${data }" var="data">
     <div class="card my-4 border-top"  style="width: 18rem; background-color: #feafa2">
   <div class="card-body">
     <h5 class="card-title" style="color: white;">${data.address_name }</h5>
     <h6 class="card-subtitle mb-2 text-muted" style="font-size: 0.8em; ">${data.address_default }</h6>
     <span class="card-text" style="color: white;">${data.address_postcode }</span><br>
     <span class="card-text" style="color: white;">${data.address_detail1 }</span>
     <span class="card-text" style="color: white;">${data.address_detail2 }</span>
     <p style="color: white;">${data.address_phone }</p>
 
 <c:if test="${!empty customerInfo && customerInfo.customer_no == data.customer_no }">
     <a href="./updateAddressPage?address_no=${data.address_no }"><button type="button" 
        class="btn btn-outline-primary" style="font-size: 0.7em; float: right;">수정</button></a>
     <a href="./deleteContentProcess?address_no=${data.address_no }"><button type="button" 
        class="btn btn-outline-danger" style="font-size: 0.7em; float: left;">삭제</button></a>
 </c:if>
   </div>
 </div>
 
 </c:forEach>
 
 </div>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>														
</body>
</html>