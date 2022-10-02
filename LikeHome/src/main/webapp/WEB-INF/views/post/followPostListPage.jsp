<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<style>
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");

body {
    font-family: Pretendard;
}

#wrapper {
   max-width: 800px;
   margin: 0 auto;
}
#cardHeadBar {
   margin: 0 auto;
   margin-top: 10px;
   margin-bottom: 10px;
   padding: 0px;
   overflow: hidden;
}

#cardHeadBar_id{
   padding: 0px;
   font-weight: bold;
   font-size: 1rem;
   
}

#cardHeadBar_witedate{
   font-size: 0.8rem;
   padding: 0px;
   text-align-last:right
}

#cardHeadBar_menu{
   font-size: x-large;   
   float: right;
   text-align-last:right
}

#iconBox{
   font-size: 0.8rem;
   margin-bottom: 15px;
}

.cardContent{
   overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}

.cardContent.open{
   max-height: 100%;
   font-size: 10rem;
   
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

#likeHeart${data.postVo.post_no }{
   color:#ff6500;
}

</style>
<script type="text/javascript">

function doLike(e){
    var post_no = e;
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
           //refreshPostList()
           //location.href="./followPostListPage"
           refreshLikeCount(e);
           refreshLikeHeart(e);
           
           }
        }      
    xhr.open("post" , "./restPostLikeProcess");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("post_no=" + post_no); 
};

function refreshLikeCount(e){
   var post_no = e;
   var xhr = new XMLHttpRequest(); //AJAX 객체 생성
   xhr.onreadystatechange = function () {
      if(xhr.readyState == 4 && xhr.status == 200){
         var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
         
         var likeCountBox = document.getElementById("likeCount" + post_no);
         likeCountBox.innerText = result.data;
      
      }
   }
   xhr.open("get" , "./restgetTotalPostLikeCount?post_no=" + post_no); //리퀘스트 세팅..
   //xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
   xhr.send(); //AJAX로 리퀘스트함..
};

function refreshLikeHeart(e){
   var post_no = e;
   var xhr = new XMLHttpRequest(); //AJAX 객체 생성
   xhr.onreadystatechange = function () {
      if(xhr.readyState == 4 && xhr.status == 200){
         var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
         
         var heartBox = document.getElementById("likeHeart" + post_no);
         
         if(result.data == true){
            heartBox.setAttribute("class" , "bi bi-heart-fill");
            heartBox.setAttribute("style" , "color:#ff6500; font-size: 1.3rem;");
         }else{
            heartBox.setAttribute("class" , "bi bi-heart");
            heartBox.setAttribute("style" , "color:#000000; font-size: 1.3rem;");
         }            
      }
   }
   
   xhr.open("get" , "./restcheckPostLike?post_no=" + post_no); //리퀘스트 세팅..
   //xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
   xhr.send(); //AJAX로 리퀘스트함..   
};

function doScrap(e){
    var post_no = e;
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
           //refreshPostList()
           location.href="./followPostListPage"
        }      
           
      }
    xhr.open("post" , "./restPostScarpProcess");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("post_no=" + post_no); 
}; 

function doFollw(e){
    var customer_no = e;
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
           refreshPostList()
        }      
           
      }
    xhr.open("post" , "../customer/restFollowProcess");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("customer_no=" + customer_no); 
}; 

function deletePost(e){
   var post_no = e;
   console.log(post_no);
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
           //refreshPostList()
           location.href="./followPostListPage"
        }      
           
      }
    xhr.open("post" , "../post/restPostDeleteProcess");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("post_no=" + post_no); 
}; 

function contentOpen(){
   var content = document.getElementsByClassName("cardContent")[0];
   content.setAttribute("class" , "open");
}
 

window.addEventListener("wheel" , function (e){
   
   if (e.deltaY > 0 ){
      document.getElementById("navbar").style.visibility = "hidden";
   } else {
      document.getElementById("navbar").style.visibility = "visible";
   }
});
</script>
</head>
<body id="body" class="bg-light">
<%----<div class="container-fluid">
     <jsp:include page="../common/header.jsp"></jsp:include>
</div> --%>

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
                      src="/uploadFiles/customerIntro/${customerInfo.customer_profile_image }">
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
              <p class="menu" onclick="location.href='#'">홈</p>
              <p class="menu" onclick="location.href='#'">스토어</p>
              <p class="menu" onclick="location.href='#'">베스트</p>
              <p class="menu" onclick="location.href='../post/followPostListPage'">팔로잉</p>
              <p class="menu" onclick="location.href='#'">사진</p>
            </div>
          </div>
          <div class="row">
            <div class="col mt-2">
              <p class="menu" onclick="location.href='#'">마이페이지</p>
               <p class="menu" onclick="location.href='#'">나의 쇼핑</p>
               <p class="menu" onclick="location.href='../order/cartPage'">장바구니</p>
              <p class="menu" onclick="location.href='../post/postRegisterPage'">사진 올리기</p>
              <p class="menu" onclick="location.href='#'">쿠폰</p>
              <p class="menu" onclick="location.href='#'">고객센터</p>
              <p class="menu" onclick="location.href='../main/helpQnaBoardPage'">문의하기</p>
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
      
      <%--<!-- 기능 이식 후 삭제 해주세요-->
      <button onclick="location.href='../customer/customerLoginPage'" type="button" class="btn btn-primary" >일반회원로그인</button>
        <button onclick="location.href='../vendor/vendorLoginPage'" type="button" class="btn btn-primary" >사업자로그인</button>
        <button onclick="location.href='../admin/adminLoginPage'" type="button" class="btn btn-primary" >관리자로그인</button>
        <!-- 기능 이식 후 삭제 해주세요-->--%>
        
      </div>
    </div>
  </div>
  <!-- 오프캔버스 좌측 -->

  <!-- 네비바 2차 -->
  <div class="scroll-container mt-1 py-2 text-center">
    <div class="menu">홈</div>
    <div class="menu">스토어</div>
    <div class="menu">베스트</div>
    <div class="menu">팔로잉</div>
    <div class="menu">사진</div>
    <div class="menu">쿠폰</div>
    <div class="menu">고객센터</div>
    <div class="menu">문의하기</div>
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
<!-- 네비바 -->


