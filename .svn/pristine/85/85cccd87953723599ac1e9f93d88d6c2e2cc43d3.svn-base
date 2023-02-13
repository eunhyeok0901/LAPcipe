<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
 <style>
 	div{
 	border : 1px solid gray;
	  
	  justify-content: center;
	  align-items: center;
	  height: 100px;
	  font-size: 2rem;
}
 </style>
 
 <script type="text/javascript">
 $(function(){
	 const content = "Hi. I'm Somi.";
	 const text = document.querySelector(".text");
	 let i = 0;
	
	 function typing(){
		 let txt = content[i++];
		    text.innerHTML += txt;
		    if (i > content.length) {
		        text.textContent = "";
		        i = 0;
		    }
	 }
	 setInterval(typing, 200)
	 
	 
 })
 
 </script>
</head>
<body>
	<div class="text_box" data-trigger >
		<span class="text"></span>
	</div>

</body>
</html>