<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<title>Insert title here</title>
<style type="text/css">
@import
	url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css")
	;

body {
	font-family: pretendard;
}

.nowrap {
	white-space: nowrap;
}

.overflow {
	overflow: hidden;
}

.ellipsis {
	text-overflow: ellipsis;
}
</style>
<script>
var index = 1;
	function hashtagPlus(e){
		
		if(e.value){
		var hashtagName = e.value;
		var hashtagBox = e.parentElement;
		e.remove();
		
		
		var Hashtag = document.createElement("i");
		Hashtag.innerText = "#"+hashtagName;
		Hashtag.setAttribute("style","color:#ff6500")
		Hashtag.classList.add("hashtag_keywords");
		hashtagBox.appendChild(Hashtag);
		
		var HashTagDeleteIcon =document.createElement("i");
		HashTagDeleteIcon.classList.add("bi");
		HashTagDeleteIcon.classList.add("bi-x");
		HashTagDeleteIcon.setAttribute("onclick","deleteHashtag(this)");
		Hashtag.after(HashTagDeleteIcon);
		
		
	  	var hasgtagInputbox = document.createElement("input");
	  	hasgtagInputbox.classList.add("hashTag");
	  	hasgtagInputbox.classList.add("form-control");
	  	hasgtagInputbox.classList.add("form-control-sm");
	  	hasgtagInputbox.classList.add("border");
	  	hasgtagInputbox.classList.add("border-white");
	  	hasgtagInputbox.classList.add("rounded-pill");
	  	hasgtagInputbox.setAttribute("type" , "text");
	  	hasgtagInputbox.setAttribute("style" , "width: 4rem;  display:inline-block ");
	  	hasgtagInputbox.setAttribute("placeholder" , "#태그");
	  	hasgtagInputbox.setAttribute("onblur" ,"hashtagPlus(this)");
	  	hashtagBox.appendChild(hasgtagInputbox);
		}
	}
