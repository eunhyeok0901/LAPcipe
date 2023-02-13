<%@page import="bps.tag.vo.TagVO"%>
<%@page import="bps.wishlist.vo.WishListVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bps.recipereview.vo.RecipeReviewVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="bps.ingreunit.service.IngreunitServiceImpl"%>
<%@page import="bps.ingreunit.service.IingreunitService"%>
<%@page import="bps.use_food.vo.Use_foodVO"%>
<%@page import="java.util.List"%>
<%@page import="bps.cookway.vo.CookwayVO"%>
<%@page import="bps.recipe.vo.RecipeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!--  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"> -->
<!--   <script src="/rps_mpro/js/jquery-3.6.1.min.js"></script> -->
<!--   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<!--   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script> -->
<!--  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> -->
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<style>

/* .rating { */
/*    width: 180px; */
/*    height : 180px; */
/* } */
/* div include:not(header1.jsp){ */
/* 	border: 1px solid red;  */
/* 	margin : 10px; */
/* } */
.rating__star {
   cursor: pointer;
 
   color: #FFEB46;
}
#ccccccontainer{
	box-shadow: 0 0 10px silver;
	margin : 10px;
}
/* span{ */
/* 	border: 2px solid blue; */
/* } */

/* .rating__star fas fa-star{ */
	
/* } */
 body{ 
 	background-color: #f5f4e9;
 } 
#outside{
	width: 1000px;
	text-align: center;
	margin-left: 23%;
	
	
}
#inside{
	padding-top: 60px;
 	background-color: white; 
/* 	background-color: #f5f4e9; */
	box-shadow: 0 0 10px silver;
	margin : 10px;
}

#div1{
 	text-align: center; 
 	margin: 0px;
	
}
#div2{ 
	float: right;
	width: 500px;
	margin : 10px;
}
#div3{
	width: 550px;
	text-align: left;
	margin-left: 22%;
	color: grey;
	
}
/* div{  */
/*  	border: 1px solid red;   */
 	
/* }  */

#title{
	text-align: left;
	padding-left: 60px;
	padding-bottom:5px;
	padding-top: 10px;
/* 	background-color: white; */
/* 	box-shadow: 0 0 10px silver; */
	font-style: italic; 
	margin : 10px;
	color: #A48654;
	font-weight: bold;
}
#ingredient1{
	display: inline-block;
	margin : 10px;
	
	
}
#ingredient{
	box-shadow: 0 0 10px silver;
	margin : 10px;	
	
}
#ingredient2{
	display: inline-block;
	margin : 10px;
}

#cook{
	border-bottom: 2px solid lightgrey;
	margin : 10px;
	
}
#cooking{
	box-shadow: 0 0 10px silver;
	margin : 10px;
}
#cookindex{
	width: 50px;
	height: 35px;
/* 	margin : 10px; */
	
}
#cookway{
	text-align: left;
	padding-left: 10px;
	width: 500px;
	height: auto;
	float: right;
	margin : 10px;
}
#cookimg{
	margin : 10px;
	display: inline-block;
}
 #ingre1{ 
 	float: left; 
	width: 100px;
	height: 20px;
	margin : 10px;
 }
 #review{
 	text-align: left;
 	margin : 10px;
}
#review1{
	padding : 10px;
}
#enroll{
	width: 100px;
	height: 50px;
	margin : 10px;
}
#reviewww{
	box-shadow: 0 0 10px silver;
	margin : 10px;
}
#reviewwww{
	padding: 10px;
}
/* #ingre2{ */
/* 	float: right; */
	
/* } */

.rating__star{
	font-size: 30px;
	font-weight: bold;
}
#tagList{
	margin : 10px;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<%	

	// 별점을 주기 위한 map
	Map ratingOptions = new HashMap();
	ratingOptions.put(0, "☆☆☆☆☆");
	ratingOptions.put(1, "★☆☆☆☆");
	ratingOptions.put(2, "★★☆☆☆");
	ratingOptions.put(3, "★★★☆☆");
	ratingOptions.put(4, "★★★★☆");
	ratingOptions.put(5, "★★★★★");
	
	// 레시피 일련번호 
	int rec_no = Integer.parseInt(request.getParameter("rec_no"));
	// 회원 아이디 (로그인 성공 시 세션영역에 저장된)
