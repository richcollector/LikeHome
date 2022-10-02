<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>장바구니</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />


<style type="text/css">
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");

	
	body {
		font-family: Pretendard;
		color:#404040;
		}
	
	a{
		 text-decoration: none;
		 color: #404040;
	}
	.cart-product{
		background-color: white;
		margin-bottom:0.4rem;
	}
	    
	.cart-summary{
		background-color:white;
		padding: 1rem 0rem;
	}
	
	.btn-order{
		background-color:#ff6500;
		color:white;
	}

	.product-subtotal{
		font-size: 1rem;
		color:#404040;
		font-weight:bold;
		text-align: end;
	}
		
	.product-vendor{
		font-size:0.9rem;
		color:#757575;
		font-weight:bold;
	}
		
	.product-name{
		font-size:1rem;
	}
		
	
    .price-title{
    	font-size:0.9rem;
    	color:#757575;
		align-self: center;
    }
	
	.price-default{
		font-size:0.9rem;
		text-align: end;
	}
	
	#totalAmount{
		color:#ff6500;
		font-size:1.2rem;
		text-align: end;
	}
	
	.form-check-input:checked {
	    background-color: #ff6500;
	    border-color: #ff6500;
	
</style>
<script type="text/javascript">

	//모두선택하면 하위 체크박스도 선택 해제
	function checkAll(checkall)  {
	  const checkboxes = document.getElementsByClassName('cartCheckBox');
	  Array.from(checkboxes).forEach(checkbox => {
	    checkbox.checked = checkall.checked
	    
	  })
	  checkSelect();
	}
	
	//하위체크박스에 따라 모두선택 체크박스 선택 해제, 체크박스에 따라 계산(현재 버그있음)
	function checkSelect()  {
	  const checkboxes = document.getElementsByClassName('cartCheckBox');
	  const checkedboxes = document.querySelectorAll('.cartCheckBox:checked');
	  const checkall = document.querySelector('input[name="checkAll"]');

	  if(checkboxes.length === checkedboxes.length)  {
	    checkall.checked = true;
	  }else {
	    checkall.checked = false;
	  }

	  var productSum = 0;
	  var deliverySum = 0;
	  
	  checkedboxes.forEach(checkedbox => {
		  var productPrice = checkedbox.closest('.cartRow').getElementsByClassName('productPrice')[0].innerText;
		  var deliveryFee = checkedbox.closest('.cartRow').getElementsByClassName('deliveryFee')[0].innerText;
		  
		  productPrice = productPrice.replace(",", "");
		  deliveryFee = deliveryFee.replace(",","");
		  
		  productSum += parseInt(productPrice);
		  deliverySum += parseInt(deliveryFee);
		  
	  })
	  document.getElementById('productSum').innerText = productSum;
	  document.getElementById('deliverySum').innerText = deliverySum;
	  document.getElementById('totalAmount').innerText = (productSum + deliverySum);
	  
	  changeMoneyUnit();
	}
	
	
	 function deleteCartItem(cartNo){
		 
		 var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);
					
					refreshCartList();
					checkSelect();
				}
			}
			xhr.open("post", "./restDeleteCartProcess");
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr.send("cartNo=" + cartNo);
	 }
	 
	
	 function increaseQuantity(cartNo){
		 
		 var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);
					
					refreshCartList();
					checkSelect();
				}
			}
			xhr.open("post", "./restIncreaseQuantityProcess");
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr.send("cartNo=" + cartNo);
	 }
	 
 	function decreaseQuantity(target, cartNo){
		
 		if(target.value == 1){
 			refreshCartList();
 			return;
 		} 
 		
		 var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);
					
					refreshCartList();
					checkSelect();
				}
			}
			xhr.open("post", "./restDecreaseQuantityProcess");
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr.send("cartNo=" + cartNo);
	 }

	 function refreshCartList(){

		 var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);
					
					var cartListBox = document.getElementById("cartList");
					cartListBox.innerHTML ="";
					
					
					for(cartData of jsonObj.cartDataList){
						
			            var cartRow = document.createElement("article")
			            cartRow.classList.add("row","cartRow", "cart-product");
						cartListBox.appendChild(cartRow);
						
			            var checkBoxCol = document.createElement("div")
			            checkBoxCol.classList.add("col-1", "mt-2");
			            

			            var infoCol = document.createElement("div")
			            infoCol.classList.add("col");
			            
			            cartRow.appendChild(checkBoxCol);
			            cartRow.appendChild(infoCol);
									
						var checkBox = document.createElement("input")
			            checkBox.classList.add("form-check-input", "cartCheckBox", "fs-5");
						checkBox.setAttribute("type", "checkbox");
						checkBox.name = "cartNo";
						checkBox.setAttribute("onclick", "checkSelect()");
						checkBox.setAttribute("value", cartData.cartVo.cart_no);
			            checkBoxCol.appendChild(checkBox);
						//checkBox.setAttribute("value", cartData.CART_NO);//TEST
						
			            //infocol(productrow, 수량가row,배송비row, 총결제상품row)
			            
			            //productRow : 이미지col, 상품(브랜드,상품명)col, 엑스박스col
			            var productRow = document.createElement("div");
			            productRow.classList.add("row", "my-3");

			            infoCol.appendChild(productRow);

			            //img col
			            var imgCol = document.createElement("div");
			            imgCol.classList.add("col-3","d-grid");
			            var img = document.createElement("img");
			            img.classList.add("img-fluid", "rounded");
			            img.setAttribute("src", "../../uploadFiles/titleImage/" + cartData.productTitleImageVo.title_image_link);
			            imgCol.appendChild(img);

			            //상품col
			            var productCol = document.createElement("div");
			            productCol.classList.add("col");
						
			            var vendorName = document.createElement("div");
			            vendorName.classList.add("product-vendor");
			            vendorName.innerText = cartData.vendorVo.vendor_brand_name;
			            
			            var productName = document.createElement("div");
			            productName.classList.add("product-name");
			            
			            var productLink =document.createElement('a');
			            productLink.innerText = cartData.productVo.product_name;
			            productLink.setAttribute('href', '../product/productDetailPage?product_no=' + cartData.productVo.product_no);
			            productName.appendChild(productLink);
			            
			            productCol.appendChild(vendorName);
			            productCol.appendChild(productName);
			            
			            var xCol = document.createElement("div");
			            xCol.classList.add("col-2",'text-end');
			            var xBtn = document.createElement("button");
			            xBtn.classList.add("btn-close");
			            xBtn.setAttribute("value", cartData.cartVo.cart_no);
			            xBtn.setAttribute("type", "button");
			            xBtn.setAttribute("onclick","deleteCartItem(this.value)");
			            xCol.appendChild(xBtn);
			            //xBtn.setAttribute("value", cartData.CART_NO);

			            productRow.appendChild(imgCol);
			            productRow.appendChild(productCol);
			            productRow.appendChild(xCol);

			            var amtRow1 = document.createElement("div")
			            amtRow1.classList.add("row", "mb-1");
			            
			            var amtRow1Col1 = document.createElement("div");
			            amtRow1Col1.classList.add("col-5");
			            amtRow1.appendChild(amtRow1Col1);
			            
			            var inputGroup = document.createElement("div");
			            inputGroup.classList.add("input-group", "py-0");

			            var minusBtn = document.createElement("button");
			            minusBtn.classList.add("btn", "btn-outline-secondary", "py-0");
			            minusBtn.setAttribute("onclick", "decreaseQuantity(this," + cartData.cartVo.cart_no + ")");
			            minusBtn.setAttribute("type", "button");
			           	minusBtn.setAttribute("value", cartData.cartVo.cart_product_quantity);
			            minusBtn.innerText = "-";
			           	//minusBtn.setAttribute("value", cartData.CART_PRODUCT_QUANTITY);

			            var inputBox = document.createElement("input");
			            inputBox.classList.add("form-control" ,"py-0", "mx-1", "text-center");
			            inputBox.setAttribute("type", "number");
			            inputBox.setAttribute("name", "cart_product_quantity");
			            inputBox.setAttribute("value", cartData.cartVo.cart_product_quantity);
			            inputBox.setAttribute("min", "1");
			            //inputBox.setAttribute("value", cartData.CART_PRODUCT_QUANTITY);
			            
			            var plusBtn = document.createElement("button");
			            plusBtn.classList.add("btn", "btn-outline-secondary", "py-0")
			            plusBtn.setAttribute("onclick", "increaseQuantity(this.value)");
			            plusBtn.setAttribute("type", "button");
			            plusBtn.setAttribute("value", cartData.cartVo.cart_no);
			            plusBtn.innerText = "+";
			            //plusBtn.setAttribute("value", cartData.CART_NO);

			            var inputHidden = document.createElement("input");
			            inputHidden.setAttribute("type", "hidden");
			            inputHidden.setAttribute("name", "product_no");
			            inputHidden.setAttribute("value", cartData.productVo.product_no);
			            //inputHidden.setAttribute("value", cartData.PRODUCT_NO);

						inputGroup.appendChild(minusBtn);
			            inputGroup.appendChild(inputBox);
			            inputGroup.appendChild(inputHidden);
			            inputGroup.appendChild(plusBtn);

			            amtRow1Col1.appendChild(inputGroup);
			            
			            var amtRow1Col2 = document.createElement("div");
			            amtRow1Col2.classList.add("col", "productPrice",'money','price-default');
			            //amtRow1Col2.innerText = cartData.CART_PRODUCT_QUANTITY * cartData.PRODUCT_PRICE;
			            amtRow1Col2.innerText = cartData.cartVo.cart_product_quantity * cartData.productVo.product_price;
			           	
			            var amtRow2 = document.createElement("div");
			            amtRow2.classList.add("row","mb-1");

			            var amtRow2Col1 = document.createElement("div");
			            amtRow2Col1.classList.add("col","price-title");
			            amtRow2Col1.innerText = '배송비';

			            var amtRow2Col2 = document.createElement("div");
			            amtRow2Col2.classList.add("col", "text-end", "deliveryFee", 'money','price-default');
			            amtRow2Col2.innerText = cartData.productVo.product_delivery_fee;
			            
			            var amtRow3 = document.createElement("div");
			            amtRow3.classList.add("row","mb-1");
			            
			            var amtRow3Col1 = document.createElement("div");
			            amtRow3Col1.classList.add("col" ,"price-title");
			            amtRow3Col1.innerText = "상품결제금액";
			            
			            var amtRow3Col2 = document.createElement("div");
			            amtRow3Col2.classList.add("col", 'product-subtotal', 'money');
			            amtRow3Col2.innerText = cartData.productVo.product_delivery_fee + parseInt(amtRow1Col2.innerText);
			            
			            amtRow1.appendChild(amtRow1Col1);
			            amtRow1.appendChild(amtRow1Col2);
			            amtRow2.appendChild(amtRow2Col1);
			            amtRow2.appendChild(amtRow2Col2);
			            amtRow3.appendChild(amtRow3Col1);
			            amtRow3.appendChild(amtRow3Col2);

			            infoCol.appendChild(amtRow1);
			            infoCol.appendChild(amtRow2);
			            infoCol.appendChild(amtRow3);

			            

			            cartListBox.appendChild(cartRow);
			            
					}

					changeMoneyUnit();
	
				}
			}
			xhr.open("get", "./restCartPage");
			xhr.send();
	 }
	 
	 
	 

	window.addEventListener("DOMContentLoaded", function (){
		//처음 실행되는 코드 모음
		
		refreshCartList();
		//checkSelect();
	});
	
	// 원 표시 자동변환 script
    function changeMoneyUnit() {
        var moneyValue = document.querySelectorAll(".money");
        const moneyUnit = "원"
        var regex = /[^0-9]/g;
        for(i of moneyValue){
            result = i.innerText.toString().replace(regex,"").replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            result = result.concat(moneyUnit);
            i.innerText = result;
        };
    };

 

	
