<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<script src="../js/jquery-3.6.1.min.js"></script>

<script>

	number = 3;
	code = '';
	$(function() {
		$.ajax({
			url : '/rps_mpro/ShowEnrollmentView.do',
			type : 'get',
			success : function(res) {
				
// 				console.log(res.list1[0]);
				
				// code1은 <div> ~~~  재료명에 대한 데이터를 담고 g까지의 select태그를 포함     </div>
				code1 = '';
				code1 += '<div class="ingredient">';
				code1 += '<select name="food">';
				
				
				// code3에는 재료의 단위에 대한 select태그를 담는다고 생각하면 편함 
				code3 = '<select name="unit">';
				check = [];
				$.each(res.list1,function(i,v){
// 					console.log(v.ing_name);
					code1 += '<option>'+v.ing_name+'</option>';
					
					if(!check.includes(v.ing_unit)){
						code3 += '<option>'+v.ing_unit+'</option>';
					}
					
					check.push(v.ing_unit);
				})
				
				code3 += '</select>';
				
				code1 += '</select>';
				
				code1 += '<input type="text" class="quantity" name="quantity1" />';
				code1 += code3;
								
				
				// code4에는 양념을 , code2에는 양념의 단위를 담는다 생각하면 편함 
				check2 = []
				code4 = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="source">';
				code2 = '<select name="unit">';
				$.each(res.list2,function(i,v){
// 					console.log(v.ing_name);
					code4 += '<option>'+v.ing_name+'</option>';
					
					if(!check2.includes(v.ing_unit)){
						code2 += '<option>'+v.ing_unit+'</option>';
					}
					
					check2.push(v.ing_unit);
				})
				code4 += '</select>';
				
				code2 += '</select>';
				code4 += '<input type="text" class="quantity" name="quantity1" />';
				
				code4 += code2;
				code4 += '</div>';
				
				code += code1;
				code += code4;
				
				$('#container').html(code);
				
				
			},
			error : function(xhr) {
				alert('상태 : ' + xhr.status);
			},
			dataType : 'json'
		})
		
		

	})

	
// 재료추가 양식이 추가되게 하는 함수 
function addfood(){
	
	const parent = document.createElement('div');
	$(parent).html(code)

	$('#container').append($(parent));	
}

	
// 이미지 클릭 시 파일 업로드를 시켜주는 함수 
function myfunction2(a){
	
	var imgName = a.name;
	lastNum = imgName.length;
	var idx = imgName.substring(3,lastNum);
	
	b = $(a).parent().find($('.uploadimg'+idx));
	console.log(b);
	b.click();
}

function myfunction3(){
	
	number++;
	
	var cookwayPlusCode = '';
	cookwayPlusCode += '<div class="text"><span>STEP'+number+'</span></div><br>';
	cookwayPlusCode += '<textarea style="width: 650px; height:150px;float: left;" class="form-control" name="cookway'+number+'"></textarea>';
	cookwayPlusCode += '<input type="file" class="upload uploadimg'+number+'" name="uploadimg'+number+'" onchange="loadFile2(this)" style="display : none;"/>';
	cookwayPlusCode += '&nbsp;<img style="float: left;" name="img'+number+'" class="cookimg cookimg'+number+'" width="180" height="150" src="../images/cookwayimg.jpg" onclick="myfunction2(this)">';
	
	var parent = document.createElement('div');
	parent.className = 'cookwaybox';
	$(parent).html(cookwayPlusCode);
	 
	$('#container2').append($(parent));
}

// function sendData(){
// 	guess = $('#food option:selected').val();
	
// }

function myfunction4(){
	$('.mainupload').click();
}