// 	session.setAttribute("mem_id", "a001");
	// 재료 단위를 출력시켜주기 위한 서비스 객체 	
	IingreunitService unitservice = IngreunitServiceImpl.getInstance();
	// 작성 날짜를 출력시키기 위해서 임시로 만듦
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(date);
	// 작성된 요리후기가 존재하는지 확인하는 불리언변수(없을 경우 '등록된 후기가 없습니다'메시지를 출력하고 후기 등록 시 덮어 씌워줘야 하므로)
// 	boolean reviewcheck = false;
	
	RecipeVO recipevo = (RecipeVO)request.getAttribute("recipevo");
	List<CookwayVO> cooklist = (List<CookwayVO>)request.getAttribute("cookvo");
	List<Use_foodVO> foods = (List<Use_foodVO>)request.getAttribute("foods");
	List<RecipeReviewVO> reviews = (List<RecipeReviewVO>)request.getAttribute("reviews");
	List<Use_foodVO> sourceList = (List<Use_foodVO>)request.getAttribute("sourceList");
	List<Use_foodVO> ingredientList = (List<Use_foodVO>)request.getAttribute("ingredientList");
	List<TagVO> tagList = (List<TagVO>)request.getAttribute("tagList");
	
%>




<script type="text/javascript">

function proc1(a){
	var ingName = a.getAttribute('name');
	a = window.open('<%= request.getContextPath()%>/FoodDetail.do?foodname='+ingName,"_blank","width=500 height=350 top=100 left=100")
	
	a.moveTo(800,100)
	
}
// onclick="proc1(this)"



star_point = 0;
<% int star_point = 0; %>

rcheck = false;

function reviewUpload(){
	var content = document.getElementById('comment').value;
	console.log(content);
 	var newdiv = document.createElement('div')
	
	var name = '<%= session.getAttribute("loginMember") %>';
	
	if(name == 'null'){
		alert('로그인 한 회원만 이용가능합니다.')
		return;
	}
	
	
	var date = '<%= today%>';
	var rec_num = <%= rec_no %>;
	
	var code = '';
	code += '<div id="review" >'
	code += '<div class="media-body">'
	code += '<h4>'
	code += name;
	code += '&nbsp;&nbsp;&nbsp;<small><i>'
	code += date;
	code += '</i></small></h4>'
	
	// star_point만큼 for문?
	for(let i = 0; i < 5; i++){
		if(i < star_point){
			code += '★';
		}else{
			code += '☆';
		}
	}
	
	code += '<br>';
	code += '<p>';
	code += content;
	
	code += '</p>';
	code += '</div>';
	code += '</div>';
	code += '<br>';
	
 	newdiv.innerHTML = code;
	
	
	console.log(rcheck);
	if(rcheck == true){
		document.getElementById('review1').innerHTML = code;
		rcheck = false;
	}else{
// 		document.getElementById('container').innerHTML = code;
 		document.getElementById('review1').appendChild(newdiv);
	}
	document.getElementById("comment").value='';
// 	$('#container').append($(newdiv));

	// ajax를 사용한 비동기 방식으로 db에 데이터(요리리뷰 및 별점) 반영시키기 
	const xhr = new XMLHttpRequest();
	


	xhr.open('get', 'RecipeReviewInsert.do?userId='+name+'&con='+content+'&score='+star_point+'&rec_no='+rec_num, true);
	
// 	xhr.setRequestHeader('Content-type', 'application/json');
	
// 	const data = {con : content, point : star_point, rec_no : rec_num};
	
	xhr.send();
	
}


window.onload = function(){
const ratingStars = [...document.getElementsByClassName("rating__star")];

function executeRating(stars) {
   const starClassActive = "rating__star fas fa-star";
   const starClassInactive = "rating__star far fa-star";
   const starsLength = stars.length;
   let i;
   
   stars.map((star) => {
	      star.onclick = () => {
	         i = stars.indexOf(star);
			 star_point = i+1;	
	         if (star.className===starClassInactive) {        
	            for (i; i >= 0; --i) stars[i].className = starClassActive;
		            
	         }else {
	            for (i; i < starsLength; ++i) stars[i].className = starClassInactive;
		            
	         }
	         
	         var a = document.getElementsByClassName('rating__star')
	         for(let i = 0; i < a.length; i++){
	        	 if(a[i].className == 'rating__star fas fa-star'){
	        		 a[i].innerText = '★';
	        	 }else{
	        		 a[i].innerText = '☆';
	        		 
	        	 }
	         }
	         
	         console.log(star_point);
	         
	      };
	   });
   
   
   }

executeRating(ratingStars);

} // window.onload함수 블럭 끝

