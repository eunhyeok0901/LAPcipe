<%@page import="bps.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LabcipeHeader</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    
    
    <script src="<%=request.getContextPath()%>/js/jquery.serializejson.min.js"></script>

	

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
<%--  					//location.href="<%=request.getContextPath()%>/header3.jsp" --%>
 					location.reload();
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
	
	  function popupalert(){
		  alert('로그아웃 되었습니다.');
	  }
	  
	  
	  function process_for_enrollRecipe(){
		  var memId = '<%= session.getAttribute("loginMember")%>';
		  
		  if(memId == 'null'){
			  alert('로그인 한 회원만 등록하실 수 있습니다.');
			  
			  if(confirm('로그인 하시겠습니까?')){
				  // 로그인 모달 창 띄우는 로직이 뭐지???
				  document.querySelector('#my_login_modal').click();
			  }
		  }else{
			  location.href = '<%=request.getContextPath()%>/view/enrollrecipe.jsp';
		  }
		  
		  
		  
		  
	  }
	  
	  function InputLogIn(){
		  document.getElementById('id').value = 'DDit404';
	  }
	  
// 	  function findId(){
// 		  document.getElementById('name').value = '대덕인재';
// 		  document.getElementById('email').value = 'qodydgh85@naver.com';
// 	  }
	  
	  function findPass(){
		  document.getElementById('id2').value = 'DDit404';
		  document.getElementById('email2').value = 'qodydgh85@naver.com';
	  }
  
  </script>



<style>

@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap');
	
	*{
	font-family: 'Noto Serif KR', serif;
	
	}

	.Wrapper *{
		margin:0 !important;
		padding:0 !important;
		color:#000 !important;
		box-sizing: border-box !important;
	}
	
	
	ul{
 		list-style: none !important; 
	}
	
	a{
 		text-decoration: none !important; 
		outline: none !important;
	}
	
	.container{
/* 		border: 1px solid; */
		width:90% !important;
		margin: 0 auto !important;
	}
	
	.container2{
/* 		border: 1px solid; */
		width:510px !important;
		margin: 0 auto !important;
/* 		border: 1px solid; */
	}
	
	.header{
		width: 100% !important;
		height: 70px !important;
		display: flex !important;
		align-itmes: center !important;
		justify-content: space-between !important;

	}
	
	.menuBar{
		width: 100% !important;
		height: 70px !important;
		display: flex !important;

	}
	
	
	.header > nav {
		width:22% !important;
		height:100% !important;
	}
	
	
	.header ul {
		width:100% !important;
		height: 100% !important;
/*  		border:1px solid;  */
	}
	
	.menuBar ul {
		width:100% !important;
		height: 100% !important;
/* 		border:1px solid; */
	}
	
	
	.header ul > li {
		font-size:17px !important;
		float: left;
		padding-top: 23px!important;
	}
	
	.menuBar ul > li {
		font-size: 30px;
		float: left;
		padding-top: 10px!important;
	}
	
	
	
	.searchbtnMain{
  		width: 42px !important;
 	    height: 30px !important;
  		background-color: white !important;
  		margin-right: 2% !important;
  		margin-top: 0% !important;
  		border: none !important;
  		border-radius: 50% !important;
	}
	
	.searchtxtMain{
		float: left !important;
	    padding-left: 7% !important;
		background: white; 
		border: none !important;
		outline: none !important;
		color: black !important;
		font-size: 15px !important;
/* 		line-height: 40px !important; */
		border-radius: 40px !important;
	}
	
	.searchbox{
		height:50% !important;
		width:80% !important;
		display:flex!important;
		border-radius: 40px !important;
		background: white !important; 
		border: 1px solid black !important; 
 		margin-left: 210% !important;
		margin-top:7% !important;
	}
	#realHeader{ 
 		position: fixed !important; 
 		width: 100%  !important;
 		
 	} 
	
	#absolute{
		position:relative;
		z-index: 1000 !important;
	}
	
	*{
	font-family: 'Noto Serif KR', serif;
	
	}
	

	
	

</style>



</head>

<body>

<%String memberid = (String)session.getAttribute("loginMember");%>

