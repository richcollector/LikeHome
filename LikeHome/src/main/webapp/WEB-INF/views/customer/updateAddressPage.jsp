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

<h1>주소 수정</h1>


<form action="../address/updateContentProcess" method="post">
 	<div class="col-md-6">
    	<label class="form-label">고객 이름</label>
    	<input name="address_name" type="text" value="${data.AddressVo.address_name }" class="form-control">
  	</div>
  	<div class="col-md-6">
    	<label class="form-label">전화번호</label>
    	<input name="address_phone" type="text" value="${data.AddressVo.address_phone }" class="form-control">
  	</div>
   	<div class="col-md-2">
   	 <label class="form-label">우편번호</label>
    	<input name="address_postcode" type="text" value="${data.AddressVo.address_postcode }" class="form-control">
  	</div>
  	<div class="col-12">
   	 <label class="form-label">주소</label>
    	<input name="address_detail1" type="text" value="${data.AdressVo.address_detail1 }" class="form-control" id="inputAddress" placeholder="1234 Main St">
  	</div>
  	<div class="col-12">
    	<label class="form-label">상세주소</label>
    	<input name="address_detail2" type="text" value="${data.AddressVo.address_detail2 }" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
    	
  	</div>
  	<input type="hidden" name="address_no" value="${data.AddressVo.address_no }"> 
  	<div class="col-12">
   	 <button type="submit" class="btn btn-primary">수정완료</button>
  	</div>
	</form>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>