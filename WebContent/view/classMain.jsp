<%@page import="com.google.gson.Gson"%>
<%-- <%@page import="java.util.List"%> --%>
<%@page import="bps.classreview.vo.ClassReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file ="/view/header1.jsp" %>  
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <title>Lapcipe</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
  	<script src = "../js/class.js"></script>
  	<link rel="preconnect" href="https://fonts.googleapis.com">
  
  	
  	
  	
<!--  	<script src="../js/jquery-3.6.1.min.js"></script> -->
 	

	

 
	<script type="text/javascript">
	
	

	<%
	
 	String id = (String)session.getAttribute("loginMember");
	if(id == null){
// 		System.out.print("로그인 안되어있음");
		%>
// 	window.onload=getClassList();
		<%
	}else{
// 		System.out.print("로그인됨");
	}

    %>

	
    
    
    

	$(function(){
		
		window.onload=getClassList();
		//클래스 리스트를 불러온다
		
		$('.cate input[type=button]').on('click',function(){
		//종류(한식/중식 등) 눌렀을 때 해당 리스트 불러오기
		
		sort = $(this).val().trim();
// 		console.log(sort);
		//'종류'텍스트 불러왔음
		getClassKorea(sort);
// 		console.log(sort);	
		})
		
		
// 		data-target="#myModal"

			
			$(document).on('click','.title', function(e){
				
				e.preventDefault();
				//클래스번호를 변수로 지정함ㄴ
				classNo = $(this).parent().find('a').attr('value');
				//클래스 번호를 클릭하면 해당 클래스에 대한 상세 정보 페이지로 넘어간다
// 	 			alert(classNo);
	 			classDetail(classNo);//모달로 클래스 상세정보
// 	 			starScore(classNo);//별점불러-> 실패!
				$('.modal-container').show();
			
			})
		
		/////////////////////
		select = "";	
		$('#select').on('change',function(){
		select = $('#select option:selected').text().trim();
// 		alert(select);
		//옵션 선택 변수
		})
		
		$('.btn-default').on('click', function(e){
		e.preventDefault();
		
		//검색어 변수
		keyword =$(this).parents('#selectForm').find('#selectsearch').val().trim();
// 		alert(keyword);

// 		console.log(keyword)
// 		console.log(select)//검색버튼 눌렀을떄 옵션, 검색어 다 확인됨
		
		if(select == "-선택-"){
			alert("카테고리를 선택해주세요.")
		}else if(select == "요리명"){
		searchResult2();
		}else if(select == "재료명"){
			searchResult();

		}
			
		})
/////////////////////재생버튼
		$('.curriculum a').on('click',function(){
			//재생버튼 클릭 결제 회원
		})
		//////////////////////////////
		$('.glyphicon-plus-sign').on('click',function(){
// 			alert("더보기버튼")
			classNo = $('.modal-classNo p').text().trim();
			getClassReview(classNo);
			$(this).css('display','none');

		})
		//모달 닫으면 댓글 영역 초기화됨 / 배경을 클릭해서 닫힐 경우는 적용되지 않음
		$('.modal-footer .closeBtn').on('click',function(){
			$(this).parents('.modal-content').find('.reviewBOx').empty();
			$('.glyphicon-plus-sign').css('display','block').css('float','right');
		})
		
		
		//등록버튼을 눌러서 로그인 상태 확인 / 로그인 된 경우에는, 등록 확인을 하고 등록창으로 넘어감

		
		$('.modal-footer .registerBtn').on('click',function(){
		
			var id = '<%=id%>';
			var classNo = $('.modal-classNo p').text().trim();
			console.log(id,classNo);
			if(id=='null'){
					alert("로그인 후 이용해주세요.");
				}else{
					alert("결제창으로 이동합니다.");
					registerPay(classNo,id);
// 					
				}
// 			})
			
		})
		
		

		//재생버튼 ->결제 회원 구분해서 재생/alert
		$('#curri_play').on('click', function(){
			var classNo = $('.modal-classNo p').text().trim();
			var id = '<%=id%>';
			confirmRegister(classNo,id);//넘겨주기!!!!
			
		})
		
		$()

	
	
	
	})//function
	
		
			
	</script>
  
 
    
    
    <style>
    

    
    
    
