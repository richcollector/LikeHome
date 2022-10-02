<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
   <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<title>일반회원 가입</title>
<style>
   @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
   body {
      font-family : pretendard;
      color: #404040;
   		}
      a{
       color: #404040;
      }
</style>

<script type="text/javascript">

   function doSumit(){
   	
		const form = document.getElementById("formID");
		
		const emailInput = document.getElementById("email");
		const pwInput = document.getElementById("pw");
		const passwordConfirmInput = document.getElementById("passwordConfirm")
		const nickInput = document.getElementById("nick");
		const birthInput = document.getElementById("birth");
		const genderInput = document.getElementById("gender");
		const introInput = document.getElementById("intro");
		const imageInput = document.getElementById("image");
		
		
		const check1Input = document.getElementById("check1");
		const check2Input = document.getElementById("check2");
		const check3Input = document.getElementById("check3");
		
		
		var emailAlertBox = document.getElementById("emailAlert");
		emailAlertBox.innerHTML = "";
		
		var pwAlertBox = document.getElementById("pwAlert");
		pwAlertBox.innerHTML = "";
		
		var nickAlertBox = document.getElementById("nickAlert");
		nickAlertBox.innerHTML = "";
		
		var birthAlertBox = document.getElementById("birthAlert");
		birthAlertBox.innerHTML = "";
		
		var introAlertBox = document.getElementById("introAlert");
		introAlertBox.innerHTML = "";
		
		var imageAlertBox = document.getElementById("imageAlert");
		imageAlertBox.innerHTML = "";
		
		var checkAlertBox = document.getElementById("checkAlert");
		checkAlertBox.innerHTML = "";
		
		if(emailInput.value == ""){
			emailAlertBox.innerText = "이메일을 입력해주셔야 합니다.";
			emailAlertBox.classList.add("text-danger");
			emailInput.focus();
			return;
		}else{
			emailAlertBox.innerHTML = "";
		}
		
		if(pwInput.value == ""){
			pwAlertBox.innerText = "비밀번호를 입력해주셔야 합니다.";
			pwAlertBox.classList.add("text-danger");
			pwInput.focus();
			return;
		}else{
			pwAlertBox.innerHTML = "";
		}
		
		if(passwordConfirmInput.value == ""){
			pwAlertBox.innerText = "비밀번호를 한번 더 입력해주세요.";
			pwAlertBox.classList.add("text-danger");
			passwordConfirmInput.focus();
			return;
		}else{
			passwordConfirmInput.innerHTML = "";
		}
		
		
		if(nickInput.value == ""){
			nickAlertBox.innerText = "닉네임을 입력해주셔야 합니다.";
			nickAlertBox.classList.add("text-danger");
			nickInput.focus();
			return;
		}else{
			nickAlertBox.innerHTML = "";
		}
		
		
		if(birthInput.value == ""){
			birthAlertBox.innerText = "생년월일을 입력해주셔야 합니다.";
			birthAlertBox.classList.add("text-danger");
			birthInput.focus();
			return;
		}else{
			birthAlertBox.innerHTML = "";
		}
		
		if(introInput.value == ""){
			introAlertBox.innerText = "자기소개를 입력해주셔야 합니다.";
			introAlertBox.classList.add("text-danger");
			introInput.focus();
			return;
		}else{
			introAlertBox.innerHTML = "";
		}
		
		if(imageInput.value == ""){
			imageAlertBox.innerText = "프로필 사진을 넣어주셔야 합니다.";
			imageAlertBox.classList.add("text-danger");
			imageInput.focus();
			return;
		}else{
			imageAlertBox.innerHTML = "";
		}
		
		if(check1Input.checked == false){
			checkAlertBox.innerText = "만 14세 이상 동의해주세요.";
			checkAlertBox.classList.add("text-danger");
			check1Input.focus();
			return;
		}else{
			checkAlertBox.innerHTML = "";
		}
		
		if(check2Input.checked == false){
			checkAlertBox.innerText = "이용약관을 동의해 주세요.";
			checkAlertBox.classList.add("text-danger");
			check2Input.focus();
			return;
		}else{
			checkAlertBox.innerHTML = "";
		}
		
		if(check3Input.checked == false){
			checkAlertBox.innerText = "개인정보 수집 및 이용동의해 주세요.";
			checkAlertBox.classList.add("text-danger");
			check3Input.focus();
			return;
		}else{
			checkAlertBox.innerHTML = "";
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
			passwordInput.focus();
			return;
		}else{
			pwAlertBox.innerHTML = "";
		}
	   
		if(pwInput.value != passwordConfirmInput.value){
			pwAlertBox.innerText = "비밀번호 확인이 일치하지 않습니다.";
			pwAlertBox.classList.remove("text-primary");
			pwAlertBox.classList.add("text-danger");
		}else{
			pwAlertBox.innerText = "비밀번호 확인이 일치합니다.";
			pwAlertBox.classList.remove("text-danger");
			pwAlertBox.classList.add("text-primary");
			passwordConfirmInput.innerHTML = "";
		}
   }
   
   
	var isChecked = false;
	
	function checkEmail(){
		var emailValue = document.getElementById("email").value;
		
		var xhr = new XMLHttpRequest();	//AJAX 객체 생성
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	//xhr.responseText = 응답 결과 텍스트
				//alert(result.data);
				//렌더링... 및 추가 화면 로직...
				var emailAlertBox = document.getElementById("emailAlert");
				
				if(result.data == true){
					isChecked = false;
					emailAlertBox.innerText = "이미 존재하는 이메일입니다.";
					emailAlertBox.classList.remove("text-success");
					emailAlertBox.classList.add("text-danger");
				}else if(emailValue == ""){
					emailAlertBox.innerText = "빈 칸은 허용되지 않습니다.";
					emailAlertBox.classList.remove("text-danger");
					emailAlertBox.classList.add("text-success");
				}else{
					isChecked = true;
					emailAlertBox.innerText = "사용 가능한 이메일입니다.";
					emailAlertBox.classList.remove("text-danger");
					emailAlertBox.classList.add("text-success");
				}
			}
		}
		
		xhr.open("get", "./isExistEmail?customer_email=" + emailValue);	//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");	//post
		xhr.send();	//AJAX로 리퀘스트함...
	}
   
   
   

   function allCheck(){

      var allCheckValue = document.querySelector("input[id=check_all]").checked;

      var list = document.getElementsByClassName("normal");
      if(allCheckValue){
         for(var i = 0; i < list.length; i++){
            list[i].checked = true;
         }
      }else{
         for(var i = 0; i < list.length; i++){
            list[i].checked = false;
         };
      }
   }

   function checkOk(){

      var total = document.getElementById("check_all");
      var list = document.getElementsByClassName("normal");

      for(var i = 0; i < list.length; i++) {
         if(list[0].checked == true &&
         list[1].checked == true &&
         list[2].checked == true &&
         list[3].checked == true ){
            total.checked = true;
         }else{
            total.checked = false;
         }
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
     
        <div class="row mb-4 pb-3 border-bottom">
           <span class="fw-bold fs-3">일반회원 가입</span>
        </div>
        
      <form id="formID" action="customerRegisterProcess" method="post" enctype="multipart/form-data">

         <div>
             <label for="email" class="form-label fw-bold">이메일 번호</label>
              <input onblur="checkEmail()" id="email" name="customer_email" type="text" class="form-control" placeholder="이메일 번호를 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         <div id="emailAlert" class="mb-4"></div>
         
         <div>
             <label for="pw" class="form-label fw-bold">비밀번호</label>
             <input id="pw" name="customer_pw" type="password" class="form-control" placeholder="비밀번호를 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
             <input onblur="checkPassword()" id="passwordConfirm" type="password" class="form-control" placeholder="비밀번호를 확인 해주세요." aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         <div id="pwAlert" class="mb-4"></div>
         
         <div>
             <label for="nick" class="form-label fw-bold mb-0">닉네임</label><br>
             <label for="nick" class="form-label"><span style="font-size: 0.75em;">다른 닉네임과 겹치지 않게 입력해주세요.</span></label>
              <input id="nick" name="customer_nick" type="text" class="form-control" placeholder="닉네임을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         <div id="nickAlert" class="mb-4"></div>
         
         <div>
             <label for="birth" class="form-label fw-bold">생년월일</label>
              <input id="birth" name="customer_birth" type="date" class="form-control" placeholder="생일을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         <div id="birthAlert" class="mb-4"></div>
         
         <div class="mb-2">
             <label for="gender" class="form-label fw-bold">성별&nbsp;</label>
              <input id="gender" name="customer_gender" type="radio" value="M" checked>&nbsp;남
              <input name="customer_gender" type="radio" value="F">&nbsp;여
         </div>
         
         <div class="input-group flex-nowrap mb-3">
              <input name="customer_state" value="T" type="hidden" aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         
         <div>
             <label for="intro" class="form-label fw-bold">자기소개</label>
              <input id="intro" name="customer_intro" type="text" class="form-control" placeholder="자기소개를 넣어주세요." aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         <div id="introAlert" class="mb-4"></div>
         
         <div>
             <label for="image" class="form-label fw-bold">프로필 사진</label>
              <input id="image" name="profile_image" multiple accept="image/*" type="file" class="form-control" placeholder="프로필 사진을 넣어주세요." aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         <div id="imageAlert" class="mb-4"></div>
         
         <div class="input-group flex-nowrap mb-3">
              <input name="customer_total_point" value="0" type="hidden" aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         
         <div class="input-group flex-nowrap mb-3">
              <input name="customer_grade" value="1" type="hidden" aria-label="Username" aria-describedby="addon-wrapping">
         </div>
         
         
         <div class="checkbox_grop row border mb-4 p-3 mx-0">
            <div class="col">
               <div class="row mb-3 pb-3 border-bottom">
                  <div class="col">
                     <span>약관동의</span>
                  </div>
               </div>
               <div class="row mb-1">
                  <div class="col">
                     <input onclick="allCheck()" id="check_all" type="checkbox"> 전체동의<br>
                  </div>
               </div>
               <div class="row mb-1">
                  <div class="col">
                     <input onclick="checkOk()" id="check1" class="normal" type="checkbox"> 만 14세 이상입니다.<span style="font-size: 0.75em; color: #ff6500;"> (필수)</span><br>
                  </div>
               </div>
               <div class="row mb-1">
                  <div class="col">
                     <input onclick="checkOk()" id="check2" class="normal" type="checkbox"> 
                       <!-- Button trigger modal -->
                       <a class="py-0" data-bs-toggle="modal" data-bs-target="#exampleModal1">
                       이용약관
                     </a>
                     <span style="font-size: 0.75em; color: #ff6500;"> (필수)</span><br>
                  </div>
               </div>
               <div class="row mb-1">
                  <div class="col">
                     <input onclick="checkOk()" id="check3" class="normal" type="checkbox"> 
                       <!-- Button trigger modal -->
                       <a class="py-0" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                       개인정보수집 및 이용동의
                     </a>
                     <span style="font-size: 0.75em; color: #ff6500;"> (필수)</span><br>
                  </div>
               </div>
               <div class="row mb-1">
                  <div class="col">
                     <input onclick="checkOk()" id="check4" class="normal" type="checkbox"> 
                     <a class="py-0" data-bs-toggle="modal" data-bs-target="#exampleModal3">
                       이벤트, 쿠폰, SMS 등 수신
                     </a>
                     <span style="font-size: 0.75em;"> (선택)</span><br>
                  </div>
               </div>
                  
               
            </div>
         </div>
		<div id="checkAlert" class="mb-4"></div>
   
         <div class="d-grid mb-3">
         <input type="button" value="가입" onclick="doSumit()" class="btn" style="background-color: #ff6500; color: white;">
         </div>
         
      </form>
      
   <!-- 이용약관 Modal -->
   <div class="row">
   <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="exampleModalLabel">이용약관</h5>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
         
         <span class="fw-bold">Welcome, LikeHome !</span><br>
         <br>
         주식회사 버킷플레이스(이하 '회사')가 인터넷과 모바일<br>
         등 플랫폼(이하 ‘LikeHome’)을통해 제공하는 다양한<br>
         서비스를 이용하여 주셔서 감사합니다. 회사는 이용자가 LikeHome을 
         더 편리하게 이용할 수 있도록 서비스 이용약관(이하 '본 약관')을 
         마련하였습니다. <br>
         <br>
         본 약관은 이용자가 서비스를 이용하는데 필요한 권리,<br>
         의무 및 책임사항  기타 필요한 사항을규정하고 있으므<br>
         로 주의깊게 살펴봐 주시기 바랍니다.<br>
         <br>
         <span class="fw-bold">본 약관에서 사용하는 용어의 정의는 다음 각 호와 같습니다.</span><br>
         <br>
         Likehome<br>
         회사가 운영하는 플랫폼을 의미하며, 인터넷, 모바일 어<br>
         플리케이션(이하 ‘앱’) 등을 통하여 파트너들이 제공하<br>
         는 다양한 재화 또는 용역(이하 '재화 등')의 광고를<br>
         이용자에게 제공하거나, 파트너와 이용자 간 거래를 중<br>
         개하고, 나아가 회사 또는 이용자가 창작한 다양한 콘<br>
         텐츠를 게시하고 그를 통하여 이용자 간 커뮤니케이션<br>
         이 진행될 수 있도록 설정한 공간을 말하며, 아울러 이<br>
         를 운영하는 사업자의 의미로도 사용합니다.<br>
         <br>
         서비스<br>
         콘텐츠 및 그를 매개로 한 이용자 간 커뮤니케이션 공<br>
         간,파트너 재화 등의 광고 및 파트너와 고객 간 거래의<br>
         중개 등 이용자의 생활을 더 편리하게 하기 위해 회사가<br>
         LikeHome을 통하여 제공 또는 제공할 서비스를 말합니다.<br>
         <br>
         제휴서비스<br>
         회사가 자신이 운영하는 타 서비스 또는 자신과 협력관
         계에 있는 제3자가 운영하는 서비스와 LikeHome을<br>
         연동하는 등 다양한 제휴 방식을 통해 LikeHome과<br>
         별개로 국내 ∙ 외에서 제공하는 서비스를 말합니다.<br>
         <br>
         이용자<br>
         회사가 제공하는 서비스를 이용하는 자로서 회원을 포<br>
         함합니다.<br>
         <br>
         회원<br>
         LikeHome에 회원등록을 한 자로서, LikeHome 내에<br>
         서 서비스를 이용할 수 있는 자격을 갖춘자를 말합니다.<br>
         <br>
         콘텐츠<br>
         회사 또는 이용자가 서비스 상에 게시 또는 등록하는 모<br>
         든 글, 사진, 동영상, 각종 파일, 링크, 회원소개 등 (부<br>
         호, 문자, 영상, 그림 등 그 형태를 불문합니다) Like<br>
         Home내에서 게시 또는 사용되는 일체의 정보를 말합니다.<br>
         <br>
         파트너<br>
         LikeHome이 지정한 절차를 마치고 LikeHome을 이<br>
         용하는 자로, LikeHome을 통해 이용자에게 자신의<br>
         재화 등을 광고 또는 판매하는 자를 말합니다.<br>
         <br>
         회원정보<br>
         LikeHome을 통해 가입을 신청한 자에게 회원가입 신<br>
         청양식(이하 '신청양식')에 따라 기재를 요청하는 개인<br>
         정보 및 회원의 식별과 서비스 이용을 위하여 회원이 <br>
         LikeHome에 제공한 정보를 말합니다.
        </div>
           
         </div>

       </div>
     </div>
   </div>      
   
   <!-- 개인정보 동의 Modal -->
   <div class="row">
   <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="exampleModalLabel">개인정보 동의</h5>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
         
         <span class="fw-bold">개인정보 항목 / 수집 및 이용목적 / 보유 및 이용기간</span><br>
         <br>
         
         <span class="fw-bold">수집하는 개인정보</span><br>
         수집방법 : 회원가입<br>
         수집항목 : (필수)닉네임, 이메일 주소, 비밀번호<br>
         수집 및 이용 목적 : 서비스 이용 및 상담, 환불 및 문의<br> 
         회신, 마케팅 및 서비스 개선을 위한 분석 등<br>
         <br>
         <span class="fw-bold">보유 및 이용기간</span><br>
         회원탈퇴 및 목적달성 후 지체없이 삭제합니다.<br>
         단, 전자상거래 등에서의 소비자보호에 관한 법률 등<br>
         관련 법령의 규정에 따라 거래 관계 확인을 위해 개인정<br>
         보를 일정기간 보유 할 수 있습니다. 또한 부정이용 방<br>
         지를 위하여 회원 탈퇴 후에도 구매 인증 시 입력한 정<br>
         보는 6개월 동안 보관합니다.<br>
         <br>
         단, 전자상거래 등에서의 소비자보호에 관한 법률 등 관<br>
         련 법령의 규정에 따라 거래 관계 확인을 위해 개인정보<br>
         를 일정기간 보유 할 수 있습니다.<br>
         <br>
         <span class="fw-bold">동의를 거부할 권리 및 거부 경우의 불이익</span> <br>
         귀하께서는 LikeHome이 위와 같이 수집하는 개인정<br>
         보에 대해 동의하지 않거나 개인정보를 기재하지 않음<br>
         으로써 거부할 수 있습니다. <br>
         <br>
         다만, 이때 회원에게 제공되는 서비스가 제한될 수 <br>
         있습니다. 
         
        </div>
           
         </div>

       </div>
     </div>
   </div>
   
   <!-- 이벤트 동의 Modal -->
   <div class="row">
   <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="exampleModalLabel">수신동의</h5>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
         
         <span class="fw-bold">개인정보 항목 / 수집 및 이용목적 / 보유 및 이용기간</span><br>
         <br>
         <span class="fw-bold">수집항목</span><br>
         이메일, 핸드폰번호, 주문기록(구매내역, 배송지정보, 결제수단 정보), 
         서비스 이용기록, 맞춤정보 설정 내역, 온라인식별자(광고ID 및 이용자 
         고유식별자)<br>
         <br>
         <span class="fw-bold">수집 및 이용목적</span><br>
         전화, 문자, 카카오톡, 이메일을 통한 프로모션 및 이벤<br> 
         트 정보 등의 전달 맞춤형 광고 전송, 고객 분석, 통계분<br> 
         석, 설문조사 등 광고 및 마케팅 목적의 활용<br>
         <br>
         <span class="fw-bold">보유 및 이용 기간</span><br>
         동의 철회시까지<br>
         <br>
         개인정보의 수집 이용에 동의를 거부할 수 있으며, 동의 <br>
         거부시에도 서비스 이용에 제한은 없습니다.
         
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