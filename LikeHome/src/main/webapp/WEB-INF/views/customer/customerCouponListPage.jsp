<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<title>Insert title here</title>
<style>
@import
	url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css")
	;

body {
	font-family: Pretendard;
}

#title {
	font-size: 0.6rem;
}

#card {
	background-color: white;
	margin: 1rem;
	border: none;
}

#end {
	text-align: center;
	margin-left: 1em;
	margin-top: 1em;
}

#center {
	margin-right: 0.5em;
	margin-left: 0.7em;
	font-size: 1rem;
	font-weight: bold;
	text-align: left;
	margin-bottom: 0px;
	color: #404040;
}

#listcoupon{
 border: none; 
 background: none;

}

#amount{
	font-size: 1.3rem;
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
</style>

<script type="text/javascript">
	
	
	function getCoupon(couponNo,e){
		var x = e.querySelector(".bi")
		console.log(x)
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				x.setAttribute('style', 'color: #757575');
	              
			}
		}
		
		xhr.open("post" , "./getCouponProcess"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("coupon_no=" + couponNo); //AJAX로 리퀘스트함..				
	}
	
	

	window.addEventListener("DOMContentLoaded", function (){
		//처음 실행되는 코드 모음
		changeMoneyUnit();
		
	});
	
	// 원 표시 자동변환 script
    function changeMoneyUnit() {
        var moneyValue = document.querySelectorAll(".money");
        const moneyUnit = "원"
        var regex = /[^0-9]/g;
        for(i of moneyValue){
            result = i.innerText.toString().replace(regex,"").replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            result = result.concat(moneyUnit);
            i.innerText = result;
        };
    };

	
	
</script>
</head>
<body>
<div class="container-fluid">
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="row">
		<div class="col px-0">
			<img class="img-fluid" src="../resources/img/coupon_ad.jpg">
		</div>
	</div>
	<!-- 여기까지 -->
	
		<c:forEach items="${getCouponDataList }" var="data">
			<div id="card" class="card my-4 shadow-lg">
				<div class="card-body">
					<div id="title" class="row">
						<div id="center" class="col-8">
							${data.couponVo.coupon_name }<br> 
							<span id="amount" class="money">${data.couponVo.coupon_amount }</span><br> 
							<span style="font-size: 0.7rem; color: #757575;"><fmt:formatDate value="${data.couponVo.coupon_end_date }" pattern="yyyy.MM.dd"/>까지</span>
						</div>
						<div id="end" class="col px-0">
							<c:if test="${!empty customerInfo }">
								<button	class="btn" style="border-color: white; text-align: center; font-size: 3.5em;"
										onClick='getCoupon(${data.couponVo.coupon_no},this)'>
										<i class="bi bi-arrow-down-circle-fill"
											style="color: #ff6500;"></i>
									</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	


	<jsp:include page="../common/footer.jsp"></jsp:include>		

</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>