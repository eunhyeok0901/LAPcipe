<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="view/header1.jsp" %>    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../CSS/public.css"> -->
<!-- <link rel="stylesheet" href="../css/join.css"></link> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>


<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">


    <title>Lapcipe</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<!-- 	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script> -->
<!--  	<script src="../js/jquery-3.6.1.min.js"></script> -->
 
 
 
<script type="text/javascript">

$(function(){
	content = "This is Lab, for Recipe ";
	texts = document.getElementsByClassName("text");
	console.log(texts);
	i = 0;
	check = true;
	function typing(){
		
// 		console.log(text);
		console.log('texts[0]의 길이 : '+texts[0].innerText.length);
		console.log('content의 길이 : '+content.length);
		
		console.log(i);
		
		if(i == content.length - 1){
			clearInterval(interval);
			count = 1;
			i = 0;
			return;
		}
		
	    if (i < content.length) {
	    let txt = content.charAt(i);
	    
	    if(txt == '!'){
		    texts[0].innerHTML += '<br>';
		    texts[1].innerHTML += '<br>';
		    texts[2].innerHTML += '<br>';
		    i++;
	    	return;
	    }
	    
	    texts[0].innerHTML += txt;
	    texts[1].innerHTML += txt;
	    texts[2].innerHTML += txt;
	    i++;
	    }
	    
// 	    if(i == content.length){
// 	    	i = 0;
// 	    }
	}
		
	var opacity = 1;
	count = 1;
	
	document.getElementById('myCarousel').addEventListener('wheel', (e) => {
		
		console.log(e.deltaY);
		if(e.deltaY == 100){
			
			if(opacity > 0.7){
				
				opacity -= 0.1
				
			}else {
				
				console.log('check');
				if(count == 1 && texts[0].innerHTML == ''){
					interval = setInterval(typing, 100);
					
					count += 1;
					
				}
				
			
				
			}
			
			document.getElementById('myCarousel').style.opacity = opacity;
		}
		
		if(e.deltaY == -100){
			
			if(opacity < 1){
			
				opacity += 0.1
			}else{
				texts[0].innerHTML = '';
				texts[1].innerHTML = '';
				texts[2].innerHTML = '';
				clearInterval(interval);
				i = 0;
				count = 1;
			}
			document.getElementById('myCarousel').style.opacity = opacity; 
		}
		
	}) // 여기까지 이벤트 리스너 



	})
	
	


			
			
</script>
  
 
    
    
   <style>
    *{
    font-family: 'Noto Serif KR', serif;
    
    }
    
   body{
   background: #f5f4e9;
   
   }

   #img11{
  		width: 100%;
  		height: 1200px;
  	}
   
   .text{
   		font-size : 70px;
   		
   }
   
    </style>
  </head>
  <body>
  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
  
  <!-- 일단 임시로 넣어놓음 (테스트) -->
  
  
  <!-- Indicators -->
  
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active" data-bs-interval="2000">
      <img id="img11" src="./images/pasta.jpg" alt="Los Angeles" >
      <div style="margin-bottom: 600px;" class="carousel-caption">
<!--         <h1 style="font-size: 100px;">LABcipe</h1> -->
  		<div class="text"></div>	
<!--         <p style="font-size: 25px;">The Recipe Community</p> -->
      </div>
    </div>

    <div class="item" data-bs-interval="1000">
      <img id="img11" src="./images/wallpaperbetter.jpg" alt="Chicago">
      <div style="margin-bottom: 600px;" class="carousel-caption">
<!--         <h1 style="font-size: 100px;">LABcipe</h1> -->
  		<div class="text"></div>	
<!--         <p style="font-size: 25px;">The Recipe Community</p> -->
      </div>
    </div>

    <div class="item" data-bs-interval="300">
      <img id="img11" src="./images/브런치.jpg" alt="New York">
      <div style="margin-bottom: 600px;" class="carousel-caption">
<!--         <h1 style="font-size: 100px;">LABcipe</h1> -->
  		<div class="text"></div>	
<!--         <p style="font-size: 25px;">The Recipe Community</p> -->
      </div>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only"></span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only"></span>
  </a>
 </div> 
  

  </body>
  <footer class="container-fluid text-center">
    <p>
    기관명 : (재)대덕인재개발원이사장 : 김형응주소 : 대전광역시 중구 계룡로 846, 3-4층<br>
   사업자등록번호 : 306-82-05291대표전화 : 042-222-8202팩스 : 070-8768-2972<br>
   COPYRIGHT © 2020 (재)대덕인재개발원 ALL RIGHTS RESERVED<br>
    
    </p>
  </footer>

     




</html>
