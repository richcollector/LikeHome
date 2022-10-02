<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠폰생성</h1>
	
	<form action="./writeCouponProcess" method="post">
		
		쿠폰 이름 : 
		<input type="text" name="coupon_name"><br>
		
		쿠폰 할인금액 :
		<input type="text" name="coupon_amount"><br>
				
		쿠폰 만료 날짜 : 
		<input type="date" name="coupon_end_date"><br>
		
	 <button type="submit" class="btn btn-primary">등록</button>
	 
	</form>
		 												
</body>
</html>