<div class="Wrapper">

	<!-- style="position: fixed;top: 0;left: 0;right: 0; -->
	<div id="absolute">	
		<div id="realHeader" style="background:white;">
		<div class="container">
				<div class="header">
					<h3 style="display: flex; align-items: center; font-size: 2em;"><a href="<%=request.getContextPath()%>/main.jsp"><i></i></a></h3>
					
					<form action="<%= request.getContextPath()%>/ShowRecipeList.do" method="post">
					<div class="searchbox">
						<input type="text" class="searchtxtMain" name="searchword" placeholder="SEARCH" style="width:100%">
		      			  <button class="searchbtnMain" type="submit">
		       				 <i style="font-size:20px; color:black; backgroud: white;"class="bi bi-search"></i>
		      			  </button>
					</div>
					</form>
					
					<nav>
						<ul>
						<%
		      			if(memberid==null){
		       			%>
		       				<li style="margin-left: 12%!important; cursor: pointer;"  onclick="process_for_enrollRecipe()"><span class="glyphicon glyphicon-plus	
		       				"></span></li>
							<li style="margin-left: 12%!important; cursor: pointer;"><a id="my_login_modal" data-toggle="modal" data-target="#loginModal">Login</a></li>
							<li style="margin-left: 12%!important; cursor: pointer;"><a data-toggle="modal" data-target="#joinModal">Join Us</a></li>
						<%}else {%>	
		       				<li style="margin-left: 12%!important; cursor: pointer;"  onclick="location.href = '<%=request.getContextPath()%>/view/enrollrecipe.jsp'"><i><span style="cursor: pointer;" class="glyphicon glyphicon-plus	
		       				"></span></i> </li>
							<li style="margin-left: 12%!important; cursor: pointer;"><a onclick="popupalert()" href="<%=request.getContextPath()%>/Logout.do">Logout</a></li>
							<li style="margin-left: 12%!important; cursor: pointer;"><a href="<%=request.getContextPath()%>/view/mypage.jsp">MyPage</a></li>
						<%} %>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>



<div class="jumbotron" style="background-color: white; text-align: center; margin-bottom: 0px; padding-top: 0px; padding-bottom: 0px;"><br><br><br><br>
    <div class="subject">
      <h1 style="margin-top:0px;cursor: pointer;" onclick="location.href = '<%=request.getContextPath()%>/main.jsp'">LABcipe</h1>      
      <p style="cursor: pointer; margin-top:10px!important;" onclick="location.href = '<%=request.getContextPath()%>/main.jsp'">Recipe Community</p>
      <br>
    </div>
</div>

<div>

<div style="background:white;">
<div class="container2">
		<div class="menuBar">
			
				<ul>
					<li style="margin-left: 10px!important;"><span style="font-size:20px; color:black;"class="bi bi-bookmark-heart"><a href="<%=request.getContextPath()%>/ShowRecipeList.do"> RECIPE</a></span></li>
					<li style="margin-left: 100px!important;"><span style="font-size:20px; color:black;"class="bi bi-collection-play"><a href="<%=request.getContextPath()%>/view/classMain.jsp"> CLASS</a></span></li>
					<li style="margin-left: 100px!important;"><span style="font-size:20px; color:black;"class="bi bi-chat-right-quote"><a href="<%=request.getContextPath()%>/view/board.jsp"> Q&A</a></span></li>
				</ul>
		</div>
	</div>
</div>
</div>
</div>

<!-- 로그인 modal -->
   <div class="modal fade" id="loginModal">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body" style="margin: 20px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h2 class="modal-title" style="text-align: center;" onclick="InputLogIn()"><b>LOGIN</b></h2><br>
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
          
