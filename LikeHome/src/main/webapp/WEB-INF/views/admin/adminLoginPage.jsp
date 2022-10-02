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
       	a{
      	 text-decoration-line: none;
      	 color: #404040;
      	}
	</style>
	
	<script type="text/javascript">
	
	function doSubmit(){
		
		const form = document.getElementById("formID");
		
		var adminId = document.getElementById("id");
		var adminPw = document.getElementById("pw");
		
		var adminIdInput = adminId.value;
		var adminPwInput = adminPw.value;
		
		var idPwAlertBox = document.getElementById("idPwAlert");
		idPwAlertBox.innerHTML = "";
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				
				if(adminIdInput == ""){
					idPwAlertBox.innerText = "아이디를 입력해주세요.";
					idPwAlertBox.classList.add("text-danger");
					adminId.focus();
					return;
				}else if(jsonObj.id == false){
					idPwAlertBox.innerText = "아이디가 다릅니다.";
					idPwAlertBox.classList.add("text-danger");
					adminId.focus();
					return;
				}else{
					idPwAlertBox.innerHTML = "";
				}
				
				if(adminPwInput == ""){
					idPwAlertBox.innerText = "비밀번호를 입력해주세요.";
					idPwAlertBox.classList.add("text-danger");
					adminPw.focus();
					return;
				}else if(jsonObj.pw == false){
					idPwAlertBox.innerText = "비밀번호가 다릅니다.";
					idPwAlertBox.classList.add("text-danger");
					adminPw.focus();
					return;
				}else{
					idPwAlertBox.innerHTML = "";
				}
				
				form.submit();
			}
 			
		}
		
		xhr.open("get", "../admin/adminLoginCheckProcess?admin_id=" + adminIdInput + "&admin_pw=" + adminPwInput);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
	}
	
	</script>
	
</head>
<body>

	<div class="container-fluid px-3 mt-3 mb-5">
	
		<!-- 뒤로가기 -->
		<div class="row mb-3">
			<div class="col fs-1">
				<a href="../admin/adminMainPage"><i class="bi bi-arrow-left-square" style="color: #ff6500;"></i></a>
			</div>
		</div>
		
		<div class="row text-center mt-5 mb-4">
			<h1 style="color: #ff6500;">LIKE HOME</h1><br>
		</div>
		
		<div class="row px-5">

			<div class="col">
				<form id="formID" action="../admin/adminLoginProcess" method="post">
					<div class="row mb-2">
						<div class="input-group flex-nowrap px-0 mb-1">
					  		<input id="id" name="admin_id" type="text" class="form-control" placeholder="관리자 번호" aria-label="Username" aria-describedby="addon-wrapping">
						</div>
						<div class="input-group flex-nowrap px-0">
					  		<input id="pw" name="admin_pw" type="password" class="form-control" placeholder="비밀번호" aria-label="Username" aria-describedby="addon-wrapping">
						</div>
					</div>
					<div id="idPwAlert" class="mb-3"></div>
					<div class="row d-grid mb-1">
						<button onclick="doSubmit()" type="button" class="btn" style="background-color: #ff6500; color: white;">
						관리자 로그인
						</button>	
					</div>
				</form>
					
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
		
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 

</body>
</html>