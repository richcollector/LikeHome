<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />


<title>Insert title here</title>
 <style>
    @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");

	body {
		font-family: Pretendard;
		color:#404040;
		}  
      
	section{
		background-color: white;
        margin-bottom:0.3rem;
	}
	
	.b-name{
		font-size: 0.9rem;
		color:#757575;
		}

	 a {
	 	text-decoration: none;
	 	color:#404040;
	 	}
	
	.btn-outline{
	 	background-color:white;
	 	color:#ff6500;
	 	font-size:0.9rem;
	 	border-color:#ff6500;
	 	padding:0.2rem 0;
	 	}
	 	
	 	
	 .title{
	 	font-weight: 600;
		padding-block: 0.5rem;	
		font-size:0.9rem; 
	 }
	 
	 .subtitle{
	 	font-size:0.9rem;
	 	color:#757575;
	 	margin-bottom:0.6rem;
	 }
	 
	header {
    font-family: pretendard;
	}
	
	::-webkit-scrollbar {
	   display: none;
	}
	
	#search{
		font-size: 1.2rem;	
	}
	
	#cart{
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
	  margin-left:20px;
	  flex: 0 0 auto;
	}
	
	.content{
		font-size:0.9rem;
	}
	
	.orderinfo{
		padding-top: 0.5rem;
	    padding-bottom: 0.3rem;
	}
	
	.total{
		font-size: 1rem;
	    color: #ff6500;
	    font-weight: 600;
	}

	 
    </style>
    
</head>


<script type="text/javascript">
	window.addEventListener("DOMContentLoaded", function (){
		changeMoneyUnit();
	});
	
	//원 표시 자동변환 script
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
<body class="bg-light">

 <div class="container-fluid">
    <header>