<!--           <div style="margin-bottom: 30px; font-weight:bold;"> -->
<!--           	<input type="checkbox" name="" id="" style="margin-left: 100px; "> 아이디 저장하기 -->
<!--           </div> -->
			
		  <div id="alertIdCheck" style="text-align:center; color: red;"></div><br>
		  	
          <div id="loginbtn" style="text-align: center;">
            <button type="button" onclick="logincheck()" 
            style="width: 60%; height: 50px; border: none; border-bottom: 1px solid #ccc; outline:none; border-radius: 40px;
            background:#ffc0cb;
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
          <h3 class="modal-title" style="text-align: center;" onclick="findId()"><b>Forgot your ID?</b></h3><br>
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
              style="border:none; border-bottom: solid 1px #ccc;
              border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px; margin-top:8px;
              width: 60%; height:45px;">
          </div>
          <br>
          
			
		  <div id="alertCheck1" style="text-align:center; color: red;"></div><br>
		  	
          <div id="loginbtn" style="text-align: center;">
            <button type="button" onclick="searchId()" 
            style="width: 60%; height: 50px; border: none; border-bottom: 1px solid #ccc; outline:none; border-radius: 40px;
            background:#ffc0cb;
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
          <h3 class="modal-title" style="text-align: center;" onclick="findPass()"><b>Forgot your PASSWORD?</b></h3><br>
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
            style="width: 60%; height: 50px; border: none; border-bottom: 1px solid #ccc; outline:none; border-radius: 40px;
            background:#ffc0cb;
            color: white; font-size: 1.2em; letter-spacing: 2px; margin-bottom: 20px; font-weight: bold;">
          	비밀번호 찾기</button>
          </div>
        
        </div>
        
      </div>
      
    </div>
  </div>


<script>

$(function(){
	//아이디체크
	$('#uid').on('keyup', function(){
		$('#uid').val().trim();
		idvalue = $('#uid').val().trim();
		idreg = /^(?=.*[a-z])(?=.*[0-9]).{4,12}$/  // 아이디는 영문자, 숫자 조합하여 4~12자리
		
		if(!(idreg.test(idvalue))){
			$(this).css('border', '2px solid #FF4500');
			$('#idbtn').prop('disabled', true);//사용불가능
		}else{
			$(this).css('border', '2px solid #228B22');
			$('#idbtn').prop('disabled', false);//사용가능
		}
	})
	
// 	$('#idbtn').on('click', function(){
// 		idvalue = $('#uid').val().trim();
// 		if(idvalue.length < 1){
// 			alert("아이디를 입력하세요");
// 			return false;
// 		}
// 		$.ajax({
<%-- 			url: "<%=request.getContextPath()%>/IdCheck.do", --%>
// 			type: 'post',
// 			data: {"id" : idvalue},
// 			success: function(res){
// 				$('#spanid').text(res.flag).css('color','#FF4500');
// 				$(this).css('border', '2px solid #FF4500');
// 			},
// 			error: function(xhr){
// 				alert("상태: " + xhr.status);
// 			},
// 			dataType : 'json'
// 		})//ajax
// 	})//click
	
	$('#alert-success1').hide();
	$('#alert-danger1').hide();
	
	$('#idbtn').on('click', function(){
		idvalue = $('#uid').val().trim();
		if(idvalue.length < 1){
			alert("아이디를 입력하세요");
			return false;
		}
		$.ajax({
			url: "<%=request.getContextPath()%>/IdCheck.do",
			type: 'post',
			data: {"id" : idvalue},
			success: function(res){
				if(res.flag=="사용 가능 아이디"){
					$('#alert-success1').show();
					$('#alert-danger1').hide();
					$('#submit').removeAttr("disabled");
				}else{
					$('#alert-success1').hide();
					$('#alert-danger1').show();
					$('#submit').removeAttr("disabled");
				}
			},
			error: function(xhr){
				alert("상태: " + xhr.status);
			},
			dataType : 'json'
		})//ajax
	})//click
		
		
	
	//비밀번호
	$('#pwd1').on('keyup', function(){
		passvalue = $(this).val().trim();
		// 비밀번호는 소문자, 숫자 조합하여 4~12자리수
		passreg = /^(?=.*[a-z])(?=.*[0-9]).{4,12}$/;
		
		if(!(passreg.test(passvalue))){
			$(this).css('border', '2px solid #FF4500');
		}else{
			$(this).css('border', '2px solid #228B22');
		}
	})
	
	// 비밀번호 확인
	$('#alert-success2').hide();
	$('#alert-danger2').hide();
	
	$('#pwd2').keyup(function(){
		var pwd1=$('#pwd1').val();
		var pwd2=$('#pwd2').val();
		if(pwd1 != "" || pwd2 != ""){
			if(pwd1 == pwd2){
				$('#pwd2').css('border', '2px solid #228B22');
				$('#alert-success2').show();
				$('#alert-danger2').hide();
				$('#submit').removeAttr("disabled");
			}else {
				$('#pwd2').css('border', '2px solid #FF4500');
				$('#alert-success2').hide();
				$('#alert-danger2').show();
				$('#submit').removeAttr("disabled");
			}
		}
	})
	
	//닉네임체크
	$('#unickname').on('keyup', function(){
		namevalue = $('#unickname').val().trim();
		namereg = /^[가-힣0-9A-Za-z]{2,11}$/;
		
		if(!(namereg.test(namevalue))){
			$(this).css('border', '2px solid #FF4500');
		}else{
			$(this).css('border', '2px solid #228B22');
		}
	})
	
	//전화번호
	$('#uhp').on('keyup', function(){
		hpvalue = $(this).val().trim();
		hpreg = /^(010)-[0-9]{4}-[0-9]{4}$/;
		
		if(!(hpreg.test(hpvalue))){
			$(this).css('border', '2px solid #FF4500');
		}else{
			$(this).css('border', '2px solid #228B22');
		}
	})
	
	//이메일
	$('#umail').on('keyup', function(){
		mailvalue = $(this).val().trim();
		mailreg = /^[a-zA-Z][a-zA-Z0-9]+@[a-zA-Z0-9]{2,10}(\.[a-zA-Z]+){1,2}$/
	
		if(!(mailreg.test(mailvalue))){
			$(this).css('border', '2px solid #FF4500');
		}else{
			$(this).css('border', '2px solid #228B22');
		}
	})
	
	//submit전송 이벤트
	$('#submit').on('click', function(){
		vdata = $('#join').serializeJSON();
		var hps=$("input[name=mem_hp]");
		var tel ="";
		for(var i=0; i<hps.length; i++){
			if(i < (hps.length -1)){
				tel += hps.eq(i).val() + "-" ;				
			}else {
				tel += hps.eq(i).val() ;								
			}
			
		}
		console.log(vdata);
		vdata.mem_hp=tel;
		
		$.ajax({
			url: '<%=request.getContextPath()%>/Insert.do',
			type: 'post',
			data: vdata,
			success: function(res){
				console.log(res.flag);
				
				if(res.flag=="회원가입이 완료되어 메인으로 이동합니다"){
// 					$('#spsub').text(res.flag).css('color', '#228B22');
					alert("회원가입이 완료되어 메인으로 이동합니다.")
// 					setTimeout($(function() { $('#joinModal').hide();}), 20000);
					location.href="<%=request.getContextPath()%>/main.jsp";
					
// 				 	const btnElement = $('#submit');
// 				 	btnElement.text("메인 페이지로 이동");
				 	
// 				 	$('#submit').click(function(){
<%-- 				 		location.href="<%=request.getContextPath()%>/main.jsp"; --%>
// 				 	})
				 	
// 				 	btnElement.click= function({
// 				 		$('#loginModal').modal('show');
// 				 	})
				}else{
					$('#spsub').text(res.flag).css('color', '#FF4500');
				}
			},
			error: function(xhr){
				alert("상태: " + xhr.status);
			},
			dataType: 'json'
		})//ajax
	})//click
})//$function