function deleteHashtag(e){
	e.previousElementSibling.remove();
	e.remove();
	
}
	function setThumbnail(e) {
		var subpostBox = document.getElementById("subpostBox");
		var x= e.closest('.row');
		
		if(document.getElementById("fakeBox")){
			document.getElementById("fakeBox").remove();
		}
		
		x.setAttribute("style","display:none");
    	for (var image of e.files) {
    	  var reader = new FileReader();

    	  reader.onload = function(event) {
    		  	
    		  	
    		  	
    		  	var subpostRowBox = document.createElement("div");
    		  	subpostRowBox.classList.add("subPostRow");
    		  	subpostRowBox.classList.add("row");
    		  	subpostRowBox.classList.add("mb-4");
    		  	
    			var subpostColBox = document.createElement("div");
    			subpostColBox.classList.add("col");
    			subpostRowBox.appendChild(subpostColBox);
    			
    		  	var innerRow1 = document.createElement("div");
    		  	innerRow1.classList.add("row");
    		  	innerRow1.classList.add("subPostImageRow");
    		  	innerRow1.setAttribute("style", "position:relative;")
    		  	subpostColBox.appendChild(innerRow1);
    		  	
    		  	var selectedBox = document.createElement("div");
    		  	selectedBox.classList.add("row");
    		  	selectedBox.classList.add("my-1");
    		  	selectedBox.classList.add("orderedRow");
    		  	selectedBox.setAttribute("id", "offanvasRow"+index);
    		  	subpostColBox.appendChild(selectedBox);
    		  	

    		  	var innerRow2 = document.createElement("div");
    		  	innerRow2.classList.add("row");
    		  	innerRow2.classList.add("my-1");
    		  	subpostColBox.appendChild(innerRow2);
    		  	
    		
    		  	var innerRow3 = document.createElement("div");
    		  	innerRow3.classList.add("row");
    		  	innerRow3.classList.add("mb-1");
    		  	subpostColBox.appendChild(innerRow3);
    		  	
    		  	var innerRow4 = document.createElement("div");
    		  	innerRow4.classList.add("row");
    		  	innerRow4.classList.add("mb-2");
    		  	subpostColBox.appendChild(innerRow4);
    		  	
    		  	
    		  	
	    	    var imagebox = document.createElement("div");
	    	    imagebox.classList.add("col");
	    	    innerRow1.appendChild(imagebox);

    		  	var innerEditRow = document.createElement("div");
    		  	innerEditRow.classList.add("row");
    		  	innerEditRow.classList.add("my-1");
    		  	innerEditRow.setAttribute("style","position:absolute;width: 100%; bottom:0%")
    		  	imagebox.appendChild(innerEditRow);

    		  	var offanvasCol = document.createElement("div");
    		  	offanvasCol.classList.add("col-6");
    		  	offanvasCol.classList.add("pe-0");
    		  	offanvasCol.classList.add("mb-0");
    		  	offanvasCol.classList.add("ms-2");
    		  	offanvasCol.classList.add("orderedProductBox");
    		  	offanvasCol.setAttribute("style","align-self:center");
    		  	innerEditRow.appendChild(offanvasCol);
    		  	
    		  	var offanvasButton =  document.createElement("button");
    		  	offanvasButton.classList.add("btn");
    		  	offanvasButton.classList.add("ps-2");
    		  	offanvasButton.classList.add("py-1");
    		  	offanvasButton.setAttribute("style", "border:0; width:100%; background-color: #ff6500; color:white");
    		  	offanvasButton.setAttribute("onclick", "orderedProduct(undefined,"+index+")");
    		  	offanvasButton.setAttribute("type", "button");
    		  	offanvasButton.setAttribute("data-bs-target","#offcanvasBottom");
    		  	offanvasButton.setAttribute("data-bs-toggle","offcanvas");
    		  	offanvasButton.setAttribute("aria-controls","offcanvasBottom");
    		  	offanvasButton.innerText = "구매한 상품 태그하기";
    		  	offanvasCol.appendChild(offanvasButton);
				index++;
    		  	
				var img = document.createElement("img");
   		  	    img.setAttribute("src", event.target.result);
   		  		img.classList.add("img");
   		  		img.classList.add("img-fluid");
   		  		img.classList.add("rounded");
   		  		imagebox.appendChild(img);
	    	    
				var editBox = document.createElement("div");
				editBox.classList.add("col");
				editBox.classList.add("ps-0");
				editBox.classList.add("me-2");
				editBox.setAttribute("style","align-self:center")
				innerEditRow.appendChild(editBox);
				
				var deleteButton = document.createElement("Button");
				deleteButton.classList.add("btn");
				deleteButton.classList.add("p-0");
				deleteButton.classList.add("ms-3");
				deleteButton.setAttribute("type","button")
				deleteButton.setAttribute("onclick","imageDelete(this)")
				deleteButton.setAttribute("style","float:right; border:0")
				editBox.appendChild(deleteButton);
   				
   				var deleteIcon = document.createElement("i");
				deleteIcon.classList.add("bi");
				deleteIcon.classList.add("bi-trash");
				deleteIcon.classList.add("fs-5");
				deleteIcon.setAttribute("style","color:white")
				deleteButton.appendChild(deleteIcon);
				
				
				var editButton = document.createElement("Button");
				editButton.classList.add("btn");
				editButton.classList.add("p-0");
				editButton.setAttribute("type","button")
				editButton.setAttribute("onclick","imageEdit(this)")
				editButton.setAttribute("style","float:right; border:0")
				editBox.appendChild(editButton);
				var editIcon = document.createElement("i");
				editIcon.classList.add("bi");
				editIcon.classList.add("bi-arrow-clockwise");
				editIcon.classList.add("fs-5");
				editIcon.setAttribute("style","color:white")
				editButton.appendChild(editIcon);
				
	  			var innerRow2Col = document.createElement("div");
   		  		innerRow2Col.classList.add("col");
   		  		innerRow2Col.classList.add("d-grid");
   		  		innerRow2.appendChild(innerRow2Col);
   		  		
   		  		var sapceTypeSelect = document.createElement("select");
   		  		sapceTypeSelect.classList.add("form-select")
   		  		sapceTypeSelect.classList.add("space_type_no")
   		  		innerRow2Col.appendChild(sapceTypeSelect);
   		  		
   		  		var sapceTypeSelectoption = document.createElement("option");
   		  		sapceTypeSelectoption.innerText="공간";
   		  		sapceTypeSelect.appendChild(sapceTypeSelectoption);
   		 		
   		  		<c:forEach items="${PostCategory.spaceTypeDataList }" var="spaceType">
   		  		var  sapceTypeSelectoptionForEachResult = document.createElement("option");
   		  		sapceTypeSelectoptionForEachResult.setAttribute("value","${spaceType.space_type_no }")
		  		sapceTypeSelectoptionForEachResult.innerText="${spaceType.space_type_name }";
		  		sapceTypeSelect.appendChild(sapceTypeSelectoptionForEachResult);
		  		</c:forEach>
   		  		

   		  		var innerRow3Col = document.createElement("div");
   		  		innerRow3Col.classList.add("col");
   		  		innerRow3.appendChild(innerRow3Col);
   		  		
   		  		var textBox = document.createElement("textarea");
   		  		textBox.classList.add("form-control");
   		  		textBox.classList.add("subpost_content");
   		  		innerRow3Col.appendChild(textBox);
   		  		
   		  		var innerRow4Col = document.createElement("div");
		  		innerRow4Col.classList.add("col");
		  		innerRow4Col.classList.add("hashtagBox");
		  		innerRow4.appendChild(innerRow4Col);
		  		
		  		
		  		
		  		var hashtagBox = document.createElement("input");
		  		hashtagBox.classList.add("hashTag");
		  		hashtagBox.classList.add("form-control");
		  		hashtagBox.classList.add("form-control-sm");
		  		hashtagBox.classList.add("border");
		  		hashtagBox.classList.add("border-white");
		  		hashtagBox.classList.add("rounded-pill");
		  		hashtagBox.setAttribute("style" , "width: 4rem; display:inline-block");
		  		hashtagBox.setAttribute("type" , "text");
		  		hashtagBox.setAttribute("placeholder" , "#태그");
		  		hashtagBox.setAttribute("onblur","hashtagPlus(this)");
		  		innerRow4Col.appendChild(hashtagBox);
   		  		
		  		document.querySelector("div#subpostBox").appendChild(subpostRowBox);	
		  		
		  		subPostPluesCreate()

   				
   			
   		  		
   		   };
			
  	    console.log(image);
   	   reader.readAsDataURL(image);
  	  }
  	}

	
	function subPostPluesCreate(){
		var subpostBox = document.getElementById("subpostBox");
		
	  	var subpostRowBox = document.createElement("div");
	  	subpostRowBox.classList.add("row");
	  	subpostRowBox.classList.add("imageInputRow");
	  	subpostBox.appendChild(subpostRowBox);
		
	  	var subpostColBox = document.createElement("div");
		subpostColBox.classList.add("col");
		subpostRowBox.appendChild(subpostColBox);
		
		
		var innerRow5 = document.createElement("div");
	 	 	innerRow5.classList.add("row");
	 	 	subpostColBox.appendChild(innerRow5);
	 		
	 		var subPostPlusBox = document.createElement("div");
	 		subPostPlusBox.classList.add("imageInputBox");
	 		subPostPlusBox.classList.add("col");
		 	subPostPlusBox.classList.add("d-grid");
			innerRow5.appendChild(subPostPlusBox);
			
			var imageinput = document.createElement("input");
			imageinput.classList.add("image");
			imageinput.setAttribute("style","display:none");
			imageinput.setAttribute("oninput","setThumbnail(this)");
			imageinput.setAttribute("type","file");
			imageinput.setAttribute("accept","image/*");
			subPostPlusBox.appendChild(imageinput); 
			
			var subPostPlusButton = document.createElement("button");
			subPostPlusButton.classList.add("btn");
			subPostPlusButton.setAttribute("type","button")
			subPostPlusButton.classList.add("subPostPuls");
			subPostPlusButton.classList.add("p-2");
			subPostPlusButton.innerText = "추가하기";
			subPostPlusButton.setAttribute("style","background:none rgb(245, 245, 245); color: #404040; border-color:rgb(245, 245, 245)")
			subPostPlusButton.setAttribute("onclick","this.parentElement.querySelector('input').click()")
			subPostPlusBox.appendChild(subPostPlusButton);
			
}	
	
