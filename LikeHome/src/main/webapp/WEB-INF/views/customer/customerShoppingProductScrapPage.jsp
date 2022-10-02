<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    color:#404040;
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

	#sort{
      font-size: 1.1rem;
      font-weight: bold;
    }
	    
	.product-name{
		overflow:hidden;
		text-overflow:ellipsis;
		line-height:1.2em;
		height:1.2em;
		font-size:0.9rem;
		display: inline-block;
		white-space: nowrap;
		width: 150px;
	}
	
	.brand-name{
		font-size: 0.8rem;
		color: #757575;
		font-weight: bold;
	  }
	   
	.rating{
		font-size:0.8rem;
	}
	
	.bi-star-fill{
		color:#ff6500;
	}


	.dropdown-toggle{
		color: #ff6500;
	    background-color: white;
	    border-color: #ff6500;
	}
	
	
</style>
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
	 <div class="menu" style="color:#ff6500;" onclick="location.href='customerShoppingProductScrapPage'">상품 스크랩북</div>
	 <div class="menu" onclick="location.href='customerShoppingProductQnaPage'">상품문의내역</div>
	 <div class="menu" onclick="location.href='customerShoppingProductReviewPage'">리뷰관리</div>
	 <div class="menu" onclick="location.href='customerMyCouponPage.jsp'">쿠폰</div>
	 <div class="menu" onclick="location.href='customerShoppingPointPage'">포인트</div>
	 <div class="menu" onclick="location.href='customerShoppingGradePage'">구매등급</div>
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
		
		<!-- 기능 이식 후 삭제 해주세요-->
		<button onclick="location.href='../customer/customerLoginPage'" type="button" class="btn btn-primary" >일반회원로그인</button>
        <button onclick="location.href='../vendor/vendorLoginPage'" type="button" class="btn btn-primary" >사업자로그인</button>
        <button onclick="location.href='../admin/adminLoginPage'" type="button" class="btn btn-primary" >관리자로그인</button>
        <!-- 기능 이식 후 삭제 해주세요-->
        
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

<div class="container-fluid">

             <div class="row pt-3 border-bottom" id="userInfoBox"
               style="background-color: white;">
               <div class="col">
                  <div class="card mb-3 border-0">
                     <div class="row g-0">
                        <div class="col-4 p-2">
                           <c:choose>
                              <c:when test="${!empty customerInfo.customer_profile_image }">
                                 <img
                                    src="/uploadFiles/customerIntro/${customerInfo.customer_profile_image }"
                                    class="img-fluid rounded-circle">
                              </c:when>
                              <c:otherwise>
                                 <img class="img-fluid rounded-circle"
                                    src="../resources/img/unprofile.gif">
                              </c:otherwise>
                           </c:choose>
                        </div>
                        <div class="col-8 pt-3 ps-3">
                           <div class="row">
                              <div class="col fw-bold"
                                 style="font-size: 1.1rem; color: #404040">${customerInfo.customer_nick }</div>
                           </div>
                           <div class="row">
                              <div class="col" style="font-size: 0.9rem; color: #757575">
                                 <span onclick="followList()"> 팔로워 </span> <span
                                    onclick="followList()" id="follow" style="font-weight: bold">
                                    ${data.followerCount } </span> <span onclick="followingList()">
                                    팔로잉 </span> <span onclick="followingList()" id="following"
                                    style="font-weight: bold"> ${data.followingCount } </span>
                              </div>
                           </div>
                           <div class="row">
                              <div class="col">
                                 <c:choose>
                                    <c:when test="${!empty followVo}">
                                       <button
                                          onclick="doFollw(this,${data.userInfo.customer_no})"
                                          id="followBtn" type="button" class="btn py-1"
                                          style="width: 50%; background-color: white; color: #ff6500; border-color: #ff6500">팔로잉</button>
                                    </c:when>
                                    <c:otherwise>
                                       <button
                                          onclick="doFollw(this,${data.userInfo.customer_no})"
                                          id="followBtn" type="button" class="btn py-1"
                                          style="width: 50%; background-color: #ff6500; color: white; border-color: #ff6500">팔로우</button>
                                    </c:otherwise>

                                 </c:choose>


                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="row pt-2">
                        <div class="col" style="font-size: 0.9rem; color: #404040">
                           ${data.userInfo.customer_intro }</div>
                     </div>
                  </div>
               </div>
            </div>
      
      
      
      <div class="row">
        <div class="col">
          
          <div class="row py-3">
          
          	<div class="col">상품스크랩 <span style="color:#757575">${fn:length(productScrapDataList) }</span></div>
          	<div class="col">
          	 <button class="btn dropdown-toggle py-0" type="button"  data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom"  aria-controls="offcanvasBottom" aria-expanded="false">카테고리</button>
	          	<div class="offcanvas offcanvas-bottom" style="height:auto;" tabindex="-1" id="offcanvasBottom">
				  <div class="offcanvas-header">
				    <h5 class="offcanvas-title" id="offcanvasBottomLabel">카테고리</h5>
				    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
				  </div>
				  <div class="offcanvas-body">
				     <ul class="list-group list-group-flush">
	                 	<c:forEach items="${productCategory1List }" var="cat1">
	                    <li class="list-group-item list-group-item-action" data-bs-toggle="offcanvas"  data-bs-target="#cat2" aria-controls="offcanvasBottom">
	                    ${cat1.product_category1_name}</li>
	                 	</c:forEach>
	                 </ul>
				  </div>
				</div>
          	</div>
          </div>
          
          
          <div class="row row-cols-2 g-2">
          	<c:forEach items="${productScrapDataList }" var="data">
	            <article class="col mb-2" onclick="location.href='../product/productDetailPage?product_no=${data.productVo.product_no}'">
	              <div class="row mb-2">
	                <div class="col" style="position:relative">
	                  <i class="text-opacity-50 bi bi-bookmark-fill" style="position: absolute; bottom: 0%; right: 8%; font-size: 1.6rem;color:#ff6500;"></i>
	                  <img class="img-fluid rounded" src="../../uploadFiles/titleImage/${data.productTitleImageVo.title_image_link }" alt="">
	                </div>
	              </div>
	              <div class="row">
	                <div class="col brand-name">${data.vendorVo.vendor_brand_name }</div>
	              </div>
	              <div class="row">
	                <div class="col product-name">${data.productVo.product_name }</div>
	              </div>
	              <div class="row">
	                <div class="col fw-bold money">${data.productVo.product_price }</div>
	              </div>
	              <div class="row">
	                <div class="col rating">
	                  <i class="bi bi-star-fill"></i>
	                  <span>3.7</span>
	                  <span>(123)</span>
	                </div>
	              </div>
           		 </article>
          	</c:forEach>
          </div>
        </div>

      </div>


    </div>



<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>