<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/view/header1.jsp" %> 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <script src="../js/board.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>

<title>LABcipe 문의게시판</title>

<style>
body {
    box-sizing: border-box;
    background: #fbf8f1;
    
 }

 .panel-body p{
    margin: 1px;
    padding: 2px;
 }
 
 .p1{
    width: 60%;
    float: left;
 }
 
 .p2{
    width: 35%;
    float: right;
    text-align: right;
 }
 
 .p3{
    clear: both;
 }
 
 input[name=reply]{
    height: 46px;
    vertical-align: top;
 }


 .navbar{
    margin-left: 60%;
 }
 
 #writebtn{
 	display : inline-block;
 	margin-top: 2%;
 	margin-left: 12%;
 	float : left;
 	
 }
 
 
 .pagination{
    float: left;
 }
 
 #pagenav{
    margin-left: 43%;
 }
 
 label{
    display: inline-block;
    width: 100px;
 }
 
 
 #modifyForm{
 	display : none;
 
 }

.modal-bottom{
   width:300px;
   margin:auto;
}


 
      
 
 
</style>

<script>
currentPage=1;
$(function(){
	listPageServer(1);  //리스트 출력하기 위한 함수호출
	
	// 검색 버튼
	$('#search').on('click', function(){
		currentPage=1;
		//page번호, 검색어(sword), 검색기준(stype)
		listPageServer(currentPage);
	})
	
	// 다음페이지 클릭
	$('#pagenav').on('click', '.next', function(){
		currentPage = parseInt($('.pager li').last().text().trim()) + 1;
		listPageServer(currentPage);
	})
	
	// 이전페이지 클릭
	$('#pagenav').on('click', '.prev', function(){
		currentPage = parseInt($('.pager li').first().text().trim() - 1);
		listPageServer(currentPage);
	})
	
	// 페이지번호 클릭
	$('#pagenav').on('click', '.pager a', function(){
		currentPage = parseInt($(this).text().trim());
		listPageServer(currentPage);
	})
   
   // 글쓰기 모달창에서 전송버튼 클릭
	$('#wsend').on('click', function(){
		indata = $('#wform').serializeJSON();
		writerServer();
		$('#wclose').trigger("click");
		$('#wModal .txt').val("");
	})
	
	// 수정, 삭제, 등록 버튼 / 제목 클릭 / 댓글 삭제, 수정
	$(document).on('click', '.action', function(){
		vidx = $(this).attr('idx').trim();
		vname = $(this).attr('name');
		
		if(vname == "modify"){
// 			alert(vidx + "번 글을 수정합니다.");
		}else if(vname == "delete"){
// 			alert(vidx + "번 글을 삭제합니다.");
			boardDeleteServer(this);
		}else if(vname == "reply"){
			vrcont = $(this).prev().val();  // 댓글 버튼을 기준으로  textarea에 입력된 값을 가져옴
		
		// 댓글 저장하기_서버로 보냄 : cont(vrcont). bonum(vidx), name 3개의 값을 객체를 이용하여 저장함
			reply = {}; 
			reply.bonum = vidx;
		
// 		n1 = String.fromCharCode(Math.random()*26 + 65);  // 소문자
// 		n2 = String.fromCharCode(Math.random()*26 + 97);  // 대문자
// 		n3 = parseInt(Math.random()*100 + 1);             // 숫자
		
//          reply.name = n1 + n2 + n3;
			reply.cont = vrcont;
		
			replySaveServer(this);   // this : 등록버튼, replyListServer에서 사용
			$(this).prev().val("");
		
		}else if(vname == "list"){
// 		// 조회수 증가
// 		vclass = $(this).parents('.panel');
// 		vclass2 = $(vclass).find('.panel-collapse');
// 		vclass3 = vclass2.attr('aria-expanded');
// 		console.log(vclass3);
		
// 		if(vclass3 == "true"){
// 			hitUpdateServer(this); // 조회수 증가_서버로 전송, db에서 조회수 수정
// 		}
    	replyListServer(this);   // this : 제목을 나타내는 a태그
		}else if(vname == "r_delete"){
		// 댓글 삭제
		replyDeleteServer(this);
		}else if(vname == "r_modify"){
		// 댓글 수정
			modifycont = $(this).parents('.rep-body').find('.p3').html();  // 댓글 원본 내용 가져옴
			modify = modifycont.replaceAll(/<br>/g, "\n");  // 댓글 원본 내용에서 br태그를 /n으로 변경
			$('#modifyForm #text').val(modify);   // 댓글 수정폼에 댓글 내용을 출력
			$(this).parents('.rep-body').find('.p3').empty().append($('#modifyForm'));  // 댓글수정폼을 this기준으로 p3으로 append
			$('#modifyForm').show();
		}
	}) // click
	
	// 댓글 수정 후 확인 버튼
	$('#btnok').on('click', function(){
		modicont =  $('#modifyForm #text').val();  // 수정된 내요 ㅇ가져옴
		vp3 = $('#modifyForm').parent(); // p3태그를 검색
		
		$('body').append($('#modifyForm')); // modifyForm을 다시 body로 이동
		$('#modifyForm').hide();
		modiout = modicont.replaceAll(/\n/g,"<br>"); //p3태그에 수정된 내용을 출력하기 위해서 <br>태그로 줄바꿈 처리
		replyUpdateServer();   // db에서 내용수정_수정 성공 후 화면을 수정 vidx, modiout
	})
	
	$('#btnreset').on('click', function(){  // 원래 원본내용을 다시 p3으로 출력, 수정폼modifyForm을 다시 body로 이동_append
		replyReset();
	})
}) // $function

