<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
	<title>전체 상품 리스트</title>
	<style>
		@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
		body {
			font-family : pretendard;
			color: #404040;
		}
	    .menu{
	      font-size: large;
	    }
       	a{
      	 text-decoration-line: none;
      	 color: #404040;
      	}
	</style>
	
	<script type="text/javascript">
	
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

  </head>
  <body class="bg-light">
	<div class="container-fluid px-3">
	
	<!-- 뒤로가기 -->
	<div class="row mt-3">
		<div class="col fs-1">
			<a href="./adminMainPage"><i class="bi bi-arrow-left-square" style="color: #ff6500;"></i></a>
		</div>
	</div>
	
	<!-- 검색 -->
	<div class="row pe-2 my-3">
		<div class="col">
			<form action="./adminTotalProductListPage" method="get">
				<div class="row">
				<div class="col pe-0">
					<select name="searchType" class="form-control">
						<option value="product_name">상품명</option>
					</select>
				</div>
				<div class="col-6 px-0 mx-0">
					<input name="searchWord" type="text" class="form-control">
				</div>
				<div class="col d-grid px-0 mx-0">
					<button class="btn btn" style="background-color: #ff6500; color: white;">검색</button>
				</div>
			</div>
			</form>
		</div>
	</div>
		
		<c:forEach items="${productCatagotyList }" var="data">
		<div class = "row border rounded bg-white my-3 py-2 mx-0">
			<div class="col">
				<div class = "row">
					<div class = "col">
						${data.category2Name }
					</div>
					<div class = "col text-end">
						<a style="color: red;" href="./deleteProductProcess?product_no=${data.productVo.product_no }">삭제</a>
					</div>
				</div>
				<div class = "row">
					<div class = "col">
					<span class="fs-5 fw-bold">${data.productVo.product_name }</span>
					</div> 
				</div>
				<div class = "row">
					<div class = "money col">
						${data.productVo.product_price }원
					</div>
				</div>
				<div class = "row">
					<div class="col">
					<span class = "pe-0">
						${data.productVo.product_quantity_onhand }개  &nbsp;| 
					</span>
					<span class = "money ps-0">${data.productVo.product_delivery_fee }원</span>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		
		<!-- 페이지 -->
		<div class="row">
			<div class="col">
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				  	<c:choose>
				  		<c:when test="${startPage <=1 }">
   				    		<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
				  		</c:when>
				  		<c:otherwise>
   				    		<li class="page-item"><a class="page-link" href="./adminTotalProductListPage?pageNum=${startPage - 1 }${additionalParam}">&lt;</a></li>
				  		</c:otherwise>
				  	</c:choose>
				  	
				  	<c:forEach begin="${startPage }" end="${endPage }" var="i">
				  		<c:choose>
				  			<c:when test="${i == currentPageNum }">
  							    <li class="page-item active"><a class="page-link" href="./adminTotalProductListPage?pageNum=${i }${additionalParam}">${i }</a></li>
				  			</c:when>
				  			<c:otherwise>
  							    <li class="page-item"><a class="page-link" href="./adminTotalProductListPage?pageNum=${i }${additionalParam}">${i }</a></li>
				  			</c:otherwise>
				  		</c:choose>
				  	</c:forEach>
				  	
				  	<c:choose>
				  		<c:when test="${endPage >= totalPageCount }">
  						    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
				  		</c:when>
				  		<c:otherwise>
  						    <li class="page-item"><a class="page-link" href="./adminTotalProductListPage?pageNum=${endPage+1 }${additionalParam}">&gt;</a></li>
				  		</c:otherwise>
				  	</c:choose>
				  </ul>
				</nav>
			</div>
		</div>
		
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>



  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 
  </body>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</html>