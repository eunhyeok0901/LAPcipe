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

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


<!-- 	<script src="../js/jquery-3.6.1.min.js"></script> -->
	
  <style>
	
	body{
/*  	    z-index: 30; */
	}

	.navbar {
        border-radius: 0;
        border: none;
        background-color: white;
        top: 0;
        right: 0;
        left: 0;
        
    }
    
    

      
    
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
				}
 				else{
 					location.href="<%=request.getContextPath()%>/view/header2.jsp"
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

<%MemberVO loginMemVo = (MemberVO)session.getAttribute("loginMember");%>


  <nav class="navbar navbar-default text-dark" style="background-color: #faf8f0;">
    <div class="container-fluid">
  
  
         <a class="navbar-brand" href="#">HOME</a>   

      

      
      
        <ul class="nav navbar-nav navbar-right">
       <%
      	if(loginMemVo==null){
       %>     
          <li><a data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
          <li><a data-toggle="modal" data-target="#joinModal"><span class="glyphicon glyphicon-plus"></span> Join</a></li>
       <%}else {%>
          <li><a  href="<%=request.getContextPath()%>/Logout.do"><span class=""></span> Logout</a></li>
          <li><a href="<%=request.getContextPath()%>/view/mypage.jsp"><span class=""></span> My Page</a></li>
          <li><a href="<%=request.getContextPath()%>/ShowRecipeList.do"><span class=""></span> Recipe</a></li>
<%--           <li><a href="<%=request.getContextPath()%>/view/mypage.jsp"><span class=""></span> My Page</a></li> --%>
       <%} %>
        </ul>
    </div>
  </nav>
  
  
  <div class="jumbotron" style="margin-top:-98px; background-color: #faf8f0;">
    <div class="container text-center">
      <h1>LABcipe</h1>      
      <p>Recipe community</p>
    </div>
  </div>
    
 
    
  <div class="container-fluid bg-3 text-center">  
    <div>  
        <img id="mainimg" src="../image/pasta.jpg" alt="pasta.jpg">
    </div>
    </div>
    



       

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



</body>
</html>