replyReset = function(){
	vp3 = $('#modifyForm').parent();
	
	$('body').append($('#modifyForm')); // 수정폼을 body로 이동
	$('#modifyForm').hide();
	vp3.html(modifycont);  // p3에 원본내용을 다시 출력함
}

</script>
</head>

<body>
<!-- 댓글수정폼 -->
<div id="modifyForm">
	<textarea id="text" rows="5" cols="50"></textarea>
	<input type="button" value="확인" id="btnok">
	<input type="button" value="취소" id="btnreset">
</div>




<%if(((String)session.getAttribute("loginMember")) != null){
 %>

   <!-- 글쓰기버튼 별도의 이벤트 없이 modal창 띄우기-->
	<button id="writebtn" type="button" data-toggle="modal" data-target="#wModal" style="margin-left: 25%;margin-top: 60px; height:40px;
	border:none;border-bottom:2px solid pink;background:#fbf8f1;">문의글쓰기</button>
	<br><br>
<%}%>

<!-- 검색하기 출력 -->
	<div id="selectForm"  style="float: right; margin-right: 25%; margin-top: 20px;">

	<select id="stype" style="outline:none;border:none;border-bottom:2px solid pink; background-color: #fbf8f1; margin: -2px; height: 40px;">
		<option value="">-선택-</option>
		<option value="">전체</option>
		<option value="mem_id">작성자</option>
		<option value="title">제목</option>
		<option value="cont">내용</option>
	</select>
		<input id="sword" style="border:none;border-bottom:2px solid pink; outline:none;background-color: #fbf8f1;  height: 40px;margin: -2px;" type="text" placeholder="  검색어를 입력하세요 ">
      <button id="search" style="margin-left:-7px;  height: 37px;   border: none; border-bottom:2px solid pink; background-color: #fbf8f1;"   class="btn btn-default" type="submit" >
        <i class="glyphicon glyphicon-search"></i>
      </button>
     </div>
	
	<!-- 리스트 출력부분 -->
   <div id = "result"></div>
   
   <!-- 페이지네비게이션 출력 -->
   <div id="pagenav"></div>
 
 <!-- The Modal -->
   <div class="modal" id="wModal">
   <div class="modal-dialog">
   <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" style="text-align:center;margin-top:20px;">문의글 작성</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" style="margin-left: 5%;">
         <form id="wform">
         		<label for="boardSubArea">제목</label>
         		<input id="boardSubArea"type="text" class="txt" name="title" style="width:74.5%;"><br><br>
         		
         		<label for="#boardContentArea">내용</label>
         		<textarea id="boardContentArea" rows="10" class="txt" cols="50" name="cont" style="width:74.5%;"></textarea>
         		<br>
         	<div class="modal-footer" style = "margin-top: 5%;">
         		<input type="button" value="등록" id="wsend" style="background:white;border:0.5px solid black; border-radius:10%;font-size:1.1em;">
         		<input type="button" value="닫기" id="wclose" data-dismiss="modal" style="background:white;border:0.5px solid black; border-radius:10%;font-size:1.1em;
         		margin-right: 42%;">
          	</div>
          </form>
      </div>

    </div>
    </div>
    </div>
    