<nav id="navbar" class="navbar row px-0 navbar-light bg-white sticky-top">
  <div class="row container-fluid m-0 pb-1  border-bottom">
    <div class="col-2 p-0">
    <button class="navbar-toggler p-0 ms-0 border-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"
    		style="box-shadow: 0 0 white; border: 0;">
      <span class="navbar-toggler-icon"></span>
    </button>
    </div>
    <div class="col-8 fw-bold fs-4" style="text-align:center; color:#ff6500;"><a onclick="location.href='../main/mainPage'">LIKEHOME</a></div>
    <div class="col-2 m-0 p-0">
    <div class="row">
       <div  data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" class="col p-0 m-0 mt-1 ms-1 me-1 text-center" style="align-self:center">
      <i id="search" class="bi bi-search"></i>
       </div>
       <div onclick="location.href='../order/cartPage'" class="col p-0 m-0">
      <i id="cart" class="m-0 bi bi-cart2 position-relative" type="button">
      </i>
      
       </div>
    </div>
    </div>
    
  <!-- 오프캔버스 좌측 -->
    <div class="offcanvas offcanvas-start" style="width: 65%" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="color:#ff6500;">LIKEHOME</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="row offcanvas-body p-0 ">
 		<div class="col p-0">
			<div id="navbarIdBox" class="row border-bottom p-2 pb-3 ms-1 mb-1">
			<c:if test="${!empty customerInfo }">
				<div class="col-2 m-0 pe-0" >
				<c:choose>
                <c:when test="${!empty customerInfo.customer_profile_image }">
                   <img style="width: 100%; height: 100%" class="rounded-circle"
                      src="${customerInfo.customer_profile_image }">
                </c:when>
                <c:otherwise>
                   <img style="width: 100%; height: 100%" class="rounded-circle"
                      src="../resources/img/home1.png">
                </c:otherwise>
             </c:choose>
				</div>
				<div class="col" style="align-self: center" >${customerInfo.customer_nick }</div>
			</c:if>
			<c:if test="${empty customerInfo && empty vendorInfo }">
			<div class="row justify-content-center">
				<div class="col-5 m-0 ms-2 p-0">
				  <button type="button" class="btn btn-outline-warning" style="color:#ff6500; border-color:#ff6500;"
				   		  onclick="location.href='../customer/customerLoginPage'">&nbsp;&nbsp;로그인&nbsp;&nbsp;</button>
				</div>
				<div class="col-5 m-0 ms-2 p-0">
				  <button type="button" class="btn btn-warning" style="color:white; background-color:#ff6500;  border-color:#ff6500;"
						  onclick="location.href='../customer/customerRegisterPage'">회원가입</button>
				</div>
			</div>
			</c:if>
			<c:if test="${!empty vendorInfo }">
			<div class="row p-0 m-0">
			  <div class="col">${vendorInfo.vendor_brand_name }</div>
			</div>
			</c:if>
		 </div>
		</div>
		<c:choose>
		<c:when test="${customerInfo.customer_no != null || vendorInfo.vendor_no == null}">
		<div class="row m-0 mt-2 border-bottom">
		  <div class="col m-0 p-0 ">
		    <div class="row">
			  <div class="col border-bottom">
		        <p class="menu" onclick="location.href='../main/mainPage'">홈</p>
		        <p class="menu" onclick="location.href='../product/productCategoryPage'">스토어</p>
		        <p class="menu" onclick="location.href='../product/bestProductPage'">베스트</p>
		        <p class="menu" onclick="location.href='../post/followPostListPage'">팔로잉</p>
		        <p class="menu" onclick="location.href='../post/postListPage'">사진</p>
		      </div>
		    </div>
		    <div class="row">
		      <div class="col mt-2">
		        <p class="menu" onclick="location.href='../customer/customerProfileMyHomePage'">마이페이지</p>
		      	<p class="menu" onclick="location.href='../order/myOrderPage'">나의 쇼핑</p>
		      	<p class="menu" onclick="location.href='../order/cartPage'">장바구니</p>
		        <p class="menu" onclick="location.href='../post/postRegisterPage'">사진 올리기</p>
		        <p class="menu" onclick="location.href='../customer/customerMyCouponPage'">쿠폰</p>
		        <p class="menu" onclick="location.href='#'">고객센터</p>
		        <p class="menu" onclick="location.href='../main/helpQnaBoardPage'">문의하기</p>
		      </div>
		    </div>
		  </div>     
		</div>
		<div class="row mt-2 justify-content-end">
		  <div class="col-5 p-0" onclick="location.href='../vendor/vendorRegisterPage'">판매자 신청</div>
		  <div class="col-5 p-0 me-1 text-center" onclick="location.href='../customer/customerLogoutProcess'">로그아웃</div>
		</div>
		</c:when>
		<c:when test="${vendorInfo.vendor_no != null }">
		<div class="row mt-2">
		  <div class="col">
		    <p class="menu" onclick="location.href='../vendor/vendorMainPage'">쇼핑몰판매</p>
		    <p class="menu" onclick="location.href='../product/productListPage'">상품 리스트 페이지</p>
		    <p class="menu" onclick="location.href='../order/cartPage'">장바구니 페이지</p>
		    <p class="menu" onclick="location.href='../order/myOrderPage'">나의 주문 내역</p>
		  </div>
		</div>
		</c:when>
		</c:choose>
		
		<!-- 기능 이식 후 삭제 해주세요-->
		<!-- <button onclick="location.href='../customer/customerLoginPage'" type="button" class="btn btn-primary" >일반회원로그인</button>
        <button onclick="location.href='../vendor/vendorLoginPage'" type="button" class="btn btn-primary" >사업자로그인</button> -->
        <button onclick="location.href='../admin/adminLoginPage'" type="button" class="btn btn-primary" >관리자로그인</button>
        <!-- 기능 이식 후 삭제 해주세요-->
        
      </div>
    </div>
  </div>
  <!-- 오프캔버스 좌측 -->
 
  <!-- 오프캔버스 우측 -->
  <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header">
      <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="통합 검색">
      <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
    </div>
  </div>
  <!-- 오프캔버스 우측 -->

