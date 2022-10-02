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
	 <div class="menu" onclick="location.href='customerMyCouponPage'">쿠폰</div>
	 <div class="menu" onclick="location.href='customerShoppingPointPage'">포인트</div>
	 <div class="menu" onclick="location.href='customerShoppingGradePage'">구매등급</div>
	 <div class="menu" onclick="location.href='customerShoppingHelpPage'">고객센터</div>
	 <div class="menu" style="color:#ff6500;" onclick="location.href='customerMyHelpQnaPage'">문의하기</div>
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
                      src="${data.customerVo.customer_profile_image }">
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

    <c:if test="${authority == 0 }">
  	    <div class="row p-2">
   		  <button class="btn btn-outline-light" style="color:#ff6500; border-color: #ff6500;" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom">
	 	  문의하기
		  </button>
  		</div>
	</c:if>
	
<div class="row m-0 mb-3">
     <div class="col">
     
      <%--나의 문의 내역 --%>
      <c:forEach items="${dataList }" var="data">
      <c:choose>
      <c:when test="${data.helpQnaVo.customer_no != customerInfo.customer_no}">
		<div class="row" style="color:#757575; margin-top: 10rem; margin-bottom:10rem; text-align: center;">
	  	  <div class="col">문의 내역이 없습니다.</div>
		</div>      
      </c:when>
      
      <c:otherwise>
       <div class="row border-bottom mb-3">
         <div class="col">
	       <div class="row mb-2" style="justify-content:space-between; ">
	         <div class="col col-5 pe-0">
		    <c:choose>
				      	<c:when test="${data.helpQnaVo.help_qna_answer_content == null }">
						  <span class="p-1 me-1" style="color:#757575; background-color: #EAEDEF; font-size: 0.7rem; border-radius: 0.5rem;">답변대기</span>
						</c:when>  	
						<c:otherwise>
					  	  <span class="p-1 me-1" style="color: white; background-color: #ff6500; font-size: 0.7rem; border-radius: 0.5rem;">답변완료</span>
						</c:otherwise>
					  </c:choose>   
			<a style="font-weight: bold; font-size: 0.9rem;" >${data.helpQnaTypeVo.help_qna_type_name }</a>
	         </div>
	         <div class="col-4 text-end text-secondary" style="font-size: 0.8rem; align-self: center;">
			   <fmt:formatDate value="${data.helpQnaVo.help_qna_writedate }"/>
			 </div>
	       </div>
	       
	       <div class="row mb-2">
	         <div class="col" style="color:#ff6500; font-weight: bold;">
	           <i class="bi bi-quora me-1"></i>${data.helpQnaVo.help_qna_title }</div>
	       </div>
	  
	       <div class="row mb-2">
	         <div class="col" style="font-weight: bold; font-size: 0.9rem;">${data.helpQnaVo.help_qna_content }</div>
	       </div>
	  	
	  	<c:if test="${!empty data.helpQnaVo.help_qna_answer_content }">
		  <div class="row cardAnswer p-3 mb-3"  style="background-color: #F7F9FA">
		    <div class="col">
		      <div class="row mb-2">
		        <div class="col px-0">${data.helpQnaVo.help_qna_answer_content }</div>
		      </div>
		      <div class="row">
		        <div class="col text-secondary px-0" style="font-size: 0.9rem;">
		        <fmt:formatDate value="${data.helpQnaVo.help_qna_answerdate }"/>
		        </div>
		      </div>
		    </div>
		  </div>
	  </c:if>
	       <div class="row">
	         <div class="col ps-1 mb-2 ms-2">
	           <button type="button" class="btn btn-outline-secondary py-1" style="font-size: 0.8rem; border-color: #C2C8CC;">삭제</button>
	         </div>
	       </div>
         </div>
       </div>
       </c:otherwise>
      </c:choose>
       </c:forEach>
     
 

	</div>

</div>


<jsp:include page="../common/footer.jsp"></jsp:include>

</div>





