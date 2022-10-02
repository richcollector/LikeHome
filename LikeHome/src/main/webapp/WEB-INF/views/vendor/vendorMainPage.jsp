<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	
	<title>판매자 메인</title>
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
    
    <script>
    
    function doSumit(){
    	
		const form = document.getElementById("formID");
		
		const pwInput = document.getElementById("pw");
		const emailInput = document.getElementById("email");
		const phoneInput = document.getElementById("phone");
		const addressInput = document.getElementById("address");
		
		
		var pwAlertBox = document.getElementById("pwAlert");
		pwAlertBox.innerHTML = "";
		
		var emailAlertBox = document.getElementById("emailAlert");
		emailAlertBox.innerHTML = "";
		
		var phoneAlertBox = document.getElementById("phoneAlert");
		phoneAlertBox.innerHTML = "";
		
		var addressAlertBox = document.getElementById("addressAlert");
		addressAlertBox.innerHTML = "";
		
		if(pwInput.value == ""){
			pwAlertBox.innerText = "비밀번호를 입력해주셔야 합니다.";
			pwAlertBox.classList.add("text-danger");
			pwInput.focus();
			return;
		}else{
			pwAlertBox.innerHTML = "";
		}
		
		
		if(emailInput.value == ""){
			emailAlertBox.innerText = "이메일을 입력해주셔야 합니다.";
			emailAlertBox.classList.add("text-danger");
			emailInput.focus();
			return;
		}else{
			emailAlertBox.innerHTML = "";
		}
		
		
		if(phoneInput.value == ""){
			phoneAlertBox.innerText = "전화번호를 입력해주셔야 합니다.";
			phoneAlertBox.classList.add("text-danger");
			phoneInput.focus();
			return;
		}else{
			phoneAlertBox.innerHTML = "";
		}
		
		
		if(addressInput.value == ""){
			addressAlertBox.innerText = "주소를 입력해주셔야 합니다.";
			addressAlertBox.classList.add("text-danger");
			addressInput.focus();
			return;
		}else{
			addressAlertBox.innerHTML = "";
		}
		
		form.submit();
    }
    
	   function checkPassword() {
			const pwInput = document.getElementById("pw");
			const passwordConfirmInput = document.getElementById("passwordConfirm")
			
			var pwAlertBox = document.getElementById("pwAlert");
			pwAlertBox.innerHTML = "";
		   
			//특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 ( 3 가지 조합)
			const passwordReg = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
			if(!passwordReg.test(pwInput.value)){
				pwAlertBox.innerText = "특수문자와 숫자를 포함하여 8~15자리를 입력해주세요.";
				pwAlertBox.classList.add("text-danger");
				pwInput.value = "";
				passwordConfirmInput.value = "";
				pwInput.focus();
				return;
			}else{
				pwAlertBox.innerHTML = "";
			}
			
			
			if(pwInput.value != passwordConfirmInput.value){
				pwAlertBox.innerText = "비밀번호가 확인되지 않았습니다.";
				pwAlertBox.classList.remove("text-primary");
				pwAlertBox.classList.add("text-danger");
			}else{
				pwAlertBox.innerText = "비밀번호가 확인 되었습니다.";
				pwAlertBox.classList.remove("text-danger");
				pwAlertBox.classList.add("text-primary");
				passwordConfirmInput.innerHTML = "";
			}
	   }
    
    function inputVendorInfo(){
    	
    	var emailInput = document.getElementById("email");
		emailInput.setAttribute("name","vendor_email");
		emailInput.setAttribute("type","text");
		emailInput.classList.add("form-control");
		emailInput.setAttribute("placeholder","이메일을 입력해주세요.")
		emailInput.value = "${vendorInfo.vendor_email}";
		emailInput.setAttribute("aria-label","Username")
		emailInput.setAttribute("aria-describedby","addon-wrapping")
		
		var phoneInput = document.getElementById("phone");
		phoneInput.setAttribute("name","vendor_phone");
		phoneInput.setAttribute("type","text");
		phoneInput.classList.add("form-control");
		phoneInput.setAttribute("placeholder","전화번호를 입력해주세요.")
		phoneInput.value = "${vendorInfo.vendor_phone}";
		phoneInput.setAttribute("aria-label","Username")
		phoneInput.setAttribute("aria-describedby","addon-wrapping")
		
		var addressInput = document.getElementById("address");
		addressInput.setAttribute("name","vendor_address");
		addressInput.setAttribute("type","text");
		addressInput.classList.add("form-control");
		addressInput.setAttribute("placeholder","주소를 입력해주세요.")
		addressInput.value = "${vendorInfo.vendor_address}";
		addressInput.setAttribute("aria-label","Username")
		addressInput.setAttribute("aria-describedby","addon-wrapping")
    	


    }

    window.addEventListener("DOMContentLoaded" , function(){
      inputVendorInfo();
		});
    	
    </script>

  </head>
  <body>

  	<div class="container-fluid">

	  	<div class="row mb-3">
	  		<div class="col-5 fs-1">
				<i class="bi bi-list" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions"></i>
			</div>
		</div>
  	
  		<div class="row mb-5">
	  		<div class="col-8 pe-0">
	  			<span class="fs-3 fw-bold">${vendorInfo.vendor_brand_name } 님,<br>
	  			 안녕하세요!</span>
	  		</div>
  			
  			<div class="col text-end ps-0 pt-1">
  			<!-- Button trigger modal -->
  			<button type="button" class="btn btn-outline py-0" style="border-color: #ff6500; color: #ff6500;" data-bs-toggle="modal" data-bs-target="#exampleModal">
  			프로필 수정
			</button>
  			</div>
  			<span>* 정산일은 매월 25일입니다.</span>
  		</div>
  		
  		
  		<div class="row mb-4">
  			<div class="col-8">
  				<span class="fs-5 fw-bold">이번달 판매 순위</span>
  			</div>
  			
  			<div class="col text-end ps-0">
  			<!-- Button trigger modal -->
  			<button type="button" class="btn btn-outline py-0" style="border-color: #ff6500; color: #ff6500;" data-bs-toggle="modal" data-bs-target="#exampleModal1">
  			전체보기
			</button>
  			</div>

  		</div>
  		
  		<div class="row px-3 mb-5">
  		
  		<table class="table text-center">
		  <thead>
		    <tr class="bg-secondary bg-opacity-25">
		      <th scope="col" style="width: 15%;">NO</th>
		      <th scope="col">상품명</th>
		      <th scope="col" style="width: 25%;">총 판매량</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${popularProduct }" var="product" begin="0" end="4">
			   		<tr>
				      <th scope="row">${product.no }</th>
				      <td>${product.productVo.product_name }</td>
				      <td>${product.productCount }</td>
				    </tr>
		    </c:forEach>
		  </tbody>
		</table>
  		<span>* 상품 판매량 순으로 정렬 하였습니다.</span>
  		</div>
  		
  		<div class="row mb-4">
  			<div class="col-8">
  				<span class="fs-5 fw-bold">스크랩 순위</span>
  			</div>
  			<div class="col text-end ps-0">
  			<!-- Button trigger modal -->
  			<button type="button" class="btn btn-outline py-0" style="border-color: #ff6500; color: #ff6500;" data-bs-toggle="modal" data-bs-target="#exampleModal2">
  			전체보기
			</button>
  			</div>
  		</div>
  		
  		<div class="row px-3">
  		
  		<table class="table text-center">
		  <thead>
		    <tr class="bg-secondary bg-opacity-25">
		      <th scope="col" style="width: 15%;">NO</th>
		      <th scope="col">상품명</th>
		      <th scope="col" style="width: 25%;">스크랩 수</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${popularScrap }" var="scrap" begin="0" end="4">
			   		<tr>
				      <th scope="row">${scrap.no }</th>
				      <td>${scrap.productVo.product_name }</td>
				      <td>${scrap.countScrapProduct }</td>
				    </tr>
		    </c:forEach>
		  </tbody>
		</table>
  		<span>* 상품 스크랩 순으로 정렬 하였습니다.</span>
  		</div>
  		 <jsp:include page="../common/footer.jsp"></jsp:include>
  	</div>
	
	<!-- 프로필 수정 Modal -->
	<div class="row">
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">판매자 프로필</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-end">
	      	
	      	<form id="formID" action="../vendor/updateVendor">
	      		<div class="row mb-3">
	      			<span class="fw-bold text-start">브랜드 : ${vendorInfo.vendor_brand_name }</span>
	      			<input name="vendor_no" value="${vendorInfo.vendor_no }" type="hidden" class="form-control">
	      		</div>
	      		
	      		
				<div class="text-start">
			 		<label for="pw" class="form-label fw-bold">비밀번호 변경</label>
			  		<input id="pw" name="vendor_pw" type="password" class="form-control" placeholder="비밀번호를 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
					<input onblur="checkPassword()" id="passwordConfirm" type="password" class="form-control" placeholder="비밀번호를 확인 해주세요." aria-label="Username" aria-describedby="addon-wrapping">	
				</div>
				<div id="pwAlert" class="text-start mb-3"></div>
				
				<div class="text-start">
			 		<span class="form-label fw-bold text-start" id="addon-wrapping">이메일 변경</span>
			  		<input id="email">
				</div>
				<div id="emailAlert" class="text-start mb-3"></div>
				
				<div class="text-start">
			 		<span class="form-label fw-bold text-start" id="addon-wrapping">전화번호 변경</span>
			  		<input id="phone" name="vendor_phone" type="text" class="form-control" placeholder="전화번호를 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
				</div>
				<div id="phoneAlert" class="text-start mb-3"></div>
				
				<div class="text-start">
			 		<span class="form-label fw-bold text-start" id="addon-wrapping">주소 변경</span>
			  		<input id="address" name="vendor_address" type="text" class="form-control" placeholder="주소를 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
				</div>
				<div id="addressAlert" class="text-start mb-3"></div>
				
				<input onclick="doSumit()" type="button" value="프로필 수정하기" class="btn" style="background-color: #ff6500; color: white;">
				
	        </form>
	        
	      </div>

	    </div>
	  </div>
	</div>		
	</div>
	
	<!-- 이번달 판매 순위 Modal -->
	<div class="row">
	<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">판매 순위</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-end">
	      
		<!-- 검색 -->
		<div class="row pe-2 mb-3">
			<div class="col">
				<form action="./vendorMainPage" method="get">
					<div class="row">
					<div class="col-3 pe-0">
						<select name="searchType" class="form-control">
							<option value="product_name">상품명</option>
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
	      
			
  		<div class="row px-3 mb-5">
  		
  		<table class="table text-center">
		  <thead>
		    <tr class="bg-secondary bg-opacity-25">
		      <th scope="col" style="width: 15%;">NO</th>
		      <th scope="col">상품명</th>
		      <th scope="col" style="width: 25%;">총 판매량</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${popularProduct }" var="product">
			   		<tr>
				      <th scope="row">${product.no }</th>
				      <td>${product.productVo.product_name }</td>
				      <td>${product.productCount }</td>
				    </tr>
		    </c:forEach>
		  </tbody>
		</table>
  		<span>* 상품 판매량 순으로 정렬 하였습니다.</span>
  		</div>
	        
	      </div>

	    </div>
	  </div>
	</div>		
	</div>
	
	<!-- 이번달 스크랩 순위 Modal -->
	<div class="row">
	<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">스크랩 순위</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-end">
	      
	      
	     <!-- 검색 -->
		<div class="row pe-2 mb-3">
			<div class="col">
				<form action="./vendorMainPage" method="get">
					<div class="row">
					<div class="col-3 pe-0">
						<select name="searchTypeScrap" class="form-control">
							<option value="product_name">상품명</option>
						</select>
					</div>
					<div class="col-6 px-0 mx-0">
						<input name="searchWordScrap" type="text" class="form-control">
					</div>
					<div class="col d-grid px-0 mx-0">
						<button class="btn btn" style="background-color: #ff6500; color: white;">검색</button>
					</div>
				</div>
				</form>
			</div>
		</div>
			
		<div class="row px-3">
  		
  		<table class="table text-center">
		  <thead>
		    <tr class="bg-secondary bg-opacity-25">
		      <th scope="col" style="width: 15%;">NO</th>
		      <th scope="col">상품명</th>
		      <th scope="col" style="width: 25%;">스크랩 수</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${popularScrap }" var="scrap">
			   		<tr>
				      <th scope="row">${scrap.no }</th>
				      <td>${scrap.productVo.product_name }</td>
				      <td>${scrap.countScrapProduct }</td>
				    </tr>
		    </c:forEach>
		  </tbody>
		</table>
  		<span>* 상품 스크랩 순으로 정렬 하였습니다.</span>
  		</div>
	        
	      </div>

	    </div>
	  </div>
	</div>		
	</div>
	
	
	
	
	
	<!-- 메뉴 -->
	<div class="offcanvas offcanvas-start pb-0" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
      <div class="offcanvas-header">
        <h2 style="color: #ff6500;" class="offcanvas-title" id="offcanvasWithBothOptionsLabel">LIKEHOME</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">

        <div class="accordion mb-5" id="accordionExample">
         <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button fw-bold" style="background-color: #ff6500; color: white;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		        ${vendorInfo.vendor_brand_name }
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		     	<a class="menu" href="../vendor/logoutProcess">로그아웃</a><br>
		      </div>
		    </div>
		  </div>
		</div>
        
        <div class="accordion mb-3" id="accordionExample">
         <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button fw-bold" style="background-color: #ff6500; color: white;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		        스토어 판매
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        <a class="menu" href="../vendor/vendorMainPage">판매메인페이지</a><br>
		        <a class="menu" href="../vendor/vendorProductRegisterPage">상품등록</a><br>
		        <a class="menu" href="../vendor/vendorProductListPage">상품리스트</a><br>
		        <a class="menu" href="../vendor/vendorOrderListPage">주문리스트</a><br>
 				<a class="menu" data-bs-toggle="modal" data-bs-target="#exampleModal1">상품 판매 순위</a><br>
 				<a class="menu" data-bs-toggle="modal" data-bs-target="#exampleModal2">스크랩 순위</a>
  			
		      </div>
		    </div>
		  </div>
		</div>

      </div>
    </div>




    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 

  </body>
 
</html>