<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" as="style" crossorigin
   href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<style type="text/css">
@import
   url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css")
   ;

	body {
	   font-family: Pretendard;
	   color: #404040;
	}
	
	/*네비바*/
	::-webkit-scrollbar {
	   display: none;
	}
	
	#search {
	   font-size: 1.2rem;
	}
	
	#cart {
	   margin-left: 10px;
	   font-size: 1.5rem;
	}
	
	.scroll-container {
	   display: flex;
	   flex-wrap: no-wrap;
	   overflow-x: scroll;
	   overflow-y: hidden;
	}
	
	.menu {
	   margin-left: 20px;
	   flex: 0 0 auto;
	}
	
	.title {
	   font-size: 1.2rem;
	   font-weight: 500;
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
		overflow:hidden;
		text-overflow:ellipsis;
		line-height:1.2em;
		height:1.2em;
		font-size:0.9rem;
		display: inline-block;
		white-space: nowrap;
		width: 150px;
	 }
	 
	 .starIcon{
	 	color: #ff6500;
	 	font-size: 0.8rem;
	 }
	 
	 .rating{
	    font-size: 0.8rem;
    	font-weight: 500;
	 }
}

/*네비바*/
</style>


</head>
<script type="text/javascript">

/* var homeTap = document.getElementById("homeTap");
homeTap.setAttribute("style","color: #ff6500");
 */


window.addEventListener("DOMContentLoaded", function (){
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

<body>
   <div class="container-fluid">
      <jsp:include page="../common/header.jsp"></jsp:include>
      

      <div class="row mt-3">
         <div class="col">
            <div class="row mb-1">
               <div class="col" style="font-size: 1.2rem; font-weight: bold">사진 38</div>
            </div>
            <div class="row row-cols-2 row-cols-md-6 g-2">
                  <div class="col">
                     <div class="card px-0"  style="overflow: hidden; object-fit: cover; height: 11rem; position: relative;">
                        <img style="height: -webkit-fill-available" class="rounded"
                           src="../resources/img/search1.jpg">
                     </div>
                  </div>
                   <div class="col">
                     <div class="card px-0"  style="overflow: hidden; object-fit: cover; height: 11rem; position: relative;">
                        <img style="height: -webkit-fill-available" class="rounded"
                           src="../resources/img/search2.jpg">
                     </div>
                  </div>
                   <div class="col">
                     <div class="card px-0" style="overflow: hidden; object-fit: cover; height: 11rem; position: relative;">
                        <img style="height: -webkit-fill-available" class="rounded"
                           src="../resources/img/search3.jpg">
                     </div>
                  </div>
                   <div class="col">
                     <div class="card px-0" style="overflow: hidden; object-fit: cover; height: 11rem; position: relative;">
                        <img style="height: -webkit-fill-available" class="rounded"
                           src="../resources/img/search4.jpg">
                     </div>
                  </div>
            </div>
            <div class="row mt-2">
               <div class="col d-grid">
                  <button class="btn" type="button" style="background-color: white; color: #ff6500; border-color: #ff6500; font-size: 1.2rem">사진 전체보기</button>
               </div>
            </div>
            
            <div class="row mt-4 mb-1">
               <div class="col" style="font-size: 1.2rem; font-weight: bold">상품<span> 24</span></div>
            </div>
            <div class="row">
		        <div class="col">
		          <div id="productList" class="row py-3 row-cols-2 g-2">
		          <c:forEach items="${resultDataList }" var="DATA" begin="2" end="5" varStatus="x">
			          <article class="col-6" onclick="location.href='../product/productDetailPage?product_no=${DATA.PRODUCT_NO}'">
			         	 <div class="row mb-2">
			          		<div class="col">
			          			<img class="img-fluid rounded" src="../../uploadFiles/titleImage/${DATA.TITLE_IMAGE_LINK }">
			          		</div>
			          	</div>
			          	<div class="row">
			          		<div class="col brand-name">${DATA.VENDOR_BRAND_NAME }</div>
			          	</div>
			          	<div class="row">
			          		<div class="col p-name">${DATA.PRODUCT_NAME }</div>
			          	</div>
			          	<div class="row">
			          		<div class="col fw-bold money">${DATA.PRODUCT_PRICE }</div>
			          	</div>
			          	<div class="row">
			          		<div class="col rating">
			          			<i class="bi bi-star-fill starIcon"></i><span> 4.5</span><span class="text-secondary"> 	(12)</span>
			          		</div>
			          	</div>
			          </article>
		          </c:forEach>
		        </div>
            </div>
            </div>
            <div class="row mt-2">
               <div class="col d-grid">
                  <button class="btn" type="button" style="background-color: white; color: #ff6500; border-color: #ff6500; font-size: 1.2rem">상품 전체보기</button>
               </div>
            </div>
         </div>
      </div>

      <jsp:include page="../common/footer.jsp"></jsp:include>


      <script type="text/javascript"
         src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
   </div>
   <!-- container fluid end -->

</body>
</html>