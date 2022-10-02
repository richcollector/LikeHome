<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />


<title>나의 주문내역</title>

<style>
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");

	body {
		font-family: Pretendard;
		color:#404040;
		
		}

	.o-info{
		font-size:0.9rem;
		font-weight:600;
	}	
    .o-detail{
    	font-size:0.8rem;
    	color:#757575;
    	
    }
		
	.delivery{
		color:#404040;
		font-size:0.9rem;
	}
	
	.deliveryInfo{
		font-size: 0.9rem;
	    color: #757575;
	    text-align: center;
	    margin: 3rem;
	}
		
	.b-name{
		font-size: 0.8rem;
		color:#757575;
		}
		
	.p-name{
		font-size:0.9rem;
		}
		
	.p-price{
		font-size:0.9rem;
		}
    
	.rc{
	     background-color: white;
	     margin-bottom:0.5rem;
	     padding-bottom:0.7rem;
	   }
	   
	 a {text-decoration: none !important;}
	 
	 .btn-sub{
	 	background-color:white;
	 	color:#ff6500;
	 	font-size:0.9rem;
	 	border-color:#ff6500;
	 	}
	 	
	 	.nav{
	 	font-size:0.8rem
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


		.btn-outline-secondary{
			font-size:0.9rem;
		}
		
		.btn-main{
		background-color:#ff6500;
		color:white;
		}
/*네비바*/

		.btn-check:active+.btn, .btn-check:checked+.btn, .btn.active, .btn.show, .btn:active{
		 background-color: #ff6500;
		 }
		 
		 .review-title{
		 	font-weight: 600;
		 }
		 
		 .star-default{
		 	color:#dee2e6;
		 }
		 
		 .star-fill{
		 	color:#ff6500;
		 }
		 
		 .review-box{
		 	width:5rem;
		 	height:5rem;
		 }
		 
		 .review-img{
		 	width: 100%;
		    height: 100%;
		    object-fit: cover;
		 }
		 
		 .reviewplus{
		 	font-size: 3rem;
		    color: #ff6500;
		    border: #ff6500 dashed 0.1rem;
		    text-align: center;
		    width: 100%;
		    height: 100%;
		    font-weight: 100;
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
<body class="bg-light">


    
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
	 <div class="menu" style="color:#ff6500;" onclick="location.href='customerShoppingStatePage'">주문배송내역조회</div>
	 <div class="menu" onclick="location.href='customerShoppingProductScrapPage'">상품 스크랩북</div>
	 <div class="menu" onclick="location.href='customerShoppingProductQnaPage'">상품문의내역</div>
	 <div class="menu" onclick="location.href='customerShoppingProductReviewPage'">리뷰관리</div>
	 <div class="menu" onclick="location.href='customerMyCouponPage'">쿠폰</div>
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
      
      <div class="row bg-white"><!--배송진행상황-->
        <div class="col px-0 text-center" onclick="location.href='../customer/customerShoppingStatePage?deliveryStatus=3'">
        	<button class="btn btn-outline-secondary rounded-pill py-0 my-1">전체</button>
        </div>
         <div class="col px-0 text-center" onclick="location.href='../customer/customerShoppingStatePage?deliveryStatus=0'">
        	<button class="btn btn-outline-secondary rounded-pill py-0 my-1">결제완료</button>
        </div>
         <div class="col px-0 text-center" onclick="location.href='../customer/customerShoppingStatePage?deliveryStatus=1'">
        	<button class="btn btn-outline-secondary rounded-pill py-0 my-1">배송중</button>
        </div>
         <div class="col px-0 text-center" onclick="location.href='../customer/customerShoppingStatePage?deliveryStatus=2'">
        	<button class="btn btn-outline-secondary rounded-pill py-0 my-1">배송완료</button>
        </div>
      </div>
      <div class="row"><!--필터-->
        <div class="col"></div>
      </div>
      
      <div class="row rc"><!--나의 주문내역 로우-->
        <div class="col">
        	<c:if test="${empty dataList}">
        		<div class="deliveryInfo">
	        		<c:choose>
	        			<c:when test="${deliveryStatus == 0 }">결제완료된 상품이 없습니다.</c:when>
	        			<c:when test="${deliveryStatus == 1 }">배송중인 상품이 없습니다.</c:when>
	        			<c:when test="${deliveryStatus == 2 }">배송완료된 상품이 없습니다.</c:when>
	        		</c:choose>
        		</div>
        	</c:if>
          <c:forEach items="${dataList }" var="data">
          <div class="row rc"><!--나의 주문내역>주문하나-->
            <div class="col">
              <div class="row pt-2">
                <div class="col o-info">
                	<span><fmt:formatDate pattern="yyyy.MM.dd" value="${data.orderVo.order_date }"/></span>
                </div>
                <div class="col-4 text-end"><a href="../order/orderDetailPage?order_no=${data.orderVo.order_no }" class="o-detail">주문상세<i class="bi bi-chevron-right fs"></i></a></div>
              </div>
              <c:forEach items="${data.orderDetailList }" var="orderDetail">
              <div class="row">
                <div class="col">
                    <div class="card my-1">
                      <div class="card-header delivery py-1">
					<c:choose>
						<c:when test="${orderDetail.orderDetailVo.order_detail_delivery_status == 0}">결제완료</c:when>
						<c:when test="${orderDetail.orderDetailVo.order_detail_delivery_status == 1}">배송중</c:when>
						<c:when test="${orderDetail.orderDetailVo.order_detail_delivery_status == 2}">배송완료</c:when>
					</c:choose>
                      </div>
                      <div class="card-body pb-1">
                        <div class="row mb-2">
                          <div class="col-3"><img src="../../uploadFiles/titleImage/${orderDetail.productTitleImageVo.title_image_link }" class="img-fluid rounded" alt="..."></div>
                          <div class="col">
                            <div class="row">
                            	<div class="col b-name">${orderDetail.vendorVo.vendor_brand_name }</div>
                            </div>
                            <div class="row">
                            	<div class="col p-name">${orderDetail.productVo.product_name }</div>
                            </div>
                            <div class="row">
                            	<div class="col p-price">
                            		<span class="money">${orderDetail.productVo.product_price}</span>
                            	<span class="text-secondary"> | </span>${orderDetail.orderDetailVo.order_detail_quantity }개
                            	</div>
                            </div>
                          </div>
                        </div>
                        <c:if test="${orderDetail.orderDetailVo.order_detail_delivery_status == 2}">
                         <div class="row">
                           <div class="col d-grid"><button class="btn btn-main py-1 mb-2" data-bs-toggle="offcanvas" data-bs-target="#reviewForm" aria-controls="offcanvasRight">리뷰 작성</button></div>
                           <!-- 리뷰작성 offcanvas -->
                           <div class="offcanvas offcanvas-end" tabindex="-1" id="reviewForm" aria-labelledby="offcanvasRightLabel">
							  <div class="offcanvas-header">
							    <h5 class="offcanvas-title" id="offcanvasRightLabel">상품 리뷰 작성</h5>
							    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
							  </div>
							  <div class="offcanvas-body">
							  	<div class="row mb-4">
		                          <div class="col-4"><img src="../../uploadFiles/titleImage/${orderDetail.productTitleImageVo.title_image_link }" class="img-fluid rounded" alt="..."></div>
							  	  <div class="col">
		                            <div class="row">
		                            	<div class="col b-name">${orderDetail.vendorVo.vendor_brand_name }</div>
		                            </div>
		                            <div class="row">
		                            	<div class="col p-name">${orderDetail.productVo.product_name }</div>
		                            </div>
		                            <div class="row">
		                            	<div class="col p-price">
		                            		<span class="money">${orderDetail.productVo.product_price}</span>
		                            	<span class="text-secondary"> | </span>${orderDetail.orderDetailVo.order_detail_quantity }개
		                            	</div>
		                            </div>
		                          </div>
		        				</div>
		        				<div class="row my-4 ">
		        					<div class="col text-center">
										<div class="review-title">상품은 어떠셨나요?</div>											        					
										<div class="fs-1">
											<i class="bi bi-star-fill star-fill"></i>
											<i class="bi bi-star-fill star-fill"></i>
											<i class="bi bi-star-fill star-fill"></i>
											<i class="bi bi-star-fill star-fill"></i>
											<i class="bi bi-star-fill star-default"></i>
										</div>											        					
		        					</div>
		        				</div>
		        				<div class="row my-2">
		        					<div class="col">
		        						<div class="review-title">사진 첨부(선택)</div>
		        					</div>
		        				</div>
		        				<div class="row row-cols-4">
		        					<div class="col">
		        						<div class="review-box">
			        						<img class="review-img rounded" alt="" src="../resources/review/none(6).jpeg">
		        						</div>
		        					</div>
		        					<div class="col ">
		        						<div class="review-box">
		        							<div class="reviewplus">+</div>
		        						</div>
		        					</div>
		        				</div>
		        				<div class="row mt-4 mb-2">
		        					<div class="col">
		        						<div class="review-title">리뷰 작성</div>
		        					</div>
		        				</div>
		        				<div class="row mt-1 mb-3">
		        					<div class="col">
										  <textarea class="form-control" placeholder="구매하신 상품의 후기를 20자 이상 남겨주시면 다른 구매자들에게도 도움이 됩니다." style="height: 100px;font-size: 0.9rem;"></textarea>
		        					</div>
		        				</div>
		        				<div class="row mb-3">
		        					<div class="col" style="font-size:0.7rem;color:#757575;">
		        						상품과 무관한 사진 및 욕설/비속어가 포함된 리뷰는 고지 없이 삭제될 수 있습니다.<br>
		        						구매하신 상품을 직접 촬영한 사진만 리뷰 등록 및 포인트 지급이 가능합니다.<br>
		        						상품 반품/취소 시, 리뷰 삭제 및 지급 포인트가 회수됩니다.<br>
		        					</div>
		        				</div>
		        				<div class="row">
		        					<div class="col d-grid">
		        						<button class="btn btn-main">등록</button>
		        					</div>
		        				</div>
							  </div>
							</div>
                         </div>
                        </c:if>
                      </div>
                    </div>
                </div>
              </div>
            </c:forEach>
            </div>
          </div>
        </c:forEach>
        </div>
      </div>
   	
   	<jsp:include page="../common/footer.jsp"></jsp:include>		
    
    </div>
    
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  </body>
</html>