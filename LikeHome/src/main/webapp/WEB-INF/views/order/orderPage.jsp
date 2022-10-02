<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>주문결제</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
	body {
		font-family: Pretendard;
		color: #404040;
	}
      
      
	.rc{
		background-color: white;
		margin-bottom:3px;
	}
	
	.payment-name{
		font-size:small;
		color:#757575;
		text-align:center;
	}
	
	.order-title{ 
		font-weight: 500;
    	font-size: 1.1rem;
		margin: 0.8rem auto;
	}
	
	.order-subtitle{
		font-size: 1rem;
		color: #757575;
		margin: 0.5rem auto;
	}
	
	.btn-main{
		background-color:#ff6500;
		color:white;
	}
	
	.btn-sub{
	 	background-color:white;
	 	color:#ff6500;
	 	font-size:0.9rem;
	 	border-color:#ff6500;
	 	}
	 	
	 #totalAmt{
	 	color:#ff6500;
	 }
	 
	 .deliveryImg{
	 	width:8rem;
	 }
	 
	 .card-body{
	 	padding: 0.6rem;
	 	font-size:0.9rem;
	 }
	 
	 
		
</style>

<script type="text/javascript">

	
	function calcTotalAmt(){
		
		var productAmt = document.getElementById("productAmt").innerText;
		var deliveryAmt = document.getElementById("deliveryAmt").innerText;
		var usedCouponAmt = document.getElementById("usedCouponAmt").innerText;
		var usedPointAmt = document.getElementById("usedPointAmt").innerText;
		var totalAmt = document.getElementById("totalAmt");
		
		productAmt = parseInt(productAmt.replace(/[^0-9]/g, ""));
		deliveryAmt = parseInt(deliveryAmt.replace(/[^0-9]/g, ""));
		usedCouponAmt = parseInt(usedCouponAmt.replace(/[^0-9]/g, ""));
		usedPointAmt = parseInt(usedPointAmt.replace(/[^0-9]/g, ""));
		
		totalAmt.innerText = productAmt + deliveryAmt - usedCouponAmt - usedPointAmt;
		orderBtn.innerText= productAmt + deliveryAmt - usedCouponAmt - usedPointAmt;
		totalInput.value = productAmt + deliveryAmt - usedCouponAmt- usedPointAmt;
	}
	
	//point
	function usePointAll(){
		
		//point section 	
		var usablePoint = document.getElementById("usablePoint");
		
		if(usablePoint.innerText == '0'){
			return;
		}
		
		var pointInput = document.getElementById("pointInput"); 
		pointInput.setAttribute("value", usablePoint.innerText);
		
		var usedPointAmt = document.getElementById("usedPointAmt");
		usedPointAmt.innerText = usablePoint.innerText;
			
		usablePoint.innerText= 0;
		
		//amt section
		
		calcTotalAmt();
		changeMoneyUnit();
	}
	
	
	function usePoint(){

		var usablePoint = document.getElementById("usablePoint");
		var pointInput = document.getElementById("pointInput");
			
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);
					
					var usablePointAmt =  jsonObj.customerTotalPoint;
					
					if(pointInput.value > usablePointAmt){
						pointInput.value = usablePointAmt;
						usablePoint.innerText = 0;
						
					}else{
						usablePoint.innerText = usablePointAmt - pointInput.value; 
					}
					
					var usedPointAmt = document.getElementById("usedPointAmt");
					usedPointAmt.innerText = pointInput.value;
				}
				calcTotalAmt();
				changeMoneyUnit();
				
			}
			xhr.open("get", "./restUsePointProcess");
			xhr.send();
	}
	
	
	function selectCoupon(){

		var couponSelectBox = document.getElementById("couponSelectBox");
    	var couponName = couponSelectBox.options[couponSelectBox.selectedIndex].text;
    	console.log(couponName);
    	var regex = /[^0-9]/g;				
    	var couponAmt = couponName.replace(regex, "");
    	console.log(couponAmt);
            
    	var usedCouponAmt = document.getElementById("usedCouponAmt");
    	usedCouponAmt.innerText = couponAmt;
    	
    	calcTotalAmt();
    	changeMoneyUnit();
    }
    
	
	//address
	function deleteAddress(addressNo){

			
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);
					
					refreshAddressList();
				}
			}
			xhr.open("post", "../customer/restDeleteAddressProcess");
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr.send("addressNo=" + addressNo);
	}
	
	function showUpdateAddressPage(addressNo){

		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				console.log(jsonObj);
				
				var data = jsonObj.addressVo;
				var updateFrm = document.getElementById('modalAddress');
				updateFrm.innerHTML = '';
				
				var frm = document.createElement('form');
				frm.name = "updatedForm";
				frm.id = "updatedForm";
				//frm.setAttribute("action", "../customer/restUpdateAddressProcess");
				frm.setAttribute('method',"post");
				
		      	var row = document.createElement('div');
	            row.classList.add('row');
	            updateFrm.appendChild(frm);
	            frm.appendChild(row);
				
	            var col = document.createElement('div');
	            col.classList.add('col');
	            row.appendChild(col);
				
	            
	            //수령인
	            var row1 = document.createElement('div');
	            row1.classList.add('row','my-2');

	            var row1col1 = document.createElement('div');
	            row1col1.classList.add('col-3');
	            row1col1.innerText = '수령인';
	            
	            var row1col2 = document.createElement('div');
	            row1col2.classList.add('col');
	            var input1 = document.createElement('input');
	            input1.classList.add('form-control');
	            input1.setAttribute('type', 'text');
	            input1.name = 'address_name';
	            input1.setAttribute('value', data.address_name);
	            row1col2.appendChild(input1);

	            row1.appendChild(row1col1);
	            row1.appendChild(row1col2);

	            //우편번호와 주소찾기
	            var row2 = document.createElement('div');
	            row2.classList.add('row','my-2');

	            var row2col1 = document.createElement('div');
	            row2col1.classList.add('col-3');
	            row2col1.innerText = '우편번호';
	            
	            var row2col2 = document.createElement('div');
	            row2col2.classList.add('col-4');
	            var input2 = document.createElement('input');
	            input2.classList.add('form-control');
	            input2.setAttribute('type', 'number');
	            input2.name = 'address_postcode';
	            input2.setAttribute('value', data.address_postcode);

	            row2col2.appendChild(input2);

	            var row2col3 = document.createElement('div');
	            row2col3.classList.add('col-4');
	            var addressbtn = document.createElement('button');
	            addressbtn.classList.add('btn', 'btn-secondary');
	            addressbtn.setAttribute("onclick","findAddress(this)");
	            addressbtn.innerText = '주소찾기';
	            row2col3.appendChild(addressbtn);

	            row2.appendChild(row2col1);
	            row2.appendChild(row2col2);
	            row2.appendChild(row2col3);

	            //주소지
	            var row3 = document.createElement('div');
	            row3.classList.add('row','my-2');

	            var row3col1 = document.createElement('div');
	            row3col1.classList.add('col-3');
	            row3col1.innerText = '주소지';
	            
	            var row3col2 = document.createElement('div');
	            row3col2.classList.add('col');
	            var input3 = document.createElement('input');
	            input3.classList.add('form-control');
	            input3.setAttribute('type', 'text');
	            input3.name = 'address_detail1';
	            input3.setAttribute('value', data.address_detail1);

	            row3col2.appendChild(input3);

	            row3.appendChild(row3col1);
	            row3.appendChild(row3col2);

	            //상세주소
	            var row4 = document.createElement('div');
	            row4.classList.add('row','my-2');

	            var row4col1 = document.createElement('div');
	            row4col1.classList.add('col-3');
	            row4col1.innerText = '상세주소';
	            
	            var row4col2 = document.createElement('div');
	            row4col2.classList.add('col');
	            var input4 = document.createElement('input');
	            input4.classList.add('form-control');
	            input4.setAttribute('type', 'text');
	            input4.name = 'address_detail2';
	            input4.setAttribute('value', data.address_detail2);

	            row4col2.appendChild(input4);

	            row4.appendChild(row4col1);
	            row4.appendChild(row4col2);

	            //연락처
	            var row5 = document.createElement('div');
	            row5.classList.add('row','my-2');

	            var row5col1 = document.createElement('div');
	            row5col1.classList.add('col-3');
	            row5col1.innerText = '연락처';
	            
	            var row5col2 = document.createElement('div');
	            row5col2.classList.add('col');
	            var input5 = document.createElement('input');
	            input5.classList.add('form-control');
	            input5.setAttribute('type', 'text');
	            input5.name = 'address_phone';
	            input5.setAttribute('value', data.address_phone);

	            row5col2.appendChild(input5);

	            row5.appendChild(row5col1);
	            row5.appendChild(row5col2);

	            //저장하기 버튼
	            
	            var input6 = document.createElement('input');
	            input6.setAttribute("type", "hidden");
	            input6.name = 'address_no';
	            input6.setAttribute('value', data.address_no);
	            frm.appendChild(input6);
	            
	            var row6 = document.createElement('div');
	            row6.classList.add('row','my-2');

	            var row6col1 = document.createElement('div');
	            row6col1.classList.add('col', 'd-grid');

	            var savebtn = document.createElement('button');
	            savebtn.classList.add('btn', 'btn-dark');
	            savebtn.setAttribute("type","button");
	            savebtn.setAttribute("onclick", "updateAddress()");
	            savebtn.innerText = '저장하기';
	            row6col1.appendChild(savebtn);
	            row6.appendChild(row6col1);

	            col.appendChild(row1);
	            col.appendChild(row2);
	            col.appendChild(row3);
	            col.appendChild(row4);
	            col.appendChild(row5);
	            col.appendChild(row6);
	            
			}
			
		}
		xhr.open("post", "../customer/restUpdateAddressPage");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("addressNo=" + addressNo);
	}
	
	function updateAddress(){
		var dd = new FormData(document.getElementById('updatedForm'));
		//updatedForm.action = "../customer/restUpdateAddressProcess"
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				refreshAddressList();
			}
		}
		xhr.open("post", "../customer/restUpdateAddressProcess");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send(dd);
	}
	
	function applyAddress(addressNo){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var data = jsonObj.addressData;
				
				document.getElementById('receiverName').value = data.address_name;
				document.getElementById('receiverPhone').value = data.address_phone;
				document.getElementById('receiverPostcode').value = data.address_postcode;
				document.getElementById('receiverAddress1').value = data.address_detail1;
				document.getElementById('receiverAddress2').value = data.address_detail2;
				document.getElementById('receiverAddress2').value = data.address_detail2;
				
			}
		}
		xhr.open("post", "../customer/restApplyAddressProcess");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("addressNo=" + addressNo);
	}
	
	function refreshAddressList(){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var modalAddress = document.getElementById('modalAddress');
				modalAddress.innerHTML = "";
				
				 for( data of jsonObj.addressDataList){

					    var addressRow = document.createElement('div');
					    addressRow.classList.add("row","my-3");
					    modalAddress.appendChild(addressRow);

					    var addressCol = document.createElement('div');
					    addressCol.classList.add("col");
					    addressRow.appendChild(addressCol);

					    var row1 = document.createElement('div');
					    row1.classList.add("row", "mb-2");
					    
					    var row1col1 = document.createElement('div');
					    row1col1.classList.add('col');
					    var row1col1span = document.createElement('span');
					    row1col1span.classList.add('fw-bold');
					    row1col1span.innerText = data.address_name;
					    row1col1.appendChild(row1col1span);
					    
					    if(data.address_default == 'T'){
					    	var defaultSpan = document.createElement('span');
					    	//defaultSpan.classList.add('badge','text-bg-primary');
					    	defaultSpan.innerText= '기본배송지';
					    	defaultSpan.style.color = '#ff6500';
					    	defaultSpan.style.fontSize = '0.9rem';
					    	row1col1.appendChild(defaultSpan);
					    }
					    
					    var row1col2 = document.createElement('div');
		                row1col2.classList.add('col-3','text-end');
		                var btn = document.createElement('button');
		                btn.classList.add('btn', 'btn-outline-dark', 'btn-sm')
		                btn.setAttribute('data-bs-dismiss', 'modal');
		                btn.setAttribute('aria-label', 'Close');
		                btn.setAttribute('onclick', "applyAddress(" + data.address_no + ")");
		                btn.innerText = '선택';

		                row1col2.appendChild(btn);

		                var row2 = document.createElement('div');
		                row2.classList.add('row');
		                var row2col1 = document.createElement('div');
		                row2col1.classList.add('col');
		                row2col1.innerText = "(" + data.address_postcode + ")" + data.address_detail1 + ", " + data.address_detail2;

		                var row3 = document.createElement('div');
		                row3.classList.add('row');
		                
		                var row3col1 = document.createElement('div');
		                row3col1.classList.add('col');
		                row3col1.innerText = data.addressVo.address_phone;
		                
		                var row3col2 = document.createElement('div');
		                row3col2.classList.add('col', 'text-end');
		                var span1 = document.createElement('span');
		                span1.classList.add('text-secondary');
		                span1.setAttribute('onclick', "showUpdateAddressPage(" + data.address_no + ")");
		                span1.innerText = '수정';
		                var span2 = document.createElement('span');
		                span2.innerText = '&#183;'
		                var span3 = document.createElement('span');
		                span3.classList.add('text-secondary');
		                span3.setAttribute('onclick',"deleteAddress(" + data.address_no + ")");
		                var span4 = document.createElement('span');
		                span4.innerText = '&#183;'
		                var span5 = document.createElement('span');
		                span5.classList.add('text-secondary');
		                span5.setAttribute('data-bs-toggle', 'modal');
		                span5.setAttribute('data-bs-target', "#showMap");
		                span5.setAttribute('onclick',"showMap(" + data.address_detail1 + ")");
		                span5.innerText = '위치보기';

		                row3col2.appendChild(span1);
		                row3col2.appendChild(span2);
		                row3col2.appendChild(span3);
		                row3col2.appendChild(span4);
		                row3col2.appendChild(span5);

		                row1.appendChild(row1col1);
		                row1.appendChild(row1col2);
		                row2.appendChild(row2col1);
		                row3.appendChild(row3col1);
		                row3.appendChild(row3col2);
		                
		                addressCol.appendChild(row1);
		                addressCol.appendChild(row2);
		                addressCol.appendChild(row3);
				       
					  }
				
			}
		}
		xhr.open("get", "../customer/restAddressListPage");
		xhr.send();
	}
	
	
	function registerAddress(){
		
			var frm = $("#addressForm").serialize();

			console.log(frm);
			
			$.ajax({
				type : 'post',
				url : '../customer/restRegisterAddressProcess',
				data : frm,
				dataType : 'json',
				error: function(xhr, status, error){
					alert(error);
				},
				success : function(json){
				}
			});
			refreshAddressList();
	}
	
    function findAddress(e) {
		
        new daum.Postcode({
            oncomplete: function(data) {
               
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
               
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                /* if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    //document.getElementById("receiverAddress1").value = extraAddr;
                
                } else {
                    document.getElementById("receiverAddress1").value = '';
                }  */
                
                var addressBox = e.closest('.addressBox');
                addressBox.querySelector('.receiverPostcode').value = data.zonecode;
                addressBox.querySelector('.receiverAddress1').value = addr;
                addressBox.querySelector('.receiverAddress2').focus();

                /* document.getElementById('receiverPostcode').value = data.zonecode;
                document.getElementById("receiverAddress1").value = addr;
                document.getElementById("receiverAddress2").focus(); */
            }
        }).open();
    }
    
    
    function payWithKakaopay(){
    	
    	var formData = new FormData();
    	
		//orderVo setting
    	formData.append('order_purchaser_name', document.getElementById('purchaserName').value);
    	formData.append('order_purchaser_phone', document.getElementById('purchaserPhone').value);
    	formData.append('order_receiver_name', document.getElementById('receiverName').value);
    	formData.append('order_receiver_phone', document.getElementById('receiverPhone').value);
    	formData.append('order_receiver_postcode', document.getElementById('receiverPostcode').value);
    	formData.append('order_receiver_address1', document.getElementById('receiverAddress1').value);
    	formData.append('order_receiver_address2', document.getElementById('receiverAddress2').value);
    	//formData.append('order_total_amount', document.getElementById('totalAmt').innerText);
    	
    	var xhr = new XMLHttpRequest();
		
		xhr.open("post", "../order/restPayWithKakaoPayProcess");
		xhr.onload = function(){
			var jsonObj = JSON.parse(xhr.responseText);
			var box = jsonObj.next_redirect_pc_url;
			window.open(box);
			/* orderForm.action = "../order/orderProcess"; */
			
		}
		xhr.send(formData);
    }
    
    function showMap(addressDetail){
    	
    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
    	
		setTimeout(function(){ map.relayout(); }, 200);
	
		var map = new kakao.maps.Map(mapContainer, mapOption);//맵 
		var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); //마커 
		var zoomControl = new kakao.maps.ZoomControl();//줌
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);//화면에 줌 추가
		var geocoder = new kakao.maps.services.Geocoder();//주소 좌표 변환
		
		geocoder.addressSearch(addressDetail, function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		        
		        marker.setMap(map);
				map.setCenter(coords);	
	
		    } 
		});    
		
    }

    
    
    
    
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