/*     //글씨체 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap');
	
	*{
	font-family: 'Noto Serif KR', serif;
	color: #4f4f4f;
/* 	글씨색 */
	
	}
/*   글씨체 */


        
    
    body { padding-right: 0 !important; }
    
    .panel-heading{
    	background-color: white;
    }

      /* Remove the navbar's default margin-bottom and rounded borders */ 
      .navbar {
        margin-bottom: 0;
        border-radius: 0;
        background-color: white;
        border : 1px solid white;
/*         position: fixed; */
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
   background: #fbf8f1;
   }

   
   #updatedList{
   	border : 1px solid red;
   	height: 300px;
   }
   
   .cate{
    border : 1px solid none;
   	height: 100px;
   }
   
   
   .cate li{
   	float: left;
   	margin-right : 30px;
   }
   .panel-heading a{
   	color: black;
    font-size: 1.2em;
    font-weight: bolder;
   }
   
   .panel-danger {
   	width : 400px;
   	height: auto;
	float: left;
	margin: 30px;
    border-color: #fbf8f1;
   }
   
   .panel-danger>.panel-heading {
    color: #fbf8f1;
    background-color: #fbf8f1;
    border-color: #fbf8f1;
}
   
   .container{
   	width: auto;
   }
   .col-sm-4{
   width: 1800px;
   margin-left: auto;
   margin-right: auto;
   }
   .panel-heading{
   	background: white;
   }	
   	.modal-container{
   	display: none;
   }
   
   .curri{
   border: 1px solid gray;  
   float: left;
   border-radius: 150px;
   height: auto;
   margin : 30px;
   padding: 10px;
   }
   .modal-footer button{
   	float: left;
	height: auto;
	margin: 10px;
	   }
	   
	.modal-content{
	box-sizing: content-box;
	cursor: pointer;
	overflow: scroll;
		
	}
	
#cateArea {
  background: #fbf8f1;
  color:pink;
/*   색상수정 */
  font-family:sans-serif;
  font-size:16px;
}



/* Wrapper Is not Needed| Just for demo purpose.  */


 .btn4{
  padding: 15px 70px;
  margin:10px 4px;
  color: #fbf8f1;
  font-family: sans-serif;
  text-transform: uppercase;
  text-align: center;
  position: relative;
  text-decoration: none;
  display:inline-block;
  
}




/*======= Button 4 =======*/
.btn4::before {
  content: '';
  position: absolute;
  bottom: 0%;
  left: 0px;
  width: 100%;
  height: 1px;
  background: pink;
/*   수정 */
  display: block;
  -webkit-transform-origin: right top;
  -ms-transform-origin: right top;
  transform-origin: right top;
  -webkit-transform: scale(0, 1);
  -ms-transform: scale(0, 1);
  transform: scale(0, 1);
  -webkit-transition: transform 0.4s cubic-bezier(1, 0, 0, 1);
  transition: transform 0.4s cubic-bezier(1, 0, 0, 1)
}

.btn4:hover::before {
  -webkit-transform-origin: left top;
  -ms-transform-origin: left top;
  transform-origin: left top;
  -webkit-transform: scale(1, 1);
  -ms-transform: scale(1, 1);
  transform: scale(1, 1)
}

#cateArea input[type=button]{
	border:none;
	background-color: #fbf8f1;
	color: black;
}



.panel-danger{
	width: 340px;
	align-content: center;
}

    </style>
  </head>
  <body></body>
  
  
  
<!--   <nav class="navbar navbar-inverse"> -->
<!--     <div class="container-fluid"> -->
  
  
  