// 이미지 업로드 시 해당 이미지를 페이지 상에서 바로 출력시키는 함수 
function loadFile(a){
	var file = a.files[0];
	
// 	document.querySelector('.maincookimg').remove();
	
// 	var newimg = document.createElement('img');
	document.querySelector('.maincookimg').src = URL.createObjectURL(file);
	
// 	newimg.style.width = "200";
// 	newimg.style.height = "200";
	
// 	$('#maincook').append($(newimg));
// 	document.getElementById('maincook').innerHTML = newimg;
}

function loadFile2(a){
	var file = a.files[0];
// 	var newimg = document.createElement('img');
	a.parentElement.lastElementChild.src = URL.createObjectURL(file);
// 	newimg.style.width = "100";
// 	newimg.style.height = "100";
	
// 	a.parentElement.lastElementChild.remove();
// 	a.parentElement.appendChild(newimg);
	
	
// 	document.getElementById('maincook').innerHTML = newimg;
}

function checkdata(){
	var a = document.getElementById('MyForm');
	
	if(a.title.value.trim() == ''){
		alert('제목을 입력해주세요.')
		return;
	}
	
	if(a.announcement.value.trim() == ''){
		alert('요리소개글을 입력해주세요.')
		return;
	}
	
	var quantities = document.getElementsByClassName('quantity')
	
	
	for(let i = 0; i < quantities.length; i++){
// 		console.log(quantities[i]);
		var qnum = quantities[i].value.trim();
		var qnum2 = quantities[i].value;
		if(qnum == ''){
			alert('수량을 입력해주세요.');
			return;	
			
		}	
			
		
		for(let value of qnum2){
			if(isNaN(parseInt(value))){
				alert('숫자를 입력해주세요.');
				return;
			}
		}
			
			
	}
	
	if(document.getElementById('tag_input').value.trim() == ''){
		alert('태그명을 입력해주세요');
		return;
	}
	
	var cookways = document.getElementsByClassName('tarea');
	for(let i = 0; i < cookways.length; i++){
		if(cookways[i].value.trim()==''){
			alert('조리방법을 입력해주세요.');
			return;
		}
	}
	
	return true;
	
}


function submitdata(){
	
	var check = checkdata();
	
	if(check){
		
		var a = document.getElementById('MyForm');
		a.submit();
		
	}
	
}


	
// 	if(event.keyCode == 8){
// 		console.log('까아꿍');
// 	}



function fill_out_recipeData(){
	document.getElementsByName('title')[0].value = '굴 소스 마요라면 만들기';
	document.getElementsByName('announcement')[0].value = '심야식당에 나온 굴소스 마요라면이 맛있어보여 생각나는 대로 간단하게 만들어 봤어요. ';
	document.getElementById('textarea1').value = '라면을 3분정도 끓여줍니다';
	document.getElementById('textarea2').value = '물은 약간만 남기고 버리고 라면수프 반개를 넣어 잘 섞어줍니다';
	document.getElementById('textarea3').value = '굴소스를 넣어서 섞어주고';
	
}




</script>

<style>
.cola{
	margin-top : 25px;
	cursor : pointer;
}


.cookimg{
	cursor : pointer;
}

footer {
	margin-top : 30px;
}

#maincook{
	cursor : pointer;
	display : inline-block;
	float : left;
	
	
}

.maincookimg{
}

#greatest_container{
	width : 1200px;
	margin : auto;
	background : white;
/* 	border : 2px solid red; */
	padding-left : 150px;
	padding-right : 150px;
	padding-top : 50px;	
	padding-bottom : 30px;
	box-shadow : 0 0 10px gray;		
	margin-top : 50px;
}
 body{
/*    padding-left : 150px;	 */
/*    padding-right : 150px;	 */
/*    padding-bottom : 150px;	 */
   background: #FFFFDC;
   background-color: #f5f4e9;
   }

#recipe_title{	
	width : 400px;
	
}   

#recipe_announce{
	padding-top : 20px;
	width : 400px;
}

#first_container{
	float : left;
	width: 600px;
}

#middle{
	clear : both;
}