<!-- 배송지목록 모달시작 -->
  	<div class="modal fade" id="myAddressList" data-bs-keyboard="false" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">배송지</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div id="modalAddress" class="modal-body">
	    	<c:choose>
	    	 <c:when test="${empty addressList}">
	    	 	<div class="row">
	    	 		<div class="col text-center">
	    	 			<div class="p-7"><img class="img-fluid deliveryImg" alt="" src="../resources/img/dkfsjl.png"></div>
	    	 			<div class="mb-4">등록된 배송지가 없습니다</div>
	    	 		</div>
	    	 	</div>
	    	 </c:when>
			<c:otherwise>
				<c:forEach items="${addressList }" var="addressList">
					<div class="row my-3">
				      <div class="col">
				        <div class="row mb-2">
				        	<div class="col"><span class="fw-bold">${addressList.address_name }</span>
				        		<c:if test="${addressList.address_default == 'T' }">
				        			<span style="color:#ff6500;font-size:0.9rem;"> 기본배송지</span>
				        		</c:if>
				        	</div>
				        	<div class="col-3 text-end"><button class="btn btn-outline-dark btn-sm" data-bs-dismiss="modal" aria-label="Close" onclick="applyAddress(${addressList.address_no})">선택</button></div>
				       </div>
				        <div class="row mb-2">
				        	<div class="col">(${addressList.address_postcode }) ${addressList.address_detail1 }, ${addressList.address_detail2 }</div>
				       </div>
				       <div class="row mb-2">
				        	<div class="col">${addressList.address_phone }</div>
				        	<div class="col text-end">
				        		<span class="text-secondary" onclick="showUpdateAddressPage(${addressList.address_no})"> 수정</span>
				        		<span>&middot;</span>
				        		<span class="text-secondary" onclick="deleteAddress(${addressList.address_no})">삭제</span>
				        		<span>&middot;</span>
				        		<span class="text-secondary" data-bs-toggle="modal" data-bs-target="#showMap" onclick="showMap('+ ${addressList.address_detail1} + ')">위치보기</span>
				        	</div>
				        </div>
				      </div>
				    </div>
 				</c:forEach>
			</c:otherwise>
	       </c:choose>  
	       <div class="row">
	       	<div class="col d-grid"><button class="btn btn-main" data-bs-toggle="modal" data-bs-target="#addAddress">+ 배송지 추가하기</button></div>
	       </div>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 배송지목록 모달 끝 -->

   <!--  카카오 맵 보기 모달시작 -->
