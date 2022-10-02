<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />

<style type="text/css">
    @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");

	body {
		font-family: Pretendard;
		color:#424242;
		}
	
	
	.f-small{
		font-size : small;
	}
	
	.btn-main{
		background-color:#ff6500;
		color:white;
	}
	
	.cat-name{
		font-size:small;
		color:gray;
		text-align:center;
		}
		
	.cat1{
		background-color: white;
   		border: 0.05rem solid #e9ecef;
   		padding-bottom:0.5rem;
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
   
	.ad{
		position:relative;
	}
	
	.rating{
		font-size:0.8rem;
	}
	
	.bi-star-fill{
		color:#ff6500;
	}
	
    .btn-over{
      position: absolute;
      top: 50%;
      left: 50%;
      width:auto;
    }
    
    .filter{
		background-color: white;
   		border: 0.07rem solid #e9ecef;
   		padding-bottom:0.5rem;
   		display: flex;
    	justify-content: space-between;
	}
	
	.title{
		font-size: 1.1rem;
	    font-weight: 600;
	}
	
	
	.bestbrand{
		position: absolute;
	    top: 50%;
	    text-align: center;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    color:white;
	    font-weight: 600;
	    font-size:1.1rem;
	    
	}
	
	
	.offcanvas-header{
		color: #ff6500;
	    padding-left: 2rem;
	    font-size: 1.2rem;
	    padding-bottom: 0rem;
	}
	
</style>
    
    
<script type="text/javascript">
    
	
	//done
	function showCategory2List(category1No){
		
		
		 var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);
					
					var data = jsonObj.productCategory2List;
					
					var cat2Box = document.getElementById("cat2");
					cat2Box.innerHTML = "";
					
					for(e of data){

						var cat2col = document.createElement('div');
						cat2col.classList.add("col-3", 'my-0');
						cat2Box.appendChild(cat2col);
						cat2col.setAttribute('onclick', "location.href='../product/productListPage?productCategory2No=" + e.product_category2_no + "'"); //해당되는 상품리스트 페이지로 이동

						var cat2img = document.createElement('img');
						cat2img.classList.add('img-fluid', 'p-2');
						cat2img.setAttribute('src','../resources/categoryImage/category2/' + e.product_category1_no + e.product_category2_no + '.png');

						var cat2name = document.createElement('div');
						cat2name.classList.add('cat-name');
						cat2name.innerText = e.product_category2_name;
						
						cat2col.appendChild(cat2img);
						cat2col.appendChild(cat2name);
					}
					
					showCategory1Product(category1No);
				}
			}
			xhr.open("get", "./restShowProductCategory2ListProcess?category1No=" + category1No);
			xhr.send();
	 }

	function showCategory1Product(category1No){
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var dataList = jsonObj.productDataList;
				
				var productList = document.getElementById("productList");
				productList.innerHTML = '';
				
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
			}
		}
		xhr.open("get", "./restShowCategory1ProductProcess?category1No=" + category1No);
		xhr.send();
	}
	
    window.addEventListener("DOMContentLoaded", function (){
		//처음 실행되는 코드 모음
		showCategory2List(1);
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

    
    <section class="row px-0">
    	<img class="img-fluid px-0" src="../resources/img/today_deal_banner_220620.gif">
    </section>
     
    
     
     
    <section class="row row-cols-3"><!-- 카테고리1 선택 -->
      <c:forEach items="${productCategory1List }" var="cat1">
	      <div class="col cat1" onclick="showCategory2List(${cat1.product_category1_no})">
	        <img class="img-fluid px-4 py-1" src="../resources/categoryImage/category1/${cat1.product_category1_no }.png">
	        <div class="cat-name">${cat1.product_category1_name }</div>
	      </div>
      </c:forEach>
    </section>
    <section id="cat2" class="row bg-white py-3"></section><!-- 카테고리2선택 ajax -->
      
     <div class="row">
     	<div class="col px-0 my-2">
     		<img class="img-fluid"alt="" src="../resources/img/165847092969443242.jpeg">
     	</div>
     </div>
     
     <section class="row bg-white mb-2 pb-3 ">
     	<div class="col">
     		<div class="row">
     			<div class="col my-3 title">라이크홈 베스트 브랜드</div>
     		</div>
     		<div class="row row-cols-3 g-2">
     			<div class="col" style="position:relative">
	     			<img class="img-fluid" style="filter:brightness(80%);" src="../resources/img/vendorImage1.jpg">
	     			<div class="bestbrand">삼익가구</div>	
     			</div>
     			<div class="col" style="position:relative">
     			<img class="img-fluid" style="filter:brightness(80%);" src="../resources/img/vendorImage2.webp">		
	     			<div class="bestbrand">마켓비</div>	
     			</div>
     			<div class="col" style="position:relative">
     			<img class="img-fluid" style="filter:brightness(80%);" src="../resources/img/vendorImage3.jpg">		
	     			<div class="bestbrand">알파</div>	
     			</div>
     		</div>
     	</div>
     </section>
     
     
      <section class="row py-2 bg-white">
      	<div id="cat1Name"class="col text-secondary">가구</div>
      </section>
     
    <section class="row bg-white"><!--전체몇개, 정렬, 필터(offcanvas botton) -->
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
               <div class="offcanvas-header" style="color: #ff6500;padding-left: 2rem;">정렬</div>
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
           <div class="col-3"><!-- 카테고리 필터 -->
             <button class="btn btn-main py-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#cat1" aria-controls="offcanvasBottom">필터</button>
		<!--카테고리1 출력  -->
             <div class="offcanvas offcanvas-bottom" style="height:auto" tabindex="-1" id="cat1">
               <div class="offcanvas-header">필터</div>
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
      
	
	
    <section class="row bg-white py-2"><!--상품리스트-->
        <div class="col">
          <div id="productList" class="row py-3 row-cols-2 g-2"></div>
        </div>
    </section>
    
    
    
    <jsp:include page="../common/footer.jsp"></jsp:include>		
     


    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

  </body>
</html>