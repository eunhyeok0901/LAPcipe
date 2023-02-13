<%@page import="java.text.DecimalFormat"%>
<%@page import="bps.postrecipe.service.PostRecipeServiceImpl"%>
<%@page import="bps.postrecipe.service.IPostRecipeService"%>
<%@page import="bps.recipe.service.RecipeServiceImpl"%>
<%@page import="bps.recipe.service.IRecipeService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="bps.recipereview.service.IRecipeReviewService"%>
<%@page import="bps.recipereview.service.RecipeReviewServiceImpl"%>
<%@page import="bps.recipereview.vo.RecipeReviewVO"%>
<%@page import="bps.recipe.vo.RecipeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header1.jsp"%>

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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">

<script>
function checklogin(){
	// 아래 세션영역에 저장하는 코드는 나중에 꼭 삭제 해야됨!!!!
	//////////////////////////////////////////////////////////////////
	<%String memId = (String) session.getAttribute("loginMember");%>
	
	var id = '<%=memId%>';
	
// 	console.log(id);
// 	alert('확인점');
// 	alert(id);
<%-- 	var id = '<%= memvo.getMem_id()%>'; --%>
	
	///////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////
	if(id == 'null'){
		alert('회원만 등록하실 수 있습니다.');
		if(confirm('로그인하시겠습니까?')){
			// 로그인 모달 창을 띄움 
			
		}
		
	}else{
// 		alert('ㅁㅁㅁㅁㅁㅁ');
		location.href= '<%=request.getContextPath()%>/view/enrollrecipe.jsp?id='+id;
	}
}

function recipedetail(a){
	b = a.getAttribute('id');
	console.log(b);
	location.href = b;
}

</script>


<style>



 #greatest_container2 {
    background-color: #faf8f0;
    width: 1300px;
    margin: auto;
    margin-top: 50px;
    padding-top: 20px;
}



  
/*   *:not(.loginModal .modal-body){ */
/*   background-color: #faf8f0; */
/*   } */
  
 
   
   
   *{
font-family: 'Noto Serif KR', serif;


  }




.enrollrecipe {
	cursor: pointer;
}

.rating__star {
	cursor: pointer;
	color: #dabd18b2;
}

body {
	padding-top: 0;
	background: #faf8f0;
}

.greatcontainer {
	margin-top: 50px;
	text-align: center;
	width: 1300px;
	height: 1400px;
	margin-left: auto;
	margin-right: auto;
	/* 		cursor : pointer; */
	/* 		border : 2px solid red; */
/* 	box-shadow: 0 0 10px gray; */
	background-color: #faf8f0;
	/* 		border-radius : 20px; */
	margin-bottom: 50px;
	padding: 14px;
}

.greatcontainer:after{
		content:"";
		clear:both;
		display:block;
}

.card {
	cursor: pointer;
	width: 300px;
	height: 450px;
	float: left;
	/* 		background-color : white;	 */
	margin-left: 15px;
	margin-top: 15px;
	display: inline-block;
	/* 		border-radius : 10px; */
}

.card-body {
	text-align: left;
	width: 300px;
}

.card-body {
	text-align: left;
	width: 300px;
}

/* 	#second_container{ */
/* 		display : inline-block; */
/* 		text-align : center; */
/* 	} */
.card-title {
	font-weight: bold;
}

.card-img-top{
	width : 300px;
	height : 300px;
}

#greatest_container2 {
	/* 		clear : both; */
	/* 		text-align : center; */
	
}

/* 	#myCarousel{ */
/* 		width : 1800px !important; */
/* 		margin : auto !important; */
/* 	} */
.carousel-inner {
	/* 		text-align : center; */
	
}

.youngho_item {
	width: 1300px;
	height: 415px;
	margin: auto;
	padding-left: 160px;
}

/* 	.left carousel-control, .right carousel-control{ */
/* 		background-image : none !important;  */
/* 		filter : none !important; */
/* 		progid : none !important; */
/* 	} */
.carousel-control.left, .carousel-control.right {
	background-image: none !important;
}

.glyphicon-chevron-left, .glyphicon-chevron-right {
	color: black !important;
}

#greatest_container2 {
/* 	box-shadow: 0 0 10px gray; */
	background-color: #faf8f0;
	width: 1300px;
	margin: auto;
	margin-top: 50px;
	padding-top: 20px;
}