//전화번호 자동 포커스 넘김
function changePhone1(){
    const phone1 = document.getElementById("phone1").value // 010
    if(phone1.length === 3){
        document.getElementById("phone2").focus();
    }
}
function changePhone2(){
    const phone2 = document.getElementById("phone2").value // 1234
    if(phone2.length === 4){
        document.getElementById("phone3").focus();
    }
}
function changePhone3(){
    const phone3 = document.getElementById("phone3").value // 5678
    if(phone3.length === 4){
      document.getElementById("uzip").focus();
	  document.getElementById("uzip").disabled = false;
    }
}

function putJoinValue(){
	document.getElementById('uid').value = 'aaa404';
	document.getElementById('pwd1').value = 'a1234';
	document.getElementById('pwd2').value = 'a1234';
	document.getElementById('uname').value = '대덕인재';
	document.getElementById('unickname').value = '대덕인재';
	document.getElementById('ubir').value = '2022-10-04';
	document.getElementById('phone1').value = '010';
	document.getElementById('phone2').value = '4044';
	document.getElementById('phone3').value = '4044';
	document.getElementById('uzip').value = '13494';
	document.getElementById('uadd1').value = '대전 대덕구 대덕대로 1324';
	document.getElementById('uadd2').value = '111-111';
	document.getElementById('umail').value = 'ddit404@naver.com';
}



