<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
   <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
   
	<title>로그인</title>
    <style>
    @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
      
      body {
      font-family : pretendard;
      color: #404040;
      }
      
      a {
      text-decoration-line: none;
      color: #404040;
      }
      
   </style>
   
   <script type="text/javascript">
   
   function doSubmit(){
      
      const form = document.getElementById("formID");
      
      var customerId = document.getElementById("id");
      var customerPw = document.getElementById("pw");
      
      var customerIdInput = customerId.value;
      var customerPwInput = customerPw.value;
      
	  var idPwAlertBox = document.getElementById("idPwAlert");
	  idPwAlertBox.innerHTML = "";
      
      var xhr = new XMLHttpRequest();   //AJAX 객체 생성
      
      xhr.onreadystatechange = function(){
         if(xhr.readyState == 4 && xhr.status == 200){
            var jsonObj = JSON.parse(xhr.responseText);   //xhr.responseText = 응답 결과 텍스트
			
			if(customerIdInput == ""){
				idPwAlertBox.innerText = "아이디를 입력해주세요.";
				idPwAlertBox.classList.add("text-danger");
				customerId.focus();
				return;
			}else if(jsonObj.id == false){
				idPwAlertBox.innerText = "아이디가 다릅니다.";
				idPwAlertBox.classList.add("text-danger");
				customerId.focus();
				return;
			}else{
				idPwAlertBox.innerHTML = "";
			}
			
			if(customerPwInput == ""){
				idPwAlertBox.innerText = "비밀번호를 입력해주세요.";
				idPwAlertBox.classList.add("text-danger");
				customerPw.focus();
				return;
			}else if(jsonObj.pw == false){
				idPwAlertBox.innerText = "비밀번호가 다릅니다.";
				idPwAlertBox.classList.add("text-danger");
				customerPw.focus();
				return;
			}else{
				idPwAlertBox.innerHTML = "";
			}
			
           	if(jsonObj.auth == false){
           		idPwAlertBox.innerText = "메일 인증이 되지 않았습니다.";
           		idPwAlertBox.classList.add("text-danger");
               	return;
            }
            
            form.submit();
         }
          
      }
      
      xhr.open("get", "../customer/customerLoginCheckProcess?customer_email=" + customerIdInput + "&customer_pw=" + customerPwInput);   //리퀘스트 세팅..
      //xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");   //post
      xhr.send();   //AJAX로 리퀘스트함...
   }
   
   function changePw(){
	      
	      const form = document.getElementById("form");
	      
	      var customerEmail = document.getElementById("email");
	      var customerPwChange = document.getElementById("pwChange");
	      var customerPwChangeConfirm = document.getElementById("pwChangeConfirm");
	      
	      var customerEmailInput = customerEmail.value;
	      var customerPwChangeInput = customerPwChange.value;
	      var customerPwChangeConfirmInput = customerPwChangeConfirm.value;
	      
	      
		  var idAlertBox = document.getElementById("idAlert");
		  idAlertBox.innerHTML = "";
		  
		  var pwAlertBox = document.getElementById("pwAlert");
		  pwAlertBox.innerHTML = "";
	      
	      var xhr = new XMLHttpRequest();   //AJAX 객체 생성
	      
	      xhr.onreadystatechange = function(){
	         if(xhr.readyState == 4 && xhr.status == 200){
	            var jsonObj = JSON.parse(xhr.responseText);   //xhr.responseText = 응답 결과 텍스트
				
				if(customerEmailInput == ""){
					idAlertBox.innerText = "아이디를 입력해주세요.";
					idAlertBox.classList.add("text-danger");
					customerEmail.focus();
					return;
				}else if(jsonObj.id == false){
					idAlertBox.innerText = "아이디가 다릅니다.";
					idAlertBox.classList.add("text-danger");
					customerEmail.focus();
					return;
				}else{
					idAlertBox.innerHTML = "";
				}
				
				if(customerPwChangeInput == ""){
					pwAlertBox.innerText = "비밀번호를 입력해주세요.";
					pwAlertBox.classList.add("text-danger");
					customerPwChange.focus();
					return;
				}else if(jsonObj.pw == true){
					pwAlertBox.innerText = "기존의 비밀번호와 같습니다.";
					pwAlertBox.classList.add("text-danger");
					customerPwChange.focus();
					return;
				}else{
					pwAlertBox.innerHTML = "";
				}
				
				//특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 ( 3 가지 조합)
				const passwordReg = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
				if(!passwordReg.test(customerPwChangeInput)){
					pwAlertBox.innerText = "특수문자와 숫자를 포함하여 8~15자리를 입력해주세요.";
					pwAlertBox.classList.add("text-danger");
					customerPwChange.value = "";
					customerPwChangeConfirm.value = "";
					customerPwChange.focus();
					return;
				}else{
					pwAlertBox.innerHTML = "";
				}
				
				if(customerPwChangeInput != customerPwChangeConfirmInput){
					pwAlertBox.innerText = "비밀번호가 확인되지 않았습니다.";
					pwAlertBox.classList.remove("text-primary");
					pwAlertBox.classList.add("text-danger");
				}else{
					pwAlertBox.innerText = "비밀번호가 확인 되었습니다.";
					pwAlertBox.classList.remove("text-danger");
					pwAlertBox.classList.add("text-primary");
					customerPwChangeConfirm.innerHTML = "";
				}
				
	            form.submit();
	         }
	          
	      }
	      
	      xhr.open("get", "../customer/customerLoginCheckProcess?customer_email=" + customerEmailInput + "&customer_pw=" + customerPwChangeInput);   //리퀘스트 세팅..
	      //xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");   //post
	      xhr.send();   //AJAX로 리퀘스트함...
	   }
	   
	   function checkPassword() {
		      var customerPwChange = document.getElementById("pwChange");
		      var customerPwChangeConfirm = document.getElementById("pwChangeConfirm");
		      
		      var customerPwChangeInput = customerPwChange.value;
		      var customerPwChangeConfirmInput = customerPwChangeConfirm.value;
			
			var pwAlertBox = document.getElementById("pwAlert");
			pwAlertBox.innerHTML = "";
		   
			//특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 ( 3 가지 조합)
			const passwordReg = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
			if(!passwordReg.test(customerPwChangeInput)){
				pwAlertBox.innerText = "특수문자와 숫자를 포함하여 8~15자리를 입력해주세요.";
				pwAlertBox.classList.add("text-danger");
				customerPwChange.value = "";
				customerPwChangeConfirm.value = "";
				customerPwChange.focus();
				return;
			}else{
				pwAlertBox.innerHTML = "";
			}
			
			if(customerPwChangeInput != customerPwChangeConfirmInput){
				pwAlertBox.innerText = "비밀번호가 확인되지 않았습니다.";
				pwAlertBox.classList.remove("text-primary");
				pwAlertBox.classList.add("text-danger");
			}else{
				pwAlertBox.innerText = "비밀번호가 확인 되었습니다.";
				pwAlertBox.classList.remove("text-danger");
				pwAlertBox.classList.add("text-primary");
				customerPwChangeConfirm.innerHTML = "";
			}
	  }
   
   
   
   
    </script>

