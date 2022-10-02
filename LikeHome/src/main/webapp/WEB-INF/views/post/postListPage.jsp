<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<title>Insert title here</title>
<style type="text/css">
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
::-webkit-scrollbar {
	display: none;
}

body{
 font-family: pretendard;
}
.postImage{
	width: 100%;
	height: 80%;
	background-repeat: no-repeat;
	background-size: cover;
}
/*네비바 css*/
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
/*네비바 css*/
</style>

<script type="text/javascript">

	function refreshPostList() {
		var house_type_no = document.getElementById("houseTypeFilter").value
		var house_style_no = document.getElementById("styleTypeFilter").value;
		var space_type_no = document.getElementById("spaceTypeFilter").value;
		var orderby = document.getElementById("orderByFilter").value;
   
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function() {
			
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			
				var postListBox = document.getElementById("PostListBox");
				postListBox.innerHTML = "";
			
				for(var data of result.data){
					
					var imageBox = document.createElement("div");
					imageBox.classList.add("col");
					postListBox.appendChild(imageBox);
					
					var image = document.createElement("img");
					image.classList.add("rounded");
					image.classList.add("img-fluid");
					image.setAttribute("onclick" , "location.href='./postDetailPage?post_no="+data.subPostVo.post_no+"'");
					image.setAttribute("src" , "/uploadFiles/"+data.subPostVo.subpost_image_link);
					imageBox.appendChild(image);
					
					var scrapIcon = document.createElement("i");
					scrapIcon.classList.add("text-opacity-50");
					scrapIcon.classList.add("bi");
					if(data.postScrapVo != null){
						scrapIcon.setAttribute("style","color:#ff6500;position: absolute; bottom: 0%; right: 3%; font-size: 1.2rem;")
					}else{
						scrapIcon.classList.add("text-white");
						scrapIcon.setAttribute("style","position: absolute; bottom: 0%; right: 3%; font-size: 1.2rem;")
					}
					scrapIcon.classList.add("bi-bookmark-fill");
					scrapIcon.setAttribute("onclick","doScrap("+data.subPostVo.post_no+",this)")
					imageBox.appendChild(scrapIcon);
					
					
					
				}
				var script = document.createElement("script");
				script.setAttribute("src","https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js")
				script.setAttribute("integrity","sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D")
				script.setAttribute("crossorigin","anonymous")
				script.setAttribute("async","true")
				postListBox.after(script)
					
				
			}

		}
		xhr.open("post", "./restPostListPage");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("house_type_no=" + house_type_no + "&house_style_no="
				+ house_style_no + "&space_type_no=" + space_type_no
				+ "&orderby=" + orderby);
	};
	
 	function orderFilter(no,name){
 		var x = document.getElementById("orderByFilter")
		x.setAttribute("value",no)
		x.setAttribute("style","color:#ff6500")
		x.innerText = name + " "
		
		var icon = document.createElement("i");
		icon.classList.add("bi");
		icon.classList.add("bi-chevron-down");
		x.appendChild(icon);
		refreshPostList()
 	}
	function houseFilter(no,name){
		var x = document.getElementById("houseTypeFilter")
		x.setAttribute("value",no)
		x.setAttribute("style","color:#ff6500")
		x.innerText = name + " "
		
		var icon = document.createElement("i");
		icon.classList.add("bi");
		icon.classList.add("bi-chevron-down");
		x.appendChild(icon);
		refreshPostList()
	}
	function styleFilter(no,name){
		var x = document.getElementById("styleTypeFilter")
		x.setAttribute("value",no)
		x.setAttribute("style","color:#ff6500")
		x.innerText = name + " "
		var icon = document.createElement("i");
		icon.classList.add("bi");
		icon.classList.add("bi-chevron-down");
		x.appendChild(icon);
		refreshPostList()
	}
	function spaceFilter(no,name){
		var x = document.getElementById("spaceTypeFilter")
		x.setAttribute("value",no)
		x.setAttribute("style","color:#ff6500")
		x.innerText = name + " "
		var icon = document.createElement("i");
		icon.classList.add("bi");
		icon.classList.add("bi-chevron-down");
		x.appendChild(icon);
		refreshPostList()
	}
	
	
	
	
	function orderReset(){
		var x = document.getElementById("orderByFilter")
		x.setAttribute("value",0)
		x.setAttribute("style","color:#404040")
		x.innerText = "정렬"+" "
		var icon = document.createElement("i");
		icon.classList.add("bi");
		icon.classList.add("bi-chevron-down");
		x.appendChild(icon);
	}
	
	function houseReset(){
		var x = document.getElementById("houseTypeFilter")
		x.setAttribute("value",0)
		x.setAttribute("style","color:#404040")
		x.innerText = "주거타입"+" "
		var icon = document.createElement("i");
		icon.classList.add("bi");
		icon.classList.add("bi-chevron-down");
		x.appendChild(icon);
		refreshPostList()
	}
	function styleReset(){
		var x = document.getElementById("styleTypeFilter")
		x.setAttribute("value",0)
		x.setAttribute("style","color:#404040")
		x.innerText = "스타일"+" "
			var icon = document.createElement("i");
		icon.classList.add("bi");
		icon.classList.add("bi-chevron-down");
		x.appendChild(icon);
		refreshPostList()
	}
	function spaceReset(){
		var x = document.getElementById("spaceTypeFilter")
		x.setAttribute("value",0)
		x.setAttribute("style","color:#404040")
		x.innerText = "공간"+" "
		var icon = document.createElement("i");
		icon.classList.add("bi");
		icon.classList.add("bi-chevron-down");
		x.appendChild(icon);
		refreshPostList()
	}
	
	function doScrap(e,x){
	    var post_no = e;
	    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	     xhr.onreadystatechange = function () {
	        if(xhr.readyState == 4 && xhr.status == 200){
	           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
	           
	           if(result.postScrap != null){
	        	   x.setAttribute("style","color:#ff6500; position: absolute; bottom: 0%; right: 3%; font-size: 1.3rem");
	        	   x.classList.remove('text-white')
	           }else{
	        	   x.setAttribute("style","position: absolute; bottom: 0%; right: 3%; font-size: 1.3rem")
	        	   x.classList.add('text-white');
	           }
	           
	           
	        }      
	           
			}
	    xhr.open("post" , "./restPostScarpProcess");
	    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	    xhr.send("post_no=" + post_no); 
	}; 

	