</script>

  
  <!-- 회원가입 modal -->
  <div class="modal fade" id="joinModal">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body" style="margin: 20px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
           <h2 class="modal-title" style="text-align : center;" onclick="putJoinValue()"><b>WELCOME</b></h2>
           <br>
          
       <form id="join"class="needs-validation" novalidate onsubmit="return false;">   
        
        <label for="uid"style="padding-left:110px;font-weight: lighter;">영문자, 숫자 조합하여 4~12자리로 만드세요</label>
        
<!--     중복검사버튼 -->
          <div id="inputId" style="text-align : center; position:relative;">
		    <input type="text" id="uid" name="mem_id" placeholder="아이디" required
		    style=" border:none; border-bottom: solid 1px #ccc; outline: none;
             border-radius: 30px; padding: 8px 0px 5px 20px; margin-bottom:20px;
             width: 60%; height:45px;">
				
      			  <button type="submit" title="아이디 중복확인" id="idbtn"
      			   style="position:absolute;margin-left:-50px;margin-top:5px;
      			   background:none; border: none;">
       				 <i style="font-size:23px; color:black;"class="bi bi-check2-circle"></i>
      			  </button>
             
<!--              <button class="search-btn" type="submit" id="idbtn"> -->
<!--        				 <i style="font-size:20px; color:black;"class="bi bi-search"></i> -->
<!--       			  </button> -->
             
	 	  </div>
	 	 <div style= "width: 55%; text-align:center; margin-left: 120px;">
		     <div class="alert alert-success" id="alert-success1">
		     	사용 가능 아이디입니다
		     </div>
		     <div class="alert alert-danger" id="alert-danger1">
		     	사용 불가능 아이디입니다
		     </div>
	  	  </div>
	  	  
	  	  <label for ="pwd1"style="padding-left:110px;font-weight: lighter;">소문자, 숫자 조합하여 4~12자리로 만드세요</label>
	  	  <div class="form-group" style="text-align : center;">
		    <input type="password" id="pwd1" name="mem_pass1" placeholder="비밀번호" required
		    style="border:none; border-bottom: solid 1px #ccc; outline: none;
             border-radius: 30px; padding: 8px 0px 5px 20px; margin-bottom:8px;
             width: 60%; height:45px;">
             <div id="pwd1Error" class="error"></div>
	  	  </div>
	  	  
	  	  <div class="form-group" style="text-align : center;">
		    <input type="password" id="pwd2" name="mem_pass2" placeholder="비밀번호 확인" required
		    style="border:none; border-bottom: solid 1px #ccc; outline: none;
             border-radius: 30px; padding: 8px 0px 5px 20px; margin-bottom:8px;
             width: 60%; height:45px;">
             <div id="pwd2Error" class="error"></div>
	  	  </div>
	   	  
	   	  <div style= "width: 55%; text-align:center; margin-left: 120px;">
		  	  <div class="alert alert-success" id="alert-success2">
		  	  	비밀번호가 일치합니다
		  	  </div>
			  <div class="alert alert-danger" id="alert-danger2">
			  	비밀번호가 일치하지 않습니다
			  </div>
		  </div>
	  	  
	   	  <div class="form-group" style="text-align : center;">
		    <input type="text" id="uname" name="mem_name" placeholder="이름" required
		     style="border:none; border-bottom: solid 1px #ccc; 
             border-radius: 30px; padding: 8px 0px 5px 20px; margin-bottom:8px;
             width: 60%; height:45px;">
             <div id="nameError" class="error"></div>
	 	  </div>
	 	  
	 	   <label for="unickname"style="padding-left:110px;font-weight: lighter;">최대 11자리</label>
	 	   <div class="form-group" style="text-align: center;">
		    <input type="text" id="unickname" name="mem_nickname" placeholder="닉네임" required
		    style="border:none; border-bottom: solid 1px #ccc; outline:none;
             border-radius: 30px; padding: 8px 0px 5px 20px; margin-bottom:8px;
             width: 60%; height:45px;">
             <div id="nicknameError" class="error"></div>
	  	  </div>
	 	  
	  	  <div class="form-group" style="text-align : center;">
		    <input type="date" id="ubir" name="mem_bir" placeholder="생년월일" required
		    style="border:none; border-bottom: solid 1px #ccc; padding-right: 20px;
             border-radius: 30px; padding: 8px 20px 5px 20px; margin-bottom:8px;
             width: 60%; height:45px;">
	  	  </div>
	  	 
	  	  
	  	  <div class="form-group" style="text-align : center;">
		    <input placeholder="휴대폰"style="border:none; border-bottom: solid 1px #ccc; padding-right: 20px;
             border-radius: 30px; padding: 8px 20px 5px 20px; margin-bottom:8px; height:45px;margin-right:6px;"
             id="phone1" type="text" size="1" maxlength="3" oninput="changePhone1()" name="mem_hp" required> -
            <input style="border:none; border-bottom: solid 1px #ccc; padding-right: 20px;
             border-radius: 30px; padding: 8px 20px 5px 20px; margin-bottom:8px; height:45px;
             margin-left:6px; margin-right:6px;" 
            id="phone2" type="text" size="1" maxlength="4" oninput="changePhone2()" name="mem_hp" required> -
            <input style="border:none; border-bottom: solid 1px #ccc; padding-right: 20px;
             border-radius: 30px; padding: 8px 20px 5px 20px; margin-bottom:8px; height:45px; margin-left:6px;" 
             id="phone3" type="text" size="1" maxlength="4" oninput="changePhone3()" name="mem_hp" required>
	  	  </div>
	  	 
	  	  
         
	  	  <div class="form-group" style="text-align : center; position:relative;">