<!--       <a class="navbar-brand glyphicon glyphicon-home"  href="#"></a>  -->
         	
           
<!--         <ul class="nav navbar-nav navbar-right"> -->
<!--             <li><a href="#">Recipe</a></li> -->
<!--             <li><a href="#">Class</a></li> -->
<!--             <li><a href="#">Notice</a></li> -->
<!--             <li><a href="#">My Page</a></li> -->
            
<!--           <li><a href="#" data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li> -->
<!--           <li><a href="#" data-toggle="modal" data-target="#joinModal"><span class="glyphicon glyphicon-plus"></span> Join</a></li> -->
          
<!--         </ul> -->
<!--     </div> -->
<!--   </nav> -->
  
  
<!--   메인 -->
<!--  <div> -->


	<div style="margin-left: 358px; margin-top: 0px; padding-top: 0px;"class="cate" id="cateArea">
	

		<ul>
			<li  class="btn4" id="korea"><input type="button" value="한식" style="font-family:Noto Serif KR, serif; font-size: 20px;"></li>
			<li  class="btn4" id="china"><input type="button" value="중식" style="font-family:Noto Serif KR, serif; font-size: 20px;"></li>
			<li  class="btn4" id="japan"><input type="button" value="일식" style="font-family:Noto Serif KR, serif; font-size: 20px;"></li>
			<li  class="btn4" id="baking"><input type="button" value="베이킹" style="font-family:Noto Serif KR, serif; font-size: 20px;"></li>
			<li   class="btn4" id="etc"><input type="button" value="기타" style="font-family:Noto Serif KR, serif; font-size: 20px;"></li>
		
		</ul>
		
		
		</div>	
 
		
		<%-- 	<%-- --%>
<!-- 	검색창div -->
	<div id="selectForm"  style="float: right; margin-right: 90px;">

	<select id="select" style="border-bottom:2px solid pink; background-color: #fbf8f1; margin: -2px; height: 40px;">
		<option>-선택-</option>
		<option>재료명</option>
		<option>요리명</option>
	</select>
		<input id="selectsearch"style=" border-bottom:2px solid pink;   background-color: #fbf8f1;  height: 40px;margin: -2px;" type="text" placeholder="  검색어를 입력하세요 ">
      <button style="margin-left:-7px;  height: 37px;   border: none; border-bottom:2px solid pink; background-color: #fbf8f1;"   class="btn btn-default" type="submit" >
        <i class="glyphicon glyphicon-search"></i>
      </button>
</form>
	</div>





  
  
	
	
	


<div id="testarea" style="background: #fbf8f1 ; height: auto;">




</div>	
	
	






	
	
	
</div>

  <footer class="container-fluid text-center">
    <p>
    
    기관명 : (재)대덕인재개발원이사장 : 김형응주소 : 대전광역시 중구 계룡로 846, 3-4층<br>
   사업자등록번호 : 306-82-05291대표전화 : 042-222-8202팩스 : 070-8768-2972<br>
   COPYRIGHT © 2020 (재)대덕인재개발원 ALL RIGHTS RESERVED<br>
    
    </p>
  </footer>


<!-- 모달창 -->

<!-- <div class="modal-container"> -->
<!--   <h2>res.det_con</h2> -->
<!--   <!-- Trigger the modal with a button --> -->
<!--   <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
    
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h1 style="font-weight: bolder; text-align: center;"  class="modal-title">모달</h1>
        </div>
        
        <div class="modal-classNo" style="float: right; width: 60px;" >
          <span style="float: left;">No_</span><p style="float: left;"></p>
        </div>
        <br><br>
        <div class="modal-body-photo">
<!--           <span> </span> -->
         <img style="margin: 20px;"width="90%" height="300" src="" alt="ㅋㅇㅋ"></img>
          
        </div>
        <div class="modal-body modal-body-DET_CON">
          <p style="text-align: center; font-size: 1.1em;">강의 소개 넣고</p>
        </div>
        <div style="float : right; margin-right: 30px;"class="modal-body modal-body-money">
