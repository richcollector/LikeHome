<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<title>관리자 메인</title>
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


  </head>
  <body>

	
  	<div class="container-fluid px-3 mt-3 mb-3">

	  	<div class="row mb-3">
	  		<div class="col-5 fs-1">
				<i class="bi bi-list" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions"></i>
			</div>
		</div>
  	
  		<div class="row mb-5">
	  		<div class="col-8 pe-0">
	  			<span class="fs-3 fw-bold">
			       <c:if test="${!empty adminInfo }">
			        관리자	
			        </c:if> 님, 안녕하세요!
		        </span>
	  		</div>

  		</div>
  		
  		<div class="row mb-4">
  			<div class="col-8">
  				<span class="fs-5 fw-bold">판매자 리스트</span>
  			</div>
  			
  			<div class="col text-end ps-0">
  			<!-- Button trigger modal -->
  			<button type="button" class="btn btn-outline py-0" style="border-color: #ff6500; color: #ff6500;" data-bs-toggle="modal" data-bs-target="#exampleModal1">
  			전체보기
			</button>
  			</div>

  		</div>
  		
  		<div class="row px-3 mb-5">
  		
  		<table class="table text-center">
		  <thead>
		    <tr class="bg-secondary bg-opacity-25">
		      <th scope="col">NO</th>
		      <th scope="col">브랜드명</th>
		      <th scope="col">총 상품 수</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${dataList }" var="data" begin="0" end="4">
			  	<c:set var="i" value="${i+1 }"/>
			   		<tr>
				      <th scope="row">${i }</th>
				      <td>${data.vendorVo.vendor_brand_name }</td>
				      <td>${data.productCount }</td>
				    </tr>
		    </c:forEach>
		  </tbody>
		</table>
  		</div>
  		
  		<div class="row mb-4">
  			<div class="col-8">
  				<span class="fs-5 fw-bold">일반회원 리스트</span>
  			</div>
  			<div class="col text-end ps-0">
  			<!-- Button trigger modal -->
  			<button type="button" class="btn btn-outline py-0" style="border-color: #ff6500; color: #ff6500;" data-bs-toggle="modal" data-bs-target="#exampleModal2">
  			전체보기
			</button>
  			</div>
  		</div>
  		
  		<div class="row px-3">
  		
  		<table class="table text-center">
		  <thead>
		    <tr class="bg-secondary bg-opacity-25">
		      <th scope="col">NO</th>
		      <th scope="col">회원명</th>
		      <th scope="col">구매 상품 수</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${customerVoList }" var="data" begin="0" end="4">
			  	<c:set var="q" value="${q+1 }"/>
			   		<tr>
				      <th scope="row">${q }</th>
				      <td>${data.customerVo.customer_nick }</td>
				      <td>${data.countTotalProduct }</td>
				    </tr>
		    </c:forEach>
		  </tbody>
		</table>
  		</div>
  		
	<jsp:include page="../common/footer.jsp"></jsp:include>
  	</div>
	
	<!-- 판매자 리스트 Modal -->
	<div class="row">
	<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">판매자 리스트</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-end">
	      
		<!-- 검색 -->
		<div class="row pe-2 mb-3">
			<div class="col">
				<form action="./adminMainPage" method="get">
					<div class="row">
					<div class="col pe-0">
						<select name="searchType" class="form-control">
							<option value="vendor_brand_name">브랜드명</option>
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
			
  		<div class="row px-3 mb-5">
  		
  		<table class="table text-center">
		  <thead>
		    <tr class="bg-secondary bg-opacity-25">
		      <th scope="col">NO</th>
		      <th scope="col">브랜드명</th>
		      <th scope="col">총 상품 수</th>
		    </tr>
		  </thead>
		  <tbody>
		  	
		  	<div class="row">
			  	<c:forEach items="${dataList }" var="data">
				  	<c:set var="j" value="${j+1 }"/>
				   		<tr>
					      <th scope="row">${j }</th>
					      <td>${data.vendorVo.vendor_brand_name }</td>
					      <td>${data.productCount }</td>
					    </tr>
			    </c:forEach>
		    </div>
		    
		  </tbody>
		</table>
  		</div>
	        
	      </div>

	    </div>
	  </div>
	</div>		
	</div>
	
	<!-- 이번달 일반회원 리스트 Modal -->
	<div class="row">
	<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">일반회원 리스트</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-end">
	      
	      <!-- 	   	검색 -->
		<div class="row pe-2 mb-3">
			<div class="col">
				<form action="./adminMainPage" method="get">
					<div class="row">
					<div class="col pe-0">
						<select name="searchTypeCustomer" class="form-control">
							<option value="customer_nick">회원명</option>
						</select>
					</div>
					<div class="col-6 px-0 mx-0">
						<input name="searchWordCustomer" type="text" class="form-control">
					</div>
					<div class="col d-grid px-0 mx-0">
						<button class="btn btn" style="background-color: #ff6500; color: white;">검색</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	      
			
  		<div class="row px-3">
  		
  		<table class="table text-center">
		  <thead>
		    <tr class="bg-secondary bg-opacity-25">
		      <th scope="col">NO</th>
		      <th scope="col">회원명</th>
		      <th scope="col">구매 상품 수</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${customerVoList }" var="data">
			  	<c:set var="w" value="${w+1 }"/>
			   		<tr>
				      <th scope="row">${w }</th>
				      <td>${data.customerVo.customer_nick }</td>
				      <td>${data.countTotalProduct }</td>
				    </tr>
		    </c:forEach>
		  </tbody>
		</table>
  		</div>
	        
	      </div>

	    </div>
	  </div>
	</div>		
	</div>
	
	<!-- 메뉴 -->
	<div class="offcanvas offcanvas-start pb-0" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
      <div class="offcanvas-header">
        <h2 style="color: #ff6500;" "class="offcanvas-title" id="offcanvasWithBothOptionsLabel">LIKEHOME</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">

        <div class="accordion mb-5" id="accordionExample">
         <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		    
		      <button class="accordion-button fw-bold" style="background-color: #ff6500; color: white;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		       <c:if test="${!empty adminInfo }">
		        관리자
		        </c:if>
   		       <c:if test="${empty adminInfo }">
		        로그인 해주세요.
		        </c:if>
		      </button>
		      
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		         <c:if test="${!empty adminInfo }">
		     	<a class="menu" href="../admin/adminLogOutProcess">로그아웃</a><br>
		     	</c:if>
		     	<c:if test="${empty adminInfo }">
		     	<a class="menu" href="../admin/adminLoginPage">로그인</a><br>
		     	</c:if>
		      </div>
		    </div>
		  </div>
		</div>
        
        <div class="accordion mb-3" id="accordionExample">
         <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button fw-bold" style="background-color: #ff6500; color: white;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		        판매자 / 회원 관리
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        <a class="menu" href="../admin/adminMainPage">관리자메인페이지</a><br>
		        <a class="menu" href="../admin/adminVendorListPage">판매자 가입 승인</a><br>  			<!-- Button trigger modal -->
	  			<a class="menu py-0" data-bs-toggle="modal" data-bs-target="#exampleModal1">
	  			판매자 리스트
				</a><br>
	  			<a class="menu py-0" data-bs-toggle="modal" data-bs-target="#exampleModal2">
	  			일반회원 리스트
				</a><br>
				<a class="menu" href="../admin/helpQnaBoardPage">문의 내역 관리</a><br> 
		      </div>
		    </div>
		  </div>
		</div>
		
		 <div class="accordion mb-3" id="accordionExample">
         <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button fw-bold" style="background-color: #ff6500; color: white;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		        스토어 관리
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		     	<a class="menu" href="../admin/adminTotalProductListPage">전체 상품관리</a><br>
		        <a class="menu" href="../admin/adminCouponListPage">쿠폰관리</a><br>

		      </div>
		    </div>
		  </div>
		</div>

      </div>
    </div>




    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 
  
  </body>
</html>