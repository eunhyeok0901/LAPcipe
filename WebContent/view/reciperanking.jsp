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
<title>Insert title here</title>

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
	List<RecipeReviewVO> reviews = (List<RecipeReviewVO>)request.getAttribute("reviews");
	
%>

	<%
		if(recipes.size() != 0){
		%>
		
		<div class="greatcontainer">
	<% 
		for(int i = 0; i < recipes.size(); i++){
	%>
	
	<!-- 여기부터 웹 브라우저 상에 출력되는 데이터들에 대한 코드가 작성됨 -->
	
	
	<!-- db에서 꺼내온 레시피들을 여기부터 나열시킴 -->
<%-- 	<a href="<%= request.getContextPath()%>/ViewDetail.do?rec_no=<%= vo.getRec_no()%>"> --%>
		<div class="card" id="<%= request.getContextPath()%>/ViewDetail.do?rec_no=<%= recipes.get(i).getRec_no()%>" onclick="recipedetail(this)">
			
			<img class="card-img-top" src="<%= request.getContextPath() %>/ImageViewController.do?fileName=<%= recipes.get(i).getRec_video()%>">
				<div class="card-body">
					<h4 class="card-title"><%= recipes.get(i).getRec_name() %></h4>
					<p class="card-text"><span class="rating__star"><%= ratingOptions.get(reviews.get(i).getRrev_score()) %></span></p>
					<p class="card-text">조회수<%= recipes.get(i).getRec_count()%></p>
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