<!--           <p style="font-size: 20px; font-weight: bold;float: left;">금액</p> -->
<!--           <span style="font-size: 20px; font-weight: bold; float: left;">원</span> -->
          
        </div>
        <br>
        <div class="modal-body modal-body-time" style="width: 150px; float: left; margin-left: 100px;">
          <span class="glyphicon glyphicon-time" style="font-size :25px; float: left; margin: 10px; height: 20px;"></span><p style="margin-top : 10px; font-size : 17px; height: 20px;">강의시간</p>
        </div>
        <div class="modal-body modal-body-period"style="width: 120px; float: left;margin: 0px;">
          <span class="glyphicon glyphicon-calendar" style="font-size :25px;  float: left; margin: 10px; "></span><p style="margin-top : 10px; float: left">수강기간</p><span style="margin-top : 10px; font-size : 17px;float: left">일</span>


        </div>
        <div class="modal-body modal-body-man"style="width: 120px; float: left;margin: 0px;">
          <span class="glyphicon glyphicon-user" style="margin-top : 10px; font-size :25px; float: left; margin: 10px"></span><p  style="margin-top : 10px; font-size : 17px; float: left">수강인원</p>
          
        </div>
        
        
        
        <div>
        
        <iframe style="margin: 30px;"width="90%;" height="300px;" src="" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        
        </div>
        
        
        
        
<!--         <br> -->
<!--         <br><br><br> -->
<!--         <div> -->
<!--         여기에 수강후기 불러오기 -->
<!--         </div> -->
        
        
	 <hr><div class="modal-body curriculum">
        <h2 style="font-weight: bold;"><span class="glyphicon glyphicon-ok	
        	
        "> </span>Curriculum </h2>
        
        <div style="height:100px;">
        
        <span class="curri" id="curri_title"  style="margin-left : -10px; font-size : 1.3em; margin-top : 5px; width : auto;  margin-right : 0px; border : none;">클래스 이름 </span>
        <a class="curri" id="curri_play" style="margin-top : 5px; border : none; width : 80px; margin-left: -20px;"><span style="font-size : 1.5em;"class="glyphicon glyphicon-play	
        "></span></a>
        
        
        </div>
        
         <div  class="modal-body"style="height:auto;">
         
         <h3 style="display: inline-block;">수강후기<a class="glyphicon glyphicon-plus-sign"></a></h3>
<!--         <span>더보기 클릭하면 후기 불러오기</span> -->
        <div class="reviewBOx" style=" border: 1px solid pink; height: auto;">
        
        </div>
        <hr>
        <div class="modal-body">
        <h4 style="font-weight: bold; ">취소/환불 안내</h4>
			<hr>
        	<p>온라인 클래스</p>
        	
        	<table class="table" border="1px;" style="text-align: center; padding: 10px;">
        		<tr>
        			<td></td>
        			<td>클래스 이용 전</td>
        			<td>클래스 이용 후
        			</td>
        		</tr>
        		<tr>
        			<td>클래스 신청 후,7일 이내</td>
        			<td>전액 환불	</td>
        			<td>기이용분 차감 후, 환불 진행</td>
        		</tr>
        		<tr>
        			<td>클래스 신청 후,7일 초과</td>
        			<td>판매금액의 10% 수수료 차감 후 환불
							<br>(수강기간 종료 시, 환불 불가)</td>
        			<td>환불 불가</td>
        		</tr>
        	
        	</table>
        </div>
        
        </div>
        
       <br><div>
    
       </div><br>
        <div class="modal-footer">
		  <button type="button" class="btn registerBtn" style="margin-left:150px; margin-right:0px; background-color: white; border: 1px solid gray; float: left;">Register</button>
          <button type="button" class="btn closeBtn" data-dismiss="modal" style=" margin-left: 10px; background-color: white; border: 1px solid gray; float: left;">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>





</html>
