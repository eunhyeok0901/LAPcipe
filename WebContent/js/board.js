/**
 * 
 */


// 댓글 저장
replySaveServer = function(target){
   
   $.ajax({
      url: '/rps_mpro/ReplySave.do',
      type: 'post',
      data: reply, //reply객체: name, bonum, cont
      success: function(res){
         alert(res.flag);
         replyListServer(target);
      },
      error: function(xhr){
         alert("상태: " + xhr.status);
      },
      dataType: 'json'
      
   })
}

//// 댓글 수정
//replyUpdateServer = function(){
//	$.ajax({
//		url : '/rps_mpro/ReplyUpdate.do',
//		type : 'post',
//		data : {"com_no" : vidx, "cont" : modiout},
//		success : function(res){
//				// 성공 시 화면 수정
//				if(res.flag == "성공"){
//					vp3.html(modiout);
//				}
//		},
//		error : function(xhr){
//			alert("상태 : " + xhr.status);
//		},
//		dataType : 'json'
//	})
//}

 
// 댓글 삭제
replyDeleteServer = function(a){
   $.ajax({
      url : '/rps_mpro/ReplyDelete.do',
      type : 'get',
      data : {"renum" : vidx},
      success : function(res){
         $(a).parents('.rep-body').remove();  // a : 댓글삭제 버튼을 기준으로 조상 rep-body를 삭제함
      },
      error : function(xhr) {
         alert(xhr.status)
      },
      dataType : 'json'
   })
}




writerServer = function(){
   $.ajax({
      url: '/rps_mpro/Writer.do',
      type: 'post',
      data: indata,
      success: function(res){
		alert(res.flag);
		$('#wclose').trigger("click");
        listPageServer(1);
      },
      error: function(xhr){
         alert("상태: " + xhr.status);
      },
      dataType: 'json'
   })
}//writerServer


// 게시글 삭제
boardDeleteServer = function(a){
   $.ajax({
      url : '/rps_mpro/BoardDelete.do',
      type : 'get',
      data : {"bonum" : vidx},
      success : function(res){
         $(a).parents('.panel-default').remove();
      },
      error : function(xhr) {
         alert(xhr.status)
      },
      dataType : 'json'
   })
}
