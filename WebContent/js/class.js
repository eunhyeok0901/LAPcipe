playClass = function(classNo){
	$.ajax({
		
		
		url : '/rps_mpro/PlayClass.do',
		type : 'post',
		data : {"classNo":classNo},
		success : function(res){
//			alert("링쿠 : "+ res);
//			location.href="view/playClass.jsp"
			window.open(res, "강의", "top=100px, left=100px, height=800px width:1200px")
		},
		error : function(xhr){
			alert("재생 : "+xhr.status)
		},
		dataType : 'text'
		
		})
		
	}
		


confirmRegister=function(classNo,id){
		$.ajax({
		
		
		url : '/rps_mpro/ConfirmRegister.do',
		type : 'post',
		data : {"classNo":classNo,
				"mem_id":id},
		success : function(res){
			
			if(id == 'null'){
				alert("로그인 후 이용해주세요.")
			}else{
					
				if(res > 0){
//					alert("강의영상으로 넘어가")
					playClass(classNo);
				}else{
					alert("현재 수강중인 강의가 아닙니다.")
				}
			}

			},
		error : function(xhr){
			alert("재생버튼 오류 : " + xhr.status);
		},
		dataType : 'json'
		
		})
			
	
}

registerPay = function(classNo,id){
	 var pop = window.open("about:blank","content","width=960,height=680, top=40, left= 490");
$.ajax({
		
		
		url : '/rps_mpro/PaymentForm.do?classNo='+classNo+'&memId='+id,
		type : 'post',
		data : {"classNo": classNo,
					"memId" : id
						},
		success : function(res){
//			alert("check");
//			alert(res);
//		var w = window.open("about:blank", "top=100px, left=100px, height=800px width:1200px");
		pop.location.href = "/rps_mpro/PaymentForm.do?classNo=" +classNo+"&memId="+id;
//		location.href = "/rps_mpro/PaymentForm.do?classNo=" +classNo+"&memId="+id;
		},
		error : function(xhr){
			alert("결제 오류 : " + xhr.status);
			
		},
		dataType : 'text'
		
		})
	
}
getClassReview=function(classNo){
	
	$.ajax({
		
		
		url : '/rps_mpro/GetClassReview.do',
		type : 'post',
		data : {"classNo":classNo},
		success : function(res){
			
//			replybox = b.parent('.modal-body').find('.reviewBOx');
			
			rcode="";
			$.each(res, function(i,v){
				
				cont = v.crev_con;
				cont = cont.replaceAll(/\n/g,"<br>");				
			
			rcode += '<div style="border : 1px solid white; margin : 5px; padding : 5px; "class="rep-body">';	
			rcode += '<div>'
			rcode += '<span>작성자 : '+v.mem_id+'</span> <span>날짜 : '+v.crev_date+'</span>'
						+'<span>'+v.crev_score+'</span>'
			rcode += '</div>'
			rcode += '<br>'
			rcode += '<p style="font-size : 1.2em;">'+cont+'</p>'
			rcode += '</div>'
				
			})
//			
////			$('.curriculum .reviewBOx').html(code);
			$('.glyphicon-plus-sign').parents('.curriculum').find('.reviewBOx').append(rcode);
			
//			
		},
		error : function(xhr){
			alert("후기오류 : " + xhr.status);
			
		},
		dataType : 'json'
		
		})
	
}


