<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   
    <style type="text/css">
    
    
    body{
    	color:#404040;
		font-family: 'Noto Sans KR', sans-serif;    	
    }
      
	.p-name{
		overflow:hidden;
		text-overflow:ellipsis;
		line-height:1.2em;
		height:2.4em;
		font-size:0.9rem;
	}
	
	.cat-name{
		font-size:small;
		color:gray;
		text-align:center;
	}
    
    .brand-name{
		font-size: 0.8rem;
		color: #757575;
		font-weight: bold;
    }
    
    .extra-info{
    	font-size:0.9rem;
    	color: #757575;
    	align-self: center;
    }
    
    .btn-main{
		background-color:#ff6500 !important;
		color:white !important;
	}
	
	.test{
	  display: flex;
	  justify-content: space-between;
	  background-color: white;
      margin: 0.4rem auto;
	}
	
	.rating{
		font-size:0.8rem;
	}
	
	.bi-star-fill{
		color:#ff6500;
	}
	
	svg{
	 	    vertical-align: baseline;
	 }
	 
	 .offcanvas-body{
	 	    text-align: start;
	 }
	 
	 .filter{
		background-color: white;
   		border: 0.07rem solid #e9ecef;
   		padding-bottom:0.5rem;
   		display: flex;
    	justify-content: space-between;
	}
    </style>
    
    
<script type="text/javascript">