<!-- 		    <input type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#zipModal" value="번호검색modal"><br> -->
		    <input type="text" id="uzip" name="mem_zip" required placeholder="우편번호"
		     style="border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 20px;
             width: 60%; height:45px;">
             
             <button type="submit" title="우편번호 검색" id="zip_search"
      			   style="position:absolute;margin-left:-50px;margin-top:6px;
      			   background:none; border: none;">
       				 <i style="font-size:20px; color:black;"class="bi bi-search"></i>
      			  </button>
             
	  	  </div>
	  	  
	  	  <div class="form-group" style="text-align : center;">
<!-- 		    <label for="uadd1">주소</label> -->
		    <input type="text" id="uadd1" name="mem_add1" required placeholder="주소"
		     style="border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 20px;
             width: 60%; height:45px;">
	  	  </div>
	  	  
	  	  
	  	  <div class="form-group" style="text-align : center;">
<!-- 		    <label for="uadd2">상세주소</label> -->
		    <input type="text" id="uadd2" name="mem_add2" required placeholder="상세주소"
		     style="border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 20px; margin-bottom:8px;
             width: 60%; height:45px;">
	  	  </div>
	  	  
	  	  <div class="form-group" style= "text-align: center;">
		    <input type="text" id="umail" name="mem_mail" placeholder="이메일" required
		    style="border:none; border-bottom: solid 1px #ccc; outline: none;
             border-radius: 30px; padding: 8px 0px 5px 20px; margin-bottom:8px;
             width: 60%; height:45px;">
	  	  </div>
	  	  
	  	 
	  	  
		  <div class="form-group form-check">
		    <label class="form-check-label">
		      <input class="form-check-input" type="checkbox" name="agree" required
		      style="margin-left:110px;"> 개인정보 수집에 동의합니다.
		    </label>
		  </div>
	   
	   	<div id="joinbtn" style="text-align:center;">
	   	 <span id = "spsub"></span><br><br>
	   	 <button type="button" id=submit
	   	 style="width: 60%; height: 50px; border: none; border-bottom: 1px solid #ccc; outline:none; border-radius: 40px;
            background:#ffc0cb;
            color: white; font-size: 1.2em; letter-spacing: 2px; margin-bottom: 20px; font-weight: bold;"
	   	 >회원가입</button><br>
	   	</div>
	   </form>
	   

         </div><!-- modalbody -->
       </div><!-- modalcontent -->

      </div>
      
    </div>


	

</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = function(){
			document.getElementById("zip_search").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
            	console.log(data);
                document.getElementById("uzip").value = data.zonecode; // 우편번호 넣기
                document.getElementById("uadd1").value = data.address; // 주소 넣기
                document.querySelector("input[name=mem_add2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>









</html>