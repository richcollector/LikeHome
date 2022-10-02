<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<style type="text/css">
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");

body {
    font-family: Pretendard;
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

.accordion-button:not(.collapsed){
	color:#ff6500;
	background-color: white;
	font-weight: bold;
	box-shadow: none;
}

.accordion-button:focus{
	box-shadow: none;
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
	 <div class="menu" onclick="location.href='addressListPage'">배송지 관리</div>
	 <div class="menu" onclick="location.href='customerShoppingProductScrapPage'">상품 스크랩북</div>
	 <div class="menu" onclick="location.href='customerShoppingProductQnaPage'">상품문의내역</div>
	 <div class="menu" onclick="location.href='customerShoppingProductReviewPage'">리뷰관리</div>
	 <div class="menu" onclick="location.href='customerMyCouponPage.jsp'">쿠폰</div>
	 <div class="menu" onclick="location.href='customerShoppingPointPage'">포인트</div>
	 <div class="menu" onclick="location.href='customerShoppingGradePage'">구매등급</div>
	 <div class="menu" style="color:#ff6500;" onclick="location.href='customerShoppingHelpPage'">고객센터</div>
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
				   		  onclick="location.href='../customer/customerLoginProcess'">&nbsp;&nbsp;로그인&nbsp;&nbsp;</button>
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
				<p class="menu"
					onclick="location.href='../post/followPostListPage'">팔로잉</p>
				<p class="menu"
					onclick="location.href='../post/postListPage'">사진</p>
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

<div class="container">
  <div class="row mb-2">
    <div class="col" style="color:#ff6500; font-weight: bold; font-size: 1.2rem;">
    자주 묻는 질문
    </div>
  </div>

  <div class="row">
	<div class="col">
		<div class="accordion accordion-flush" id="accordionFlushExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed px-2" style="box-shadow: none;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        <i class="bi bi-quora me-2"></i>배송은 얼마나 걸리나요?
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne">
      <div class="accordion-body" style="background-color:#f8f9fa; font-size: 0.9rem;">
      상품 배송 기간은 배송 유형에 따라 출고 일자 차이가 있습니다. 자세한 사항은 구매하신 상품의 상세 페이지에서 확인 가능하며, 배송 유형 별 기본 출고 기간은 아래와 같습니다. 
      <br>
      ∙ 일반 택배 / 화물 택배 : 결제 후 1~3 영업일 이내 출고됩니다.
      <br>
      ∙ 업체 직접 배송 : 배송 지역에 따라 배송 일자가 상이할 수 있으므로 상품 상세 페이지에서 확인 해주세요.
      <br>
      ※ 영업일은 주말, 공휴일을 제외한 기간입니다.
      <br>
      ※ 제조사의 사정에 따라 출고일은 지연될 수 있는 점 양해 부탁드립니다.
      </div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTwo">
      <button class="accordion-button collapsed px-2" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        <i class="bi bi-quora me-2"></i>주문 취소는 어떻게 하나요?
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo">
      <div class="accordion-body" style="background-color:#f8f9fa; font-size: 0.9rem;">
      판매처에서 주문을 확인하기 전이라면 언제든 취소하실 수 있으며, [나의 쇼핑 > 주문배송내역 조회 > 주문상세보기]에서 직접 주문취소하실 수 있습니다.
      <br>
      ※ 이미 판매처에서 상품을 확인해 준비 중이라면, 직접 취소가 어렵습니다. 상세 페이지에 확인되는 판매자 연락처 또는 LIKEHOME 고객센터로 문의 부탁드립니다.
      </div>
    </div>
  </div>
  
    <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed px-2" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        <i class="bi bi-quora me-2"></i>제품의 자세한 정보는 어떻게 알 수 있나요?
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree">
      <div class="accordion-body" style="background-color:#f8f9fa; font-size: 0.9rem;">
		각 제품의 상세 페이지에서 확인 가능하며, 더욱 자세한 정보는 제품상세페이지 내 문의하기를 통해 판매 업체에 문의 가능합니다.
      </div>
    </div>
  </div>
 
   <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed px-2" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
        <i class="bi bi-quora me-2"></i>회원 정보 수정은 어디에서 하나요?
      </button>
    </h2>
    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour">
      <div class="accordion-body" style="background-color:#f8f9fa; font-size: 0.9rem;">
		회원 정보 수정은 아래 경로로 직접 변경 가능합니다.
		<br>
		마이페이지 > 설정 > 회원 정보 수정
		<br>
		※ 원활한 주문 및 배송을 위해 회원 정보를 정확하게 기재해 주세요.
		</div>
    </div>
  </div>
  
   <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed px-2" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFour">
        <i class="bi bi-quora me-2"></i>상품을 받는 주소(배송지) 등록은 어떻게 하나요?
      </button>
    </h2>
    <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFour">
      <div class="accordion-body" style="background-color:#f8f9fa; font-size: 0.9rem;">
		 마이페이지 > 배송지 관리 또는 주문서 작성 시 배송지 관리에서 배송 주소를 등록/수정/삭제할 수 있습니다. 
      </div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed px-2" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseFour">
        <i class="bi bi-quora me-2"></i>주문 내역은 어떻게 확인할 수 있나요?
      </button>
    </h2>
    <div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingFour">
      <div class="accordion-body" style="background-color:#f8f9fa; font-size: 0.9rem;">
		 마이페이지 > 나의 쇼핑 > 주문배송내역조회 에서 확인 가능합니다.
      </div>
    </div>
  </div>
  
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed px-2" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseFour">
        <i class="bi bi-quora me-2"></i>배송완료로 나오는데 아직 상품을 받지 못했어요.
      </button>
    </h2>
    <div id="flush-collapseSeven" class="accordion-collapse collapse" aria-labelledby="flush-headingFour">
      <div class="accordion-body" style="background-color:#f8f9fa; font-size: 0.9rem;">
		 배송 상황에 따라 배송완료로 확인될 수 있습니다. 
		 <br>
		 아래 내용 확인해 주세요.
		 <br>
		 ■ 배송 기사가 상품을 아직 보유하고 있는 경우
		 <br>
		 보유여부는 택배사 또는 배송기사분에게 확인해 주세요.
		 <br>
		 ■ 경비실, 문 앞, 택배 보관함 등에 위탁 장소에 배송하는 경우 
		 <br>
		 다시 한번 상품이 있는지 확인해 주세요.
		 <br>
		 ■ 배송 완료로 먼저 처리 후 현재 배송 중일 경우 
		 <br>
		 배송중으로 배송기사분에게 확인해 주세요.
		 <br>
		 ■ 브랜드사에서 송장번호를 잘못 입력 한 경우 
		 <br>
		 배송 지역이 다르게 확인될 수 있어 무신사 고객센터로 문의하면 정상 송장번호 확인 가능해요.
		 <br>
		 위에 내용으로 확인 안되는 경우 무신사 고객센터로 문의해 주세요.
      </div>
    </div>
  </div>
  
</div>
	</div>
  </div>
  
  <jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>