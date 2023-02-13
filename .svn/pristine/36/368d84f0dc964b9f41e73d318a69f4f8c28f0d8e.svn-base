<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="bps.recipereview.service.IRecipeReviewService"%>
<%@page import="bps.recipereview.service.RecipeReviewServiceImpl"%>
<%@page import="bps.recipereview.vo.RecipeReviewVO"%>
<%@page import="bps.recipe.vo.RecipeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header1.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script> -->
<title>Insert title here</title>
<!-- 메인 화면의 배너에서 recipe를 클릭할 시 해당 페이지로 안내될 것!(서블릿을 거쳐서 여기로 오게 될 것임) -->


<script>
function checklogin(){
	// 아래 세션영역에 저장하는 코드는 나중에 꼭 삭제 해야됨!!!!
	//////////////////////////////////////////////////////////////////
	<% MemberVO memvo = (MemberVO)session.getAttribute("loginMember"); %>
	
	var id = <%= memvo %>;
	
	console.log(id);
	
	
<%-- 	var id = '<%= memvo.getMem_id()%>'; --%>
	
	///////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////
	if(id == 'null'){
		alert('회원만 등록하실 수 있습니다.');
		if(confirm('로그인하시겠습니까?')){
			// 로그인 모달 창을 띄움 
		}
	}else{
		location.href= '<%= request.getContextPath() %>/view/enrollrecipe.jsp?id='+id;
	}
}

function recipedetail(a){
	b = a.getAttribute('id');
	console.log(b);
	location.href = b;
}


</script>


<style>
	.enrollrecipe{
	cursor : pointer;
	
	}
	
	.rating__star {
	   cursor: pointer;
	   color: #dabd18b2;
	}
	
	body{
		background : #FFFFDC;
	}

	.greatcontainer{
		margin-top : 50px;
		text-align : center;
		width : 1300px;
		height : 1400px;
		margin-left : auto;
		margin-right : auto;
/* 		cursor : pointer; */
/* 		border : 2px solid red; */
		box-shadow : 0 0 10px gray;	
		background-color : white;
/* 		border-radius : 20px; */
		margin-bottom : 50px;
		
	}
	
	.card{
		cursor : pointer;
		width : 300px;
		height : 400px;
		float : left; 
/* 		background-color : white;	 */
		margin-left : 15px;
		margin-top : 15px;
		display : inline-block;
/* 		border-radius : 10px; */
	}
	
	.card-body{
	 	text-align : center;
		width : 300px;
		
	}
	
	.card-img-top{
		width : 300px;
		height : 250px;
/* 		border-radius : 10px; */
	}
	
/* 	#second_container{ */
/* 		display : inline-block; */
/* 		text-align : center; */
/* 	} */
	
	.card-title{
		font-weight : bold;
	}
</style>

</head>
<body>
<%
	//별점을 주기 위한 map
	Map ratingOptions = new HashMap();
	ratingOptions.put(0, "☆☆☆☆☆");
	ratingOptions.put(1, "★☆☆☆☆");
	ratingOptions.put(2, "★★☆☆☆");
	ratingOptions.put(3, "★★★☆☆");
	ratingOptions.put(4, "★★★★☆");
	ratingOptions.put(5, "★★★★★");

	List<RecipeVO> recipes = (List<RecipeVO>)request.getAttribute("recipes");

	IRecipeReviewService reviewservice = RecipeReviewServiceImpl.getInstance();
	
	
	List<RecipeReviewVO> reviewlist = null;
			
	
%>

	<%
		if(recipes.size() != 0){
		%>
		
		<div class="greatcontainer">
	<% 
		for(RecipeVO vo : recipes){
	%>
	
	<% reviewlist = reviewservice.getSomeReview(vo.getRec_no()); 
	   int score_total = 0;
	   int avg_score = 0;	
		
		if(reviewlist.size() != 0){
			
		   for(RecipeReviewVO vo2 : reviewlist){
			   score_total += vo2.getRrev_score();
			}
		   
			avg_score = score_total / reviewlist.size();
		}
	%>
	<!-- 여기부터 웹 브라우저 상에 출력되는 데이터들에 대한 코드가 작성됨 -->
	
	
	
	
	
		
	
	<!-- db에서 꺼내온 레시피들을 여기부터 나열시킴 -->
<%-- 	<a href="<%= request.getContextPath()%>/ViewDetail.do?rec_no=<%= vo.getRec_no()%>"> --%>
		<div class="card" id="<%= request.getContextPath()%>/ViewDetail.do?rec_no=<%= vo.getRec_no()%>" onclick="recipedetail(this)">
			
			<img class="card-img-top" src="<%= request.getContextPath() %>/ImageViewController.do?fileName=<%= vo.getRec_video()%>">
				<div class="card-body">
					<h4 class="card-title"><%= vo.getRec_name() %></h4>
					<p class="card-text"><span class="rating__star"><%= ratingOptions.get(avg_score) %></span></p>
					<p class="card-text">조회수<%= vo.getRec_count()%></p>
				</div> 
		</div>
	
	<%
		}
	%>
		</div>
		
	<%}else{%>
		<h2>등록된 레시피가 없습니다.</h2>
		
		
		
	<%} %>	
	
	
	<a href="<%= request.getContextPath()%>/view/enrollrecipe.jsp">레시피 등록페이지</a>
	
	<!-- 레시피 등록하기를 클릭했을 때 로그인 여부를 체크함 -->
<!-- 	<span id="enrollrecipe" onclick="checklogin()">레시피 등록 페이지</span> -->



<%@ include file="footer.jsp" %>
</body>
</html>