<script type="text/javascript">
 // 리스트 페이지
    listPageServer = function(vpage){
    	// 검색기준과 검색어 가져오기
    	
    	vtype = $('#stype option:selected').val().trim();
    	vword = $('#sword').val().trim();
    	
    	$.ajax({
    		url : '/rps_mpro/ListPage.do',
    		type : 'post',
    		data : {"page" : vpage, "stype" : vtype, "sword" : vword},
    		success : function(res){
    			code = "";
    			code += '<div class="containerBoard" style="width:50%; margin-left: 25%; margin-top: 5%;">';
    			code += '<div class="panel-group" id="accordion">';
    			
    			$.each(res.datas, function(i,v){
    				cont = v.board_con; //enter기호 포함
    				cont = cont.replaceAll(/\r/g,"").replaceAll(/\n/g, "<br>");
    				
    				code += '<div class="panel panel-default">';
    				code += 	'<div class="panel-heading" style="background:#f5f5f5;!important;">';
    				code += 		'<h4 class="panel-title">';
    				code +=				'<a name="list" class="action" idx="' + v.board_no + '" data-toggle="collapse" data-parent"#accordion" href="#collapse' + v.board_no + '">' + v.board_title + '</a>';
    				code +=			'</h4>';
    				code +=		'</div>';
    				code +=		'<div id="collapse' + v.board_no + '"class="panel-collapse collapse">';
    				code +=			'<div class="panel-body pbody">';
    				code +=				'<p class="p1">';
    				code +=					'아이디 : <span class="id">' + v.mem_id + '</span>&nbsp;&nbsp;&nbsp;&nbsp;';
    				code +=					'작성날짜 : <spafn class="date">' + v.board_date + '</span>&nbsp;&nbsp;&nbsp;&nbsp;';
    				code +=				'</p>';
    				if('<%=((String)session.getAttribute("loginMember"))%>' == 'DDit404' && 
    						v.mem_id != 'a001' &&
    						v.mem_id != 'a010' &&
    						v.mem_id != 'a004' &&
    						v.mem_id != 'a002'
    						){
    				code +=				'<p class="p2">';
//     				code +=					'<input type="button" idx="' + v.board_no + '" value="수정"  name="modify" class="action">';
                	code +=					'<input type="button" idx="' + v.board_no + '" value="삭제"  name="delete" class="action">';
    				code +=				'</p>';
    				}
    				code +=				'<p class="p3 bcont">';
    				code +=					cont;
    				code +=				'</p>';
    				    
    				if('<%=((String)session.getAttribute("loginMember"))%>' == 'admin'){
    				
    				code +=				'<p class="p4">';
    				code +=					'<textarea style="display:inline-block;width:95%;border:1;overflow:visible;text-overflow:ellipsis;"></textarea>';
    				code +=					'<input type="button" idx="' + v.board_no + '"value="등록" name="reply" class="action">';
    				code +=				'</p>';
    				}
    					
    				code +=			'</div>';
    				code +=		'</div>';
    				code +=	'</div>';
    			})  // each
    			
    			code += "</div>";
    			code += "</div>";
    			
    			$('#result').html(code); // 리스트 출력
            	pager="";   //페이지 출력
             
             //이전페이지
             if(res.sp > 1){
                pager += '<ul class="pagination">';
                pager += '<li class="page-item"><a class="page-link prev" href="#">Previous</a></li>';
                pager += '</ul>';
             }
             
             //페이지번호
             pager += '<ul class="pagination pager" style="font-size:1.4em;padding-left:5%;">';
             for(i=res.sp; i<=res.ep; i++){
                if(currentPage == i){
                   pager += '<li class="page-item active"><a class="page-link" href="#" style="background:none!important;border:none;'
                   pager += 'color:#e67373">'+ i +'</a>';
                }else{
                   pager += '<li class="page-item"><a class="page-link" href="#" style="background:none!important;border:none;color:black;">'+ i +'</a></li>';
                }
             }
             pager += '</ul>';
             
             // 다음페이지
             if(res.ep < res.tp){
                pager += '<ul class="pagination">';
                pager += '<li class="page-item"><a class="page-link next" href="#">Next</a></li>';
                pager += '</ul>';
             }
             $('#pagenav').html(pager);
    		}, // success
    		error : function(xhr){
    			alert("?? : " + xhr.status);
    		},
    		dataType : 'json'
    	})
    } // listPageServer
    
    
 // 댓글 리스트 출력
    replyListServer = function(a){  // a :등록버튼 또는 제목을 나타내는 a태그
       $.ajax({
          url: '/rps_mpro/ReplyList.do',
          type: 'get',
          data: {"bonum" : vidx},
          success: function(res){
    	// a를 기준으로 댓글리스트를 출력_ panel-body 안쪽으로 추가
        // pbody = a.parents('.panel').find('.panel-body')
             rcode = "";
             $.each(res, function(i,v){
                cont = v.com_con;
                cont = cont.replaceAll(/\n/g, "<br>");
                
                rcode += '<div class="rep-body" style="background: #f5f5f5;border: 1px dotted black; padding: 5px;margin-top:5px;">';
                rcode += '          <p class="p1">';
                rcode += '               작성자 : <span class="name">' + v.com_name + '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                rcode += '          </p>';
                if('<%=((String)session.getAttribute("loginMember"))%>' == 'admin'){
                rcode += '          <p class="p2">';
//                 rcode += '             <input type="button" idx="' + v.com_no + '" value="댓글수정"  name="r_modify" class="action">';
                rcode += '             <input type="button" idx="' + v.com_no + '" value="댓글삭제"  name="r_delete" class="action">';
                rcode += '          </p>';
                }
                rcode += '          <p class="p3">';
                rcode += 				cont;
                rcode += '          </p>';
                rcode += '</div>';
             })

    		//a를 기준으로 조상찾기-parents('.panel')
            //후손으로 panel_body찾기 .find('.panel-body')
             $(a).parents('.panel').find('.rep-body').remove();
             $(a).parents('.panel').find('.panel-body').append(rcode);
          },
          error: function(xhr){
             alert("상태: " + xhr.status)
          },
          dataType: 'json'
       })
    }
    
    
    
    </script>
    

</body>
</html>