<div class="modal fade" id="showMap" data-bs-keyboard="false" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">위치보기</h5>
        <button type="button" class="btn-close" data-bs-toggle="modal" data-bs-target="#myAddressList" aria-label="Close"></button>
      </div>
      
		<div class="modal-body">
			<!-- 지도api test -->
			<div id="map" style="width:100%;height:350px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b8f2bbe9546945c29265d17b8f0af6c&libraries=services"></script>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b8f2bbe9546945c29265d17b8f0af6c"></script>
	    </div>
    </div>
  </div>
</div>
<!-- 카카오맵 모달 끝 -->


<!-- 배송지추가 모달시작 -->
  	<div class="modal fade" id="addAddress" data-bs-keyboard="false" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">배송지 추가</h5>
	        <button type="button" class="btn-close" data-bs-toggle="modal" data-bs-target="#myAddressList" aria-label="Close"></button>
	      </div>
	      <form id="addressForm">
		      <div class="modal-body">
				<div class="row addressBox">
				  <div class="col">
				    <div class="row my-2">
				      <div class="col-3">우편번호</div>
				      <div class="col"><input name="address_postcode" class="form-control receiverPostcode" type="number"></div>
				      <div class="col-4 d-grid"><button type="button" class="btn btn-sub px-1" onclick="findAddress(this)">주소찾기</button></div>
				    </div>
				    <div class="row my-2">
				      <div class="col-3">주소지</div>
				      <div class="col"><input name="address_detail1" class="form-control receiverAddress1" type="text"></div>
				    </div>
				    <div class="row my-2">
				      <div class="col-3">상세주소</div>
				      <div class="col"><input name="address_detail2" class="form-control receiverAddress2" type="text"></div>
				    </div>
				    <div class="row my-2">
				      <div class="col-3">수령인</div>
				      <div class="col"><input name="address_name" class="form-control" type="text"></div>
				    </div>
				    <div class="row my-2">
				      <div class="col-3">연락처</div>
				      <div class="col"><input name="address_phone" class="form-control" type="text"></div>
				    </div>
				    <div class="row">
				      <div class="col-1"><input name="address_default" class="form-check-input" type="checkbox" value="T"></div>
                      <div class="col text-secondary">기본 배송지로 저장</div>
				    </div>
				  </div>
				</div>
		       	<div class="row my-3">
		       		<div class="col d-grid"><button type="button" class="btn btn-main" data-bs-toggle="modal" data-bs-target="#myAddressList" onclick="registerAddress()">저장하기</button></div>
		       	</div>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>
