<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<title>Insert title here</title>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<style type="text/css">
@import
	url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css")
	;

::-webkit-scrollbar {
	display: none;
}

body {
	font-family: pretendard;
}

.postImage {
	width: 100%;
	height: 80%;
	background-repeat: no-repeat;
	background-size: cover;
}
/*네비바 css*/
#search {
	font-size: 1.2rem;
}

#cart {
	font-size: 1.5rem;
}

.scroll-container {
	display: flex;
	flex-wrap: no-wrap;
	overflow-x: scroll;
	overflow-y: hidden;
}

.menu {
	margin-left: 20px;
	flex: 0 0 auto;
}
/*네비바 css*/
</style>
<script type="text/javascript">
function userHome(){
	var contatinerColor = document.getElementById("container")
	contatinerColor.setAttribute("style","background-color: white")
	var homeTap = document.getElementById("homeTap")
	homeTap.setAttribute("style","color: #ff6500")
	var imageTap = document.getElementById("imageTap")
	imageTap.setAttribute("style","color: #404040")
	var followerTap = document.getElementById("followerTap")
	followerTap.setAttribute("style","color: #404040")
	var followingTap = document.getElementById("followingTap")
	followingTap.setAttribute("style","color: #404040")
	
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
        
           var postBox = document.getElementById("postBox");
           postBox.innerHTML="";
           
           var postColBox = document.createElement("div")
           postColBox.classList.add("col");
           postBox.appendChild(postColBox);
           
           var textRowBox = document.createElement("div")
           textRowBox.classList.add("row");
           textRowBox.classList.add("mb-1");
           textRowBox.classList.add("mt-3");
           textRowBox.setAttribute("style","justify-content: space-between");
           postColBox.appendChild(textRowBox);
           
           var text1 = document.createElement("div")
           text1.classList.add("col-auto");
           text1.setAttribute("style","color: #404040");
           textRowBox.appendChild(text1);
           
           var text1Span1 =document.createElement("span")
           text1Span1.innerText = " "+"사진"+" ";
           text1.appendChild(text1Span1);
           
           var text1Span2 =  document.createElement("span")
           text1Span2.classList.add("fw-bold");
           text1Span2.innerText = " "+result.data.postCount+" ";           
           text1.appendChild(text1Span2);
          
           var text2 =  document.createElement("div")
           text2.classList.add("col-auto");   
           text2.classList.add("text-end"); 
           text2.setAttribute("style","color:#ff6500")
           text2.setAttribute("onclick","imageHome()")
           text2.innerText = "전체보기"
           textRowBox.appendChild(text2);
           
           var imageRowBox = document.createElement("div")
           imageRowBox.classList.add("row");
           imageRowBox.classList.add("row-cols-3");
           imageRowBox.classList.add("row-cols-md-6");
           imageRowBox.classList.add("g-2");
           postColBox.appendChild(imageRowBox);
           
           
           for(var i = 0; i < result.data.postDataList.length; i++){
        	   if(i ==3){
        		   break;
        	   }else{
        		   var imageCol = document.createElement("div")
        		   imageCol.classList.add("col");
        		   imageRowBox.appendChild(imageCol);
        	   	
        		   var imageCard = document.createElement("div")
        		   imageCard.classList.add("card");
        		   imageCard.classList.add("px-0");
        		   imageCard.setAttribute("style","overflow: hidden; width: 7rem; height: 7rem; object-fit: cover");
        		   imageCard.setAttribute("onclick","location.href='../post/postDetailPage?post_no="+result.data.postDataList[i].postVo.post_no+"'");
        		   imageCol.appendChild(imageCard);
        		   
        		   
        		   var image = document.createElement("img")
        		   image.setAttribute("style","height:-webkit-fill-available")
        		   image.classList.add("rounded");
        		   image.setAttribute("src","/uploadFiles/"+result.data.postDataList[i].subpostVo.subpost_image_link+"")
        		   imageCard.appendChild(image);
        	   }
           }
           
           
           var textRowBox = document.createElement("div")
           textRowBox.classList.add("row");
           textRowBox.classList.add("mb-1");
           textRowBox.classList.add("mt-3");
           textRowBox.setAttribute("style","justify-content: space-between");
           postColBox.appendChild(textRowBox);
           
           var text1 = document.createElement("div")
           text1.classList.add("col-auto");
           text1.setAttribute("style","color: #404040");
           textRowBox.appendChild(text1);
           
           var text1Span1 =document.createElement("span")
           text1Span1.innerText = " "+"좋아요"+" ";
           text1.appendChild(text1Span1);
           
           var text1Span2 =  document.createElement("span")
           text1Span2.classList.add("fw-bold");
           text1Span2.innerText = " "+result.data.postLikeCount+" ";           
           text1.appendChild(text1Span2);
          
           var text2 =  document.createElement("div")
           text2.classList.add("col-auto");   
           text2.classList.add("text-end"); 
           text2.setAttribute("style","color:#ff6500")
           text2.setAttribute("onclick","imageHome()")
           text2.innerText = "전체보기"
           textRowBox.appendChild(text2);
           
           var imageRowBox = document.createElement("div")
           imageRowBox.classList.add("row");
           imageRowBox.classList.add("row-cols-3");
           imageRowBox.classList.add("row-cols-md-6");
           imageRowBox.classList.add("g-2");
           postColBox.appendChild(imageRowBox);
           
           
           for(var i = 0; i < result.data.postLikeDataList.length; i++){
        	   if(i ==3){
        		   break;
        	   }else{
        		   var imageCol = document.createElement("div")
        		   imageCol.classList.add("col");
        		   imageRowBox.appendChild(imageCol);
        	   	
        		   var imageCard = document.createElement("div")
        		   imageCard.classList.add("card");
        		   imageCard.classList.add("px-0");
        		   imageCard.setAttribute("style","overflow: hidden; width: 7rem; height: 7rem; object-fit: cover");
        		   imageCard.setAttribute("onclick","location.href='../post/postDetailPage?post_no="+result.data.postLikeDataList[i].postLikeVo.post_no+"'");
        		   imageCol.appendChild(imageCard);
        		   
        		   
        		   var image = document.createElement("img")
        		   image.setAttribute("style","height:-webkit-fill-available")
        		   image.classList.add("rounded");
        		   image.setAttribute("src","/uploadFiles/"+result.data.postLikeDataList[i].subPostImage+"")
        		   imageCard.appendChild(image);
        	   }
           }
           
           
           
           var textRowBox = document.createElement("div")
           textRowBox.classList.add("row");
           textRowBox.classList.add("mb-1");
           textRowBox.classList.add("mt-3");
           textRowBox.setAttribute("style","justify-content: space-between");
           postColBox.appendChild(textRowBox);
           
           var text1 = document.createElement("div")
           text1.classList.add("col-auto");
           text1.setAttribute("style","color: #404040");
           textRowBox.appendChild(text1);
           
           var text1Span1 =document.createElement("span")
           text1Span1.innerText = " "+"사진스크랩"+" ";
           text1.appendChild(text1Span1);
           
           var text1Span2 =  document.createElement("span")
           text1Span2.classList.add("fw-bold");
           text1Span2.innerText = " "+result.data.postScrapCount+" ";           
           text1.appendChild(text1Span2);
          
           var text2 =  document.createElement("div")
           text2.classList.add("col-auto");   
           text2.classList.add("text-end"); 
           text2.setAttribute("style","color:#ff6500")
           text2.setAttribute("onclick","imageHome()")
           text2.innerText = "전체보기"
           textRowBox.appendChild(text2);
           
           var imageRowBox = document.createElement("div")
           imageRowBox.classList.add("row");
           imageRowBox.classList.add("row-cols-3");
           imageRowBox.classList.add("row-cols-md-6");
           imageRowBox.classList.add("g-2");
           postColBox.appendChild(imageRowBox);
           
           
           for(var i = 0; i < result.data.postScrapDataList.length; i++){
        	   if(i ==3){
        		   break;
        	   }else{
        		   var imageCol = document.createElement("div")
        		   imageCol.classList.add("col");
        		   imageRowBox.appendChild(imageCol);
        	   	
        		   var imageCard = document.createElement("div")
        		   imageCard.classList.add("card");
        		   imageCard.classList.add("px-0");
        		   imageCard.setAttribute("style","overflow: hidden; width: 7rem; height: 7rem; object-fit: cover");
        		   imageCard.setAttribute("onclick","location.href='../post/postDetailPage?post_no="+result.data.postScrapDataList[i].postScrapVo.post_no+"'");
        		   imageCol.appendChild(imageCard);
        		   
        		   
        		   var image = document.createElement("img")
        		   image.setAttribute("style","height:-webkit-fill-available")
        		   image.classList.add("rounded");
        		   image.setAttribute("src","/uploadFiles/"+result.data.postScrapDataList[i].subPostImage+"")
        		   imageCard.appendChild(image);
        	   }
           }
           
           var textRowBox = document.createElement("div")
           textRowBox.classList.add("row");
           textRowBox.classList.add("mb-1");
           textRowBox.classList.add("mt-3");
           textRowBox.setAttribute("style","justify-content: space-between");
           postColBox.appendChild(textRowBox);
           
           var text1 = document.createElement("div")
           text1.classList.add("col-auto");
           text1.setAttribute("style","color: #404040");
           textRowBox.appendChild(text1);
           
           var text1Span1 =document.createElement("span")
           text1Span1.innerText = " "+"상품스크랩"+" ";
           text1.appendChild(text1Span1);
           
           var text1Span2 =  document.createElement("span")
           text1Span2.classList.add("fw-bold");
           text1Span2.innerText = " "+result.data.productScrapcount+" ";           
           text1.appendChild(text1Span2);
          
           var text2 =  document.createElement("div")
           text2.classList.add("col-auto");   
           text2.classList.add("text-end"); 
           text2.setAttribute("style","color:#ff6500")
           text2.setAttribute("onclick","imageHome()")
           text2.innerText = "전체보기"
           textRowBox.appendChild(text2);
           
           var imageRowBox = document.createElement("div")
           imageRowBox.classList.add("row");
           imageRowBox.classList.add("row-cols-3");
           imageRowBox.classList.add("row-cols-md-6");
           imageRowBox.classList.add("g-2");
           postColBox.appendChild(imageRowBox);
           
           
           for(var i = 0; i < result.data.productScrapDataList.length; i++){
        	   if(i ==3){
        		   break;
        	   }else{
        		   var imageCol = document.createElement("div")
        		   imageCol.classList.add("col");
        		   imageRowBox.appendChild(imageCol);
        	   	
        		   var imageCard = document.createElement("div")
        		   imageCard.classList.add("card");
        		   imageCard.classList.add("px-0");
        		   imageCard.setAttribute("style","overflow: hidden; width: 7rem; height: 7rem; object-fit: cover");
        		   imageCard.setAttribute("onclick","location.href='../post/postDetailPage?post_no="+result.data.productScrapDataList[i].productScrapVo.product_no+"'");
        		   imageCol.appendChild(imageCard);
        		   
        		   
        		   var image = document.createElement("img")
        		   image.setAttribute("style","height:-webkit-fill-available")
        		   image.classList.add("rounded");
        		   image.setAttribute("src","/uploadFiles/titleImage/"+result.data.productScrapDataList[i].productTitleImage+"")
        		   imageCard.appendChild(image);
        	   }
           }
           
           
           
           
        }      
           
		}
    xhr.open("post" , "./resrMyHomePage");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send(); 
}