function imageDelete(e){
	var x = e.closest(".subPostRow");
	var y = x.previousElementSibling;
	x.remove();
	y.remove();
}	

function imageEdit(e){
	var x = e.closest(".subPostRow");
	var z = x.previousElementSibling.querySelector(".imageInputBox");
	var editInput = document.createElement("input");
	editInput.classList.add("tempImage");
	editInput.setAttribute("style","display:none");
	editInput.setAttribute("type","file");
	editInput.setAttribute("onchange","editImageThumbnail(this)");
	editInput.setAttribute("accept","image/*");
	z.appendChild(editInput);
	
	editInput.click();
}

function editImageThumbnail(e){
	var x = e.closest(".imageInputRow").nextElementSibling.querySelector(".img")
	for (var image of e.files) {
  	  var reader = new FileReader();
  	
  		reader.onload = function(event) {
  		 	x.setAttribute("src", event.target.result);
  			e.className ="image";
  			var z = e.parentElement.querySelectorAll("input");
  			z[0].remove();
  		}
  	  
  		
  	reader.readAsDataURL(image);
	}

	
}

	function postSubmit(){
		var house_type_no = document.getElementById("house_type_no").value;
		var house_style_no = document.getElementById("house_style_no").value;
		var imageCount = document.getElementsByClassName("image");
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
   		 xhr.onreadystatechange = function () {
     	if(xhr.readyState == 4 && xhr.status == 200){
         var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
		
         for(var i = 0 ; i < imageCount.length-1 ; i++){
				subpostSubmit(i);
			}
			
	 	
		
		if(result.result){
			location.href="../post/postListPage";
		}
		}      
    }	
	xhr.open("post","./restPostRegisterProcess",false);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("house_type_no=" + house_type_no + "&house_style_no=" + house_style_no); 
		

	
}
	
	 function subpostSubmit(e){
		 var i = e;
		 var hashtag_keyword = new Array();
		 var product_no = new Array();
		 var FD = new FormData();
		 var imageList = document.getElementsByClassName("image");
		 var file = imageList[i].files[0];
		 var space_type_noList = document.getElementsByClassName("space_type_no");
		 var space_type_no = space_type_noList[i].value
		 var subpost_contentList = document.getElementsByClassName("subpost_content");
		 var subpost_content = subpost_contentList[i].value;
		 var hashtagBoxList = document.getElementsByClassName("hashtagBox");
		 var hashtag_keywordsList = hashtagBoxList[i].getElementsByClassName("hashtag_keywords")
		 for(var x of hashtag_keywordsList){
		     hashtag_keyword.push(x.innerText)
		 }
		 var productList = document.getElementsByClassName("orderedRow");
		 var productNoList = productList[i].getElementsByClassName("inputProduct")
		 for( var y of productNoList){
			 console.log("뭐나오냐"+y);
			 product_no.push(y.value)
		 }
		 
		 FD.append("space_type_no",space_type_no)
		 FD.append("file",file);
		 FD.append("subpost_content", subpost_content)		 
		 FD.append("hashtag_keyword", hashtag_keyword)
		 FD.append("product_no", product_no)
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	    		xhr.onreadystatechange = function () {
	      	 if(xhr.readyState == 4 && xhr.status == 200){
		          var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
	     	  }      
	  	  } 
	  	  xhr.open("post","./restSubPostRegisterProcess" , false);
	  		for (let key of FD.keys()) {
	 	   console.log(key);
		 }
	  		for (let value of FD.values()) {
	  	      console.log(value);
	  	}
		  xhr.send(FD);
	 }
	 
	function deleteSelectedProduct(e){
		e.closest(".card").remove();
	}
	


