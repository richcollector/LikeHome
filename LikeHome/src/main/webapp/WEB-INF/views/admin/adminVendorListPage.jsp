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
	<title>판매자 리스트</title>
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

	function vendorStateChange(sel,vendor_no){
		
		var vendor_state = sel.value;

		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		
		xhr.open("post", "../admin/updateByVendorState");	//리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send("vendor_state=" + vendor_state + "&vendor_no=" + vendor_no);	//AJAX로 리퀘스트함...
		
		refreshVendor(vendor_no);
	}

	function refreshVendor(vendor_no){

		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
				console.log(jsonObj)
				
				var vendorStateBox = document.getElementById("vendorState" + vendor_no);
				vendorStateBox.innerHTML = "";

				if(jsonObj == false){
					var state1 = document.createElement("span");
					state1.innerText = "승인대기";
					state1.classList = "text-success";
					vendorStateBox.appendChild(state1);
				}

				if(jsonObj == true){
					var state2 = document.createElement("span");
					state2.innerText = "승인완료";
					state2.classList = "text-primary";
					vendorStateBox.appendChild(state2);
				}
			}
		}
	
		
		xhr.open("get", "../admin/selectByVendorState?vendor_no=" + vendor_no);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...

	}
    
    </script>

  </head>
  <body class="bg-light">
	<div class="container-fluid px-3">
	
	<!-- 뒤로가기 -->
	<div class="row mt-3">
		<div class="col fs-1">
			<a href="./adminMainPage"><i class="bi bi-arrow-left-square" style="color: #ff6500;"></i></a>
		</div>
	</div>
	
	<!-- 검색 -->
	<div class="row pe-2 my-3">
		<div class="col">
			<form action="./adminVendorListPage" method="get">
				<div class="row">
				<div class="col pe-0">
					<select name="searchType" class="form-control">
						<option value="vendor_brand_name">브랜드</option>
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
		
		<c:forEach items="${vendorVo }" var="data">
		<div class = "row border rounded bg-white my-3 py-2 mx-0">
			<div class="col">
				<div class = "row">
					<div class = "col">
					<span class="fs-5 fw-bold">${data.vendor_brand_name }</span>
					</div> 
				</div>
				<div class = "row">
					<div class = "col">
						${data.vendor_business_number }
					</div>
				</div>
				<div class = "row">
					<div class = "col">
						${data.vendor_email }
					</div>
				</div>
				<div class = "row">
					<div class = "col">
						${data.vendor_phone }
					</div>
				</div>
				<div class = "row">
					<div class = "col">
						${data.vendor_address }
					</div>
				</div>
				<div class = "row">
					<div id="vendorState${data.vendor_no }" class = "col-3 pe-0">
					<c:choose>
						<c:when test="${data.vendor_state == 'F' }">
							<span class="text-success">승인대기</span>
						</c:when>
						<c:when test="${data.vendor_state == 'T' }">
							<span class="text-primary">승인완료</span>
						</c:when>
					</c:choose>
					</div>
					<div class = "col-5 py-0 ps-0">
						<select onchange="vendorStateChange(this , ${data.vendor_no })" name="vendor_state" class="form-control py-0">
				      		<c:choose>
					      		<c:when test="${data.vendor_state == 'F' }">
						      		<option value="F" selected>승인대기</option>
						      		<option value="T">승인완료</option>
					      		</c:when>
					      		<c:when test="${data.vendor_state == 'T' }">
						      		<option value="F">승인대기</option>
						      		<option value="T" selected>승인완료</option>
					      		</c:when>
				      		</c:choose>
				      	</select>
					</div>
				</div>
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
   				    		<li class="page-item"><a class="page-link" href="./adminVendorListPage?pageNum=${startPage - 1 }${additionalParam}">&lt;</a></li>
				  		</c:otherwise>
				  	</c:choose>
				  	
				  	<c:forEach begin="${startPage }" end="${endPage }" var="i">
				  		<c:choose>
				  			<c:when test="${i == currentPageNum }">
  							    <li class="page-item active"><a class="page-link" href="./adminVendorListPage?pageNum=${i }${additionalParam}">${i }</a></li>
				  			</c:when>
				  			<c:otherwise>
  							    <li class="page-item"><a class="page-link" href="./adminVendorListPage?pageNum=${i }${additionalParam}">${i }</a></li>
				  			</c:otherwise>
				  		</c:choose>
				  	</c:forEach>
				  	
				  	<c:choose>
				  		<c:when test="${endPage >= totalPageCount }">
  						    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
				  		</c:when>
				  		<c:otherwise>
  						    <li class="page-item"><a class="page-link" href="./adminVendorListPage?pageNum=${endPage+1 }${additionalParam}">&gt;</a></li>
				  		</c:otherwise>
				  	</c:choose>
				  </ul>
				</nav>
			</div>
		</div>
		
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>



  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 
  </body>
</html>