function imageHome(){
	var contatinerColor = document.getElementById("container")
	contatinerColor.setAttribute("style","background-color:#f8f9fa")
	var homeTap = document.getElementById("homeTap")
	homeTap.setAttribute("style","color: #404040")
	var imageTap = document.getElementById("imageTap")
	imageTap.setAttribute("style","color: #ff6500")
	var followerTap = document.getElementById("followerTap")
	followerTap.setAttribute("style","color: #404040")
	var followingTap = document.getElementById("followingTap")
	followingTap.setAttribute("style","color: #404040")
		var postScrapTap = document.getElementById("postScrapTap")
	postScrapTap.setAttribute("style","color: #404040")
	var postLikeTap = document.getElementById("postLikeTap")
	postLikeTap.setAttribute("style","color: #404040")
	
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
        
           var postBox = document.getElementById("postBox");
           postBox.innerHTML="";
           
           var postColBox = document.createElement("div")
           postColBox.classList.add("col");
           postBox.appendChild(postColBox);
           
           var textRowBox = document.createElement("div")
           textRowBox.classList.add("row");
           textRowBox.classList.add("pt-2");
           textRowBox.setAttribute("style","background-color: white;")
           postColBox.appendChild(textRowBox);
           
           var text =  document.createElement("div")
           text.classList.add("col");
           text.classList.add("fw-bold");
           text.setAttribute("style","font-size: 1.2rem");
           textRowBox.appendChild(text);
           
           for(var data of result.data.postDataList){
        	   
		   		var imageRowBox = document.createElement("div")
           		imageRowBox.classList.add("row");
		   		imageRowBox.classList.add("pb-3");
           		postColBox.appendChild(imageRowBox);
        	   
        		var imageColBox = document.createElement("div")
        		imageColBox.classList.add("col");
        		imageColBox.classList.add("px-0");
        		imageColBox.classList.add("pb-1");
        		imageColBox.setAttribute("style","background-color: white")
        		imageRowBox.appendChild(imageColBox);
        	   
        		var imageRow1 = document.createElement("div")
        		imageRow1.classList.add("row");
        		imageRow1.classList.add("mt-1");
        		imageRow1.classList.add("mb-1");
        		imageRow1.classList.add("p-0");
        		imageRow1.setAttribute("style","width: 100%")
        		imageColBox.appendChild(imageRow1);
        		
                var profileCol =  document.createElement("div");
                profileCol.classList.add("col-2");
                profileCol.classList.add("ms-2");
                imageRow1.appendChild(profileCol);
                
                if(data.customerVo.customer_profile_image != null){
                var profileImage =  document.createElement("img");
                profileImage.classList.add("rounded-circle");
                profileImage.classList.add("img-fluid");
                profileImage.setAttribute("src","/uploadFiles/customerIntro/"+data.customerVo.customer_profile_image+"");
             	profileCol.appendChild(profileImage);
                }else{
             	   var profileImage =  document.createElement("img");
                    profileImage.classList.add("rounded-circle");
                    profileImage.classList.add("img-fluid");
                    profileImage.setAttribute("src","../resources/img/unprofile.gif");
                 	profileCol.appendChild(profileImage);
                }
        		
                var nickOuterCow = document.createElement("div")
                nickOuterCow.classList.add("col");
                nickOuterCow.classList.add("ps-1");
                imageRow1.appendChild(nickOuterCow);
                
                var nickRow = document.createElement("div")
                nickRow.classList.add("row");
                nickOuterCow.appendChild(nickRow);
                
                var nick = document.createElement("div")
                nick.classList.add("col");
                nick.classList.add("fw-bold");
                nick.setAttribute("style","color: #404040; font-size:0.9rem");
                nick.innerText = data.customerVo.customer_nick;
                nickRow.appendChild(nick);
                
                var dateRow = document.createElement("div")
                dateRow.classList.add("row");
                nickOuterCow.appendChild(dateRow);
                
        		var imageRow1Col1 = document.createElement("div")
        		imageRow1Col1.classList.add("col");
        		imageRow1Col1.classList.add("align-self-center");
        		imageRow1Col1.classList.add("text-start");
        		imageRow1Col1.setAttribute("style","color: #757575; font-size: 0.8rem")
        		imageRow1Col1.innerText= moment(data.postVo.post_write_date).format(' YYYY.MM.DD ');
        		dateRow.appendChild(imageRow1Col1);
        			
        			
        		var imageRow1Col2 = document.createElement("div")
        		imageRow1Col2.classList.add("col-auto");
        		imageRow1Col2.classList.add("align-self-center");
        		imageRow1Col2.classList.add("me-0");
        		imageRow1Col2.classList.add("p-0");
        		imageRow1Col2.setAttribute("data-bs-toggle","modal");
        		imageRow1Col2.setAttribute("data-bs-target","#exampleModal");
        		imageRow1Col2.setAttribute("onclick","modalReport("+data.postVo.post_no+")");
        		imageRow1.appendChild(imageRow1Col2);
        		
        		var dotIcon =  document.createElement("i")
        		dotIcon.classList.add("bi");
        		dotIcon.classList.add("bi-three-dots");
        		dotIcon.setAttribute("style","font-size:1.3rem")
        		imageRow1Col2.appendChild(dotIcon);
        		
        		
        		var imageRow2 = document.createElement("div")
        		imageRow2.classList.add("row");
        		imageRow2.classList.add("m-0");
        		imageRow2.setAttribute("style","width:100%");
        		imageColBox.appendChild(imageRow2);
        		
        		var imageCol = document.createElement("div")
        		imageCol.classList.add("col");
        		imageCol.classList.add("px-0");
        		imageRow2.appendChild(imageCol);
        		
        		var image = document.createElement("img")
        		image.classList.add("img-fluid");
        		image.setAttribute("onclick","location.href='../post/postDetailPage?post_no="+data.postVo.post_no+"'")
        		image.setAttribute("src","/uploadFiles/"+data.subpostVo.subpost_image_link+"")
        		imageCol.appendChild(image);
        		
        		var imageRow3 = document.createElement("div")
        		imageRow3.classList.add("row");
        		imageRow3.classList.add("my-2");
        		imageRow3.classList.add("mx-0");
        		imageRow3.setAttribute("style","width:100%")
        		imageColBox.appendChild(imageRow3);
        		
        		
        		var iconCol1 = document.createElement("div")
        		iconCol1.classList.add("col");
        		iconCol1.classList.add("text-center");
        		imageRow3.appendChild(iconCol1);
        		
        		
        		if(data.postLikeVo == null){
        		var heartIcon = document.createElement("i")
        		heartIcon.classList.add("bi");
        		heartIcon.classList.add("bi-heart");
        		heartIcon.setAttribute("style","font-size:1.3rem; color:#404040");
        		heartIcon.setAttribute("onclick","doLike("+data.postVo.post_no+")");
        		iconCol1.appendChild(heartIcon);
        		}else{
        			heartIcon.classList.add("bi");
            		heartIcon.classList.add("bi-heart-fill");
            		heartIcon.setAttribute("style","font-size:1.3rem; color:#ff6500");
            		heartIcon.setAttribute("onclick","doLike("+data.postVo.post_no+")");
            		iconCol1.appendChild(heartIcon);
        			
        		}
        		var heartCount = document.createElement("span")
        		heartCount.setAttribute("style","font-size:1.1rem");
        		heartCount.classList.add("ms-1");
        		heartCount.innerText= " "+data.postLikeCount+" ";
        		iconCol1.appendChild(heartCount);
        		
        		
        		var iconCol2 = document.createElement("div")
        		iconCol2.classList.add("col");
        		iconCol2.classList.add("text-center");
        		imageRow3.appendChild(iconCol2);
        		
        		
        		if(data.postScrapVo == null){
            		var scrapIcon = document.createElement("i")
            		scrapIcon.classList.add("bi");
            		scrapIcon.classList.add("bi-bookmark");
            		scrapIcon.setAttribute("style","font-size:1.3rem; color:#404040");
            		scrapIcon.setAttribute("onclick","doScrap("+data.postVo.post_no+")");
            		iconCol2.appendChild(scrapIcon);
            		}else{
            			var scrapIcon = document.createElement("i")
            			scrapIcon.classList.add("bi");
            			scrapIcon.classList.add("bi-bookmark-fill");
            			scrapIcon.setAttribute("style","font-size:1.3rem; color:#ff6500");
            			scrapIcon.setAttribute("onclick","doScrap("+data.postVo.post_no+")");
                		iconCol2.appendChild(scrapIcon);
            		}
        		
        		var scrapCount = document.createElement("span")
        		scrapCount.setAttribute("style","font-size:1.1rem");
        		scrapCount.classList.add("ms-1");
        		scrapCount.innerText= " "+data.postScrapCount+" ";
        		iconCol2.appendChild(scrapCount);
        		
        		var iconCol3 = document.createElement("div")
        		iconCol3.classList.add("col");
        		iconCol3.classList.add("text-center");
        		imageRow3.appendChild(iconCol3);
        		
        		var commentIcon = document.createElement("i")
        		commentIcon.classList.add("bi");
        		commentIcon.classList.add("bi-chat-dots");
        		commentIcon.setAttribute("style","font-size:1.3rem; color:#404040");
        		commentIcon.setAttribute("onclick","location.href='postDetailPage?post_no="+data.postVo.post_no+"#commentBox'");
        		iconCol3.appendChild(commentIcon);
        		
        		var commentCount = document.createElement("span")
        		commentCount.classList.add("ms-1");
        		commentCount.innerText= " "+data.postCommentCount+" ";
        		iconCol3.appendChild(commentCount);
        		
        		
        		var iconCol4 = document.createElement("div")
        		iconCol4.classList.add("col");
        		iconCol4.classList.add("text-center");
        		imageRow3.appendChild(iconCol4);
        		
        		var shareIcon = document.createElement("i")
        		shareIcon.classList.add("bi");
        		shareIcon.classList.add("bi-share");
        		shareIcon.setAttribute("style","font-size:1.3rem; color:#404040");
        		iconCol4.appendChild(shareIcon);
        		
           }
           
        }      
           
		}
     xhr.open("post" , "./resrMyHomePage");
     xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
     xhr.send(); 
}

