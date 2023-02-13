<%@page import="bps.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Labcipe</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<script src="../js/jquery-3.6.1.min.js"></script>
	
   
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
        width: 95%;
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
      
      .search input[type=text],
      .search input[type=submit] {
     padding: 20px;
     border: none;
     outline: none;
     box-sizing: border-box;
     height: 15px;
   }
   .search input[type=text] {
     width: 200px;
     margin-right: -6px;
     padding-left: 40px;
     border-radius: 40px 0 0 40px;
   }
   .search input[type=submit] {
     width: 80px;
     border-radius: 0 40px 40px 0;
     cursor: pointer;
     background-color: #FFFFDC;
/*      color: #FFFFCC; */
     margin-right: 50px;
     margin-bottom: 20px;
   }
   .search input[type=submit]:hover {
     background-color: darkgoldenrod;
   }
   .search input[type=text]::placeholder {
     font-size: 15px;
/*      font-style: italic; */
   }
      
   body{
   background: #FFFFDC;
   }

   
   
   
    </style>
    
  <script>
  function logincheck(){
	  var myid = $('#id').val();
	  var mypass = $('#pass').val();
	 
	  $.ajax({
		  url : '<%=request.getContextPath()%>/Login.do',
		  type : 'get',
		  data : {id : myid, pass : mypass},
		  success : function(res){
			console.log(res);
			
			if(res == "로그인에 실패하였습니다! 다시 입력해주세요."){
				var span = document.createElement('span');
				span.innerText = res
				$('#alertIdCheck').html($(span));
				$('#id').val('');
				$('#pass').val('');
			}else{
				location.href = '<%= request.getContextPath()%>/main/main.jsp';
			}
		  },
		  dataType:'text'
	  })
	  
  }
  
  
  function searchId(){
	  var name = $('#name').val();
	  var email = $('#email').val();
	  
	  $.ajax({
		  url: '<%=request.getContextPath()%>/SearchId.do',
		  type: 'get',
		  data: {memName: name, memEmail: email},
		  success: function(res){
			  console.log(res);
			  
			  var span = document.createElement('span');
			  span.innerText = res;
			  $('#alertCheck1').html($(span));
		  },
		  dataType:'text'
	  })
	  
  }
  
  
  function searchPass(){
	  var id = $('#id2').val();
	  var email = $('#email2').val();
	  
	  $.ajax({
		  url: '<%=request.getContextPath()%>/SearchPass.do',
		  type: 'get',
		  data: {memId2 : id, memEmail2 : email},
		  success: function(res){
			  console.log(res);
			  
			  var span = document.createElement('span');
			  span.innerText = res;
			  
			  $('#alertCheck2').html($(span));
			  
		  },
		  dataType: 'text'
	  })
	  
	  
  }
  
  
  </script>
  </head>
  <body>
  <%
  MemberVO loginMemVo = (MemberVO)session.getAttribute("loginMember");
  %>
  <nav class="navbar navbar-inverse">
    <div class="container-fluid text-red">
  
  
  <!-- 
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"><p>안녕하세요</p></span>
          <span class="icon-bar">두번쨰</span>
          <span class="icon-bar">세번쨰</span>                        
        </button>
       -->
<!--       <div> -->
<!--         <a class="navbar-brand" href="#">search</a> -->
         <a class="navbar-brand" href="#">HOME</a>   

      