#categoryinfo{

	padding-top : 20px; 
	padding-bottom : 20px;
}

.ingredient{
	margin-bottom : 10px;
}


.cookwaybox{
	margin-top : 20px;
	line-height : 50px;
	height : 150px;
	
}

.text{
	
 	vertical-align : middle;	 
	line-height : inherit;
	display : inline-block;
	font-size : 30px;
	
}

.tarea{
 	vertical-align : middle;	 
	line-height : inherit;
	display : inline-block;
	width : 500px;
	height : 150px;
	margin-top : 20px;
}


.upload{
 	vertical-align : middle;	 
	line-height : inherit;
	display : inline-block;

}

.cookimg{
 	vertical-align : middle;	 
	line-height : inherit;
	display : inline-block;

}

.recipe_title {
	width : 230px;
	height : 20px;
}
#recipe_title{

	font-size : 25px;
}

.recipe_announce{
	width : 230px;
	height : 100PX;
}

#recipe_announce{
	font-size : 25px;
}

h2{
	font-weight : bold;
}

#cookinfo{
	font-size : 25px;
}

option{
	font-size : 21px;
	margin-left : 5px;
}

select{
	margin-left : 5px;
	font-size : 17px;
}

.quantity{
	margin-left : 5px;
	height : 26.5px;
}

#recipe_enroll{
/* 	border : 2px solid black; */
	margin-bottom : 15px;
	font-weight : bold;
	font-size : 40px;
}

#last_buttons{
	margin-top : 30px;
	width : 500px;
	margin-left : auto;
	margin-right : auto;
	text-align : center;
}

#store_button{
	border : none;
 	border-radius : 10px ; 
	background-color : green;
	width : 100px;
	height : 50px;
	box-shadow : 2px 2px;
	color : white;
	font-weight : bold;
}

#reset_button{
	border : none;
	background-color : #ffa500;
 	border-radius : 10px; 
	width : 100px;
	height : 50px;
	box-shadow : 2px 2px;
	margin-left : 3px;
	color : white;
	font-weight : bold;
}

#tag_style{
	font-size : 20px;
	
}

#plusfood{
	cursor : pointer;
	margin-left: 250px;
}

</style>

</head>
<body>

<div id="greatest_container">
		
		<div id="recipe_enroll"><h2 onclick="fill_out_recipeData()">레시피 등록</h2></div><br><br>
	<form action="<%= request.getContextPath() %>/RecipeEnroll.do" method="post" id="MyForm" enctype="multipart/form-data" onsubmit="sendData()">
		<!-- 로그인한 회원의 아이디를 hidden속성의 input태그에 기입하여 레시피 등록을 처리하는 서블릿으로 전달해줌 -->
		<input type="hidden" name="memId" value="<%= (String)session.getAttribute("loginMember")%>"/>
		<div style="border: 1px solid lightgrey"></div><br><br>
		<div id="first_container" style="float: left;  display: inline;">
			 <span id="recipe_title">레시피 제목 </span><br> <input style=" width: 500px; height: 50px;" class="form-control" cols = "15" rows="1" id="recipe_title" type="text" name="title"><br> 
			<span id="recipe_announce">요리소개글 </span> <br><textarea  style=" width: 500px; height: 80px;" class="form-control" id="recipe_announce" name="announcement"></textarea>
		</div>
			<div style="float: right; display: inline;"  id="maincook">
				<input type="file" class="mainupload" name="mainimg" onchange="loadFile(this)" style="display : none; margin-left: 200px;" />
				<img name="mainimg" class="maincookimg" width="280" height="240" src="../images/cookmain.jpg" onclick="myfunction4()">
			</div><br><br>
			
		<br>
		
		
	
	<div id="middle"><br><br>		
	<div style="border: 1px solid lightgrey"></div>
	<div id="categoryinfo">	<br>
		<span style="float: left;" id="cookinfo">카테고리</span>&nbsp;&nbsp;&nbsp;&nbsp;
		<div style="float: left; padding-top: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;
		<select name="category">
			<option>밑반찬</option>
			<option>메인반찬</option>
			<option>국/탕</option>
			<option>찌개</option>
			<option>디저트</option>
			<option>면/만두</option>
			<option>밥/죽/떡</option>
			<option>퓨전</option>
			<option>김치/젓갈/장류</option>
			<option>양념/소스/잼</option>
			<option>양식</option>
			<option>샐러드</option>
			<option>스프</option>
			<option>빵</option>
		</select>
		</div>
	</div><br><br>	
	<div style="border: 1px solid lightgrey"></div><br><br>
		
		<!-- 아래 컨테이너에 재료들이 추가되어짐 -->
		<span style="font-size : 25px;">재료선택</span>&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
		<div style="display: inline-block;" id="container">
		</div>
	
		
		<!-- 클릭시 재료 입력란이 늘어나게 하는 이미지 -->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;
		<img id="plusfood" src="../images/addbutton2.JPG" width="120" height="50" onclick="addfood()"><br><br>
		<div style="border: 1px solid lightgrey"></div>