function logincheck1(a){
	console.log(a);
	var url1 = a.getAttribute('name');
	
<%-- 	<% session.setAttribute("loginMember", "a001");%> --%>
	var memId = '<%=session.getAttribute("loginMember")%>';
	console.log(memId);
	if(memId == 'null'){
		alert('로그인 한 회원만 이용가능합니다.');
	}else{
		
		$.ajax({
			url : url1,
			type : 'get',
			success : function(res){
				if(res == '하트빨간색'){
					a.src = "/rps_mpro/images/redH.png";
				}else{
					a.src = "/rps_mpro/images/blackH.png";
					
				}
			},
			dataType : 'text'
		})
		
	}
	
	<%
	
	%>
}

	$(function(){
		
		$.ajax({
<%-- 			url : '<%=request.getContextPath()%>/AddWishList.do?mem_id="a001"&rec_no=1&mode=2', --%>
			url : '<%=request.getContextPath()%>/AddWishList.do?mem_id=<%=(String)session.getAttribute("loginMember")%>&rec_no=<%=request.getAttribute("rec_no")%>&mode=2',
			type : 'get',
			success : function(res){
// 				alert(res)
				if(res == '하트빨간색'){
					document.getElementById('wish').src = "/rps_mpro/images/redH.png";
				}else{
					document.getElementById('wish').src ="/rps_mpro/images/blackH.png";
				}
				
			},
			error : function(xhr){
				alert(xhr.status);
			},
			dataType : 'text'
		})	
	})
   
</script>

</head>
<body>

<br>
<div id="div1">
  <div id="outside">
	<div id="inside">
		<!-- 레시피 테이블의 데이터 -->
		<img class="img-rounded" src="<%= request.getContextPath() %>/ImageViewController.do?fileName=<%= recipevo.getRec_video()%>" width=600 height=500><br><br><br>
		<h2><%= recipevo.getRec_name() %></h2><br>
		<div id="div3" ><h4><%= recipevo.getRec_con() %></h4></div><br><br><br>
	 	
		<!-- 스크랩하기(찜) -->
			<img style="cursor: pointer;" width="50px" height="50px" id="wish" 