<!--       </div> -->
      
      
        <ul class="nav navbar-nav navbar-right">
            <li ><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Recipe</a></li>
            <li><a href="#">Notice</a></li>
       <%
      	if(loginMemVo==null){
       %>     
          <li><a data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
          <li><a data-toggle="modal" data-target="#joinModal"><span class="glyphicon glyphicon-plus"></span> Join</a></li>
       <%}else {%>
          <li><a href="<%=request.getContextPath()%>/Logout.do"><span class=""></span> Logout</a></li>
          <li><a href="<%=request.getContextPath()%>/member/mypage.jsp"><span class=""></span> My Page</a></li>
       <%} %>
        </ul>
    </div>
  </nav>
  
  
  <div class="jumbotron">
    <div class="container text-center">
      <h1>LABcipe</h1>      
      <p>A delicious recipe</p>
    </div>
  </div>
    
    
        
  <div style="text-align:right;">

   <form class="search">
        <input type="text" placeholder="검색어를 입력하세요">
        <input type="submit" value="search">
        
    </form>
       
  </div>
 
    
  <div class="container-fluid bg-3 text-center">  
    <div>  
        <img id="mainimg" src="../image/pasta.jpg" alt="pasta.jpg">
    </div>
    </div>
    
    

    
        <h3>조회수 TOP</h3><br>
    <div class="row">
      <div class="col-sm-3">
        <p>레시피 1</p>
        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      </div>
      <div class="col-sm-3"> 
        <p>레시피 2</p>
        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      </div>
      <div class="col-sm-3"> 
        <p>레시피 3</p>
        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      </div>
      <div class="col-sm-3">
        <p>레시피 4</p>
        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      </div>
    </div>
  <br>
  
  
  
   <h3>등록레시피</h3><br>

  <div class="container-fluid bg-3 text-center">    
    <div class="row">
      <div class="col-sm-3">
        <p>게시물 1</p>
        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      </div>
      <div class="col-sm-3"> 
        <p>게시물 2</p>
        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      </div>
      <div class="col-sm-3"> 
        <p>게시물 3</p>
        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      </div>
      <div class="col-sm-3">
        <p>게시물 4</p>
        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      </div>
    </div>
  </div><br><br>
  
  <footer class="container-fluid text-center">
    <p>
    기관명 : (재)대덕인재개발원이사장 : 김형응주소 : 대전광역시 중구 계룡로 846, 3-4층<br>
   사업자등록번호 : 306-82-05291대표전화 : 042-222-8202팩스 : 070-8768-2972<br>
   COPYRIGHT © 2020 (재)대덕인재개발원 ALL RIGHTS RESERVED<br>
    
    </p>
  </footer>


       

   <!-- 로그인 modal -->
   <div class="modal fade" id="loginModal">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body" style="margin: 20px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h2 class="modal-title" style="text-align: center;"><b>LOGIN</b></h2><br>
          <br>
          
  
          <div id="id_insert" style="text-align: center;">
             <input type="text" name="id" id="id" class="text_field" placeholder="아이디"  required
             style=" border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px;
             width: 60%; height:45px;">
          </div>
          <br>
          
          <div id="pw_insert" style="text-align: center;">
              <input type="password" name="password" id="pass" class="text_field" placeholder="비밀번호" required
              style="background:transparent; border:none; border-bottom: solid 1px #ccc;
              border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px;
              width: 60%; height:45px;">

          </div>
          <br>
          
          <div style="margin-bottom: 30px; font-weight:bold;">
          	<input type="checkbox" name="" id="" style="margin-left: 100px; "> 아이디 저장하기
          </div>
			
		  <div id="alertIdCheck" style="text-align:center; color: red;"></div><br>
		  	
          <div id="loginbtn" style="text-align: center;">
            <button type="button" onclick="logincheck()" 
            style="width: 60%; height: 50px; border:0; outline:none; border-radius: 40px;
            background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
            color: white; font-size: 1.2em; letter-spacing: 2px; margin-bottom: 20px; font-weight: bold;">
                          로그인</button>
          </div>
        
          <div style="text-align:center;">
          	 <a href="#searchId" data-toggle="modal">아이디 찾기</a>
          	 <p style="display:inline; color: #ccc;"> | </p>
             <a href="#searchPass" data-toggle="modal">비밀번호 찾기</a>
          </div>
        </div>
        
      </div>
      
    </div>
  </div>
  
  
  
  <!-- 아이디 찾기 modal -->
   <div class="modal fade" id="searchId">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body" style="margin: 20px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title" style="text-align: center;"><b>Forgot your ID?</b></h3><br>
          <br>
          
  
          <div id="id_insert" style="text-align: center;">
             <input type="text" name="memName" id="name" class="text_field" placeholder="이름"  required
             style=" border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px;
             width: 60%; height:45px;">
          </div>
          
          
          <span style="color: gray; margin-left: 110px;"></span><br>
          <div id="pw_insert" style="text-align: center;">
              <input type="text" name="memEmail" id="email" class="text_field" placeholder="이메일" required
              style="background:transparent; border:none; border-bottom: solid 1px #ccc;
              border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px; margin-top:8px;
              width: 60%; height:45px;">
          </div>
          <br>
          
			
		  <div id="alertCheck1" style="text-align:center; color: red;"></div><br>
		  	
          <div id="loginbtn" style="text-align: center;">
            <button type="button" onclick="searchId()" 
            style="width: 60%; height: 50px; border:0; outline:none; border-radius: 40px;
            background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
            color: white; font-size: 1.2em; letter-spacing: 2px; margin-bottom: 20px; font-weight: bold;">
          	아이디 찾기</button>
          </div>
        
        </div>
        
      </div>
      
    </div>
  </div>
  
  
  <!-- 비밀번호 찾기 modal -->
   <div class="modal fade" id="searchPass">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body" style="margin: 20px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title" style="text-align: center;"><b>Forgot your PASSWORD?</b></h3><br>
          <br>
          
  
          <div id="id_insert" style="text-align: center;">
             <input type="text" name="memId2" id="id2" class="text_field" placeholder="아이디"  required
             style=" border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px;
             width: 60%; height:45px;">
          </div>
          
          
          <span style="color: gray; margin-left: 110px;"></span><br>
          <div id="pw_insert" style="text-align: center;">
              <input type="text" name="memEmail2" id="email2" class="text_field" placeholder="이메일" required
              style="background:transparent; border:none; border-bottom: solid 1px #ccc;
              border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px; margin-top:8px;
              width: 60%; height:45px;">
          </div>
          <br>
          
			
		  <div id="alertCheck2" style="text-align:center; color: red;"></div><br>
		  	
          <div id="loginbtn" style="text-align: center;">
            <button type="button" onclick="searchPass()" 
            style="width: 60%; height: 50px; border:0; outline:none; border-radius: 40px;
            background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
            color: white; font-size: 1.2em; letter-spacing: 2px; margin-bottom: 20px; font-weight: bold;">
          	비밀번호 찾기</button>
          </div>
        
        </div>
        
      </div>
      
    </div>
  </div>


  
  <!-- 회원가입 modal -->
  <div class="modal fade" id="joinModal">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body" style="margin: 20px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
           <h2 class="modal-title" style="text-align : center;"><b>WELCOME</b></h2>
           <br>
          
         <form action="" method="post">  
          
        <input type="button" class="btn btn-outline-success btn-sm" id="idbtn" value="중복검사"
        style= "margin-left: 100px; outline:none;
         border-radius: 40px;background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));color: white;margin-bottom:5px;
         border: none;"><br>
          <div id="inputId" style="text-align : center;">
		    <input type="text" id="uid" name="mem_id" placeholder="아이디" required
		    style=" border:none; border-bottom: solid 1px #ccc; 
             border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px;
             width: 60%; height:45px;">
	 	  </div> 
		    <span id="spanid" style="padding-left:100px;">사용할 수 없는 아이디입니다.</span>
	 	  <br><br>
	  	 
	  	  <div class="form-group" style="text-align : center;">
		    <input type="text" id="pwd" name="mem_pass" placeholder="비밀번호" required
		    style="border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px;
             width: 60%; height:45px;">
	  	  </div>
	   	  
	   	  <div class="form-group" style="text-align : center;">
		    <input type="text" id="uname" name="mem_name" placeholder="이름" required
		     style="border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px;
             width: 60%; height:45px;">
	 	  </div>
	  	  
	  	  
	  	  <div class="form-group" style="text-align : center;">
		    <input type="date" id="ubir" name="mem_bir" placeholder="생년월일" required
		    style="border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px;
             width: 60%; height:45px;">
	  	  </div>
	  	 
	  	  
	  	  <div class="form-group" style="text-align : center;">
		    <input type="text" id="uhp" name="mem_hp" placeholder="전화번호" required
		     style="border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px;
             width: 60%; height:45px;">
	  	  </div>
	  	 
	  	  
		  <input type="button" class="btn btn-success btn-sm" id="zipbtn"value="우편번호검색" style="margin-left: 100px; outline:none;
         border-radius: 40px;background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));color: white;margin-bottom:5px;
         border: none;"><br>
	  	  <div class="form-group" style="text-align : center;">
