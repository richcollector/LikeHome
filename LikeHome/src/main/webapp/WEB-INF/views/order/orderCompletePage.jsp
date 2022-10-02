<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>주문완료</title>
<style type="text/css">
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");

	body {
      font-family: Pretendard;
      color: #292929;
      font-size:0.9rem;
      }
      
    .btn-main{
		background-color:#ff6500;
		color:white;
	}

	.btn-sub{
	 	background-color:white;
	 	color:#ff6500;
	 	border-color:#ff6500;
	 	}
	.title{
		 font-weight: 600;
		 }
	.subtitle{
		color: #757575;
		margin: 0.5rem auto;
	}
	
	.content{
		margin: 0.5rem auto;
	}
	
	.total{
		color:#ff6500;
		font-size:1.1rem;
		font-weight:600;
		}
	 	
</style>

<script type="text/javascript">
window.addEventListener("DOMContentLoaded", function (){
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
<body class="bg-light">
<div class="container-fluid">

	<div class="row bg-white py-2 border-bottom">
		<div class="col text-center fs-5">주문 완료</div>
	</div>
	
	<div class="row bg-white mb-2" style="padding: 5rem 0rem;"><!-- 주문완료멘트 -->
		<div class="col">
			<div class="row mb-1">
				<div class="col text-center fs-5">주문이 완료되었습니다.</div>
			</div>
			
			<div class="row mb-2">
				<div class="col text-center"><span>주문번호 : </span><span>${orderVo.order_code }</span></div>
			</div>
			<div class="row mb-3">
				<div class="col text-center">
					<button class="btn btn-sub" onclick="location.href='./orderDetailPage?order_no=${orderVo.order_no}'">주문상세보기</button>
					<button class="btn btn-main" onclick="location.href='../main/mainPage'">계속쇼핑하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row mb-2 bg-white">
	  <div class="col">
	    <div class="row pt-3">
	      <div class="col title">배송정보</div>
	    </div>
	    <div class="row">
	      <div class="col-3">
	        <div class="subtitle">받는분</div>
	        <div class="subtitle">배송지</div>
	        <div class="subtitle">연락처</div>
	      </div>
	      <div class="col">
	        <div class="content">${orderVo.order_receiver_name }</div>
	        <div class="content">${orderVo.order_receiver_address1}${orderVo.order_receiver_address2 }</div>
	        <div class="content">${orderVo.order_receiver_phone }</div>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="row bg-white mb-2 py-3 total">
	  <div class="col">결제금액</div>
	  <div class="col money text-end">${orderVo.order_total_amount }</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>