<!-- adBox -->
<div class="row mb-1"><img src="../resources/img/banner.png" ></div>
<!-- adBox -->

<!-- post -->
<div id="wrapper ">
   <div class="row row-cols-1 g-3">
     <c:forEach items="${FollowPostdata }" var="data">
  <div class="col">
    <div class="card">
       <div id="card-head">
          <div id="cardHeadBar" class="row">
             <div id="cardHeadBar_title_image" class="col-2">
                     <c:choose>
                        <c:when test="${!empty data.customerVo.customer_profile_image }">
                           <img style="width: 100%; height: 100%" class="rounded-circle"
                              src="/uploadFiles/customerIntro/${data.customerVo.customer_profile_image }">
                        </c:when>
                        <c:otherwise>
                           <img style="width: 100%; height: 100%" class="rounded-circle"
                              src="../resources/img/home1.png">
                        </c:otherwise>
                     </c:choose>
             </div>
             <div id="cardHeadBar_id" class="col align-self-center">${data.customerVo.customer_nick }</div>
             <div id="cardHeadBar_witedate" class="col align-self-center text-secondary">
             
             <fmt:formatDate value="${data.postVo.post_write_date }" type="date" dateStyle="short" />
             </div>
             <div id="cardHeadBar_menu" class="col-2 align-self-center">
                <i class="bi bi-three-dots" data-bs-toggle="modal" data-bs-target="#exampleModal"></i>
             </div>
          </div>
       </div>
       <a href="postDetailPage?post_no=${data.postVo.post_no }">
       <img class="img-rounded img-fluid"
            style="max-width: 100%; height: auto;"
            src="/uploadFiles/${data.subPostVo.subpost_image_link }"></a>
      <div class="card-body">
        <p class="cardContent" onclick="contentOpen()">${data.subPostVo.subpost_content }</p>
      </div>
      <div id="iconBox" class="row">
        <div class="col text-center ">
        <c:choose>
          <c:when test="${!empty data.postLikeVo}">
            <i id="likeHeart${data.postVo.post_no }" class="postHeart bi bi-heart-fill" style="font-size: 1.3rem; color:#ff6500;" onclick="doLike(${data.postVo.post_no})"></i>
          </c:when>
          <c:otherwise>
            <i id="likeHeart${data.postVo.post_no }" class="postHeart bi bi-heart" style="font-size: 1.3rem;" onclick="doLike(${data.postVo.post_no})"></i>
          </c:otherwise>
        </c:choose>
        
          <c:if test="${data.postLikeCount != 0 }">
            <span id="likeCount${data.postVo.post_no }" class="m-1">${data.postLikeCount }</span>
          </c:if>
        <span id="likeCount${data.postVo.post_no }" class="m-1"></span>
        
        </div>
        <div class="col text-center">
        <c:choose>
        <c:when test="${!empty data.postScrapVo }">
          <i class="bi bi-bookmark-fill center" style="font-size: 1.3rem; color:#ff6500;" onclick="doScrap(${data.postVo.post_no })"></i><span class="m-1">${data.postScrapCount }</span>
        </c:when>
        <c:otherwise>
          <i class="bi bi-bookmark center" style="font-size: 1.3rem" onclick="doScrap(${data.postVo.post_no })"></i>
          <c:if test="${data.postScrapCount != 0 }">
          <span class="m-1">${data.postScrapCount }</span>
          </c:if>
          <span class="m-1"></span>
        </c:otherwise>
       </c:choose>
       </div>
       
       <div class="col text-center">
         <i class="bi bi-chat-dots" style="font-size: 1.3rem" onclick="location.href='postDetailPage?post_no=${data.postVo.post_no}#commentBox'"></i>
         <c:if test="${data.postCommentCount != 0 }">
         <span class="m-1">${data.postCommentCount }</span>
         </c:if>
         <span class="m-1"></span>
       </div>
       <div class="col text-center">
         <i id="share" class="bi bi-share" style="font-size:1.3rem;"></i>
       </div>
      </div>
    </div>
  </div>
<!-- post -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <c:if test="${data.customerVo.customer_no == customerInfo.customer_no }">
        <div class="modal-body text-center border-bottom">수정</div>
        <div class="modal-body text-center border-bottom"><span onclick="deletePost(${data.postVo.post_no })">삭제</span></div>
      </c:if>
      <c:if test="${!empty data.customerVo.customer_no }">
        <div class="modal-body text-center border-bottom text-danger">신고하기</div>
      </c:if>
        <div class="modal-body text-center border-bottom" data-bs-dismiss="modal" aria-label="Close">취소</div>
    </div>
  </div>
</div>
<!-- Modal -->
  </c:forEach>
</div>
</div>

   <jsp:include page="../common/footer.jsp"></jsp:include>      


   <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>