</script>



</head>

<body class="bg-light">

<div class="container-fluid">

       <jsp:include page="../common/header2.jsp"></jsp:include>


	<div class="row bg-white mb-2 sticky-top"><!--모두선택-->
		<div class="col-1">
			<input class="form-check-input fs-5 my-1" type="checkbox" name="checkAll" onclick="checkAll(this)">
		</div>
		<div class="col" style="align-self: center;">전체 선택</div>
	</div>

	<form name="checkOutFrm" action="./orderPage" method="post">
		<section class="row">
			<div class="col" id="cartList"></div><!-- 카트(렌더링부분) -->
		</section>
		<section class="row cart-summary"><!-- 결제예상정보 -->
			<div class="col">
				<div class="row mb-1">
					<div class="col price-title">총 상품금액</div>
					<div id="productSum" class="col price-default money">0원</div>
				</div>
				<div class="row mb-1">
					<div class="col price-title">총 배송비</div>
					<div id="deliverySum" class="col price-default money">0원</div>
				</div>
				<div class="row fw-bold">
					<div class="col fs-5">총 결제금액</div>
					<div id="totalAmount" class="col money" style="color:#ff6500">0원</div>
				</div>
			</div>
		</section>
		
		<div class="row bg-white py-2 sticky-bottom"><!-- 결제버튼 -->
			<div class="col d-grid"><button class="btn btn-order">바로구매</button></div>
		</div>
	</form>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>		
	

	
</div><!-- container fluid end -->	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>