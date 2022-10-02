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
<title>회원정보 수정</title>
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

	function doSumit(){
	    const form = document.getElementById("formID");
	    
	    const nickInput = document.getElementById("nick");
	    const birthInput = document.getElementById("birth");
	    const introInput = document.getElementById("intro");
	    const imageInput = document.getElementById("image");

	    
	    if(nickInput.value == ""){
	       alert("닉네임을 입력하셔야 합니다.");
	       return;
	    }
	    
	    if(birthInput.value == ""){
	       alert("생년월일을 입력하셔야 합니다.");
	       return;
	    }
	    
	    if(introInput.value == ""){
	       alert("자기소개를 넣어주셔야 합니다.");
	       return;
	    }
	    
	    if(imageInput.value == ""){
	       alert("프로필 사진을 넣어주셔야 합니다.");
	       return;
	    }
	    
	    form.submit();
	 }
 
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
	 <div class="col-auto" onclick="location.href='customerShoppingStatePage'">나의 쇼핑</div>
	 <div class="col-auto" style="color:#ff6500;" onclick="location.href='customerInfoSettingPage'">설정</div>
  </div>  
<!-- 네비바 2차 -->

<!-- 네비바 3차 -->
  <div class="row text-center m-0 mt-1 py-2 justify-content-center" style="width:100%">
	 <div class="col-auto" style="color:#ff6500;"  onclick="location.href='../customer/customerInfoSettingPage'">회원정보 수정</div>
	 <div class="col-auto" onclick="location.href='customerPasswordUpdatePage'">비밀번호 변경</div>
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
                      src="${customerInfo.customer_profile_image }">
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
		        <p class="menu" onclick="location.href='#'">홈</p>
		        <p class="menu" onclick="location.href='#'">스토어</p>
		        <p class="menu" onclick="location.href='#'">베스트</p>
		        <p class="menu" onclick="location.href='../post/followPostListPage'">팔로잉</p>
		        <p class="menu" onclick="location.href='#'">사진</p>
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

     <div class="container-fluid px-3 mb-4">
        
        <div class="row border rounded mx-0">
     	<form id="formID" action="updateCustomerProcess" method="post" enctype="multipart/form-data">

         <div class="mt-2 mb-4">
             <label for="email" class="form-label fw-bold">이메일 번호</label><br>
             <c:if test="${!empty customerInfo.customer_email}">
             <span>${customerInfo.customer_email }</span>
             <input name="customer_email" value="${customerInfo.customer_email }" type="hidden" class="form-control">
             </c:if>
              <c:if test="${empty customerInfo.customer_email}">
              <span class="email">로그인 해주셔야합니다.</span>
             </c:if>
         </div>
         
         <div class="mb-4">
             <label for="nick" class="form-label fw-bold mb-0">닉네임</label><br>
             <label for="nick" class="form-label"><span style="font-size: 0.75em;">다른 닉네임과 겹치지 않게 입력해주세요.</span></label>
              <input id="nick" name="customer_nick" type="text" class="form-control" placeholder="닉네임을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         
         <div class="mb-4">
             <label for="birth" class="form-label fw-bold">생년월일</label>
              <input id="birth" name="customer_birth" type="date" class="form-control" placeholder="생일을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         
         <div class="mb-2">
             <label for="gender" class="form-label fw-bold">성별&nbsp;</label>
              <input id="gender" name="customer_gender" type="radio" value="M" checked>&nbsp;남
              <input name="customer_gender" type="radio" value="F">&nbsp;여
         </div>
         
         <div class="input-group flex-nowrap mb-3">
              <input name="customer_state" value="T" type="hidden" aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         
         <div class="mb-4">
             <label for="intro" class="form-label fw-bold">자기소개</label>
              <input id="intro" name="customer_intro" type="text" class="form-control" placeholder="자기소개를 넣어주세요." aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         
         <div class="mb-4">
             <label for="image" class="form-label fw-bold">프로필 사진</label>
              <input id="image" name="profile_image" multiple accept="image/*" type="file" class="form-control" placeholder="프로필 사진을 넣어주세요." aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         
         <input id="image" name="ex_profile_image" value="${customerInfo.customer_profile_image }" type="hidden" class="form-control">
         
         
         <div class="input-group flex-nowrap">
              <input name="customer_total_point" value="0" type="hidden" aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         
         <div class="input-group flex-nowrap">
              <input name="customer_grade" value="1" type="hidden" aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         
         <div class="d-grid mb-3">
         <input type="button" value="회원정보 수정" onclick="doSumit()" class="btn" style="background-color: #ff6500; color: white;">
         </div>
         
    	</form>
    	</div>
	</div>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>