</script>
</head>
<body>
<!-- 네비바 -->
<nav id="navbar" class="pb-0 navbar navbar-light bg-white sticky-top">
  <div class="row container-fluid m-0 pb-1  border-bottom">
    <div class="col-2 p-0">
    <button class="navbar-toggler p-0 ms-0 border-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"
    		style="box-shadow: 0 0 white; border: 0;">
      <span class="navbar-toggler-icon"></span>
    </button>
    </div>
    
    <div class="col-8 fw-bold fs-4" style="text-align:center; color:#ff6500;"><a onclick="location.href='../main/mainPage'">LIKEHOME</a></div>
    <div class="col-2 m-0 p-0">
      <i id="search" class="bi bi-search" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"></i>
      <i id="cart" class="bi bi-cart2"  onclick="location.href='../order/cartPage'"></i>
    </div>
    
  <!-- 오프캔버스 좌측 -->
    <div class="offcanvas offcanvas-start" style="width: 65%" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="color:#ff6500;">LIKEHOME</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="row offcanvas-body p-0 ">
 		<div class="col p-0">
			<div id="navbarIdBox" class="row border-bottom ps-3 pb-3 mb-1 mx-0">
			<c:if test="${!empty customerInfo }">
				<div class="col-2 m-0 pe-0" >
				<c:choose>
                <c:when test="${!empty customerInfo.customer_profile_image }">
                   <img style="width: 100%; height: 100%" class="rounded-circle"
                      src="/uploadFiles/customerIntro/${customerInfo.customer_profile_image }">
                </c:when>
                <c:otherwise>
                   <img style="width: 100%; height: 100%" class="rounded-circle"
                      src="../resources/img/163944985057083845.webp">
                </c:otherwise>
             </c:choose>
				</div>
				<div class="col-auto" style="align-self: center" >${customerInfo.customer_nick }</div>
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
		      	<p class="menu" onclick="location.href='../customer/customerShoppingStatePage'">나의 쇼핑</p>
		      	<p class="menu" onclick="location.href='../order/cartPage'">장바구니</p>
		        <p class="menu" onclick="location.href='../post/postRegisterPage'">사진 올리기</p>
		        <p class="menu" onclick="location.href='../customer/customerCouponListPage'"> 쿠폰</p>
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
        <!-- <button onclick="location.href='../admin/adminLoginPage'" type="button" class="btn btn-primary" >관리자로그인</button> -->
        <!-- 기능 이식 후 삭제 해주세요-->
        
      </div>
    </div>
  </div>
  <!-- 오프캔버스 좌측 -->

  <!-- 네비바 2차 -->
  <div class="py-2 scroll-container border-bottom mt-1 text-center">
	 <div class="menu" onclick="location.href='../main/mainPage'">홈</div>
	 <div class="menu" onclick="location.href='../product/productCategoryPage'">스토어</div>
	 <div class="menu" onclick="location.href='../product/bestProductPage'">베스트</div>
	 <div class="menu" onclick="location.href='../post/followPostListPage'">팔로잉</div>
	 <div class="menu" style="color:#ff6500" onclick="location.href='../post/postListPage'">사진</div>
	 <div class="menu" onclick="location.href='../customer/customerCouponListPage'">쿠폰</div>
	 <div class="menu" onclick="location.href='../admin/helpQnaAnswerPage'">고객센터</div>
	 <div class="menu" onclick="location.href='../main/helpQnaBoardPage'">문의하기</div>
  </div>
  
    <div id="filterBar" class="my-2 scroll-container text-center" style="width: 100%;color: #757575">
    <div class="ms-3 me-2 "  style="width: 8%">
    	<i class="bi bi-funnel-fill"> </i>
    </div>
    <div class="px-0 me-4"  style="width: auto ;color: #404040; flex: 0 0 auto;">
    	<button id="orderByFilter" value="0" class="p-0 btn border-0" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#orderBy"
				aria-controls="offcanvasBottom" style="width: 100%;" >정렬
				<span><i class="bi bi-chevron-down"></i></span>
				</button>
    </div>
    <div class="px-0 me-4" style="width: auto;color: #404040; flex: 0 0 auto;">
    <button id="houseTypeFilter" value="0" class="p-0 btn border-0" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#houseType"
				aria-controls="offcanvasBottom" style="width: 100%"><span>주거타입</span>
				<span><i class="bi bi-chevron-down"></i></span>
				</button>
    </div>
    <div class="px-0 me-4" style="width:auto;color: #404040; flex: 0 0 auto;">
    <button id="styleTypeFilter" value="0" class="p-0 btn border-0" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#StyleType"
				aria-controls="offcanvasBottom" style="width: 100%">
				<span>스타일</span>
				<span><i class="bi bi-chevron-down"></i></span></button>
    	
    </div>
    <div class="px-0 me-4" style="width:auto;color: #404040;flex: 0 0 auto;">
    <button id="spaceTypeFilter" value="0" class="p-0 btn border-0" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#spaceType"
				aria-controls="offcanvasBottom" style="width: 100%">
				<span>공간</span>
				<span><i class="bi bi-chevron-down"></i></span>
				</button>
    </div>
    </div>
    
    
  <!-- 네비바 2차 -->
 
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

	<div id="container" class="container-fluid">
		<div class="row row-cols-2 row-cols-md-6 g-2" id="PostListBox" data-masonry='{"percentPosition": true }'>
		<c:forEach items="${data }" var="subPostData" >
			<div class="col">
				<img onclick="location.href='./postDetailPage?post_no=${subPostData.subPostVo.post_no}'" class="rounded img-fluid" src="/uploadFiles/${subPostData.subPostVo.subpost_image_link }">
				<c:choose>
					<c:when test="${empty subPostData.postScrapVo  }">
						<i onclick="doScrap(${subPostData.subPostVo.post_no},this)" style="position: absolute; bottom: 0%; right: 3%; font-size: 1.3rem" class="text-white text-opacity-50 bi bi-bookmark-fill"></i>
					</c:when>
					<c:otherwise>
						<i onclick="doScrap(${subPostData.subPostVo.post_no},this)" style="color:#ff6500; position: absolute; bottom: 0%; right: 3%; font-size: 1.3rem" class="text-opacity-50 bi bi-bookmark-fill"></i>
					</c:otherwise>
				</c:choose>
				
			</div>
		</c:forEach>

		
		</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>		
	</div>





	<div style="height: auto" class="offcanvas offcanvas-bottom" tabindex="-1" id="orderBy"
		aria-labelledby="offcanvasBottomLabel">
		<div class="offcanvas-header">
			<h5 style="color: #ff6500" class="offcanvas-title" id="offcanvasBottomLabel">정렬</h5>
			<button onclick="orderReset()" type="button" class="btn" data-bs-dismiss="offcanvas" value="0" >초기화</button>
		</div>
		<div class="offcanvas-body small py-0">
			<div onclick="orderFilter(1,this.innerText)"  data-bs-dismiss="offcanvas" class="my-2">최신순</div>
		</div>
		<div class="offcanvas-body small py-0">
			<div onclick="orderFilter(2,this.innerText)" data-bs-dismiss="offcanvas" class="my-2">인기순</div>
		</div>
	</div>




	<div style="height: auto" class="offcanvas offcanvas-bottom" tabindex="-1" id="houseType"
		aria-labelledby="offcanvasBottomLabel">
		<div class="offcanvas-header">
			<h5 style="color: #ff6500" class="offcanvas-title" id="offcanvasBottomLabel">주거타입</h5>
			<button onclick="houseReset()" type="button" class="btn" data-bs-dismiss="offcanvas" value="0" >초기화</button>
		
		</div>
		
			<c:forEach items="${PostCategory.houseTypeDataList }" var="category">
				<div class="offcanvas-body small py-0">
				<div onclick="houseFilter(${category.house_type_no },'${category.house_type_name }')" data-bs-dismiss="offcanvas" class="my-2">
						${category.house_type_name }
				</div>
				</div>
			</c:forEach>
	</div>




	<div style="height: auto" class="offcanvas offcanvas-bottom" tabindex="-1" id="StyleType"
		aria-labelledby="offcanvasBottomLabel">
		<div class="offcanvas-header">
			<h5 style="color: #ff6500" class="offcanvas-title" id="offcanvasBottomLabel">스타일</h5>
			<button onclick="styleReset()" type="button" class="btn" data-bs-dismiss="offcanvas" value="0" >초기화</button>
		
		</div>
			<c:forEach items="${PostCategory.houseStyleDataList }" var="category">
				<div class="offcanvas-body small py-0">
				<div onclick="styleFilter(${category.house_style_no },'${category.house_style_name }')" data-bs-dismiss="offcanvas" class="my-2"  >
					${category.house_style_name }
				</div>
				</div>
			</c:forEach>
	</div>




	<div style="height: auto" class="offcanvas offcanvas-bottom" tabindex="-1" id="spaceType"
		aria-labelledby="offcanvasBottomLabel">
			<div class="offcanvas-header">
			<h5 style="color: #ff6500" class="offcanvas-title" id="offcanvasBottomLabel">공간</h5>
			<button onclick="spaceReset()" type="button" class="btn" data-bs-dismiss="offcanvas" value="0" >초기화</button>
		
		</div>
			<c:forEach items="${PostCategory.spaceTypeDataList }" var="category">
				<div class="offcanvas-body small py-0">
				<div  onclick="spaceFilter(${category.space_type_no },'${category.space_type_name}' )" data-bs-dismiss="offcanvas" class="my-2">
						${category.space_type_name }
				</div>
				</div>
			</c:forEach>
		
	</div>

<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>