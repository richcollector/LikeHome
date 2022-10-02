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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
       <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<title>판매자 상품 상세페이지</title>
    <style>
    	@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
		body {
			font-family : pretendard;
			color: #404040;
		}
      .menu{
        font-size: large;
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
    
	<div class="container-fluid px-4">
	
	<!-- 뒤로가기 -->
	<div class="row mt-3">
		<div class="col fs-1 ps-0">
			<a href="./vendorProductListPage"><i class="bi bi-arrow-left-square" style="color: #ff6500;"></i></a>
		</div>
	</div>
		<div class="mt-2">
		<span class="fw-bold">상품정보</span>
		</div>
		<!-- 상단 정보 -->
		<div class="row border rounded bg-white py-2 mx-0 mb-3">
			<div class="col">
				<div class="row mb-2 pb-2 border-bottom">
					<span>브랜드 네임</span><br>
					<span class="fw-bold">${dataList }</span>
				</div>
				<div class="row mb-2 pb-2 border-bottom">
					<div class="col">
						<span>상품명</span><br>
						<span class="fw-bold">${data.productVo.product_name }</span>
					</div>
				</div>
		
				<div class="row">
				<span>상품가격</span><br>
				<span class="money col-9 fw-bold">${data.productVo.product_price }원</span>
				</div>
			</div>
		</div>
		
		<!-- 상단 메뉴 -->
		<span class="fw-bold mt-3">타이틀이미지</span>
		<div class="row border rounded bg-white mb-3 py-2 mx-0">
			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
			  <div class="carousel-indicators">
			  	<c:forEach items="${title }" var="title" varStatus="status">
			  		<c:choose>
				  		<c:when test="${status.index == 0}">
	  					   	 <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index }" class="active" aria-current="true" aria-label="Slide ${status.index +1}"></button>
				  		</c:when>
				  		<c:otherwise>
	  					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index }" aria-label="Slide ${status.index +1}"></button>
				  		</c:otherwise>
			  		</c:choose>
		  		</c:forEach>
			  </div>
			  
			  <div class="carousel-inner">
			  	<c:forEach items="${title }" var="title">
			  	<c:set var="i" value="${i+1 }"/>
				  	<c:choose>
					  	<c:when test="${i == 1 }">
						    <div class="carousel-item active">
						      <img src="../../uploadFiles/titleImage/${title.productTitleImageVo.title_image_link }" class="d-block w-100" alt="...">
						    </div>
					    </c:when>
					    <c:otherwise>
	   					    <div class="carousel-item">
						      <img src="../../uploadFiles/titleImage/${title.productTitleImageVo.title_image_link }" class="d-block w-100" alt="...">
						    </div>
					    </c:otherwise>
				    </c:choose>
			    </c:forEach>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</div>
		
		<!-- 디테일이미지 -->
		<span class="fw-bold mt-3">디테일이미지</span>
		<div class="row border rounded bg-white mb-3 py-2 mx-0">
		<c:forEach items="${detail }" var="detail">
		<img style="max-width:auto; max-width:640px; max-height:auto;"  src="../../uploadFiles/detailImage/${detail.productDetailImageVo.detail_image_link }">
		</c:forEach>
		
		</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
    
    
    
    <div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
      <div class="offcanvas-header">
        <h2 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">LIKEHOME</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        
        <button onclick="location.href='../customer/customerLoginPage'" type="button" class="btn btn-primary" >일반회원로그인</button>
        <button onclick="location.href='../vendor/vendorLoginPage'" type="button" class="btn btn-primary" >사업자로그인</button>
        <button onclick="location.href='../admin/adminLoginPage'" type="button" class="btn btn-primary" >관리자로그인</button>
        <button onclick="location.href='../customer/customerRegisterPage'" type="button" class="btn btn-primary">일반회원 회원가입</button>
        <button onclick="location.href='../vendor/vendorRegisterPage'" type="button" class="btn btn-primary">사업자 회원가입</button>

        <br>
        <br>
        <p  class="menu"><a href="">자유게시판</a></p>
        <p class="menu"><a href="">상품관리</a></p>
        <p class="menu"><a href="">주문관리</a></p>
        <p class="menu"><a href="">리뷰관리</a></p>
        <p class="menu"><a href="">문의관리</a></p>
        

        <button type="button" class="btn btn-primary">로그아웃</button>

      </div>
    </div>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 
  </body>
</html>