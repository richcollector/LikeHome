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
	<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
	<title>판매자 상품등록</title>
	<style>
		@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
		body {
			font-family : pretendard;
			color: #404040;
		}
   		.option{
			font-size: 0.75rem;
		}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
		
		function doSumit() {
			const form = document.getElementById("formID");
			
			const product_category1Input = document.getElementById("product_category1");
			const product_category2Input = document.getElementById("product_category2");
			
			const title_imageInput = document.getElementById("title_image");
			const detailImageInput = document.getElementById("detail_image");
			
			const product_nameInput = document.getElementById("product_name");
			const priceInput = document.getElementById("price");
			const quantityInput = document.getElementById("quantity");
			const deliveryPriceInput = document.getElementById("deliveryPrice");
			
			var checkNameAlertBox = document.getElementById("checkNameAlert");
			checkNameAlertBox.innerHTML = "";

			var checkCategoryAlertBox = document.getElementById("checkCategoryAlert");
			checkCategoryAlertBox.innerHTML = "";

			var checkTitleAlertBox = document.getElementById("checkTitleAlert");
			checkCategoryAlertBox.innerHTML = "";
			
			var checkDetailAlertBox = document.getElementById("checkDetailAlert");
			checkDetailAlertBox.innerHTML = "";
			
			var checkPriceAlertBox = document.getElementById("checkPriceAlert");
			checkPriceAlertBox.innerHTML = "";
			
			var checkQuantityAlertBox = document.getElementById("checkQuantityAlert");
			checkQuantityAlertBox.innerHTML = "";
			
			var checkDeliveryAlertBox = document.getElementById("checkDeliveryAlert");
			checkDeliveryAlertBox.innerHTML = "";
			
			if(product_category1Input.value == 0){
				checkCategoryAlertBox.innerText = "대분류를 넣어주셔야 합니다.";
				checkCategoryAlertBox.classList.add("text-danger");
				deliveryPriceInput.focus();
				return;
			}else{
				checkCategoryAlertBox.innerHTML = "";
			}
			
			if(product_category2Input.value == 0){
				checkCategoryAlertBox.innerHTML = "";
				checkCategoryAlertBox.innerText = "중분류를 넣어주셔야 합니다.";
				checkCategoryAlertBox.classList.add("text-danger");
				product_category2Input.focus();
				return;
			}else{
				checkCategoryAlertBox.innerHTML = "";
			}
			
			if(title_imageInput.value == ""){
				checkTitleAlertBox.innerText = "타이틀 이미지를 넣어주셔야 합니다.";
				checkTitleAlertBox.classList.add("text-danger");
				title_imageInput.focus();
				return;
			}else{
				checkTitleAlertBox.innerHTML = "";
			}
		
			if(detailImageInput.value == ""){
				checkDetailAlertBox.innerText = "디테일 이미지를 넣어주셔야 합니다.";
				checkDetailAlertBox.classList.add("text-danger");
				detailImageInput.focus();
				return;
			}else{
				checkDetailAlertBox.innerHTML = "";
			}
			
			if(product_nameInput.value == ""){
				checkNameAlertBox.innerText = "상품명을 입력해주셔야 합니다.";
				checkNameAlertBox.classList.add("text-danger");
				product_nameInput.focus();
				return;
			}else{
				checkPriceAlertBox.innerHTML = "";
			}
		
			if(priceInput.value == ""){
				checkPriceAlertBox.innerText = "금액을 입력해주셔야 합니다.";
				checkPriceAlertBox.classList.add("text-danger");
				priceInput.focus();
				return;
			}else{
				checkPriceAlertBox.innerHTML = "";
			}
		
			if(quantityInput.value == ""){
				checkQuantityAlertBox.innerText = "재고 수량을 입력해주셔야 합니다.";
				checkQuantityAlertBox.classList.add("text-danger");
				quantityInput.focus();
				return;
			}else{
				checkQuantityAlertBox.innerHTML = "";
			}
			
			if(deliveryPriceInput.value == ""){
				checkDeliveryAlertBox.innerText = "배송비용을 입력해주셔야 합니다.";
				checkDeliveryAlertBox.classList.add("text-danger");
				deliveryPriceInput.focus();
				return;
			}else{
				checkDeliveryAlertBox.innerHTML = "";
			}
			
			form.submit();
		}
		
		var isChecked = false;
		
		function checkProductName(){
			var nameValue = document.getElementById("product_name").value;
			
			var xhr = new XMLHttpRequest();	//AJAX 객체 생성
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var result = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
					//alert(result.data);
					//렌더링... 및 추가 화면 로직...
					var checkNameAlertBox = document.getElementById("checkNameAlert");
					if(result.data == true){
						isChecked = false;
						checkNameAlertBox.innerText = "이미 존재하는 상품명 입니다.";
						checkNameAlertBox.classList.remove("text-success");
						checkNameAlertBox.classList.add("text-danger");
					}else if(nameValue == ""){
						isChecked = false;
						checkNameAlertBox.innerText = "빈 칸은 허용되지 않습니다.";
						checkNameAlertBox.classList.remove("text-danger");
						checkNameAlertBox.classList.add("text-success");
					}else{
						isChecked = true;
						checkNameAlertBox.innerText = "사용 가능한 상품명입니다.";
						checkNameAlertBox.classList.remove("text-danger");
						checkNameAlertBox.classList.add("text-success");
					}
				}
			}
			
			xhr.open("get", "./isExistName?product_name=" + nameValue);	//리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
			xhr.send();	//AJAX로 리퀘스트함...
		}
		
		function doCategory(){
			
			var xhr = new XMLHttpRequest();	//AJAX 객체 생성
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
					var categorySelectBox = document.getElementById("product_category1");
					categorySelectBox.innerHTML ="";
					
					var option0 = document.createElement("option");
					option0.value = "0";
					option0.innerText = "대분류";
					option0.disabled = true;
					option0.selected = true;
					option0.hidden = true;
					categorySelectBox.appendChild(option0);
					
					for(commentData of jsonObj.data){
						
						var optionList = document.createElement("option");
						optionList.classList = "option";
						optionList.value = commentData.productCategory1Vo.product_category1_no;
						optionList.innerText = commentData.productCategory1Vo.product_category1_name;
						categorySelectBox.appendChild(optionList);
						
					}
					
				}
			}
			
			xhr.open("get", "../vendor/categoryProcess");	//리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
			xhr.send();	//AJAX로 리퀘스트함...
		}
		
		function categoryChange(){
			var selectValue = document.getElementById("product_category1");
	
			var categoryValue = selectValue.value;
			console.log(categoryValue);
			
			var xhr = new XMLHttpRequest();	//AJAX 객체 생성
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
					
					var categorySelectBox = document.getElementById("product_category2");
					categorySelectBox.innerHTML ="";
	
					if(categoryValue == null){
						var option0 = document.createElement("option");
						option0.value = "0";
						option0.innerText = "중분류";
						option0.disabled = true;
						option0.selected = true;
						option0.hidden = true;
						categorySelectBox.appendChild(option0);
					}else{
	
						var option0 = document.createElement("option");
							option0.value = "0";
							option0.innerText = "중분류";
							option0.disabled = true;
							option0.selected = true;
							option0.hidden = true;
							categorySelectBox.appendChild(option0);
					
						for(commentData of jsonObj.data){
							
							var optionList = document.createElement("option");
							optionList.classList = "option";
							optionList.value = commentData.productCategory2Vo.product_category2_no;
							optionList.innerText = commentData.productCategory2Vo.product_category2_name;
							categorySelectBox.appendChild(optionList);
							
						}
					}
				}
			}
			
			xhr.open("get", "../vendor/categoryProcess2?product_category1_no=" + categoryValue);	//리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
			xhr.send();	//AJAX로 리퀘스트함...
		}
	
		
		
		window.addEventListener("DOMContentLoaded" , function(){
			doCategory();
			categoryChange();
		});
	
	</script>
	
	</head>
	<body>
		<div class="container-fluid px-3">
		<!-- 뒤로가기 -->
		<div class="row mb-3 mt-3">
			<div class="col fs-1">
				<a href="./vendorMainPage"><i class="bi bi-arrow-left-square" style="color: #ff6500;"></i></a>
			</div>
		</div>
		
		<div class="row mb-4 pb-3 border-bottom">
			<span class="fw-bold fs-3">상품 등록</span>
		</div>
		
		<form id="formID" action="./writeProductProcess" method="post" enctype="multipart/form-data">
			
			<div class="mb-3 mb-4">
				<span class="fw-bold ">브랜드 : ${vendorInfo.vendor_brand_name }</span><br>
				<input name="vendor_no" value="${vendorInfo.vendor_no }" type="hidden">
			</div>
			
			<div class="row my-3">
				<span class="fw-bold">카테고리</span>
			</div>
			
			<div class="row">
				<div class="col-4">
					<select onchange="categoryChange()" id="product_category1" name="product_category1_no"  class="form-control">
					</select>
				</div>

				
				<div class="col-4 ms-3 pe-0">
					<select  id="product_category2" name="product_category2_no" class="form-control">
					</select>
				</div>
			</div>
			<div id="checkCategoryAlert" class="mb-3"></div>
		
		<div class="mb-4">
	  		<label for="formFile" class="form-label fw-bold">타이틀이미지</label>
	  		<input id="title_image" class="form-control" name="product_title_image" multiple accept="image/*" type="file" id="formFile">
		</div>
		<div id="checkTitleAlert" class="mb-3"></div>
		
		<div class="mb-4">
	  		<label for="formFile" class="form-label fw-bold">상세설명이미지</label>
	  		<input id="detail_image" class="form-control" name="product_detail_image" multiple accept="image/*" type="file" id="formFile">
		</div>
		<div id="checkDetailAlert" class="mb-3"></div>
	
		<input name="product_state" value="T" type="hidden">
		
		<div>
	 		<label for="product_name" class="form-label fw-bold">상품명</label>
	  		<input onblur="checkProductName()" id="product_name" name="product_name" type="text" class="form-control" placeholder="상품이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
		</div>
		<div id="checkNameAlert" class="mb-3"></div>
		
		<div>
	 		<label for="price" class="form-label fw-bold">판매가</label>
	  		<input id="price" name="product_price" type="text" class="form-control" placeholder="상품이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
		</div>
		<div id="checkPriceAlert" class="mb-3"></div>
		
		<div>
	 		<label for="quantity" class="form-label fw-bold">재고수량</label>
	  		<input id="quantity" name="product_quantity_onhand" type="text" class="form-control" placeholder="상품이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
		</div>
		<div id="checkQuantityAlert" class="mb-3"></div>
		
		<div>
	 		<label for="deliveryPrice" class="form-label fw-bold">배송비용</label>
	  		<input id="deliveryPrice" name="product_delivery_fee" type="text" class="form-control" placeholder="상품이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
		</div>
		<div id="checkDeliveryAlert" class="mb-3"></div>
		
		
		<div class="d-grid mb-4">
		<input type="button" onclick="doSumit()" class="btn" style="background-color: #ff6500; color: white;" value="상품등록하기">
		</div>
		
		</form>
			
		<jsp:include page="../common/footer.jsp"></jsp:include>
		</div>
		
	    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 
	
	</body>
	</html>