</script>
</head>
<body>
	<div class="container-fluid" style="margin: 0 auto">

		<div class="row sticky-top my-2 pb-1"
			style="border-bottom: 0.2rem solid #f8f9fa; background: white">
			<div class="col" onclick="history.back()">
				<i class="fs-3 bi bi-arrow-left"></i>
			</div>
			<div onclick="postSubmit()" class="text-end fs-5 col-3 p-0 me-3"
				style="align-self: center; color: #ff6500">올리기</div>
		</div>

		<div class="row my-2 pb-2" style="border-bottom: 0.2rem solid #f8f9fa">
			<div class="col pe-1">
				<select class="form-select" id="house_type_no" name="house_type_no">
					<option>주거형태</option>
					<c:forEach items="${PostCategory.houseTypeDataList }"
						var="houseType">
						<option value="${houseType.house_type_no }">${houseType.house_type_name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col ps-1">
				<select class="form-select" id="house_style_no"
					name="house_style_no">
					<option>스타일</option>
					<c:forEach items="${PostCategory.houseStyleDataList }"
						var="houseStyle">
						<option value="${houseStyle.house_style_no }">${houseStyle.house_style_name }</option>
					</c:forEach>
				</select>
			</div>
		</div>


		<div class="row mb-4">
			<div class="col" id="subpostBox">
				<div class="row imageInputRow">
					<div class="col">
						<div class="row" style="position: relative;">
							<div class="imageInputBox col d-grid">
								<div class="row my-1"
									style="position: absolute; width: 100%; bottom: 0%">
									<div class="col-6 pe-0 mb-0 ms-2 orderedProductBox"
										style="align-self: center;">
										<button class="btn ps-2 py-1"
											style="width: 100%; border: 0; background-color: #ff6500; color: white"
											onclick="orderedProduct(undefined,1)" type="button"
											data-bs-target="#offcanvasBottom" data-bs-toggle="offcanvas"
											aria-controls="offcanvasBottom">구매한 상품 태그하기</button>
									</div>
									<div class="col ps-0 me-2" style="align-self: center">
										<button class="btn p-0 ms-3" type="button"
											onclick="imageDelete(this)" style="float: right; border: 0">
											<i class="bi bi-trash fs-5" style="color: #404040"></i>
										</button>
										<button class="btn p-0" type="button"
											onclick="imageEdit(this)" style="float: right; border: 0">
											<i class="bi bi-arrow-clockwise fs-5" style="color: #404040"></i>
										</button>
									</div>
								</div>
								<input style="display: none" oninput="setThumbnail(this)"
									name="file" class="image" type="file" accept="image/*">
								<img onclick="this.parentElement.querySelector('input').click()"
									src="../resources/img/camera.png"
									style="max-width: 100%; height: auto;">


							</div>
						</div>
							<div class="row" id="fakeBox">
						<div class="col">
							<div class="row my-1">
								<div class="col d-grid">
									<select class="form-select space_type_no"><option>공간</option>
										<option value="1">원룸</option>
										<option value="2">거실</option>
										<option value="3">침실</option>
										<option value="4">주방</option>
										<option value="5">욕실</option>
										<option value="6">아이방</option>
										<option value="7">드레스룸</option>
										<option value="8">서재&amp;작업실</option>
										<option value="9">베란다</option>
										<option value="10">사무공간</option>
										<option value="11">상업공간</option>
										<option value="12">가구&amp;소품</option>
										<option value="13">현관</option>
										<option value="14">외관&amp;기타</option></select>
								</div>
							</div>
							<div class="row mb-1">
								<div class="col">
									<textarea class="form-control subpost_content"></textarea>
								</div>
							</div>
							<div class="row mb-2">
								<div class="col hashtagBox">
									<input
										class="hashTag form-control form-control-sm border border-white rounded-pill"
										style="width: 4rem; display: inline-block" type="text"
										placeholder="#태그" onblur="hashtagPlus(this)">
								</div>
							</div>
						</div>
					</div>
					
					</div>
			
				</div>
			</div>

		</div>
		 <jsp:include page="../common/footer.jsp"></jsp:include>
		</div>

		<div style="height: 90%; max-width: 100%; margin: 0 atuo;"
			class="offcanvas offcanvas-bottom offcanvas-vertical-height"
			tabindex="-1" id="offcanvasBottom"
			aria-labelledby="offcanvasBottomLabel">
			<div class="offcanvas-header">
				<script type="text/javascript">
  	function orderedProduct(e,x){
  		var btnIndex = x;
  		var searchWord;
  		var editOrderedId = document.getElementById("orderedId")
  		editOrderedId.setAttribute("onkeyup","orderedProduct(this,"+btnIndex+")")
  		if(e == undefined){
  		}else{
  			searchWord = e.value;
  		}
  		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
  	     xhr.onreadystatechange = function () {
  	        if(xhr.readyState == 4 && xhr.status == 200){
  	           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
  	        	var offcanvasBody = document.getElementById("offanvasBody")
  	        	offcanvasBody.innerHTML = "";
  	        	for(var data of result.orderProductData){
  	        	
  	        	var cardBox = document.createElement("div");
  	        	cardBox.classList.add("card");
  	        	cardBox.classList.add("mb-2");
  	        	cardBox.classList.add("border-0");
  	        	offcanvasBody.appendChild(cardBox);
  	        	
  	        	var cardRow = document.createElement("div");
  	        	cardRow.classList.add("row");
  	        	cardRow.classList.add("g-0");
  	        	cardRow.setAttribute("style","height:100%")
  	        	cardBox.appendChild(cardRow);
  	        	
  	        	var cardImageBox = document.createElement("div");
  	        	cardImageBox.classList.add("col-3");
  	        	cardImageBox.setAttribute("style","object-fit:cover; height:100%");
  	        	cardRow.appendChild(cardImageBox);
  	        	
  	        	var cardImage = document.createElement("img");
  	        	cardImage.setAttribute("src","/uploadFiles/titleImage/"+data.productTitleImage+"")
  	        	cardImage.setAttribute("style","height:100%; width:100%; border-radius:1.6rem")
  	        	cardImageBox.appendChild(cardImage);
  	        	
  	        	var cardBodyBox = document.createElement("div");
  	        	cardBodyBox.classList.add("col-7");
  	        	cardBodyBox.classList.add("ps-1");
  	        	cardRow.appendChild(cardBodyBox);
  	        	
  	        	var PoductBrandName = document.createElement("p");
  	        	PoductBrandName.classList.add("m-0");
  	        	PoductBrandName.setAttribute("style","font-weight:bold; color:#757575; font-size:0.8rem")
  	        	PoductBrandName.innerText = data.vendorBrandName;
  	        	cardBodyBox.appendChild(PoductBrandName);
  	        	
  	        	var ProductName = document.createElement("p");
  	        	ProductName.classList.add("m-0");
  	        	ProductName.setAttribute("style","color:#404040")
  	        	ProductName.innerText = data.productVo.product_name;
  	        	cardBodyBox.appendChild(ProductName);
  	        	
  	        	
  	        	var cardSelect = document.createElement("div");
  	        	cardSelect.classList.add("col-2");
  	        	cardSelect.classList.add("text-center");
  	        	cardSelect.setAttribute("style","align-self:center")
  	        	cardRow.appendChild(cardSelect);
  	        	
  	        	var cardButton = document.createElement("button");
  	        	cardButton.setAttribute("type", "button");
  	        	cardButton.setAttribute("style", "background: #ff6500; color:white ; border-color:#ff6500");
  	        	cardButton.setAttribute("onclick", "selectProduct("+data.productVo.product_no+","+btnIndex+")");
  	        	cardButton.classList.add("btn");
  	        	cardButton.classList.add("btn-sm");
  	        	cardButton.setAttribute("data-bs-dismiss","offcanvas")
  	        	cardButton.innerText = "선택";
  	        	cardSelect.appendChild(cardButton);
  	        	}
  	        }      
  	           
  			}
  	    xhr.open("post" , "../post/restOrderProductList");
  	    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  	    xhr.send("searchWord=" + searchWord); 
  	
  	}
  	
  	function selectProduct(no,e){
		var product_no = no;
		var btnIndexNo = e; 
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
   		 xhr.onreadystatechange = function () {
     	 if(xhr.readyState == 4 && xhr.status == 200){
         var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
		
   			var orerdProductPlusBox = document.getElementById("offanvasRow"+btnIndexNo)
   			
        	var cardBox = document.createElement("div");
	        	cardBox.classList.add("card");
	        	cardBox.classList.add("mt-1");
	        	cardBox.setAttribute("style","border:0")
	        	orerdProductPlusBox.appendChild(cardBox);
	        	
	        	var inputProductNo = document.createElement("input");
	        	inputProductNo.classList.add("inputProduct");
	        	inputProductNo.setAttribute("type","hidden")
	        	inputProductNo.setAttribute("value", no);
	        	cardBox.appendChild(inputProductNo);
	        	
	        	var cardRow = document.createElement("div");
	        	cardRow.classList.add("row");
	        	cardRow.classList.add("g-0");
	        	cardRow.setAttribute("style","height:100%")
	        	cardBox.appendChild(cardRow);
	        	
	        	var cardImageBox = document.createElement("div");
	        	cardImageBox.classList.add("col-2");
	        	cardImageBox.setAttribute("style","object-fit:cover; height:100%");
	        	cardRow.appendChild(cardImageBox);
	        	
	        	var cardImage = document.createElement("img");
	        	cardImage.setAttribute("src","/uploadFiles/titleImage/"+result.productDetail.productTitleImage+"")
	        	cardImage.setAttribute("style","height:100%; width:100%;border-radius:1.2rem")
	        	cardImageBox.appendChild(cardImage);
	        	
	        	var cardBodyBox = document.createElement("div");
	        	cardBodyBox.classList.add("col-8");
	        	cardBodyBox.classList.add("ps-1");
	        	cardRow.appendChild(cardBodyBox);
	        	
	        	var PoductBrandName = document.createElement("p");
	        	PoductBrandName.classList.add("m-0");
	        	PoductBrandName.setAttribute("style","color:#757575; font-weight:bold; font-size:0.8rem")
	        	PoductBrandName.innerText = result.productDetail.productBrandName
	        	cardBodyBox.appendChild(PoductBrandName);
	        	
	        	var ProductName = document.createElement("p");
	        	ProductName.setAttribute("style","color:#404040; font-size:0.9rem")
	        	ProductName.classList.add("m-0");
	        	ProductName.classList.add("nowrap");
  	        	ProductName.classList.add("overflow");
  	        	ProductName.classList.add("ellipsis");
	        	ProductName.innerText = result.productDetail.productVo.product_name
	        	cardBodyBox.appendChild(ProductName);
	        	
	        	
	        	
	        	var cardSelect = document.createElement("div");
	        	cardSelect.classList.add("col-2");
	        	cardSelect.classList.add("text-center");
	        	cardSelect.setAttribute("style","align-self:center")
	        	cardRow.appendChild(cardSelect);
	        	
	        	var productDeleteButton = document.createElement("button");
	   			productDeleteButton.classList.add("btn");
	   			productDeleteButton.classList.add("btn-sm");
	   			productDeleteButton.classList.add("bi");
	   			productDeleteButton.classList.add("bi-x-lg");
	   			productDeleteButton.setAttribute("onclick", "deleteSelectedProduct(this)");
	   			productDeleteButton.setAttribute("style","font-size:1.2rem")
	   			cardSelect.appendChild(productDeleteButton);
	   			
		}      
    }	
	xhr.open("post","./restSelectProductDetail");
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("product_no=" + product_no); 
  	}
  	
  </script>
				<input id="orderedId" class="form-control"
					type="text">
				<button type="button" class="btn-close text-reset"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div id="offanvasBody" class="offcanvas-body small"></div>
		</div>


		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>