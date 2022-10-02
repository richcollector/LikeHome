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
	<title>판매자 주문리스트</title>
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

	function deliveryChange(sel, detailNo){
		
		var statusageNum = sel.value;

		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		
		

		xhr.open("post", "../vendor/updateDeliveryProcess");	//리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send("delivery_statusageNum=" + statusageNum + "&ORDER_DETAIL_NO=" + detailNo);	//AJAX로 리퀘스트함...
		
		refreshDelivery(detailNo);
	}

	function refreshDelivery(detailNo){

		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
				var deliveryStateBox = document.getElementById("deliveryState" + detailNo);
				deliveryStateBox.innerHTML = "";
				
				if(jsonObj == 0){
					var state0 = document.createElement("span");
					state0.innerText = "입금완료";
					state0.classList = "text-danger";
					deliveryStateBox.appendChild(state0);
				}

				if(jsonObj == 1){
					var state1 = document.createElement("span");
					state1.innerText = "배송중";
					state1.classList = "text-success";
					deliveryStateBox.appendChild(state1);
				}

				if(jsonObj == 2){
					var state2 = document.createElement("span");
					state2.innerText = "배송완료";
					state2.classList = "text-primary";
					deliveryStateBox.appendChild(state2);
				}
			}
		}
	
		
		xhr.open("get", "../vendor/getDeliveryStatus?detailNo=" + detailNo);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...

	}
	
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
			<a href="./vendorMainPage"><i class="bi bi-arrow-left-square" style="color: #ff6500;"></i></a>
		</div>
	</div>
	
	<!-- 검색 -->
	<div class="row pe-2 my-3">
		<div class="col">
			<form action="./vendorOrderListPage" method="get">
				<div class="row">
				<div class="col pe-0">
					<select name="searchType" class="form-control">
						<option value="order_code">주문번호</option>
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
	
		<c:forEach items="${dataList }" var="data">
		<div class = "row border rounded bg-white my-3 py-2 mx-0">
			<div class="col">
				<div class = "row">
					<div class = "col-8">
					<span>${data.orderVo.order_code }</span>
					</div> 
					<div class = "col-4 ps-0 text-end">
					<span><a href="./vendorOrderDetailListPage?order_no=${data.orderVo.order_no }">상세페이지</a></span>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<span>${data.customerVo.customer_nick } | </span>
						<span><fmt:formatDate value="${data.orderVo.order_date }" pattern="yy.MM.dd"/></span>
					</div>
				</div>
				<c:forEach items="${data.orderDetailList }" var="detail">
				<div class = "row">
					<div class = "col">
					<span class="fs-5 fw-bold">${detail.productVo.product_name }</span>
					</div> 
				</div>
				<div class = "row">
					<div class="col">
						<span class = "money pe-0">${detail.orderDetailVo.order_detail_quote_price }원</span>
						<span class = "ps-0">|&nbsp;&nbsp;&nbsp;${detail.orderDetailVo.order_detail_quantity }개</span>
					</div>
						<div id="detailNo" style="display: none;">
							${detail.orderDetailVo.order_detail_delivery_status }
						</div>
				</div>
				<div class = "row">
					<div id="deliveryState${detail.orderDetailVo.order_detail_no }" class = "col-3 pe-0">
					<c:choose>
						<c:when test="${detail.orderDetailVo.order_detail_delivery_status == 0 }">
							<span class="text-danger">입금완료</span>
						</c:when>
						<c:when test="${detail.orderDetailVo.order_detail_delivery_status == 1 }">
							<span class="text-success">배송중</span>
						</c:when>
						<c:when test="${detail.orderDetailVo.order_detail_delivery_status == 2 }">
							<span class="text-primary">배송완료</span>
						</c:when>
					</c:choose>
					</div>
					<div class = "col-5 py-0 ps-0">
						<select onchange="deliveryChange(this , ${detail.orderDetailVo.order_detail_no })" name="order_detail_delivery_status" class="form-control py-0">
				      		<c:choose>
					      		<c:when test="${detail.orderDetailVo.order_detail_delivery_status == 0 }">
						      		<option value="0" selected>입금완료</option>
						      		<option value="1">배송중</option>
						      		<option value="2">배송완료</option>
					      		</c:when>
					      		<c:when test="${detail.orderDetailVo.order_detail_delivery_status == 1 }">
						      		<option value="0">입금완료</option>
						      		<option value="1" selected>배송중</option>
						      		<option value="2">배송완료</option>
					      		</c:when>
					      		<c:when test="${detail.orderDetailVo.order_detail_delivery_status == 2 }">
						      		<option value="0">입금완료</option>
						      		<option value="1">배송중</option>
						      		<option value="2" selected>배송완료</option>
					      		</c:when>
				      		</c:choose>
				      	</select>
					</div>
				</div>
				</c:forEach>
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
   				    		<li class="page-item"><a class="page-link" href="./vendorOrderListPage?pageNum=${startPage - 1 }${additionalParam}">&lt;</a></li>
				  		</c:otherwise>
				  	</c:choose>
				  	
				  	<c:forEach begin="${startPage }" end="${endPage }" var="i">
				  		<c:choose>
				  			<c:when test="${i == currentPageNum }">
  							    <li class="page-item active"><a class="page-link" href="./vendorOrderListPage?pageNum=${i }${additionalParam}">${i }</a></li>
				  			</c:when>
				  			<c:otherwise>
  							    <li class="page-item"><a class="page-link" href="./vendorOrderListPage?pageNum=${i }${additionalParam}">${i }</a></li>
				  			</c:otherwise>
				  		</c:choose>
				  	</c:forEach>
				  	
				  	<c:choose>
				  		<c:when test="${endPage >= totalPageCount }">
  						    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
				  		</c:when>
				  		<c:otherwise>
  						    <li class="page-item"><a class="page-link" href="./vendorOrderListPage?pageNum=${endPage+1 }${additionalParam}">&gt;</a></li>
				  		</c:otherwise>
				  	</c:choose>
				  </ul>
				</nav>
			</div>
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