</head>
<body>

   <div class="container-fluid px-3 mt-3">
   
      <!-- 뒤로가기 -->
      <div class="row mb-3">
         <div class="col fs-1">
            <a href="../main/mainPage"><i class="bi bi-arrow-left-square" style="color: #ff6500;"></i></a>
         </div>
      </div>
      
      <div class="row text-center mb-4">
         <h1 style="color: #ff6500;">LIKE HOME</h1><br>
      </div>
      
      <div class="row px-5 pb-3">

         <div class="col">
            <form id="formID" action="../customer/customerLoginProcess" method="post">
            <div class="row mb-1">
		        <div class="btn-group px-0">
					<a href="../customer/customerLoginPage" class="btn" style="background-color: #ff6500; color: white;">일반회원</a>
					<a href="../vendor/vendorLoginPage" class="btn btn-outline" style="border-color: #ff6500; color: #ff6500;" aria-current="page">판매자</a>
				</div>
               </div>
               <div class="row">
                  <div class="input-group flex-nowrap px-0 mb-1">
                       <input id="id" name="customer_email" type="text" class="form-control" placeholder="아이디" aria-label="Username" aria-describedby="addon-wrapping">
                  </div>
                  <div class="input-group flex-nowrap px-0">
                       <input id="pw" name="customer_pw" type="password" class="form-control" placeholder="비밀번호" aria-label="Username" aria-describedby="addon-wrapping">
                  </div>
               </div>
               <div id="idPwAlert" class="mb-3"></div>
               <div class="row d-grid mb-1">
                  <button onclick="doSubmit()" type="button" class="btn btn-outline" style="border-color: #ff6500; color: #ff6500;">
                  일반회원 로그인
                  </button>
                  
               </div>
            </form>
               <div class="row">
               		<div class="col-7 text-end ps-0">
				<!-- Button trigger modal -->
				<a class="py-0" style="color: #757575;" data-bs-toggle="modal" data-bs-target="#exampleModal1">
				비밀번호 재설정
				</a>
					</div>
                  <div class="col ps-0">
                     <a style="color: #757575;" href="../customer/customerRegisterPage">회원가입</a>
                  </div>
               </div>
               
               <div class="row mt-4">
                  <div class="co text-center ps-0">
                     <span style="font-size: 0.8em;">SNS계정으로 간편 로그인/회원가입</span>
                  </div>
               </div>
               
               <div class="row mt-4">
                  <div class="col text-center ps-0">
                     <img style="width: 3em; height: 3em;" src="../resources/img/facebook.png">
                     <img style="width: 3em; height: 3em;" src="../resources/img/kakaotalk.png">
                     <img style="width: 3em; height: 3em;" src="../resources/img/naver.png">
                  </div>
               </div>
               
               <div class="row mt-4">
                  <div class="col text-center ps-0">
                     <span style="font-size: 0.8em;">로그인에 문제가 있으신가요?</span>
                  </div>
               </div>
         </div>

      </div>
      
      
    <!-- 프로필 수정 Modal -->
	<div class="row">
	<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">비밀번호 재설정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-end">
	      	
	      	<form id="form" action="../customer/updateCustomerPwProcess">
				<div class="text-start">
			 		<label for="email" class="form-label fw-bold">아이디</label>
			  		<input id="email" name="customer_email" type="text" class="form-control" placeholder="아이디를 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
				</div>
	      		<div id="idAlert" class="text-start mb-3"></div>
				<div class="text-start">
			 		<label for="pwChange" class="form-label fw-bold">비밀번호 변경</label>
			  		<input id="pwChange" name="customer_pw" type="password" class="form-control" placeholder="비밀번호를 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
					<input onblur="checkPassword()" id="pwChangeConfirm" type="password" class="form-control" placeholder="비밀번호를 확인 해주세요." aria-label="Username" aria-describedby="addon-wrapping">	
				</div>
				<div id="pwAlert" class="text-start mb-3"></div>
				
				<input onclick="changePw()" type="button" value="프로필 수정하기" class="btn" style="background-color: #ff6500; color: white;">
				
	        </form>
	        
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