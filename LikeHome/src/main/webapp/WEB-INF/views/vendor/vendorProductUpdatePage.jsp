<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid px-3">
	
	<!-- 뒤로가기 -->
	<div class="row mb-4">
		<div class="col fs-1">
			<a href="./vendorProductListPage"><i class="bi bi-arrow-left-square" style="color: cornfloewrblue;"></i></a>
		</div>
	</div>
	
	<form action="./updateProductProcess" method="post" enctype="multipart/form-data">
	
	<div class="mb-3">
		<span class="fw-bold">브랜드 : ${vendorInfo.vendor_brand_name }</span><br>
		<input name="vendor_no" value="${vendorInfo.vendor_no }" type="hidden">
	</div>
		
	<div class="input-group flex-nowrap mb-3">
 		<span class="input-group-text" id="addon-wrapping">상품명</span>
  		<input name="product_name" type="text" class="form-control" placeholder="상품이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
	</div>
	
	<div class="input-group flex-nowrap mb-3">
 		<span class="input-group-text" id="addon-wrapping">판매가</span>
  		<input name="product_price" type="text" class="form-control" placeholder="상품이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
	</div>
	
	<div class="input-group flex-nowrap mb-3">
 		<span class="input-group-text" id="addon-wrapping">재고수량</span>
  		<input name="product_quantity_onhand" type="text" class="form-control" placeholder="상품이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
	</div>
	
	<div class="input-group flex-nowrap mb-3">
 		<span class="input-group-text" id="addon-wrapping">배송비용</span>
  		<input name="product_delivery_fee" type="text" class="form-control" placeholder="상품이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
	</div>
	
	<input name="product_no" value="${data.productVo.product_no }" type="hidden">
	
	<button class="btn btn-primary" type="submit">상품수정하기</button>
	
	</form>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
		
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 

</body>
</html>