#popular_recipe {
	font-size: 28px;
	font-weight: bold;
}

#starscoreText {
	color: black;
}

#youngho_pages {
	margin-top: 20px;
	width: 500px;
	height: 80px;
	margin: auto;
	font-size: 30px;
	padding: 0;
	text-align: center;
}


.youngho_page {
	display: inline-block;
	margin-left: 7px;
	background: #faf8f0;
	/* 		border : 1px solid black; */
/* 	box-shadow: 0 0 10px gray; */
	color: #e57373 !important;
	font-size: 20px;
	font-weight: 900;
}

.youngho_page a {
	color: gray !important;
}

/* 	li a:hover{ */
/* 	} */

#searchword{
	color : green;
}

#search_for_none{
	font-size : 50px;
}

.search_announce{
	color : gray;
	font-size : 15px;
}

.carousel-indicators{
	z-index : -100;
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
	
	//조회수 숫자 , 찍기
	DecimalFormat formatter = new DecimalFormat("###,###");

	IPostRecipeService postservice = PostRecipeServiceImpl.getInstance();

	List<RecipeVO> wholerecipes = (List<RecipeVO>) request.getAttribute("list");
	Map<String, Object> map = (Map<String, Object>) request.getAttribute("map");
	// 좋은 방법인지는 모르겠으나 일단 결과물을 빨리 확인해보기 위해서 일단 이렇게 짜봄 
	List<RecipeVO> somerecipes = new ArrayList<RecipeVO>();

	IRecipeService recipeservice = RecipeServiceImpl.getInstance();

	// 조회수순으로 정렬된 레시피들 
	// db에서 꺼내올 때 select * 하기 때문에 레시피가 단 한개도 없는 일이 발생하지 않는 한 널포인트 에러x 
	somerecipes = recipeservice.getRecipeByCount();

	IRecipeReviewService reviewservice = RecipeReviewServiceImpl.getInstance();

	List<RecipeReviewVO> reviewlist = null;

	// 여기부터는 별점순으로 레시피들을 꺼내오기 위해 작성하는 코드 
	// 별점이 달린 레시피가 단 한개도 없는 경우가 아니라면 널포인트 에러가 뜨지 않을 것임 
	List<RecipeReviewVO> reviews = reviewservice.getAvgScore();
	List<RecipeVO> starrecipes = new ArrayList<>();
	for (RecipeReviewVO reviewvo : reviews) {
		RecipeVO recipevo = recipeservice.getOneRecipe(reviewvo.getRec_no());
		starrecipes.add(recipevo);
	}
	%>

	<%-- 	<form action="<%= request.getContextPath() %>/ShowRecipeList.do" method="get"> --%>
	<!-- 	<span>검색창</span>  -->
	<!-- 	<select name="searchCategory"> -->
	<!-- 		<option>전체</option> -->
	<!-- 		<option>밑반찬</option> -->
	<!-- 		<option>메인반찬</option> -->
	<!-- 		<option>국/탕</option> -->
	<!-- 		<option>찌개</option> -->
	<!-- 		<option>디저트</option> -->
	<!-- 		<option>면/만두</option> -->
	<!-- 		<option>밥/죽/떡</option> -->
	<!-- 		<option>퓨전</option> -->
	<!-- 		<option>김치/젓갈/장류</option> -->
	<!-- 		<option>양념/소스/잼</option> -->
	<!-- 		<option>양식</option> -->
	<!-- 		<option>샐러드</option> -->
	<!-- 		<option>스프</option> -->
	<!-- 		<option>빵</option> -->
	<!-- 	</select> -->
	<!-- 	<input type="text" name="searchWord"/> <input type="submit" value="전송"/> -->
	<!-- 	</form> -->

	<div id="greatest_container2">
<!-- 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
		<h2 style="margin-left: 170px; font-weight: bolder;"id="popular_recipe">인기 급상승 레시피</h2>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">




				<div class="item active">

					<%
						int mycnt = 0;

					int perslide = 3;

					int multiple_number = 1;
					%>


					<div class="youngho_item">

						<%
							outer: for (int i = 0; i < somerecipes.size(); i++) {
							mycnt += 1;
						%>

						<!-- for문을 통해 꺼내온 각각의 recipevo객체들의 평균 별점을 구하는 로직  -->
						<%
							reviewlist = reviewservice.getSomeReview(somerecipes.get(i).getRec_no());
						double score_total = 0;
						double avg_score = 0;

						// 	   double avg_score2 = 0;
						double temp = 0;
						int temp2 = 0;

						if (reviewlist.size() != 0) {

							for (RecipeReviewVO vo2 : reviewlist) {
								score_total += vo2.getRrev_score();
							}

							avg_score = (double) (score_total / (double) reviewlist.size());

							// 			avg_score2 = (double)score_total
							temp = Math.round(avg_score * 10) / 10.0;
							temp2 = (int) avg_score * 1;
						}
						%>
						<!-- ----------------------------------------------------- -->

						<!-- 1번째 sliede안에 들어갈 내용물 -->
						<div class="card"
							id="<%=request.getContextPath()%>/ViewDetail.do?rec_no=<%=somerecipes.get(i).getRec_no()%>"
							onclick="recipedetail(this)">

							<img class="card-img-top img-rounded"
								src="<%=request.getContextPath()%>/ImageViewController.do?fileName=<%=somerecipes.get(i).getRec_video()%>">
							<div class="card-body">
								<h4 class="card-title"><%=somerecipes.get(i).getRec_name()%></h4>

								<p class="card-text"><%=postservice.getOnePostRecipe(somerecipes.get(i).getRec_no())%></p>
								<p class="card-text">
									<span class="rating__star"><%=ratingOptions.get(temp2)%>
										<span id="starscoreText"><%=temp%></span></span>
								</p>
								<p class="card-text">
									조회수&nbsp;&nbsp;<%= formatter.format(somerecipes.get(i).getRec_count()) %></p>
							</div>
						</div>

						<%
							if (mycnt < (perslide * multiple_number)) {
							continue outer;

						} else {
							multiple_number += 1;
							break outer;
						}

						}
						%>
						<!-- ----------------------------------------------------- -->
					</div>
					<!-- 여기까지 youngho 아이템 -->

				</div>



				<div class="item">

					<div class="youngho_item">
						<%
							outer2: for (int i = mycnt; i < somerecipes.size(); i++) {
							mycnt += 1;
						%>

						<!-- for문을 통해 꺼내온 각각의 recipevo객체들의 평균 별점을 구하는 로직  -->
						<%
							reviewlist = reviewservice.getSomeReview(somerecipes.get(i).getRec_no());
						double score_total = 0;
						double avg_score = 0;

						//    	 	   double avg_score2 = 0;
						double temp = 0;
						int temp2 = 0;

						if (reviewlist.size() != 0) {

							for (RecipeReviewVO vo2 : reviewlist) {
								score_total += vo2.getRrev_score();
							}

							avg_score = (double) (score_total / (double) reviewlist.size());

							//    	 			avg_score2 = (double)score_total
							temp = Math.round(avg_score * 10) / 10.0;
							temp2 = (int) avg_score * 1;
						}
						%>



						<!-- 2번째 슬라이드 내용물 -->
						<div class="card"
							id="<%=request.getContextPath()%>/ViewDetail.do?rec_no=<%=somerecipes.get(i).getRec_no()%>"
							onclick="recipedetail(this)">

							<img class="card-img-top img-rounded"
								src="<%=request.getContextPath()%>/ImageViewController.do?fileName=<%=somerecipes.get(i).getRec_video()%>">
							<div class="card-body">
								<h4 class="card-title"><%=somerecipes.get(i).getRec_name()%></h4>
								<p class="card-text"><%=postservice.getOnePostRecipe(somerecipes.get(i).getRec_no())%></p>
								<p class="card-text">
									<span class="rating__star"><%=ratingOptions.get(temp2)%>
										<span id="starscoreText"><%=temp%></span> </span>
								</p>
								<p class="card-text">
									조회수&nbsp;&nbsp;<%=formatter.format(somerecipes.get(i).getRec_count())%></p>
							</div>
						</div>

						<%
							if (mycnt < (perslide * multiple_number)) {
							continue outer2;

						} else {
							multiple_number += 1;
							break outer2;
						}

						}
						%>

						<!-- 2번째 슬라이드 내용물 -->
					</div>



				</div>


				<div class="item">
					<div class="youngho_item">
						<%
							outer3: for (int i = mycnt; i < somerecipes.size(); i++) {
							mycnt += 1;
						%>

						<!-- for문을 통해 꺼내온 각각의 recipevo객체들의 평균 별점을 구하는 로직  -->
						<%
							reviewlist = reviewservice.getSomeReview(somerecipes.get(i).getRec_no());
						double score_total = 0;
						double avg_score = 0;

						//  	 	   double avg_score2 = 0;
						double temp = 0;
						int temp2 = 0;

						if (reviewlist.size() != 0) {

							for (RecipeReviewVO vo2 : reviewlist) {
								score_total += vo2.getRrev_score();
							}

							avg_score = (double) (score_total / (double) reviewlist.size());

							//  	 			avg_score2 = (double)score_total
							temp = Math.round(avg_score * 10) / 10.0;
							temp2 = (int) avg_score * 1;
						}
						%>


						<!-- 3번째 슬라이드 내용물 -->
						<div class="card"
							id="<%=request.getContextPath()%>/ViewDetail.do?rec_no=<%=somerecipes.get(i).getRec_no()%>"
							onclick="recipedetail(this)">

							<img class="card-img-top img-rounded"
								src="<%=request.getContextPath()%>/ImageViewController.do?fileName=<%=somerecipes.get(i).getRec_video()%>">
							<div class="card-body">
								<h4 class="card-title"><%=somerecipes.get(i).getRec_name()%></h4>
								<p class="card-text"><%=postservice.getOnePostRecipe(somerecipes.get(i).getRec_no())%></p>
								<p class="card-text">
									<span class="rating__star"><%=ratingOptions.get(temp2)%>
										<span id="starscoreText"><%=temp%></span> </span>
								</p>
								<p class="card-text">
									조회수&nbsp;&nbsp;<%=formatter.format(somerecipes.get(i).getRec_count())%></p>
							</div>
						</div>

						<!-- 3번째 슬라이드 내용물 -->
						<%
							if (mycnt < (perslide * multiple_number)) {
							continue outer3;

						} else {
							multiple_number += 1;
							break outer3;
						}

						}
						%>

					</div>


					<!---------------------- 경계선---------------------- -->

				</div>

			</div>



			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>



	<div id="greatest_container2">
<!-- 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
		<span style="margin-left: 170px; font-weight: bolder; color: green" id="popular_recipe" style="color: green">BEST</span>
			<span style="font-size:27px; font-weight:  bolder;">레시피</span>
		<div id="myCarousel2" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">




				<div class="item active">

					<%
						mycnt = 0;

					perslide = 3;

					multiple_number = 1;
					%>


					<div class="youngho_item">

						<%
							outer: for (int i = 0; i < starrecipes.size(); i++) {
							mycnt += 1;
						%>

						<!-- for문을 통해 꺼내온 각각의 recipevo객체들의 평균 별점을 구하는 로직  -->
						<%
							reviewlist = reviewservice.getSomeReview(starrecipes.get(i).getRec_no());
						double score_total = 0;
						double avg_score = 0;

						// 	   double avg_score2 = 0;
						double temp = 0;
						int temp2 = 0;

						if (reviewlist.size() != 0) {

							for (RecipeReviewVO vo2 : reviewlist) {
								score_total += vo2.getRrev_score();
							}

							avg_score = (double) (score_total / (double) reviewlist.size());

							// 			avg_score2 = (double)score_total
							temp = Math.round(avg_score * 10) / 10.0;
							temp2 = (int) avg_score * 1;
						}
						%>
						<!-- ----------------------------------------------------- -->

						<!-- 1번째 sliede안에 들어갈 내용물 -->
						<div class="card"
							id="<%=request.getContextPath()%>/ViewDetail.do?rec_no=<%=starrecipes.get(i).getRec_no()%>"
							onclick="recipedetail(this)">

							<img class="card-img-top img-rounded"
								src="<%=request.getContextPath()%>/ImageViewController.do?fileName=<%=starrecipes.get(i).getRec_video()%>">
							<div class="card-body">
								<h4 class="card-title"><%=starrecipes.get(i).getRec_name()%></h4>
								<p class="card-text"><%=postservice.getOnePostRecipe(starrecipes.get(i).getRec_no())%></p>
								<p class="card-text">
									<span class="rating__star"><%=ratingOptions.get(temp2)%>
										<span id="starscoreText"><%=temp%></span></span>
								</p>
								<p class="card-text">
									조회수&nbsp;&nbsp;<%=formatter.format(starrecipes.get(i).getRec_count())%></p>
							</div>
						</div>

						<%
							if (mycnt < (perslide * multiple_number)) {
							continue outer;

						} else {
							multiple_number += 1;
							break outer;
						}

						}
						%>
						<!-- ----------------------------------------------------- -->
					</div>
					<!-- 여기까지 youngho 아이템 -->

				</div>



				<div class="item">

					<div class="youngho_item">
						<%
							outer2: for (int i = mycnt; i < starrecipes.size(); i++) {
							mycnt += 1;
						%>

						<!-- for문을 통해 꺼내온 각각의 recipevo객체들의 평균 별점을 구하는 로직  -->
						<%
							reviewlist = reviewservice.getSomeReview(starrecipes.get(i).getRec_no());
						double score_total = 0;
						double avg_score = 0;

						//    	 	   double avg_score2 = 0;
						double temp = 0;
						int temp2 = 0;

						if (reviewlist.size() != 0) {

							for (RecipeReviewVO vo2 : reviewlist) {
								score_total += vo2.getRrev_score();
							}

							avg_score = (double) (score_total / (double) reviewlist.size());

							//    	 			avg_score2 = (double)score_total
							temp = Math.round(avg_score * 10) / 10.0;
							temp2 = (int) avg_score * 1;
						}
						%>



						<!-- 2번째 슬라이드 내용물 -->
						<div class="card"
							id="<%=request.getContextPath()%>/ViewDetail.do?rec_no=<%=starrecipes.get(i).getRec_no()%>"
							onclick="recipedetail(this)">

							<img class="card-img-top img-rounded"
								src="<%=request.getContextPath()%>/ImageViewController.do?fileName=<%=starrecipes.get(i).getRec_video()%>">
							<div class="card-body">
								<h4 class="card-title"><%=starrecipes.get(i).getRec_name()%></h4>
								<p class="card-text"><%=postservice.getOnePostRecipe(starrecipes.get(i).getRec_no())%></p>
								<p class="card-text">
									<span class="rating__star"><%=ratingOptions.get(temp2)%>
										<span id="starscoreText"><%=temp%></span> </span>
								</p>
								<p class="card-text">
									조회수&nbsp;&nbsp;<%=formatter.format(starrecipes.get(i).getRec_count())%></p>
							</div>
						</div>

						<%
							if (mycnt < (perslide * multiple_number)) {
							continue outer2;

						} else {
							multiple_number += 1;
							break outer2;
						}

						}
						%>

						<!-- 2번째 슬라이드 내용물 -->
					</div>



				</div>


				<div class="item">
					<div class="youngho_item">
						<%
							outer3: for (int i = mycnt; i < starrecipes.size(); i++) {
							mycnt += 1;
						%>

						<!-- for문을 통해 꺼내온 각각의 recipevo객체들의 평균 별점을 구하는 로직  -->
						<%
							reviewlist = reviewservice.getSomeReview(starrecipes.get(i).getRec_no());
						double score_total = 0;
						double avg_score = 0;

						//  	 	   double avg_score2 = 0;
						double temp = 0;
						int temp2 = 0;

						if (reviewlist.size() != 0) {

							for (RecipeReviewVO vo2 : reviewlist) {
								score_total += vo2.getRrev_score();
							}

							avg_score = (double) (score_total / (double) reviewlist.size());

							//  	 			avg_score2 = (double)score_total
							temp = Math.round(avg_score * 10) / 10.0;
							temp2 = (int) avg_score * 1;
						}
						%>


						<!-- 3번째 슬라이드 내용물 -->
						<div class="card"
							id="<%=request.getContextPath()%>/ViewDetail.do?rec_no=<%=starrecipes.get(i).getRec_no()%>"
							onclick="recipedetail(this)">

							<img class="card-img-top img-rounded"
								src="<%=request.getContextPath()%>/ImageViewController.do?fileName=<%=starrecipes.get(i).getRec_video()%>">
							<div class="card-body">
								<h4 class="card-title"><%=starrecipes.get(i).getRec_name()%></h4>
								<p class="card-text"><%=postservice.getOnePostRecipe(starrecipes.get(i).getRec_no())%></p>
								<p class="card-text">
									<span class="rating__star"><%=ratingOptions.get(temp2)%>
										<span id="starscoreText"><%=temp%></span> </span>
								</p>
								<p class="card-text">
									조회수&nbsp;&nbsp;<%=formatter.format(starrecipes.get(i).getRec_count())%></p>
							</div>
						</div>

						<!-- 3번째 슬라이드 내용물 -->
						<%
							if (mycnt < (perslide * multiple_number)) {
							continue outer3;

						} else {
							multiple_number += 1;
							break outer3;
						}

						}
						%>

					</div>


					<!---------------------- 경계선---------------------- -->

				</div>

			</div>



			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel2"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel2"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>











	<!-- 여기부터는 모든 레시피들을 띄워주는 구간임(carousel아래부분) -->

	<%
		if (wholerecipes.size() != 0) {
	%>
	
<!-- 	<div style="display : inline-block; height : 1000px;"></div> -->
	<div class="greatcontainer" style="height : auto;">
		<%
			for (RecipeVO vo : wholerecipes) {
		%>

		<%
			reviewlist = reviewservice.getSomeReview(vo.getRec_no());
			
		double score_total = 0;
		double avg_score = 0;
		double temp = 0;
		int temp2 = 0;
		if (reviewlist.size() != 0) {

			for (RecipeReviewVO vo2 : reviewlist) {
				score_total += vo2.getRrev_score();
			}

			avg_score = (double) (score_total / (double) reviewlist.size());
			temp = Math.round(avg_score * 10) / 10.0;
			temp2 = (int) avg_score * 1;
		}
		%>
		<!-- 여기부터 웹 브라우저 상에 출력되는 데이터들에 대한 코드가 작성됨 -->




		
		

		<!-- db에서 꺼내온 레시피들을 여기부터 나열시킴 -->
		<%-- 	<a href="<%= request.getContextPath()%>/ViewDetail.do?rec_no=<%= vo.getRec_no()%>"> --%>
		<div class="card"
			id="<%=request.getContextPath()%>/ViewDetail.do?rec_no=<%=vo.getRec_no()%>"
			onclick="recipedetail(this)">

			<img class="card-img-top img-rounded"
				src="<%=request.getContextPath()%>/ImageViewController.do?fileName=<%=vo.getRec_video()%>">
			<div class="card-body">
				<h4 class="card-title"><%=vo.getRec_name()%></h4>
				<p class="card-text"><%=postservice.getOnePostRecipe(vo.getRec_no())%></p>
				<p class="card-text">
					<span class="rating__star"><%=ratingOptions.get(temp2)%><span
						id="starscoreText"><%=temp%></span></span>
				</p>
				<p class="card-text">
					조회수&nbsp;&nbsp;<%=formatter.format(vo.getRec_count())%></p>
			</div>
		</div>

		<%
			}
		%>
	
	
<!-- 	<div style="display : inline-block; width : 10px; height: 1000px; clear : both;"></div> -->
	
	
	</div>
	
	

	<%
		} else {
	%>
		
	     <% String word = (String)request.getAttribute("sword"); %>
		
		
		<div class="greatcontainer" style="height : auto;"><p id="search_for_none"><span id="searchword">"<%= word%>"</span>에 대한 검색결과가 없습니다.</p><br>
							<p class="search_announce">- 단어의 철자가 정확한지 확인해주세요.</p>
							<p class="search_announce">- 검색어의 단어 수를 줄이거나, 다른 검색어로 검색해보세요.</p>
							<p class="search_announce">- 더 일반적인 검색어로 다시 검색해 보세요.</p>
		</div>                 


	<%
		}
	%>

	<%=map.get("pagingimg")%>
	
<!-- 	<span id="enrollrecipe" onclick="checklogin()">레시피 등록페이지</span> -->

	<!-- 레시피 등록하기를 클릭했을 때 로그인 여부를 체크함 -->
	<!-- 	<span id="enrollrecipe" onclick="checklogin()">레시피 등록 페이지</span> -->


	<%-- 	<a href="<%= request.getContextPath()%>/ShowRecipeListByRank.do?mode=score">별점순으로 조회(레시피)</a> --%>
	<%-- 	<a href="<%= request.getContextPath()%>/ShowRecipeListByRank.do?mode=count">조회수순으로 조회(레시피)</a> --%>
	<div style="min-height: 500px;"></div>
	<%@ include file="footer.jsp"%>
</body>
</html>