</nav>
</header>
    
    <section class="row orderinfo content"><!--주문번호 주문 일자-->
      <div class="col">
      	<div>주문번호 <span style="font-weight: 600;">${orderVo.order_code }</span></div>
      </div>
	  <div class="col-3 text-end">
	 	<span><fmt:formatDate pattern="yyyy.MM.dd" value="${orderVo.order_date }"/></span>
	  </div>      	
    </section>
    <section class="row"><!--주문내역(상품여러개)-->
      <div class="col">
      	<div class="row">
      		<div class="col title">주문상품정보</div>
      	</div>
      
        <c:forEach items="${dataList}" var="data">
        <div class="row py-2 content">
          <div class="col-3">
         	<img class="img-fluid rounded" src="../../uploadFiles/titleImage/${data.productTitleImageVo.title_image_link }">
          </div>
          <div class="col">
            <div class="row">
              <div class="col b-name">${data.vendorVo.vendor_brand_name }</div>
            </div>
            <div class="row">
              <div class="col p-name">
                <a href="../product/productDetailPage?product_no=${data.productVo.product_no }">${data.productVo.product_name}</a>
              </div>
            </div>
            <div class="row">
              <div class="col">
              	<span class="money fw-bold">${data.orderDetailVo.order_detail_quote_price}</span>
              	<span class="text-secondary"> | </span>
              	<span>${data.orderDetailVo.order_detail_quantity}개</span>
              </div>
            </div>
            <c:if test="${data.orderDetailVo.order_detail_delivery_status == 2 }">
	            <div class="row">
	              <div class="col my-2 d-grid">
	                <button class="btn btn-outline">리뷰쓰기</button>
	              </div>
	            </div>
            </c:if>
          </div>
        </div>
      </c:forEach>
      </div>
    </section>
    <section class="row"><!--배송지 정보-->
      <div class="col">
        <div class="row">
          <div class="col title">배송지 정보</div>
        </div>
        <div class="row">
          <div class="col content">
            <div class="row">
             <div class="col-3 subtitle">받는사람</div> 
             <div class="col">${orderVo.order_receiver_name }</div> 
            </div>
            <div class="row">
              <div class="col-3 subtitle">연락처</div> 
              <div class="col">${orderVo.order_receiver_phone }</div> 
            </div>
            <div class="row">
              <div class="col-3 subtitle">주소</div> 
              <div class="col">${orderVo.order_receiver_address1}</div> 
            </div>
          </div>
        </div>
      </div>
    </section>
    
    
    <c:set var="productSum" value="0"></c:set>
      <c:set var="deliverySum" value="0"></c:set>
      
      	<c:forEach items="${dataList }" var="data">
      		<c:set var = "productSum" value="${productSum + (data.orderDetailVo.order_detail_quote_price * data.orderDetailVo.order_detail_quantity) }"></c:set>
      		<c:set var = "deliverySum" value="${deliverySum + data.productVo.product_delivery_fee }"></c:set>
      	</c:forEach>
      
      	<c:set var="totalSum" value="${productSum + deliverySum }"></c:set>
		
    
    
    
    <section class="row pb-3"><!--결제 정보-->
      <div class="col">
        <div class="row">
          <div class="col title">결제정보</div>
        </div>
        <div class="row content">
          <div class="col">
            <div class="row">
              <div class="col subtitle">상품금액</div>
              <div class="col text-end"><span id="productAmt" class="money"><c:out value="${productSum }"></c:out></span></div>
            </div>
            <div class="row">
              <div class="col subtitle">선불배송비</div>
              <div class="col text-end"><span id="deliveryAmt" class="money"><c:out value="${deliverySum }"></c:out></span></div>
            </div>
            <div class="row">
              <div class="col subtitle">사용 포인트</div>
              <div class="col text-end">000P</div>
            </div>
            <div class="row">
              <div class="col subtitle">쿠폰 할인가</div>
              <div class="col text-end"><span class="money">00000</span></div>
            </div>
            <div class="row">
              <div class="col subtitle">결제 방법</div>
              <div class="col text-end">카카오페이</div>
            </div>
            <div class="row">
              <div class="col subtitle" style="font-size:1rem">결제 금액</div>
              <div class="col text-end total"><span class="money">${orderVo.order_total_amount }</span></div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <jsp:include page="../common/footer.jsp"></jsp:include>		
    

   </div>


<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 

</body>
</html>