<!-- 배송지추가 모달 끝 -->
				
<div class="container-fluid">

	<jsp:include page="../common/header2.jsp"></jsp:include>	
	

     <form id="orderForm" name="orderForm" enctype="multipart/form-data" action="./orderProcess" method="post">
      <section class="row bg-white mb-2"><!--주문자정보-->
        <div class="col">
          <div class="row">
            <div class="col order-title">주문자</div>
          </div>
          <div class="row">
            <div class="col">
              <div class="row mb-1"><!--주문자>이름-->
                <div class="col-3 order-subtitle">이름</div>
                <div class="col">
                  <input id="purchaserName" name="order_purchaser_name" type="text" class="form-control"></div>
              </div>
              <div class="row mb-1"><!--주문자>휴대전화-->
                <div class="col-3 order-subtitle">휴대전화</div>
                <div class="col">
                  <input id="purchaserPhone" name="order_purchaser_phone" type="text" class="form-control"></div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="row bg-white mb-2"><!--배송지정보-->
        <div class="col">
          <div class="row">
            <div class="col order-title">배송지</div>
            <div class="col-4 my-1 text-end"><!-- 배송지 모달 실행 -->
            	<button type="button" class="btn btn-sub py-0 mt-3" data-bs-toggle="modal" data-bs-target="#myAddressList">배송지목록</button>
            </div>
          </div>
          <div class="row">
            <div class="col">
              <div class="row mb-1"><!--받는사람-->
                <div class="col-3 order-subtitle">받는 사람</div>
                <div class="col">
                  <input id="receiverName" name="order_receiver_name" type="text" class="form-control receiverName"></div>
              </div>
              <div class="row mb-1"><!--연락처-->
                <div class="col-3 order-subtitle">휴대전화</div>
                <div class="col">
                  <input id="receiverPhone" name="order_receiver_phone" type="text" class="form-control receiverPhone"></div>
              </div>
              <div class="row addressBox">
                <div class="col-3 order-subtitle">주소</div>
                <div class="col">
                  <div class="row mb-1"><!--주소1-->
                    <div class="col">
                      <input id="receiverPostcode" name="order_receiver_postcode" type="text" class="form-control receiverPostcode"></div>
                    <div class="col-5 d-grid">
                      <button type="button" class="btn btn-sub" onclick="findAddress(this)">주소찾기</button>
                    </div>
                  </div>
                  <div class="row mb-1"><!--주소2-->
                    <div class="col">
                      <input id="receiverAddress1" name="order_receiver_address1" type="text" class="form-control receiverAddress1"></div>
                  </div>
                  <div class="row mb-1"><!--주소3-->
                    <div class="col">
                      <input id="receiverAddress2" name="order_receiver_address2" type="text" class="form-control receiverAddress2"></div>
                  </div>
                  <div class="row mb-1">
                    <div class="col-1"><input class="form-check-input" type="checkbox"></div>
                    <div class="col text-secondary">기본 배송지로 저장</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="row bg-white mb-2"><!--주문상품-->
        <div class="col">
          <div class="row">
            <div class="col order-title">주문상품</div>
          </div>
          <div class="row">
            <div class="col">
              <div class="row">
                <div class="col">

                  <c:forEach items="${dataList }" var="data">
                  <input type="hidden" name="cart_no" value="${data.cartVo.cart_no }">
                    <div class="card my-2">
                      <div class="card-header py-1">
                        <div class="row">
                          <div class="col" style="font-size:0.9rem">${data.vendorVo.vendor_brand_name }</div>
                          <div class="col text-end text-secondary" style="font-size:0.9rem">
							<c:choose>
								<c:when test="${data.productVo.product_delivery_fee == 0 }"><span>무료배송</span></c:when>
								<c:otherwise><span>배송비 </span><span class="money">${data.productVo.product_delivery_fee }</span></c:otherwise>
							</c:choose>
                          </div>
                        </div>
                      </div>
                      <div class="card-body">
                        <div class="row">
                          <div class="col-3"><img src="../../uploadFiles/titleImage/${data.productTitleImageVo.title_image_link }" class="rounded img-fluid" alt="..."></div>
                          <div class="col">
                            <div class="row">
                            	<div class="col">${data.productVo.product_name }</div>
                            </div>
                            <div class="row">
                            	<div class="col">
	                            	<span class="money" style="font-size:0.9rem;font-weight:bold;">${data.productVo.product_price}</span>
	                            	<span class="text-secondary" style="font-size:0.9rem"> | ${data.cartVo.cart_product_quantity }개</span>
                            	</div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                </c:forEach>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="row bg-white mb-2"><!--쿠폰-->
        <div class="col">
          <div class="row">
            <div class="col order-title">쿠폰</div>
          </div>
          <div class="row mb-2">
            <div class="col">
              <select id="couponSelectBox" class="form-select" name="coupon_no" onchange="selectCoupon()" aria-label="Default select example">
                <option selected value="0">쿠폰 선택</option>
               <c:forEach items="${couponList }" var="coupon">
                <option value="${coupon.coupon_no}">${coupon.coupon_name}(${coupon.coupon_amount }원)</option>
               </c:forEach>
              </select>
            </div>
          </div>
        </div>
      </section>
      <section class="row bg-white mb-2"><!--포인트-->
        <div class="col">
          <div class="row">
            <div class="col order-title">포인트</div>
          </div>
          <div class="row mb-1">
            <div class="col d-grid">
            	<input id="pointInput" type="number" class="form-control d-grid" value="0" onblur="usePoint()">
            </div>
            <div class="col-4 d-grid">
            	<button type="button" class="btn btn-sub" onclick="usePointAll()">전액사용</button>
            </div>
          </div>
          <div class="row mb-1">
            <div class="col order-subtitle">사용가능 포인트 <span class="text-secondary" id="usablePoint">${customerTotalPoint }</span>P</div>
          </div>
        </div>
      </section>
      <section class="row bg-white mb-2"><!--결제수단-->
        <div class="col">
          <div class="row">
            <div class="col order-title">결제수단</div>
          </div>
          <div class="row mb-3">
            <div class="col-3">
            	<div class="row p-2"><img src="../resources/img/img_card.png"></div>
            	<div class="row">
            		<div class="col payment-name">카드</div>
         		</div>
            </div>
            <div class="col-3">
            	<div class="row p-2"><img src="../resources/img/img_vbank.png"></div>
            	<div class="row name-small">
            		<div class="col payment-name">무통장입금</div>
            	</div>
            </div>
            <div class="col-3">
            	<div class="row p-2"><img src="../resources/img/img_kakaopay.png"></div>
            	<div class="row">
            		<div class="col payment-name">카카오페이</div>
            	</div>
            </div>
            <div class="col-3">
            	<div class="row p-2"><img src="../resources/img/img_naver.png"></div>
            	<div class="row">
            		<div class="col payment-name">네이버페이</div>
            	</div>
            </div>
          </div>
        </div>
      </section>
      
      
      <c:set var="productSum" value="0"></c:set>
      <c:set var="deliverySum" value="0"></c:set>
      
      	<c:forEach items="${dataList }" var="data">
      		<c:set var = "productSum" value="${productSum + (data.productVo.product_price * data.cartVo.cart_product_quantity) }"></c:set>
      		<c:set var = "deliverySum" value="${deliverySum + data.productVo.product_delivery_fee }"></c:set>
      	</c:forEach>
      
      	<c:set var="totalSum" value="${productSum + deliverySum }"></c:set>
		
		
      
      <div class="row bg-white mb-2"><!--결제금액정보-->
        <div class="col">
          <div class="row">
            <div class="col order-title">결제금액</div>
          </div>
          <div class="row">
            <div class="col">
              <div class="row">
                <div class="col order-subtitle">총 상품 금액</div>
                <div class="col text-end"><span id="productAmt" class="money"><c:out value="${productSum }"></c:out></span></div>
              </div>
              <div class="row">
                <div class="col order-subtitle">총 배송비</div>
                <div class="col text-end"><span id="deliveryAmt" class="money"><c:out value="${deliverySum }"></c:out></span></div>
              </div>
              <div class="row">
                <div class="col order-subtitle">쿠폰 사용</div>
                <div class="col text-end"><span>(-)</span><span id="usedCouponAmt" class="money">0원</span></div>
              </div>
              <div class="row">
                <div class="col order-subtitle">포인트 사용</div>
                <div class="col text-end"><span>(-)</span><span id="usedPointAmt" class="money">0원</span></div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col fs-5 fw-bold">최종 결제 금액</div>
            <div class="col fs-5 text-end fw-bold money" id="totalAmt"><c:out value="${totalSum }"></c:out></div>
          </div>
        </div>
      </div>
      <div class="row bg-white py-2 sticky-bottom"><!--결제버튼-->
        <div class="col d-grid">
         <%--   <button class="btn btn-dark" type="button" onclick="payWithKakaopay()">${totalSum }원 결제하기</button>  --%>
         <button class="btn btn-main"><span class="money" id="orderBtn" style="color:white">${totalSum }</span> 결제하기</button>
        <input type="hidden" id="totalInput" name="order_total_amount" value="${totalSum }"> 
        </div>
      </div>
    </form>
   
   <jsp:include page="../common/footer.jsp"></jsp:include>		
   
  </div>
    
    


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>