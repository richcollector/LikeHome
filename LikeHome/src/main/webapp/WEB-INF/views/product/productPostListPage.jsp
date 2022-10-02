<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />

<title>Insert title here</title>


<style type="text/css">
	@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");

	body {
		font-family: Pretendard;
		color:#404040;
		}  

	.p-name{
		color: #ff6500;
	    font-size: 1.1rem;
	    font-weight: 600;
	}
</style>

<script type="text/javascript">
	var productNo = ${productData.productVo.product_no};
	
	function refreshProductPostList(productNo) {
	    
	    var xhr = new XMLHttpRequest(); 
	    xhr.onreadystatechange = function() {
	       
	       if (xhr.readyState == 4 && xhr.status == 200) {
	          var jsonObj = JSON.parse(xhr.responseText); 
	       
	          var postListBox = document.getElementById("PostListBox");
	          postListBox.innerHTML = "";
	       
	          for(var data of jsonObj.subpostDataList){
	             
	             var imageBox = document.createElement("div");
	             imageBox.classList.add("col");
	             postListBox.appendChild(imageBox);
	             
	             var image = document.createElement("img");
	             image.classList.add("rounded");
	             image.classList.add("img-fluid");
	            image.setAttribute("onclick" , "location.href='../post/postDetailPage?post_no='"+ data.post_no +"'");
	             image.setAttribute("src" , "/uploadFiles/"+data.subpost_image_link);
	             imageBox.appendChild(image);
	             
	             var scrapIcon = document.createElement("i");
	             scrapIcon.classList.add("text-opacity-50");
	             scrapIcon.classList.add("bi");
	             if(data.postScrapVo != null){
	                scrapIcon.setAttribute("style","color:#ff6500;position: absolute; bottom: 0%; right: 3%; font-size: 1.2rem;")
	             }else{
	                scrapIcon.classList.add("text-white");
	                scrapIcon.setAttribute("style","position: absolute; bottom: 0%; right: 3%; font-size: 1.2rem;")
	             }
	             scrapIcon.classList.add("bi-bookmark-fill");
	             scrapIcon.setAttribute("onclick","doScrap("+data.post_no+",this)")
	             imageBox.appendChild(scrapIcon);
	             
	             
	             
	          }
	          var script = document.createElement("script");
	          script.setAttribute("src","https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js")
	          script.setAttribute("integrity","sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D")
	          script.setAttribute("crossorigin","anonymous")
	          script.setAttribute("async","true")
	          postListBox.after(script)
	             
	          
	       }
	
	    }
	    xhr.open("get", "./restProductPostListPage?productNo=" + productNo);
	    xhr.send();
	 };
	 
	 

	 window.addEventListener("DOMContentLoaded", function (){
			//처음 실행되는 코드 모음
			refreshProductPostList(productNo);
		});
		
	
	   
</script>
</head>
<body>
<div class="container-fluid">
	
    <jsp:include page="../common/header2.jsp"></jsp:include>	

	<div class="row my-3">
		<div class="col-3"><img class="rounded img-fluid" src="../resources/img/06b846a3-20b7-4f87-b615-18b5a5882fd1_1660203841645.jpg"></div>
		<div class="col">
			<span class="p-name">${productData.productVo.product_name }</span><span>로 꾸민 유저들의 스타일링 사진</span>
		</div>
	</div>
      
    <div class="row row-cols-2 row-cols-md-6 g-2" id="PostListBox" data-masonry='{"percentPosition": true }'>
	
	</div>
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>	
	
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</body>
</html>