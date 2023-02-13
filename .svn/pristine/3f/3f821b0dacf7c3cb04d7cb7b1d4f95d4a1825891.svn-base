<%@page import="bps.buyedclass.vo.BuyedClassVO"%>
<%@page import="java.util.List"%>
<%@page import="bps.util.SqlMapClientFactory"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>
<script>
	$(function(){
		$('#btn1').on('click',function(){
			$.ajax({
				  url : '/member.jsp',
                  type : 'get',
                  // 위 요청. 아래 응답
                  // data : sdfsdf (데이터가 없으므로 생략)
                  success : function(result){
                          code = "<table border='1'>";
                          code += "<tr><td>아이디</td><td>이름</td><td>주소</td>";
                          code += "<td>전화번호</td><td>이메일</td></tr>";       
                          
                          $.each(result, function(i,v){
                                  // code += `<tr><td>${result[i].id}아이디</td><td>이름</td><td>주소</td>";
                                  code += `<tr><td>${v.id}</td><td>${v.name}</td><td>${v.addr}</td>`;
                                  code += `<td>${v.hp}</td><td>${v.mail}</td></tr>`;       
                          })
                          code += "</table>";
                          $('#result1').html(code);
                          
                  },
                  error : function(xhr){
                          alert("상태 : " + xhr.status);
                  },
                  dataType : 'json'
			})
			
			
		})
	})

</script>
<title>Insert title here</title>
</head>
<body>
	<h3>클래스 구매 목록</h3>
	
	<input type="button" value="확인" id="btn1">
        <div id="result1"></div>
</body>
</html>
    <% 		
    // JAVA 실행되는 필드.
    // 클라이언트 요청시 전송 데이터 받기

    // db를 이용하여 crud 처리한다
    
    // SqlMapClient객체를 얻어온다
    SqlMapClient smc = SqlMapClientFactory.getSqlMapClient();
    
    // sql문 실행
    List<BuyedClassVO> list = smc.queryForList("buyedclass.getAllBuyedClass");

    // 처리결과 값을 출력한다. - text데이터를 생성 -client 전달
%>

[	
		<% for(int i = 0 ; i<list.size(); i++){ 
		BuyedClassVO vo = list.get(i);
		if(i>0) out.print(",");
		%>
		{
			"buyed_no" : "<%= vo.getBuyed_no() %>",
			"class_no" : "<%= vo.getClass_no() %>",
			"mem_id" : "<%= vo.getMem_id() %>"
		}
		
		<% }%>


]