<%-- 			name="<%=request.getContextPath()%>/AddWishList.do?mem_id=a001%>&rec_no=1%>&mode=1" --%>
			name="<%=request.getContextPath()%>/AddWishList.do?mem_id=<%=(String)session.getAttribute("loginMember") %>&rec_no=<%=request.getAttribute("rec_no")%>&mode=1"
			 alt="" src="/rps_mpro/images/blackH.png" onclick="logincheck1(this)"><br><br>
			<h5 style="display: inline;">레시피</h5>&nbsp;<h5 style="color: red; display: inline;">찜하기</h5><br><br><br><br>
		
		<!-- 재료사용 테이블의 데이터 -->
	</div>
	<div id = "title"><h4>필수재료<small  style="color: lightgrey;">  Ingredient</small></h4></div>
	  <div id="ingredient" style="background-color: white;">
		<div id = "ingredient1"> 
			<h5 style="font-weight: bold;">[ 양념 ]</h5>
			<%
			for(Use_foodVO vo : sourceList){
				
			%>
				<div id="ingre1"><%= vo.getIng_name() %>&nbsp;
			<%-- 	<a href="<%= request.getContextPath()%>/FoodDetail.do?foodname=<%= vo.getIng_name()%>"> --%>
					<img style="cursor: pointer;" alt="ingre_detail.jpg" src="/rps_mpro/images/ingre_info.JPG" name="<%= vo.getIng_name() %>" onclick="proc1(this)"></div>
					<div id= "ingre1"><%= vo.getIng_qty() %>&nbsp;<%= unitservice.getOneUnit(vo.getIng_name())%></div><br><br>
				 <div style="border-bottom: 1px dotted lightgrey;"></div>
				
			<%} %>
	   	</div> 
		
		<div  id = "ingredient2">
			<h5 style="font-weight: bold;">[ 재료 ]</h5>
			<%
			for(Use_foodVO vo : ingredientList){
				
			%>
				<div id="ingre1"><%= vo.getIng_name() %>&nbsp;
			<%-- 	<a href="<%= request.getContextPath()%>/FoodDetail.do?foodname=<%= vo.getIng_name()%>"> --%>
					<img style="cursor: pointer;" src="/rps_mpro/images/ingre_info.JPG" name="<%= vo.getIng_name() %>" onclick="proc1(this)"></div>
					<div id="ingre1"><%= vo.getIng_qty() %>&nbsp;<%= unitservice.getOneUnit(vo.getIng_name())%></div><br><br>
					<div style="border-bottom: 1px dotted lightgrey;"></div>
			<%} %>
		</div>	
	  </div>
		
	<!-- 조리방법 테이블의 데이터 -->
	<div id = "title"><h4>조리순서<small style="color: lightgrey;">  Steps</small></h4></div>
		<div id="cooking" style="background-color: white;"><br>
			<%
			for(CookwayVO vo : cooklist){
			%>
				<div id = "cook" >
					<div id = "cookindex"><h2 style="color: #A48654;"><%= vo.getCook_index() %></h2></div>
					<div id = "cookway"><p style="font-size: 15px;">조리 방법 : <%= vo.getCook_con() %></p></div>
					<div id = "cookimg"><img class="img-rounded" src="<%= request.getContextPath() %>/ImageViewController.do?fileName=<%= vo.getCook_image()%>" width=300 height=200></div><br>
				</div>
			<%} %>
			<br>
		</div>
		
		
		<div id = "title"><h4>요리후기<small  style="color: lightgrey;">  Reviews</small></h4></div>
		
		<!-- 후기 테이블에서 데이터들을 끌어 모아와야함 -->
	<!-- 	<div class="media border p-3"> -->
	<!-- 	  <div class="media-body"> -->
	<!-- 	    <h4>John Doe <small><i>Posted on February 19, 2016</i></small></h4> -->
	<!-- 	    <p>Lorem ipsum...</p> -->
	<!-- 	  </div> -->
	<!--     </div> -->
	<div id="ccccccontainer" style="background-color: white;">
		<div id="review1"><br>
	 
			<%if(reviews == null || reviews.size() == 0){ 
				%>
				
				<script>rcheck=true;</script>
				
				<h3>등록된 후기가 없습니다.</h3>
				
			<% }else{ 
				
				for(RecipeReviewVO vo : reviews){
			%>
				<div style="border: 1px solid lightgrey;"></div>	
				<div id="review" class="media border p-3">
					<div>
					  <h4><%= vo.getMem_id() %>&nbsp;&nbsp;&nbsp;<small><i><%= vo.getRrev_date() %></i></small></h4> 
					<% 
						out.println(ratingOptions.get(vo.getRrev_score()));			
		// 				for(int i = 0; i < vo.getRrev_score(); i++){
		// 					out.print(ratingOptions.get(i));
		// 				}
					%> <br>
					
					<p><%= vo.getRrev_con() %></p> 
					</div>
				</div>
		    <% 	} %>
				
			
			<% } %>
		<!-- 	<div> -->
		<!-- 		<span>a001</span> <span> 2022/07/09</span> <br>  -->
		<!-- 		<span>레시피가 아주 굿이에요!</span> -->
		<!-- 	</div> -->
			
		<!-- 	<div> -->
		<!-- 		<span>b001</span> <span> 2022/07/10</span> <br>  -->
		<!-- 		<span>훌륭한 레시피네요!</span> -->
		<!-- 	</div> -->
			<div style="border: 1px solid lightgrey;"></div>
		</div>
		<br>
	</div>
	
<!-- 	태그나열 -->
	<div id="tagList" style="text-align: left;">
		<%
			for(TagVO tvo : tagList){
		%>
			<button style="background-color: #CD853F; border: none" class="btn btn-info" onclick="location.href='/rps_mpro/ShowRecipeList.do?tag_name=<%=tvo.getTag_name() %>'" type="button" >#<%=tvo.getTag_name() %></button>&nbsp;&nbsp;
		<%
			}
		%>
	</div>
	
	
	<!-- 후기 작성양식 -->
	<div id="reviewww" style="background-color: white;"><br>
		<div id="reviewwww" class="form-group">
			<label for="comment">리뷰 등록</label>
			<textarea  class="form-control" cols = "10" rows="5" id="comment" placeholder="레시피에 대한 후기와 별점을 남겨주세요~!!"></textarea>
				<!-- 별점 주기 -->
				<div class="rating">
				       <span class="rating__star far fa-star">☆</span>
				       <span class="rating__star far fa-star">☆</span>
				       <span class="rating__star far fa-star">☆</span>
				       <span class="rating__star far fa-star">☆</span>
				       <span class="rating__star far fa-star">☆</span>
				</div>
			<input id="enroll" type="button" class="btn btn-success"value="등록하기" onclick="reviewUpload()"><br><br><br>
		</div>
	</div>
	
	

  </div>
</div>
<br><br><br>
<%@ include file="footer.jsp" %>
</body>
</html>