<%@page import="bps.ingredient.vo.IngrediVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<body>

<%
	List<IngrediVO> list = (List<IngrediVO>) request.getAttribute("ingList");
%>
	<%for(IngrediVO vo : list){ %>
	
	<!-- Trigger the modal with a button -->
<!-- <button style="width: 20px; height: 20px;" type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal"></button> -->
<!-- <img alt="" src="../images/ingre_detail.jpg" > -->
<!-- Modal -->
<!-- <div id="myModal" class="modal fade" role="dialog"> -->
<!--   <div class="modal-dialog"> -->

<!--     Modal content -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!--         <h4 class="modal-title">Modal Header</h4> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<!--         <div class="container"> -->
<%-- 			  <h2><%=vo.getIng_name() %></h2> --%>
<!-- 			  <table class="table" style="he"> -->
			    
<!-- 			    <tbody> -->
			          
<!-- 			      <tr class="warning"> -->
<!-- 			        <th>효능</th> -->
<%-- 			        <td><%=vo.getIng_effect() %></td> --%>
			        
<!-- 			      </tr> -->
<!-- 			      <tr class="active"> -->
<!-- 			        <th>구입처</th> -->
<%-- 			        <td><%=vo.getIng_way() %></td> --%>
			       
<!-- 			      </tr> -->
<!-- 			      <tr class="active"> -->
<!-- 			        <th>관리법</th> -->
<%-- 			        <td><%=vo.getIng_buy() %></td> --%>
			        
<!-- 			      </tr> -->
<!-- 			    </tbody> -->
<!-- 			  </table> -->
<!-- 			</div> -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!--       </div> -->
<!--     </div> -->

<!--   </div> -->
<!-- </div> -->
	
<div class="container">
  <h2><%=vo.getIng_name() %></h2>
  <table class="table" style="he">
    
    <tbody>
          
      <tr class="warning">
        <th>효능</th>
        <td><%=vo.getIng_effect() %></td>
        
      </tr>
      <tr class="active">
        <th>구입처</th>
        <td><%=vo.getIng_way() %></td>
       
      </tr>
      <tr class="active">
        <th>관리법</th>
        <td><%=vo.getIng_buy() %></td>
        
      </tr>
    </tbody>
  </table>
</div>
<%-- 		<h3>재료명 : <%=vo.getIng_name() %> </h3><br> --%>
<%-- 		<h3>  효능 : <%=vo.getIng_effect() %> </h3><br> --%>
<%-- 		<h3>구입처 : <%=vo.getIng_way() %> </h3><br> --%>
<%-- 		<h3>관리법 : <%=vo.getIng_buy() %></h3><br> --%>
		
		
		
		
		
	<%} %>

</body>
</html>