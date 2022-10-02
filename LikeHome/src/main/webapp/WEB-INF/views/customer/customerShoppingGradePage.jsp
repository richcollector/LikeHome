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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<title>Insert title here</title>
<style>
	@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
	body{
		font-family: Pretendard;
	}
	
	#title{
		
		text-align: center;
		font-size: 1.4em;
		color: #404040;
	}
	
	#icon{
		font-size: 2.5em;
		color: #757575;
		text-align: center;

	}

	#icon1{
		font-size: 2em;
	}

	#card{
		margin-left: 0.8em;
		margin-right: 0.8em;
	}

	#blue{
		text-align: center; 
		font-size: 1.5em; 
		font-weight: bold; 
		padding-bottom: 1em;
	}

	/*네비바*/
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

/*네비바*/

.btn-check:active+.btn, .btn-check:checked+.btn, .btn.active, .btn.show, .btn:active{
 background-color: #ff6500;
}
</style>
<script type="text/javascript">
	
	
</script>
</head>
<body>
	<!-- 네비바 -->
<nav id="navbar" class="navbar navbar-light bg-white sticky-top">
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
		<i id="cart" class="m-0 bi bi-cart2" type="button" ></i>
		 </div>
	  </div>
	  </div>
	 </div>
	<!-- 네비바 2차 -->
	<div class="row text-center m-0 mt-1 py-2 justify-content-center border-bottom" style="width:100%">
	   <div class="col-auto" onclick="location.href='../customer/customerProfileMyHomePage'">프로필</div>
	   <div class="col-auto" style="color:#ff6500;" onclick="location.href='customerShoppingStatePage'">나의 쇼핑</div>
	   <div class="col-auto" onclick="location.href='customerInfoSettingPage'">설정</div>
	</div>  
  <!-- 네비바 2차 -->
  
  <!-- 네비바 3차 -->
	<div class="scroll-container mt-1 py-2 text-center ">
	   <div class="menu" onclick="location.href='customerShoppingStatePage'">주문배송내역조회</div>
	   <div class="menu" onclick="location.href='customerShoppingProductScrapPage'">상품 스크랩북</div>
	   <div class="menu" onclick="location.href='customerShoppingProductQnaPage'">상품문의내역</div>
	   <div class="menu" onclick="location.href='customerShoppingProductReviewPage'">리뷰관리</div>
	   <div class="menu" onclick="location.href='customerMyCouponPage'">쿠폰</div>
	   <div class="menu" onclick="location.href='customerShoppingPointPage'">포인트</div>
	   <div class="menu" style="color:#ff6500;" onclick="location.href='customerShoppingGradePage'">구매등급</div>
	   <div class="menu" onclick="location.href='customerShoppingHelpPage'">고객센터</div>
	   <div class="menu" onclick="location.href='customerMyHelpQnaPage'">문의하기</div>
	</div>
   
  <!-- 네비바 3차 -->
  
	<!-- 오프캔버스 좌측 -->
	  <div class="offcanvas offcanvas-start" style="width: 65%" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
		<div class="offcanvas-header mx-2">
		  <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="color:#ff6500;">LIKEHOME</h5>
		  <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="row offcanvas-body p-0 m-0">
		   <div class="col p-0">
			  <div id="navbarIdBox" class="row border-bottom p-2 pb-3 ms-1 mb-1">
			  <c:if test="${!empty customerInfo }">
				  <div class="col-2 m-0 pe-0" >
				  <c:choose>
				  <c:when test="${!empty customerInfo.customer_profile_image }">
					 <img style="width: 100%; height: 100%" class="rounded-circle"
						src="/uploadFiles/customerIntro/${customerInfo.customer_profile_image }"> 
				  </c:when>
				  <c:otherwise>
					 <img style="width: 100%; height: 100%" class="rounded-circle"
						 src="../resources/img/none.gif">
				  </c:otherwise>
			   </c:choose>
				  </div>
				  <div class="col" style="align-self: center" >${customerInfo.customer_nick }</div>
			  </c:if>
			  <c:if test="${empty customerInfo && empty vendorInfo }">
			  <div class="row justify-content-center">
				  <div class="col-5 m-0 ms-2 p-0">
					<button type="button" class="btn btn-outline-warning" style="color:#ff6500; border-color:#ff6500;"
							   onclick="location.href='#'">&nbsp;&nbsp;로그인&nbsp;&nbsp;</button>
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
					<p class="menu" onclick="location.href='../customer/customerShoppingStatePage'">나의 쇼핑</p>
					<p class="menu" onclick="location.href='../order/cartPage'">장바구니</p>
				  <p class="menu" onclick="location.href='../post/postRegisterPage'">사진 올리기</p>
				  <p class="menu" onclick="location.href='../customer/customerMyCouponPage'">쿠폰</p>
				  <p class="menu" onclick="location.href='../customer/customerShoppingHelpPage'">고객센터</p>
				  <p class="menu" onclick="location.href='../customer/customerMyHelpQnaPage'">문의하기</p>
				</div>
			  </div>
			</div>     
		  </div>
		  <div class="row mt-2 justify-content-end">
			<div class="col-5 p-0" onclick="location.href='../vendor/vendorRegisterPage'">판매자 신청</div>
			<div class="col-5 p-0 me-1 text-center">로그아웃</div>
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
		  
		</div>
	  </div>
	<!-- 오프캔버스 좌측 -->
	
  
  </nav>
  <!-- 네비바 -->
  
	
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
  
	<div class="container-fluid bg-light">
		<div class="row d-grid bg-white my-3">
			<div class="col" id="title" style="font-weight: bold;" >
				회원등급
			</div>
			<div class="col" id="icon">
				<i style="color: #6495ed;" class="bi bi-award-fill"></i>
		</div>
		
			<div id="blue" class="col">
			   블루
			</div>
		</div>
		

		<div class="row bg-white">
			<div class="col my-3" style="color: #404040; font-size: 1.1em; font-weight: bold;">
				최근 3개월 실적 
			</div>
		</div>
		<div class="row bg-white" style="padding-bottom: 1.5em;">
			<div class="col-5" style="margin-left: 2em;">
				구매횟수 : 0건
			</div>
			<div class="col-5">
				실결제금액 : 0원
			</div>
		</div>
		
		<div class="row border-top">
			<div class="col my-2" style="font-weight: bold; font-size: 1.2em;">
				등급안내
			</div>
		</div>
		<div id="card" class="card">
			<div class="card-body">
			  <div class="row">
				  <div id="icon1" class="col-2">
				  	<i style="color: #6495ed;" class="bi bi-award-fill"></i>
				  </div>
				  <div class="col" style="margin-top: 1.2em; font-size: 0.8em;">
					  신규가입 및 실결제금액 5만원 미만  
				  </div>
			  </div>
			  
			  <div class="row border-top">
				<div class="col" style="margin-top: 1em;">
				  혜택 실결제금액의 0.5% 적립
				</div>
			</div>
			</div>
		  </div>
		 
		  <div id="card" class="card" style="margin-top: 1em; margin-bottom: 1em;">
			<div class="card-body">
			  <div class="row">
				  <div id="icon1" class="col-2">
				  	<i style="color: #6e8b3d;" class="bi bi-award-fill"></i>
				  </div>
			  
			  
				<div class="col" style="margin-top: 1.2em; font-size: 0.8em;">
					실결제금액 5만원 이상 10만원 미만  
				</div> 
			  
			  <div class="row border-top">
				<div class="col" style="margin-top: 1em;">
				  혜택 실결제금액의 1% 적립
				</div>
			</div>
			</div>
		  </div>
		</div>
		  <div id="card" class="card" style="margin-bottom: 1em;">
			<div class="card-body">
			  <div class="row">
				  <div id="icon1" class="col-2">
				  	<i style="color: #ff6500;" class="bi bi-award-fill"></i>
				  </div>
				  <div class="col" style="margin-top: 1.2em; font-size: 0.8em;">
					실결제금액 10만원 이상 20만원 미만  
				</div>
			
			  <div class="row border-top">
				<div class="col" style="margin-top: 1em;">
				  혜택 실결제금액의 2% 적립
				</div>
				</div>
			</div>
			</div>
		  </div>
		  <div class="row my-3 px-3">
			  <div class="col" style="text-align: justify; color: #757575;">
				  <div>*회원등급은 최근 3개월 동안의 구매 횟수와 실결제 금액에 따라 결정됩니다.</div>
				  <div>회원등급은 매주 토요일 자정, 이전 3개월 동안의 구매실적이 집계되어 다음날인 일요일 오전 10시에 변경됩니다.</div>
				  <div>여러 상품을 한번에 주문했을 경우, 각각의 구매 확정시점에 실결제 금액에 반영됩니다.</div>
				  <div>회원등급 혜택은 인테리어 시공 서비스/상품에는 적용되지 않습니다.</div>
			  </div>
		  </div>
	
		
		</div>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>