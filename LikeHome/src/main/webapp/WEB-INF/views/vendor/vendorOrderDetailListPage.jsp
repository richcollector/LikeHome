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
	<title>판매자 오더상세페이지</title>
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

	<div class="container-fluid px-3">
	
	<!-- 뒤로가기 -->
	<div class="row mt-3">
		<div class="col fs-1">
			<a href="./vendorOrderListPage"><i class="bi bi-arrow-left-square" style="color: #ff6500;"></i></a>
		</div>
	</div>
	
		<c:forEach items="${dataList }" var="data">
		<div class="row my-2">
			<div class="col-4 mx-0 pe-0">
			<span class="fw-bold"><fmt:formatDate value="${data.orderVo.order_date }" pattern="yy.MM.dd"/>(주문)</span>
			</div>
			<div class="col text-end mx-0">
			<span class="fw-bold">주문번호 : ${data.orderVo.order_code }</span>
			</div>
		</div>
		</c:forEach>

		<!-- 상단 박스 -->
		<c:forEach items="${dataList }" var="data">
		<div class = "row border rounded bg-white my-2 py-2 mx-0">
			<div class="col">
				<div class = "row">
					<div class = "col">
					<span class = "fw-bold">결제 정보</span>
					</div> 
				</div>
				<div class = "row">
					<div class = "col">
					<span>상품가격</span>
					</div>
					<div class = "money col text-end">
					<c:set var = "total" value="0"/>
					<c:forEach items="${data.orderDetailList }" var="detail" varStatus="status">
						<span style="display: none;">${detail.productVo.product_price }원</span>
						<c:set var="total" value="${total + detail.productVo.product_price }"/>
					</c:forEach>
					<c:out value="${total}"/>
					</div> 
				</div>
				<div class = "row">
					<div class = "col">
					<span>할인금액</span>
					</div>
					<div class = "col text-end">
					<span>0원</span>
					</div> 
				</div>
				<div class = "row">
					<div class = "col">
					<span>배송비</span>
					</div>
					<div class = "col text-end">
					<c:forEach items="${data.orderDetailList }" var="detail" begin="0" end="0">
						<span class="money">${detail.productVo.product_delivery_fee }원</span>
					</c:forEach>
					</div> 
				</div>
				<div class = "row border-top">
					<div class = "col">
					<span>현대카드</span>
					</div>
					<div class = "col text-end">
					<span>0원</span>
					</div> 
				</div>
				<div class = "row">
					<div class = "col">
					<span class = "fw-bold">총 결제금액</span>
					</div>
					<div class = "money col text-end">
					<c:set var = "total" value="0"/>
					<c:forEach items="${data.orderDetailList }" var="detail" varStatus="status">
						<span style="display: none;">${detail.productVo.product_price }원</span>
						<c:set var="total" value="${total + detail.productVo.product_price }"/>
					</c:forEach>
					<c:forEach items="${data.orderDetailList }" var="detail" begin="0" end="0">
						<span style="display: none;">${detail.productVo.product_delivery_fee }원</span>
						<c:set var="total" value="${total + detail.productVo.product_delivery_fee }"/>
					</c:forEach>
					<c:out value="${total}"/>
					</div> 
				</div>
			</div>
		</div>
		</c:forEach>
			
		<!-- 중간 박스 -->
		<c:forEach items="${dataList }" var="data">
		<div class = "row border rounded bg-white my-2 py-2 mx-0">
			<div class="col">
				<div class = "row">
					<div class = "col">
					<span class = "fw-bold">${data.orderVo.order_purchaser_name }(구매자)</span>
					</div> 
				</div>
				<div class = "row">
					<div class = "col">
					<span>${data.orderVo.order_purchaser_phone }</span>
					</div>
				</div>
			</div>		
		</div>
		<div class = "row border rounded bg-white my-2 py-2 mx-0">
			<div class="col">
				<div class = "row">
					<div class = "col">
					<span class = "fw-bold">${data.orderVo.order_receiver_name }(수취인)</span>
					</div> 
				</div>
				<div class = "row">
					<div class = "col">
					<span>(${data.orderVo.order_receiver_postcode })${data.orderVo.order_receiver_address1 }</span><br>
					<span>${data.orderVo.order_receiver_address2 }</span>
					</div>
				</div>
				<div class = "row">
					<div class = "col">
					<span>${data.orderVo.order_receiver_phone }</span>
					</div>
				</div>
			</div>		
		</div>
		
		
		<!-- 하단 박스 -->
		<div class = "row border rounded bg-white my-2 py-2  mx-0">
			<div class="col">
				<div class = "row mb-2">
					<div class = "col">
					<span class = "fw-bold">주문목록</span>
					</div>
				</div>
				
				<c:forEach items="${data.orderDetailList }" var="detail">
				<div class = "row border rounded py-2 mx-2 mb-3">
					<div class = "col">
						<div class = "row my-1">
							<div class = "col">
							<span class= "fw-bold">${detail.productVo.product_name }</span>
							</div> 
						</div>
						<div class = "row">
							<div class = "col">
							<span>${detail.orderDetailVo.order_detail_quantity }개 | </span>
							<span>${detail.orderDetailVo.order_detail_quote_price }원</span>
							</div>
						</div>
					</div>
				</div>

				</c:forEach>
				
			</div>		
		</div>
		</c:forEach>
			
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