<!-- 		    <input type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#zipModal" value="번호검색modal"><br> -->
		    <input type="text" id="uzip" name="mem_zip" required placeholder="우편번호"
		     style="border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 10px;
             width: 60%; height:45px;">
	  	  </div>
	  	  
	  	  <div class="form-group" style="text-align : center;">
<!-- 		    <label for="uadd1">주소</label> -->
		    <input type="text" id="uadd1" name="mem_add1" required placeholder="주소"
		     style="border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 10px;
             width: 60%; height:45px;">
	  	  </div>
	  	  
	  	  
	  	  <div class="form-group" style="text-align : center;">
<!-- 		    <label for="uadd2">상세주소</label> -->
		    <input type="text" id="uadd2" name="mem_add2" required placeholder="상세주소"
		     style="border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px;
             width: 60%; height:45px;">
	  	  </div>
	  	  
	  	  <div class="form-group" style= "text-align: center;">
		    <input type="text" id="umail" name="mem_mail" placeholder="이메일" required
		    style="border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px;
             width: 60%; height:45px;">
	  	  </div>
	  	  
	  	  <div class="form-group" style="text-align: center;">
		    <input type="text" id="unick" name="mem_nick" placeholder="닉네임" required
		    style="border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px;
             width: 60%; height:45px;">
	  	  </div>
	  	  
		  <div class="form-group form-check">
		    <label class="form-check-label">
		      <input class="form-check-input" type="checkbox" name="remember" required
		      style="margin-left:100px;"> 개인정보 수집에 동의합니다.
		    </label>
		  </div>
	   
	   	<div id="joinbtn" style="text-align:center;">
	   	 <button type="submit" id="submit"
	   	 style="width: 60%; height: 50px; border:0; outline:none; border-radius: 40px;
         background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
         color: white; font-size: 1.2em; letter-spacing: 2px; margin-bottom: 20px;"
	   	 >회원가입</button>
	   	</div>
	  </form>

         </div><!-- modalbody -->
       </div><!-- modalcontent -->

      </div>
      
    </div>





</html>