<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>LABcipe 회원가입</title>
 	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<script src="../js/join.js"></script>

<style>
tr:hover{
 	background: lime;
 }
</style>

<script>
$(function(){
	//아이디체크
	$('#uid').on('keyup', function(){
		$('#uid').val().trim();
		idvalue = $('#uid').val().trim();
		idreg = /^[a-zA-Z0-9]{4,12}$/  // 아이디는 영문자, 숫자 조합하여 4~12자리
		
		if(!(idreg.test(idvalue))){
			$(this).css('border', '2px solid red');
			$('#idbtn').prop('disabled', true);//사용불가능
		}else{
			$(this).css('border', '2px solid lime');
			$('#idbtn').prop('disabled', false);//사용가능
		}
	})
	
	$('#idbtn').on('click', function(){
		idvalue = $('#uid').val().trim();
		if(idvalue.length < 1){
			alert("아이디를 입력하세요");
			return false;
		}
		$.ajax({
			url: "/middlepro/IdCheck.do",
			type: 'post',
			data: {"id" : idvalue},
			success: function(res){
				$('#spanid').text(res.flag).css('color','red');
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
			$(this).css('border', '2px solid red');
		}else{
			$(this).css('border', '2px solid lime');
		}
	})
	
	// 비밀번호 확인
	$('#alert-success').hide();
	$('#alert-danger').hide();
	
	$('#pwd2').keyup(function(){
		var pwd1=$('#pwd1').val();
		var pwd2=$('#pwd2').val();
		if(pwd1 != "" || pwd2 != ""){
			if(pwd1 == pwd2){
				$('#alert-success').show();
				$('#alert-danger').hide();
				$('#submit').removeAttr("disabled");
			}else {
				$('#alert-success').hide();
				$('#alert-danger').show();
				$('#submit').removeAttr("disabled");
			}
		}
	})
	
	//이름 체크
	$('#uname').on('keyup', function(){
		namevalue = $('#uname').val().trim();
		namereg = /^[가-힣]{2,4}$/;
		
		if(!(namereg.test(namevalue))){
			$(this).css('border', '2px solid red');
		}else{
			$(this).css('border', '2px solid lime');
		}
	})
	
	//전화번호
	$('#uhp').on('keyup', function(){
		hpvalue = $(this).val().trim();
		hpreg = /^(010)-[0-9]{4}-[0-9]{4}$/;
		
		if(!(hpreg.test(hpvalue))){
			$(this).css('border', '2px solid red');
		}else{
			$(this).css('border', '2px solid lime');
		}
	})
	
	//이메일
	$('#umail').on('keyup', function(){
		mailvalue = $(this).val().trim();
		mailreg = /^[a-zA-Z][a-zA-Z0-9]+@[a-zA-Z0-9]{2,10}(\.[a-zA-Z]+){1,2}$/
	
		if(!(mailreg.test(mailvalue))){
			$(this).css('border', '2px solid red');
		}else{
			$(this).css('border', '2px solid lime');
		}
	})
	
	//submit전송 이벤트
	$('form').on('submit', function(){
		vdata = $('form').serializeJSON();
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
			url: '/middlepro/Insert.do',
			type: 'post',
			data: vdata,
			success: function(res){
				console.log(res);
				$('#spsub').text(res.flag).css('color', 'red');
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

</script>
</head>

<body>
   <div>
      <div class="title"><h3 style="font-size: 18px;">LABcipe 회원가입</h3></div>
      <div id="result1" class="container">
	    <form class="needs-validation" novalidate onsubmit="return false;">
	   	  
	   	  <div class="form-group">
		    <label for="uid">아이디(영문자, 숫자 조합하여 4~12자리로 만드세요)</label>
		    <input type="button" class="btn btn-outline-success btn-sm" id="idbtn" value="중복검사">
		    <span id="spanid"></span>
		    <input type="text" class="form-control" id="uid" name="mem_id" required>
	 	  </div>
	 	  
	  	  <div class="form-group">
		    <label for="pwd1">비밀번호(소문자, 숫자 조합하여 4~12자리로 만드세요)</label>
		    <input type="password" class="form-control" id="pwd1" name="mem_pass1" required>
		    <div id="pwd1Error" class="error"></div>
	  	  </div>
	  	   
		  <div class="form-group">
			<label for="pwd2">비밀번호 확인</label>
    		<input type="password" class="form-control" id="pwd2" name="mem_pass2" required>
    		<div id="pwd2Error" class="error"></div>
    	  </div>
    	  
    	  <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다</div>
		  <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다</div>
	 	  
	   	  <div class="form-group">
		    <label for="uname">이름</label>
		    <input type="text" class="form-control" id="uname" name="mem_name" required>
		    <div id="nameError" class="error"></div>
	 	  </div>
	  	  
	   	  <div class="form-group">
		    <label for="unickname">닉네임</label>
		    <input type="text" class="form-control" id="unickname" name="mem_nickname" required>
		    <div id="nicknameError" class="error"></div>
	 	  </div>
	 	  
	  	  <div class="form-group">
		    <label for="ubir">생년월일</label>
		    <input type="date" class="form-control" id="ubir" name="mem_bir" required>
	  	  </div>
	  	  
	  	  <div class="form-group">
		    <label for="uhp">전화번호</label><br>
		    <input id="phone1" type="text" size="1" maxlength="3" oninput="changePhone1()" name="mem_hp" required> -
            <input id="phone2" type="text" size="3" maxlength="4" oninput="changePhone2()" name="mem_hp" required> -
            <input id="phone3" type="text" size="3" maxlength="4" oninput="changePhone3()" name="mem_hp" required>
	  	  </div>
	  	  
	  	  <div class="form-group">
		    <label for="uzip">우편번호</label>
		    <input type="button" class="btn btn-success btn-sm" id="zip_search" value="우편번호 검색">
		    <input type="text" class="form-control" id="uzip" name="mem_zip" required>
	  	  </div>
	  	  
	  	  <div class="form-group">
		    <label for="uadd1">주소</label>
		    <input type="text" class="form-control" id="uadd1" name="mem_add1" required>
	  	  </div>
	  	  
	  	  <div class="form-group">
		    <label for="uadd2">상세주소</label>
		    <input type="text" class="form-control" id="uadd2" name="mem_add2" required>
	  	  </div>
	  	  
	  	  <div class="form-group">
		    <label for="umail">이메일</label>
		    <input type="text" class="form-control" id="umail" name="mem_mail" required>
		    <div id="mailError" class="error"></div>
	  	  </div>
	  	  
		  <div class="form-group form-check">
		      <input class="form-check-input" type="checkbox" name="agree" value="동의" required> 개인정보 수집에 동의합니다
		  </div>
	   
	   	   <button type="submit" class="btn btn-primary btn-lg">회원가입하기</button>
	   <span id="spsub"></span>
	   </form>
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