<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">

<title>Insert title here</title>

<script type="text/javascript">
//function getCheckboxValue(event)  {
	  /*let result = '';
	  if(event.target.checked)  {
	    result = event.target.value;
	  }else {
	    result = '';
	  }
	  
	  document.getElementById('result').innerText
	    = result;
	}*/
	
	function is_checked() {
		  
		  // 1. checkbox element를 찾습니다.
		  const checkbox = document.getElementById('my_checkbox');

		  // 2. checked 속성을 체크합니다.
		  const is_checked = checkbox.checked;

		  // 3. 결과를 출력합니다.
		  document.getElementById('result').innerText = is_checked;
		  
		}
</script>

</head>
<body>

	
	<h1>배송지 등록</h1>
	<br>

	<form action="./writeAddressProcess" method="post">
 <div class="col-md-6">
    	<label class="form-label">받는 사람</label>
    	<input name="address_name" type="text" class="form-control">
  	</div>
  	<br>
  	<div class="col-md-6">
    	<label class="form-label">전화번호</label>
    	<input name="address_phone" type="text" class="form-control">
  	</div>
  	<br>
   	<div class="col-md-2">
   	 <label class="form-label">우편번호</label>
    	<input name="address_postcode" type="text" class="form-control">
  	</div>
  	<br>
  	<div class="col-12">
   	 <label class="form-label">주소</label>
    	<input name="address_detail1" type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
  	</div>
  	<br>
  	<div class="col-12">
    	<label class="form-label">상세주소</label>
    	<input name="address_detail2" type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
  	</div>
   <br>
  	<div>
  	
  	<input type="checkbox" name="address_default" value="T"  id="my_checkbox" onclick='is_checked()'/>기본 배송지로 선택
  	
  	</div>
  <br>
  	<div class="col-12">
   	<button type="submit" class="btn btn-primary">등록</button>
   	 
  	</div>
	</form>


						
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>																			
</body>
</html>