//scroll paging
	var loading = false;
	var pageNum = 1;
	var productCategory2No = ${currentCategory2No};
	var orderBy = 0;
	
	//스크롤 바닥 감지
	window.onscroll = function(e) {
	    if((window.innerHeight + window.scrollY) + 200 >= document.body.offsetHeight) {
	    	//pageNum++;
	        getProductList(productCategory2No, orderBy, pageNum); //파라미터 수정 필요
	    }
	};
		
		
    function getProductList(changedProductCategory2No, changedOrderBy, pageNum){
		console.log(pageNum);
    	orderBy = changedOrderBy;
    	productCategory2No = changedProductCategory2No;
    	
    	var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var dataList = jsonObj.productDataList;
				
				var productList = document.getElementById("productList");
				
				if(pageNum == 1){
			    	productList.innerHTML = "";
				}
			
				if(jsonObj.totalPageCount < pageNum){
					return;
				}
				
				
			    var productCount = document.getElementById("productCount");
			    productCount.innerText = jsonObj.productCount;
			    
			    for(data of dataList){

			      var col1 = document.createElement('article');
			      col1.classList.add('col-6','mb-2');
			      col1.setAttribute("onclick", "location.href='../product/productDetailPage?product_no=" + data.productVo.product_no + "'");

			      productList.appendChild(col1);

			      var row1 = document.createElement('div');
			      row1.classList.add('row' , 'mb-2');

			      var row1col1 = document.createElement('div');
			      row1col1.classList.add('col');
			      var imgbox = document.createElement('img');
			      imgbox.classList.add("img-fluid","rounded");
		          imgbox.setAttribute("src", "../../uploadFiles/titleImage/" + data.productTitleImageVo.title_image_link);
				  row1col1.appendChild(imgbox);

			      var row2 = document.createElement('div');
			      row2.classList.add('row');

			      var row2col1 = document.createElement('div');
			      row2col1.classList.add('col','brand-name');
			      row2col1.innerText = data.vendorVo.vendor_brand_name;

			      var row3 = document.createElement('div');
			      row3.classList.add('row');

			      var row3col1 = document.createElement('div');
			      row3col1.classList.add('col', 'p-name');
			      row3col1.innerText = data.productVo.product_name;
			      
			      var row4 = document.createElement('div');
			      row4.classList.add('row');

			      var row4col1 = document.createElement('div');
			      row4col1.classList.add('col','fw-bold','money');
			      row4col1.innerText = data.productVo.product_price;

			      var row5 = document.createElement('div');
			      row5.classList.add('row');

			      var row5col1 = document.createElement('div');
			      row5col1.classList.add('col', 'rating');
			      
			      var starIcon = document.createElement('i');
			      starIcon.classList.add('bi', 'bi-star-fill');
			      var starRating = document.createElement('span');
			      starRating.innerText = " 4.3";
			      var reviewCnt = document.createElement('span');
			      reviewCnt.classList.add('text-secondary');
			      reviewCnt.innerText = ' 	(2,333)';
			      
			      row5col1.appendChild(starIcon);
			      row5col1.appendChild(starRating);
			      row5col1.appendChild(reviewCnt);
			      

			      row1.appendChild(row1col1);
			      row2.appendChild(row2col1);
			      row3.appendChild(row3col1);
			      row4.appendChild(row4col1);
			      row5.appendChild(row5col1);

			      col1.appendChild(row1);
			      col1.appendChild(row2);
			      col1.appendChild(row3);
			      col1.appendChild(row4);
			      col1.appendChild(row5);

			    }
			    changeMoneyUnit();
				pageNum ++;
			}
		}
		xhr.open("post", "./restProductListPage", false);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("productCategory2No=" + productCategory2No + "&orderBy=" + orderBy + "&pageNum=" + pageNum);
    	
    }
    
    
    //offcanvas category 필터용
	function showCategory2List(category1No){
		
		 var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);
					
					var data = jsonObj.productCategory2List;
					
					var offcanvasUl = document.getElementById("offcanvasUl");
					offcanvasUl.innerHTML = "";
					
					for( e of data){
						var offcanvasLi = document.createElement("li");
						offcanvasLi.classList.add("list-group-item", "list-group-action");
						offcanvasLi.setAttribute("data-bs-toggle", "offcanvas");
						offcanvasLi.setAttribute("aria-controls", "offcanvasBottom");
						offcanvasLi.setAttribute("onclick", "getProductList(" + e.product_category2_no + ", orderBy, pageNum)");
						offcanvasLi.innerText = e.product_category2_name;
						offcanvasUl.appendChild(offcanvasLi);
						
						
					}
				}
			}
			xhr.open("get", "./restShowProductCategory2ListProcess?category1No=" + category1No);
			xhr.send();
	 }
	
	
  
    window.addEventListener("DOMContentLoaded", function (){
    	getProductList(productCategory2No, orderBy, pageNum);
    	changeMoneyUnit();
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
    
     <jsp:include page="../common/header.jsp"></jsp:include>
     		
     <div class="row bg-white">
       <div id="catDescription" class="col extra-info pt-0 pb-2">
       		<span>${categoryLayer.PRODUCT_CATEGORY1_NAME }</span>
        	<span><svg class="icon" width="10" height="10" viewBox="0 0 8 8" fill="currentColor"><path d="M4.95 4L2.12 1.19l.7-.71 3.54 3.54-3.53 3.53-.7-.7z"></path></svg></span>
        	<span>${categoryLayer.PRODUCT_CATEGORY2_NAME }</span>
       </div>
     </div>
      

	<section class="row">
		<img class="img-fluid px-0" src="../resources/img/28273827.png">
	</section>      
	
	
     <section class="row bg-white mb-1"><!--전체몇개, 정렬, 필터(offcanvas botton) -->
       <div class="col">
         <div class="row my-2">
           <div class="col-4 extra-info">
           	<span>총 </span><span id="productCount">${productCount }</span><span>개</span>
           </div>
           <div class="col-2"></div>
           <div class="col">
           <div  data-bs-toggle="offcanvas" data-bs-target="#orderBy" aria-controls="offcanvasBottom">판매순 <svg class="icon" width="8" height="8" viewBox="0 0 8 8" preserveAspectRatio="xMidYMid meet"><path fill="#BDBDBD" d="M0 2l4 4 4-4z"></path></svg></div>
           
           
			<!-- 정렬옵션출력 -->
             <div class="offcanvas offcanvas-bottom" tabindex="-1" id="orderBy">
               <div class="offcanvas-header fw-bold">정렬</div>
               <div class="offcanvas-body">
                 <ul class="list-group list-group-flush">
                   <li class="list-group-item list-group-item-action" value="0" onclick="getProductList(${currentCategory2No},0,1)" data-bs-toggle="offcanvas" aria-controls="offcanvasBottom">판매순</li>
                   <li class="list-group-item list-group-item-action" value="1" onclick="getProductList(${currentCategory2No},1,1)" data-bs-toggle="offcanvas" aria-controls="offcanvasBottom">높은가격순</li>
                   <li class="list-group-item list-group-item-action" value="2" onclick="getProductList(${currentCategory2No},2,1)" data-bs-toggle="offcanvas" aria-controls="offcanvasBottom">낮은가격순</li>
                   <li class="list-group-item list-group-item-action" value="3">리뷰순</li>
                 </ul>
               </div>
             </div>
           </div>
           <div class="col-3 text-end"><!-- 카테고리 필터 -->
             <button class="btn btn-main py-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#cat1" aria-controls="offcanvasBottom">필터</button>
		<!--카테고리1 출력  -->
             <div class="offcanvas offcanvas-bottom" style="height:auto" tabindex="-1" id="cat1">
               <div class="offcanvas-header fw-bold">필터</div>
               <div class="offcanvas-body">
                 <ul class="list-group list-group-flush">
                 	<c:forEach items="${productCategory1List }" var="cat1">
                    <li class="list-group-item list-group-item-action" onclick="showCategory2List(${cat1.product_category1_no})" data-bs-toggle="offcanvas"  data-bs-target="#cat2" aria-controls="offcanvasBottom">
                    ${cat1.product_category1_name}</li>
                 	</c:forEach>
                 </ul>
               </div>
             </div>
             <!-- 카테고리2 출력 -->	
             <div class="offcanvas offcanvas-bottom" style="height:auto" tabindex="-1" id="cat2">
               <div class="offcanvas-header">
               </div>
               <div class="offcanvas-body">
                 <ul class="list-group list-group-flush" id="offcanvasUl"></ul>
               </div>
             </div>
           </div>
         </div>
       </div>
     </section>
      
      <div class="row bg-white  py-2"><!--상품리스트-->
        <div class="col">
          <div id="productList" class="row py-3 row-cols-2 g-2"></div>
        </div>
      </div>
      

		<div class="d-flex justify-content-center">
		  <div class="spinner-border" role="status">
		  </div>
		</div>
		<br>


    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  </body>
</html>