function followerHome(){
	var contatinerColor = document.getElementById("container")
	contatinerColor.setAttribute("style","background-color:white")
	var homeTap = document.getElementById("homeTap")
	homeTap.setAttribute("style","color: #404040")
	var imageTap = document.getElementById("imageTap")
	imageTap.setAttribute("style","color: #404040")
	var followerTap = document.getElementById("followerTap")
	followerTap.setAttribute("style","color: #ff6500")
	var followingTap = document.getElementById("followingTap")
	followingTap.setAttribute("style","color: #404040")
		var postScrapTap = document.getElementById("postScrapTap")
	postScrapTap.setAttribute("style","color: #404040")
	var postLikeTap = document.getElementById("postLikeTap")
	postLikeTap.setAttribute("style","color: #404040")
	
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
        	
           var postBox = document.getElementById("postBox");
           postBox.innerHTML="";
           
           var postColBox = document.createElement("div")
           postColBox.classList.add("col");
           postBox.appendChild(postColBox);
           
           var textRowBox = document.createElement("div")
           textRowBox.classList.add("row");
           textRowBox.classList.add("ps-3");
           textRowBox.classList.add("my-3");
           textRowBox.setAttribute("style","font-weight: bold; font-size: 1.2rem")
           textRowBox.innerText = "Follower"
        	postColBox.appendChild(textRowBox);
          
           
           for(var follower of result.data.followerDataList){
        	   
        	var folowerBox = document.createElement("div")
        	folowerBox.classList.add("row");   
        	folowerBox.classList.add("my-2");   
        	postColBox.appendChild(folowerBox);
        	
        	var imageCol  = document.createElement("div")
        	imageCol.classList.add("col-2"); 
        	imageCol.classList.add("px-2"); 
        	imageCol.classList.add("ms-2");
        	folowerBox.appendChild(imageCol);
        		
        	
        	if(follower.customerVo.customer_profile_image != null){
        	var image = document.createElement("img")
        	image.classList.add("img-fluid"); 
        	image.classList.add("rounded-circle"); 
        	image.setAttribute("src","/uploadFiles/customerIntro/"+follower.customerVo.customer_profile_image)
        	imageCol.appendChild(image);
        	}else{
        		var image = document.createElement("img")
            	image.classList.add("img-fluid"); 
            	image.classList.add("rounded-circle"); 
            	image.setAttribute("src","../resources/img/unprofile.gif")
            	imageCol.appendChild(image);
        	}
        	
        	
        	var IntroBox = document.createElement("div")
        	IntroBox.classList.add("col"); 
        	IntroBox.classList.add("ps-0"); 
        	IntroBox.setAttribute("style","align-self:center");
        	folowerBox.appendChild(IntroBox);
        	
        	var nick =  document.createElement("p")
        	nick.classList.add("mb-1");
        	nick.setAttribute("style","font-size: 0.9rem; color: #404040; font-weight: bold");
        	nick.innerText = follower.customerVo.customer_nick
        	IntroBox.appendChild(nick);
        	
        	var intro = document.createElement("p")
        	intro.classList.add("mb-0");
        	intro.setAttribute("style","font-size: 0.7rem; color: #757575;");
        	intro.innerText = follower.customerVo.customer_intro
        	IntroBox.appendChild(intro);
        	
        	var followBox = document.createElement("div")
        	followBox.classList.add("col-2");
        	followBox.classList.add("px-0");
        	followBox.classList.add("text-center");
        	followBox.setAttribute("style","align-self:center");
        	folowerBox.appendChild(followBox);
        	
        	
        	if(follower.followVo != null){
        	var followButton  = document.createElement("button")
        	followButton.classList.add("p-0");
        	followButton.classList.add("btn");
        	followButton.setAttribute("style","font-size: 0.9rem;border-color: white ; background-color: white; color: #404040");
        	followButton.setAttribute("type","button")
        	followButton.innerText = "팔로잉"
        	followBox.appendChild(followButton);
        	}else{
        		var followButton  = document.createElement("button")
            	followButton.classList.add("p-0");
            	followButton.classList.add("btn");
            	followButton.setAttribute("style","font-size: 0.9rem; background-color: white; color: #ff6500");
            	followButton.setAttribute("type","button")
            	followButton.innerText = "팔로우"
            	followBox.appendChild(followButton);
        	}
        		
        		
        		
        	   
           }
           
        }      
           
		}
    xhr.open("post" , "./resrMyHomePage");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send(); 
}