/*
별점넣기 실패!!
starScore = function(class_no){
	
	$.ajax({
		
		
		url : '/rps_mpro/StarScore.do',
		type : 'post',
		data : {"classNo":classNo},
		
		success : function(res){
			con="";
			$.each(res,function(i,v){
				con += v.crev_score
			})
			alert(con)
//			$('.panel-danger #score').text(con);
			
			},
		error : function(xhr){
			alert("별점상태 : " + xhr.status);
			
		},
		dataType : 'json'
		
		})
			
			
	
}


*/



 
 searchResult2 = function(a){
	
	
	$.ajax({
		
		
		url : '/rps_mpro/SearchResult2.do',
		type : 'post',
		data : {"keyword":keyword},
		success : function(res){
			
			recode = '<div class="container">';
			recode +=' <div class="row">';
			recode +='<div class="col-sm-4">';
			
			$.each(res, function(i,v){
				
			recode += '<div style="width : 370px; margin-left : 22px;" class="panel panel-danger">'
	        recode += '<div class="panel-heading"><a class="title" data-toggle="modal" href="#myModal" value="'+v.class_no+'">'+v.class_title +'</a></div>'
	        recode += '<div style="padding : 0px;" class="panel-body"><img style="width :500px; height: 300px;" src="../images/'+v.class_image+'" class="img-responsive" style="width:100%" alt="Image"></a></div>'
//	        recode += '<div class="panel-body2">강의소개</div>'
//	        recode += '<div class="panel-footer">'+v.class_price+'</div>'
	        recode += '<div style="text-align: right;font-size:1.2em; font-weight:bolder"   class="panel-footer">'+v.class_price+'WON</div>'

	      	recode += '</div>'
		})
		
			recode += '</div>'
			recode += '</div></div>'
			
			$('#testarea').html(recode);

			
		},
		error : function(xhr){
			alert("검색결과 오류" + xhr.status)
		},
		dataType : 'json'
		
		})
	
	
	
	
	
}
 
 
 
 
 
 searchResult = function(a){
	
	
	$.ajax({
		
		
		url : '/rps_mpro/SearchResult.do',
		type : 'post',
		data : {"keyword":keyword},
		success : function(res){
			
			recode = '<div class="container">';
			recode +=' <div class="row">';
			recode +='<div class="col-sm-4">';
			
			$.each(res, function(i,v){
				
			recode += '<div style="width : 370px; margin-left : 22px;" class="panel panel-danger">'
	        recode += '<div class="panel-heading"><a class="title" data-toggle="modal" href="#myModal" value="'+v.class_no+'">'+v.class_title +'</a></div>'
	        recode += '<div style="padding : 0px;" class="panel-body"><img style="width :500px; height: 300px;" src="../images/'+v.class_image+'" class="img-responsive" style="width:100%" alt="Image"></a></div>'
//	        recode += '<div class="panel-body2">강의소개</div>'
	        recode += '<div style="text-align: right;font-size:1.2em; font-weight:bolder"   class="panel-footer">'+v.class_price+'WON</div>'
	      	recode += '</div>'
		})
		
			recode += '</div>'
			recode += '</div></div>'
			
			$('#testarea').html(recode);

			
		},
		error : function(xhr){
			alert("검색결과 오류" + xhr.status)
		},
		dataType : 'json'
		
		})
	
	
	
	
	
}
 

 classDetail=function(classNo){//클래스명 클릭하면 클래스 상세정보
// 	alert(classNo)
 
	$.ajax({
		
		url : '/rps_mpro/GetClassDetail.do',
		type : 'get',
		data : {"classNo" : classNo},
		success : function(res){
			
//			$('.modal-container').show();
//			//DetailVO 받아왔음
			title="";
			time="";
			period="";
			man="";
			price="";
			det_con="";class_no="";det_miri_video="";crev_score="";photo="";
			$.each(res,function(i,v){
				title+=v.class_title
				time+=v.class_time
				period+=v.class_period
				man+=v.class_man
				price+=v.class_price;
				det_con+=v.det_con;
				class_no+=v.class_no;
				det_miri_video+=v.det_miri_video;
				crev_score+=v.crev_score;
				photo+="../images/"+v.det_image;				
			})
	
//		$('.modal-container').show();
//		console.log(con);
		//제목표시
		
		$('.modal-content .modal-title').text(title);
		$('.modal-body-time p').text(time);
		$('.modal-body-period p').text(period);
		$('.modal-body-man p').text(man);
		$('.modal-body-money p').text(price);
		$('.modal-body-DET_CON p').text(det_con);
		$('.modal-classNo p').text(class_no);
		$('.modal-body-photo img').attr('src',photo)
		$('.modal-body-photo img').attr('alt',photo)


		$('.modal-content iframe').attr('src',det_miri_video);
		
		$('.curriculum #curri_title').text("["+title+"]" + " 영상바로가기")

		
   

		
//			console.log(res);
//    	window.location.href = "/rps_mpro/view/classDetail.jsp";
		con = "";
		$.each(res,function(i,v){
			con += v.det_name	
		})
//			console.log(con);
			
		},
		error : function(xhr){
			alert("오류.. : "+xhr.status);
		},
		dataType : 'json'
	
	})
}

 
 

 getClassKorea=function(a){//종류 버튼 가져왔어
	
	$.ajax({
		
		url : '/rps_mpro/GetClassSort.do',
		type : 'post',
		data : {"sort":a},
		/*contentType: false,
		processData: false,*/
		success : function(res){
			
			recode = '<div class="container">';
			recode +=' <div class="row">';
			recode +='<div class="col-sm-4">';
			
			$.each(res, function(i,v){
				
			recode += '<div style="width : 370px; margin-left : 22px;" class="panel panel-danger">'
	        recode += '<div class="panel-heading"><a class="title" data-toggle="modal" href="#myModal" value="'+v.class_no+'">'+v.class_title +'</a></div>'
	        recode += '<div style="padding : 0px;" class="panel-body"><img style="width :500px; height: 300px;" src="../images/'+v.class_image+'" class="img-responsive" style="width:100%" alt="Image"></a></div>'
//	        recode += '<div class="panel-body2">강의소개</div>'
	        recode += '<div style="text-align: right;font-size:1.2em; font-weight:bolder"   class="panel-footer">'+v.class_price+'WON</div>'
	      	recode += '</div>'
		})
		
			recode += '</div>'
			recode += '</div></div>'
			
			$('#testarea').html(recode);

		
		},
		error : function(xhr){
			alert("종류 :"+xhr.status)
		},
		dataType : 'json'
	
	
	
})
 

 }
 
 
 



/////
 
 getClassList = function(){
	//클래스 메인에서 클래스 리스트를 불러온다
	
	$.ajax({
		
		url : '/rps_mpro/getClassList.do',
		type : 'post',
		success : function(res){
			
			
			recode = '<div class="container">';
			recode +=' <div class="row">';
			recode +='<div class="col-sm-4">';
			
		 $.each(res,function(i,v){
			
			
			
			
			recode += '<div style="width : 370px;  margin-left : 22px;" class="panel panel-danger">'
	        recode += '<div class="panel-heading"><a data-toggle="modal" href="#myModal" class="title" value="'+v.class_no+'">'+v.class_title +'</a></div>'

	        recode += '<div style="padding : 0px;" class="panel-body"><img style="width :500px; height: 300px;" src="../images/'+v.class_image+'" class="img-responsive" style="width:100%" alt="Image"></a></div>'
//	        recode += '<div class="panel-body2">강의소개</div>'
	        recode += '<div style="text-align: right;font-size:1.2em; font-weight:bolder"   class="panel-footer">'+v.class_price+'WON</div>'
	      	recode += '</div>'
		})
		
			recode += '</div>'
			recode += '</div></div>'
			
			$('#testarea').html(recode);
			
		},
		error : function(xhr){
			alert("기본 "+xhr.status);
		},
		dataType : 'json'
		
	})
	
	
}





 
 