<!--  오프캔버스 글쓰기 -->
<div class="offcanvas offcanvas-bottom" style="height:80%;" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
  <div class="row offcanvas-header border-bottom">
    <div class="col"><h5 class="text-center fw-bold p-0 m-0 ">문의하기</h5></div>
  </div>
  <div class="offcanvas-body">
    <form action="../main/helpQnaWriteProcess" method="post">
     <div class="row">
       <div class="col mb-3">
         <div class="row">
           <div class="col fw-bold mb-2">문의 유형</div>
         </div>
         <div class="row row-cols-3 m-0">
           <div class="col p-0">
             <input type="radio" class="btn-check" name="help_qna_type_no" value="1" id="option1" autocomplete="off">
			 <label class="btn btn-outline-secondary" style="box-shadow: 0 0 white; width: 100%; border-color: #ced4da; border-right: unset; border-bottom: unset; border-bottom-right-radius: unset; border-top-right-radius: unset; border-bottom-left-radius: unset;" for="option1">
			 상품</label>
			 </div>
			<div class="col p-0">
			 <input type="radio" class="btn-check" name="help_qna_type_no" value="2" id="option2" autocomplete="off">
			 <label class="btn btn-outline-secondary" style="box-shadow: 0 0 white; width: 100%; border-color: #ced4da; border-right: unset; border-bottom: unset; border-radius: unset;" for="option2">
			 배송</label>
			 </div>
			<div class="col p-0">
			 <input type="radio" class="btn-check" name="help_qna_type_no" value="3" id="option3" autocomplete="off">
			 <label class="btn btn-outline-secondary" style="box-shadow: 0 0 white; width: 100%; border-color: #ced4da; border-bottom: unset; border-top-left-radius: unset; border-bottom-left-radius: unset; border-bottom-right-radius: unset;"  for="option3">
			 주문</label>
			</div>
		  <div class="col p-0">
			 <input type="radio" class="btn-check" name="help_qna_type_no" value="4" id="option4" autocomplete="off">
			 <label class="btn btn-outline-secondary" style="box-shadow: 0 0 white; width: 100%; border-color: #ced4da; border-right: unset; border-top-left-radius: unset;  border-top-right-radius: unset; border-bottom-right-radius: unset;" for="option4">
			 결제</label>
			 </div>
		  <div class="col p-0">
			 <input type="radio" class="btn-check" name="help_qna_type_no" value="5" id="option5" autocomplete="off">
			 <label class="btn btn-outline-secondary" style="box-shadow: 0 0 white; width: 100%; border-color: #ced4da; border-right:none; border-top-left-radius: unset;  border-radius: unset;" for="option5">
			 회원</label>
			 </div>
		<div class="col p-0">
			 <input type="radio" class="btn-check" name="help_qna_type_no" value="6" id="option6" autocomplete="off">
			 <label class="btn btn-outline-secondary" style="box-shadow: 0 0 white; width: 100%; border-color: #ced4da;  border-top-left-radius: unset; border-top-right-radius: unset; border-bottom-left-radius: unset;" for="option6">
			 기타</label>
		  </div>
		</div>
       </div>
	 </div>
      
        <div class="row">
        	<div class="col fw-bold mb-2">제목</div>
        </div>
        <div class="row">
      	  <div class="col mb-3">
      	    <input type="text" name="help_qna_title" class="form-control" placeholder="제목을 입력해주세요">
       	  </div>
      	</div>
      	
       <div class="row">
        	<div class="col  fw-bold mb-2">내용</div>
       </div>
	    <div class="col mb-3">
       	  <textarea class="form-control" name="help_qna_content" placeholder="문의 내용을 입력해주세요"></textarea>
       	  <input type="hidden" name="customer_no" value=${customerInfo.customer_no }>
      	</div>
      	
      	<div class="row">
      	  <div class="col mb-3" style="font-size: 0.8rem; color: #757575;">
      	  - 문의내용에 대한 답변은 ‘마이페이지 > 나의 쇼핑 > 나의 문의내역’ 에서 확인 가능합니다.
      	  <br>
      	  - 상품과 관련 없거나 부적합한 내용을 기재하시는 경우, 사전 고지 없이 삭제 또는 차단될 수 있습니다.
      	  </div>
      	</div>
      	
          <div class="row">
      <div class="col d-grid">
        <button type="button" class="btn btn-primary fw-bold" style="color: #757575; background-color: #ededed; border-color: #ededed;" data-bs-dismiss="offcanvas" aria-label="Close">취소</button>
      </div>
      <div class="col d-grid">
        <button type="submit" class="btn btn-primary" style="box-shadow: 0 0 white; background-color: #ff6500; border-color: #ff6500;">완료</button>
      </div>
      </div>
      </form>
    </div> 
    </div> 
<!--  오프캔버스 글쓰기 -->



<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>