function followingHome(){
	var contatinerColor = document.getElementById("container")
	contatinerColor.setAttribute("style","background-color:white")
	var homeTap = document.getElementById("homeTap")
	homeTap.setAttribute("style","color: #404040")
	var imageTap = document.getElementById("imageTap")
	imageTap.setAttribute("style","color: #404040")
	var followerTap = document.getElementById("followerTap")
	followerTap.setAttribute("style","color: #404040")
	var followingTap = document.getElementById("followingTap")
	followingTap.setAttribute("style","color: #ff6500")
		var postScrapTap = document.getElementById("postScrapTap")
	postScrapTap.setAttribute("style","color: #404040")
	var postLikeTap = document.getElementById("postLikeTap")
	postLikeTap.setAttribute("style","color: #404040")
	
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
        	
           var postBox = document.getElementById("postBox");
           postBox.innerHTML="";
           
           var postColBox = document.createElement("div")
           postColBox.classList.add("col");
           postBox.appendChild(postColBox);
           
           var textRowBox = document.createElement("div")
           textRowBox.classList.add("row");
           textRowBox.classList.add("ps-3");
           textRowBox.classList.add("my-3");
           textRowBox.setAttribute("style","font-weight: bold; font-size: 1.2rem")
           textRowBox.innerText = "Following"
        	postColBox.appendChild(textRowBox);
          
           
           for(var following of result.data.followingDataList){
        	   
        	var folowerBox = document.createElement("div")
        	folowerBox.classList.add("row");   
        	folowerBox.classList.add("my-2");   
        	postColBox.appendChild(folowerBox);
        	
        	var imageCol  = document.createElement("div")
        	imageCol.classList.add("col-2"); 
        	imageCol.classList.add("px-2"); 
        	imageCol.classList.add("ms-2");
        	folowerBox.appendChild(imageCol);
        		
        	
        	if(following.customerVo.customer_profile_image != null){
        	var image = document.createElement("img")
        	image.classList.add("img-fluid"); 
        	image.classList.add("rounded-circle"); 
        	image.setAttribute("src","/uploadFiles/customerIntro/"+following.customerVo.customer_profile_image)
        	imageCol.appendChild(image);
        	}else{
        		var image = document.createElement("img")
            	image.classList.add("img-fluid"); 
            	image.classList.add("rounded-circle"); 
            	image.setAttribute("src","../resources/img/unprofile.gif")
            	imageCol.appendChild(image);
        	}
        	
        	
        	var IntroBox = document.createElement("div")
        	IntroBox.classList.add("col"); 
        	IntroBox.classList.add("ps-0"); 
        	IntroBox.setAttribute("style","align-self:center");
        	folowerBox.appendChild(IntroBox);
        	
        	var nick =  document.createElement("p")
        	nick.classList.add("mb-1");
        	nick.setAttribute("style","font-size: 0.9rem; color: #404040; font-weight: bold");
        	nick.innerText = following.customerVo.customer_nick
        	IntroBox.appendChild(nick);
        	
        	var intro = document.createElement("p")
        	intro.classList.add("mb-0");
        	intro.setAttribute("style","font-size: 0.7rem; color: #757575;");
        	intro.innerText = following.customerVo.customer_intro
        	IntroBox.appendChild(intro);
        	
        	var followBox = document.createElement("div")
        	followBox.classList.add("col-2");
        	followBox.classList.add("px-0");
        	followBox.classList.add("text-center");
        	followBox.setAttribute("style","align-self:center");
        	folowerBox.appendChild(followBox);
        	
        	
        	if(following.followVo != null){
        	var followButton  = document.createElement("button")
        	followButton.classList.add("p-0");
        	followButton.classList.add("btn");
        	followButton.setAttribute("style","font-size: 0.9rem;border-color: white ; background-color: white; color: #404040");
        	followButton.setAttribute("type","button")
        	followButton.innerText = "팔로잉"
        	followBox.appendChild(followButton);
        	}else{
        		var followButton  = document.createElement("button")
            	followButton.classList.add("p-0");
            	followButton.classList.add("btn");
            	followButton.setAttribute("style","font-size: 0.9rem; background-color: white; color: #ff6500");
            	followButton.setAttribute("type","button")
            	followButton.innerText = "팔로우"
            	followBox.appendChild(followButton);
        	}
        		
        		
        		
        	   
           }
           
        }      
           
		}
    xhr.open("post" , "./resrMyHomePage");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send(); 
}







