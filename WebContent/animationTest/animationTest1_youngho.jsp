<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../view/header1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../CSS/public.css"> -->
<!-- <link rel="stylesheet" href="../css/join.css"></link> -->
    <title>Lapcipe</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<!-- 	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script> -->
<!--  	<script src="../js/jquery-3.6.1.min.js"></script> -->
 
 <script src="../js/jquery-3.6.1.min.js"></script>
 
<script type="text/javascript">






	

$(function(){
content = "Hi. I'm Somi.";
text = document.querySelector(".text");
i = 0;
check = true;
function typing(){
	
	console.log(text);
	
	if(text.innerText.length >= content.length){
		clearInterval(interval);
		count = 1;
		return;
	}
	
    if (i < content.length) {
    let txt = content.charAt(i);
    text.innerHTML += txt;
    i++;
    }
    
    if(i == content.length){
    	i = 0;
    }
}
	
var opacity = 1;
count = 1;
document.getElementById('pasta').addEventListener('wheel', (e) => {
	
	console.log(e.deltaY);
	if(e.deltaY == 100){
		
		if(opacity > 0.7){
			
			opacity -= 0.1
			
		}else {
			
			console.log('check');
			if(count == 1){
				interval = setInterval(typing, 200);
				
				count += 1;
				
			}
			
		
			
		}
		
		document.getElementById('pasta').style.opacity = opacity;
	}
	
	if(e.deltaY == -100){
		
		if(opacity < 1){
		
			opacity += 0.1
		}else{
			text.innerHTML = '';

		}
		document.getElementById('pasta').style.opacity = opacity; 
	}
	
}) // 여기까지 이벤트 리스너 



})


</script>
  
 
    
    
    <style>
    
    

      /* Remove the navbar's default margin-bottom and rounded borders */ 
      .navbar {
        margin-bottom: 0;
        border-radius: 0;
        background-color: white;
        border : 1px solid white;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 20;
      }
      
      /* Add a gray background color and some padding to the footer */
      
      footer {
        background-color: #f2f2f2;
        padding: 25px;
      }

      #mainimg{
/*         width: 95%; */
        height: auto;
        padding : 0px;
        
      }
      
       .jumbotron{ 
          background: #FFFFDC; 
          margin-bottom: 10px; 
                 } 
/*       *{ */
/*       background-color : #FAFADA; */
/*       } */
      .col-sm-3{
         border : 1px dashed gray;
      }
      
      input[type=text],
      input[type=submit],
      select {
     border: none;
     outline: none;
     box-sizing: border-box;
     height: 25px;
     margin-left: -5px;
     
   }
   
  
   
   .btn-default{
   	margin-right: 50px;
   }
   
   .search input[type=text] {
     width: 200px;
     border-radius: 40px;
     
   }
   .search input[type=submit] {
      
      /*
      width: 80px; 
      border-radius: 0 40px 40px 0; 
      cursor: pointer; 
      background-color: #FFFFDC; 
      color: #FFFFCC;
      margin-right: 50px
     margin-bottom: 20px; 
     */
     
     
   }
   .search input[type=submit]:hover {
     background-color: darkgoldenrod;
   }
   .search input[type=text]::placeholder {
     font-size: 15px;
/*      font-style: italic; */
   }
      
   body{
   background: #f5f4e9;
   }

   
   #pasta{
	   	width : 1000px;
	   	height : 600px;
   		background-image : url('../images/pasta.jpg'); 
   		text-align : center;
   		line-height : 600px;
   		padding-bottom : 90px;
   }
   
   #helper{
  	display : inline-block;
  	line-height : inherit;
  
   }
   
   .text{
   		display : inline-block;
   		line-height : inherit;
   		font-size : 60px;
   		vertical-aling : middle;
   }
   
   </style>
 </head>
<body>
  


<!-- 		<img id="pasta" width="100" height="150" src="../images/pasta.jpg" /> -->
		
		
<!-- 		<div class="text"></div> -->
<!-- 		<button id="test_button" type="button" onclick="showtext()"></button> -->
		<div id="pasta">
			<div id="helper"></div>
			<h2 class="text"></h2>
<!-- 			<img  src="../images/pasta.jpg" /> -->
			
		</div>
		
		
<!-- 		<img src="../images/cake.jpg" /> -->
	

  </body>
  <footer class="container-fluid text-center">
    <p>
    기관명 : (재)대덕인재개발원이사장 : 김형응주소 : 대전광역시 중구 계룡로 846, 3-4층<br>
   사업자등록번호 : 306-82-05291대표전화 : 042-222-8202팩스 : 070-8768-2972<br>
   COPYRIGHT © 2020 (재)대덕인재개발원 ALL RIGHTS RESERVED<br>
    
    </p>
  </footer>

      
     
  
 





</html>
