<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />

<title>Insert title here</title>


<style type="text/css">
	@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");

	body {
		font-family: Pretendard;
		color:#404040;
		}  

	.btn-main{
		background-color:#ff6500;
		color:white;
	}
	
	.btn-sub{
	 	background-color:white;
	 	color:#ff6500;
	 	font-size:0.9rem;
	 	border-color:#ff6500;
	 	}
	 	
	 .v-name{
		color: #757575;
	    font-size: 0.9rem;
	    font-weight: 600;
	 }
	 
	 .p-price{
		font-size: 1rem;
	    font-weight: 700;
	 }
	 
	 .p-name{
	 	font-size:1rem;
	 }
	 
	 .starIcon{
	 	color: #ff6500;
	 	font-size: 0.8rem;
	 }
	 
	 .rating{
	    font-size: 0.8rem;
    	font-weight: 500;
	 }
	 
	 .infoBox{
	 	align-self: center;
	 }
	 
	 .badge{
	 	color: #757575;
    	background-color: #e9ecef;
    	font-weight: 600;
	 }
</style>

<script type="text/javascript">

function showBestSellingProductList(){
	
	var target = document.getElementById("selling");
	target.style.color = "white";
	target.style.backgroundColor = "#ff6500"; 
	
	var untarget = document.getElementById("scrapped");
	untarget.style.color = '#ff6500';
	untarget.style.backgroundColor = "white";
	untarget.style.borderColor = "#ff6500";
	
	var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var productList = document.getElementById("productList");
				productList.innerHTML = "";

				var dataList = jsonObj.productDataList;

				for(data of dataList){
					
				  var row1 = document.createElement('div');
				  row1.classList.add('row', 'g-2', 'my-2');
				  row1.setAttribute('onclick', "location.href='../product/productDetailPage?product_no=" + data.productVo.product_no + "'");

				  productList.appendChild(row1);

				  var col1 = document.createElement('div');
				  col1.classList.add('col-6');
				  col1.setAttribute("style", "position:relative");

				  var col1img = document.createElement('img');
				  col1img.classList.add("img-fluid","rounded");
				  col1img.setAttribute('src','../../uploadFiles/titleImage/' + data.productTitleImageVo.title_image_link);

				  
				  var scrapIcon = document.createElement("i");
		             scrapIcon.classList.add("text-opacity-50");
		             scrapIcon.classList.add("bi");
		             if(data.postScrapVo != null){
		                scrapIcon.setAttribute("style","color:#ff6500;position: absolute; bottom: 0%; right: 3%; font-size: 1.6rem;")
		             }else{
		                scrapIcon.classList.add("text-white");
		                scrapIcon.setAttribute("style","position: absolute; bottom: 0%; right: 3%; font-size: 1.6rem;")
		             }
		             scrapIcon.classList.add("bi-bookmark-fill");
		             scrapIcon.setAttribute("onclick","doScrap("+data.post_no+",this)")
		             col1.appendChild(scrapIcon);
		             
		             
				  var col2 = document.createElement('div');
				  col2.classList.add('col', 'infoBox');

				  var vendor = document.createElement('div');
				  vendor.classList.add('v-name');
				  vendor.innerText = data.vendorVo.vendor_brand_name;

				  var product = document.createElement('div');
				  product.classList.add('p-name');
				  product.innerText = data.productVo.product_name;

				  var price = document.createElement('div');
				  price.classList.add('money','p-price');
				  price.innerText = data.productVo.product_price;

				  var star = document.createElement('div');
				  var starIcon = document.createElement('i');
				  starIcon.classList.add('bi-star-fill','starIcon');
				  var starRating = document.createElement('span');
				  starRating.classList.add('rating');
				  starRating.innerText = ' 4.7';

				  col1.appendChild(col1img);
				  col2.appendChild(vendor);
				  col2.appendChild(product);
				  col2.appendChild(price);
				  col2.appendChild(star);
				  
				  
				  if(data.productVo.product_delivery_fee == 0){
					  var badge = document.createElement('span');
					  badge.classList.add('badge');
					  badge.innerText = '무료배송';
					  col2.appendChild(badge);
				  }

				  star.appendChild(starIcon);
				  star.appendChild(starRating);

				  

				  row1.appendChild(col1);
				  row1.appendChild(col2);

    			  changeMoneyUnit();

				}
				
			}
		}
		xhr.open("get", "./restProductListPage");
		xhr.send();
}



	function showBestScrappedProductList(){
		
		var target = document.getElementById("scrapped");
		target.style.color = "white";
		target.style.backgroundColor = "#ff6500"; 
		
		var untarget = document.getElementById("selling");
		untarget.style.color = '#ff6500';
		untarget.style.backgroundColor = "white";
		untarget.style.borderColor = "#ff6500";
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var productList = document.getElementById("productList");
				productList.innerHTML = "";
				
				var dataList = jsonObj.productDataList;

				for(data of dataList){
					
				  var row1 = document.createElement('div');
				  row1.classList.add('row', 'g-2', 'my-2');
				  row1.setAttribute('onclick', "location.href='../product/productDetailPage?product_no=" + data.PRODUCT_NO + "'");

				  productList.appendChild(row1);

				  var col1 = document.createElement('div');
				  col1.classList.add('col-6');
				  col1.setAttribute("style", "position:relative");


				  var col1img = document.createElement('img');
				  col1img.classList.add("img-fluid","rounded");
				  col1img.setAttribute('src','../../uploadFiles/titleImage/' + data.TITLE_IMAGE_LINK);

				  
				  var scrapIcon = document.createElement("i");
		             scrapIcon.classList.add("text-opacity-50");
		             scrapIcon.classList.add("bi");
		             if(data.postScrapVo != null){
		                scrapIcon.setAttribute("style","color:#ff6500;position: absolute; bottom: 0%; right: 3%; font-size: 1.6rem;")
		             }else{
		                scrapIcon.classList.add("text-white");
		                scrapIcon.setAttribute("style","position: absolute; bottom: 0%; right: 3%; font-size: 1.6rem;")
		             }
		             scrapIcon.classList.add("bi-bookmark-fill");
		             scrapIcon.setAttribute("onclick","doScrap("+data.post_no+",this)")
		             col1.appendChild(scrapIcon);
		             
		             
				  var col2 = document.createElement('div');
				  col2.classList.add('col', 'infoBox');

				  var vendor = document.createElement('div');
				  vendor.classList.add('v-name');
				  vendor.innerText = data.VENDOR_BRAND_NAME;

				  var product = document.createElement('div');
				  product.classList.add('p-name');
				  product.innerText = data.PRODUCT_NAME;

				  var price = document.createElement('div');
				  price.classList.add('money','p-price');
				  price.innerText = data.PRODUCT_PRICE;

				  var star = document.createElement('div');
				  var starIcon = document.createElement('i');
				  starIcon.classList.add('bi-star-fill','starIcon');
				  var starRating = document.createElement('span');
				  starRating.classList.add('rating');
				  starRating.innerText = ' 4.7';
				  
				  col1.appendChild(col1img);
				  col2.appendChild(vendor);
				  col2.appendChild(product);
				  col2.appendChild(price);
				  col2.appendChild(star);

				  if(data.PRODUCT_DELIVERY_FEE == 0){
					  var badge = document.createElement('span');
					  badge.classList.add('badge');
					  badge.innerText = '무료배송';
					  col2.appendChild(badge);
				  }

				  star.appendChild(starIcon);
				  star.appendChild(starRating);


				  row1.appendChild(col1);
				  row1.appendChild(col2);

    			  changeMoneyUnit();
				}
			}
		}
		xhr.open("get", "./restBestScrappedProductPage");
		xhr.send();
	}


window.addEventListener("DOMContentLoaded", function (){
	showBestSellingProductList();
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
<body>
<div class="container-fluid">
	
    <jsp:include page="../common/header.jsp"></jsp:include>	

	<div class="row">
		<div class="col d-grid">
		<div class="btn-group" role="group" aria-label="Basic outlined example">
		  <button id="selling"type="button" class="btn btn-sub" onclick="showBestSellingProductList()">판매 베스트</button>
		  <button id="scrapped" type="button" class="btn btn-sub" onclick="showBestScrappedProductList()">스크랩 베스트</button>
		</div>
		</div>
	</div>	
	<div class="row pb-4">
		<div class="col" id="productList">
		<!-- 상품리스트 렌더링 -->
		</div>
	</div>
	
	
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>	
	
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</body>
</html>