function doFollw(x,e){
    var customer_no = e;
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
        
           if(result.followVo != null){
        	   x.innerText = "팔로잉"
        	   x.setAttribute("style","width: 50%; background-color:white; color: #ff6500; border-color: #ff6500")
           }else{
        	   x.innerText = "팔로우"
        		x.setAttribute("style","width: 50%; background-color:#ff6500; color: white; border-color: #ff6500")
           }
        }      
           
		}
    xhr.open("post" , "./restFollowProcess");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("customer_no=" + customer_no); 
}


function report(x,e){
	var post_no = e;
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
           if(result.postReport == null){
        	   x.innerText = "신고하기"
           }else{
        	   x.innerText = "신고됨"
           }
        }      
           
		}
    xhr.open("post" , "../post/restPostReportProcess");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("post_no=" + post_no);
}

function modalReport(e){
	var post = e;
	var x = document.getElementById("modalinner");
	x.setAttribute("onclick","report(this,"+post+")")
	
}


</script>
</head>
<body>
	<!-- 네비바 -->
	<nav id="navbar"
		class="pb-0 navbar navbar-light bg-white sticky-top border-bottom">
		<div class="row container-fluid m-0 pb-1  border-bottom">
			<div class="col-2 p-0">
				<button class="navbar-toggler p-0 ms-0 border-0" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar"
					style="box-shadow: 0 0 white; border: 0;">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>

			<div class="col-8 fw-bold fs-4"
				style="text-align: center; color: #ff6500;">
				<a onclick="location.href='../main/mainPage'">LIKEHOME</a>
			</div>
			<div class="col-2 m-0 p-0">
				<div class="row">
					<div data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
						aria-controls="offcanvasRight"
						class="col p-0 m-0 mt-1 ms-1 me-1 text-center"
						style="align-self: center">
						<i id="search" class="bi bi-search"></i>
					</div>
					<div onclick="location.href='../order/cartPage'"
						class="col p-0 m-0">
						<i id="cart" class="m-0 bi bi-cart2"></i>
					</div>
				</div>
			</div>

			<!-- 오프캔버스 좌측 -->
			<div class="offcanvas offcanvas-start " style="width: 65%"
				tabindex="-1" id="offcanvasNavbar"
				aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasNavbarLabel">LIKEHOME</h5>
					<button type="button" class="btn-close text-reset"
						data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<div class="row offcanvas-body p-0 ">
					<div class="col p-0">
						<div id="navbarIdBox" class="row border-bottom mx-0 py-3 ps-3">
							<c:if test="${!empty customerInfo }">
								<div class="col-2 m-0 pe-0">
									<c:choose>
										<c:when test="${!empty customerInfo.customer_profile_image}">
											<img style="width: 100%; height: 100%" class="rounded-circle"
												src="/uploadFiles/customerIntro/${customerInfo.customer_profile_image }">
										</c:when>
										<c:otherwise>
											<img style="width: 100%; height: 100%" class="rounded-circle"
												src="../resources/img/unprofile.gif">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col pe-0" style="align-self: center">${customerInfo.customer_nick }</div>
							</c:if>
							<c:if test="${empty customerInfo && empty vendorInfo }">
								<div class="row justify-content-center">
									<div class="col-5 m-0 ms-2 p-0">
										<button type="button" class="btn btn-outline-warning"
											style="color: #ff6500; border-color: #ff6500;"
											onclick="location.href='#'">&nbsp;&nbsp;로그인&nbsp;&nbsp;</button>
									</div>
									<div class="col-5 m-0 ms-2 p-0">
										<button type="button" class="btn btn-warning"
											style="color: white; background-color: #ff6500; border-color: #ff6500;"
											onclick="location.href='../customer/customerRegisterPage'">회원가입</button>
									</div>
								</div>
							</c:if>
							<c:if test="${!empty vendorInfo }">
								<div class="row p-0 m-0">
									<div class="col">${vendorInfo.vendor_brand_name }</div>
								</div>
							</c:if>
						</div>
						<c:choose>
							<c:when
								test="${customerInfo.customer_no != null || vendorInfo.vendor_no == null}">
								<div class="row m-0 mt-2 border-bottom">
									<div class="col m-0 p-0 ">
										<div class="row">
											<div class="col border-bottom">
												<p class="menu" onclick="location.href='../main/mainPage'">홈</p>
												<p class="menu" onclick="location.href='../product/productCategoryPage'">스토어</p>
												<p class="menu" onclick="location.href='../product/bestProductPage'">베스트</p>
												<p class="menu"
													onclick="location.href='../post/followPostListPage'">팔로잉</p>
												<p class="menu"
													onclick="location.href='../post/postListPage'">사진</p>
											</div>
										</div>
										<div class="row">
											<div class="col mt-2">
												<p class="menu" onclick="location.href='../customer/customerProfileMyHomePage'">마이페이지</p>
												<p class="menu" onclick="location.href='../customer/customerShoppingStatePage'">나의 쇼핑</p>
												<p class="menu" onclick="location.href='../order/cartPage'">장바구니</p>
												<p class="menu"
													onclick="location.href='../post/postRegisterPage'">사진
													올리기</p>
												<p class="menu" onclick="location.href='../customer/customerCouponListPage'">쿠폰</p>
												<p class="menu" onclick="location.href=''">고객센터</p>
												<p class="menu"
													onclick="location.href='../main/helpQnaBoardPage'">문의하기</p>
											</div>
										</div>
									</div>
								</div>
								<div class="row mt-2 justify-content-end">
									<div class="col-5 p-0"
										onclick="location.href='../vendor/vendorRegisterPage'">판매자
										신청</div>
									<div class="col-5 p-0 me-1 text-center">로그아웃</div>
								</div>
							</c:when>
							<c:when test="${vendorInfo.vendor_no != null }">
								<div class="row mt-2">
									<div class="col">
										<p class="menu"
											onclick="location.href='../vendor/vendorMainPage'">쇼핑몰판매</p>
										<p class="menu"
											onclick="location.href='../product/productListPage'">상품
											리스트 페이지</p>
										<p class="menu" onclick="location.href='../order/cartPage'">장바구니
											페이지</p>
										<p class="menu" onclick="location.href='../order/myOrderPage'">나의
											주문 내역</p>
									</div>
								</div>
							</c:when>
						</c:choose>
					</div>


				</div>
			</div>
		</div>
		<!-- 오프캔버스 좌측 -->
 <div class="row text-center m-0 mt-1 py-2 justify-content-center border-bottom" style="width:100%">
	 <div class="col-auto" style="color:#ff6500;" onclick="location.href='../customer/customerProfileMyHomePage'">프로필</div>
	 <div class="col-auto"  onclick="location.href='customerShoppingStatePage'">나의 쇼핑</div>
	 <div class="col-auto" onclick="location.href='customerInfoSettingPage'">설정</div>
  </div>  
		<!-- 네비바 2차 -->
		<div class="py-2 scroll-container border-bottom mt-1 text-center"
			style="width: 100%">
			<div id="homeTap"
				onclick="location.href='./customerProfileMyHomePage'" class="menu"
				style="color: #404040">마이홈</div>
			<div id="imageTap" onclick="imageHome()" class="menu"
				style="color: #404040">사진</div>
			<div id="postLikeTap"
				onclick="location.href='./customerProfileMyLikePage'" class="menu"
				style="color: #ff6500">좋아요</div>
			<div id="postScrapTap"
				onclick="location.href='./customerProfileMyPostScrapPage'"
				class="menu" style="color: #404040">사진스크랩</div>
			<div id="followerTap" onclick="followerHome()" class="menu"
				style="color: #404040">팔로워</div>
			<div id="followingTap" onclick="followingHome()" class="menu"
				style="color: #404040">팔로우</div>
		</div>

		<!-- 네비바 2차 -->

		<!-- 오프캔버스 우측 -->
		<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
			aria-labelledby="offcanvasRightLabel">
			<div class="offcanvas-header">
				<input type="text" class="form-control"
					id="exampleFormControlInput1" placeholder="통합 검색">
				<button type="button" class="btn-close text-reset"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body"></div>
		</div>
		<!-- 오프캔버스 우측 -->

	</nav>
	<div id="container" class="container-fluid">
		<div class="row">
			<div class="col">
				<div class="row pt-3 border-bottom" style="background-color: white;">
					<div class="col">
						<div class="card mb-3 border-0">
							<div class="row g-0">
								<div class="col-4 p-2">
									<c:choose>
										<c:when test="${!empty customerInfo.customer_profile_image }">
											<img
												src="/uploadFiles/customerIntro/${customerInfo.customer_profile_image }"
												class="img-fluid rounded-circle">
										</c:when>
										<c:otherwise>
											<img class="img-fluid rounded-circle"
												src="../resources/img/unprofile.gif">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-8 pt-3 ps-3">
									<div class="row">
										<div class="col fw-bold"
											style="font-size: 1.1rem; color: #404040">${customerInfo.customer_nick }</div>
									</div>
									<div class="row">
										<div class="col" style="font-size: 0.9rem; color: #757575">
											<span onclick="followList()"> 팔로워 </span> <span
												onclick="followList()" id="follow" style="font-weight: bold">
												${data.followerCount } </span> <span onclick="followingList()">
												팔로잉 </span> <span onclick="followingList()" id="following"
												style="font-weight: bold"> ${data.followingCount } </span>
										</div>
									</div>
								</div>
							</div>
							<div class="row pt-2">
								<div class="col" style="font-size: 0.9rem; color: #404040">
									${data.userInfo.customer_intro }</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row mb-4" id="postBox">
					<div class="col">
						<div class="row  mb-1 mt-3" style="justify-content: space-between">
							<div class="col-auto" style="color: #404040">
								<span>좋아요</span> <span class="fw-bold">
									${data.postLikeCount } </span>
							</div>

						</div>
						<div class="row row-cols-2 row-cols-md-6 g-2">
							<c:forEach items="${data.postLikeDataList }" var="postLike" >
								<div class="col">
									<div class="card px-0"
										onclick="location.href='../post/postDetailPage?post_no=${postLike.postLikeVo.post_no}'"
										style="overflow: hidden; object-fit: cover; height: 11rem; position: relative;">
										<i
											style="position: absolute; bottom: 0%; right: 3%; font-size: 1.3rem; color: #ff6500"
											class=" text-opacity-50 bi bi-heart-fill"></i> <img
											style="height: -webkit-fill-available" class="rounded"
											src="/uploadFiles/${postLike.subPostImage }">
									</div>
								</div>
							</c:forEach>
						</div>

					</div>




				</div>






			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div id="modalinner"
					class="modal-body text-center border-bottom text-danger">신고하기</div>
				<div class="modal-body text-center border-bottom"
					data-bs-dismiss="modal" aria-label="Close">취소</div>
			</div>
		</div>
	</div>
	<!-- Modal -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>