<!-- 		class="form-control" cols = "10" rows="5" id="comment"  -->
			<br><br>
		<span style="font-size : 25px;">조리순서</span>
		<div id="container2">
			<div class="cookwaybox">
				<div class="text" id="text1"><span >STEP1</span></div><br> 
				<textarea class="form-control" style="width: 650px; height:150px;float: left;" id="textarea1" name="cookway1"></textarea>
				<input id="upload1" type="file" class="upload uploadimg1" name="uploadimg1" onchange="loadFile2(this)" style="display : none;"/>
				<img style="float: left;" name=img1 class="cookimg cookimg1" width="180" height="150" src="../images/cookwayimg.jpg" onclick="myfunction2(this)">
			</div><br><br>
			
			<div class="cookwaybox">
				<div class="text"><span>STEP2</span></div><br> 
				<textarea style="width: 650px; height:150px;float: left;"  id="textarea2" class="form-control" name="cookway2"></textarea>
				<input type="file" class="upload uploadimg2" name="uploadimg2" onchange="loadFile2(this)" style="display : none;"/>
				<img name="img2" class="cookimg cookimg2" width="180" height="150" src="../images/cookwayimg.jpg" onclick="myfunction2(this)">
			</div><br><br>
			
			<div class="cookwaybox">
				<div class="text"><span>STEP3</span></div> <br>
				<textarea style="width: 650px; height:150px;float: left;"  id="textarea3" class="form-control" name="cookway3"></textarea>
				<input type="file" class="upload uploadimg3" name="uploadimg3" onchange="loadFile2(this)" style="display : none;"/>
				<img  style="float: left;" name="img3" class="cookimg cookimg3" width="180" height="150" src="../images/cookwayimg.jpg" onclick="myfunction2(this)">
			</div><br>
		</div>
		
		<!-- 클릭시 조리방법이 추가되게하는 이미지  -->
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img style="margin-left: 130px;" class="cola" src="../images/addbutton2.JPG" width="120" height="50" onclick="myfunction3()" ><br><br>
		<div style="border: 1px solid lightgrey"></div><br><br>
		<!-- 태그명 기입 -->
		<div id="tag_style" style="font-size : 20px;"><span>태그설정</span><br><br><input placeholder="원하시는 태그를 입력해주세요" class="form-control" id="tag_input" type="text" name="tag" /></div> <br>
		<!-- 아래는 제출하는 코드 --><br>
		<div style="border: 1px solid lightgrey"></div><br>
	</div>
</form>
	
	
</div>

		<div id="last_buttons"><input id="store_button" type="submit" value="저장" onclick="submitdata()"/> <input id="reset_button" type="reset" value="취소"/></div>
	


<%@ include file="footer.jsp" %>
</body>
</html>