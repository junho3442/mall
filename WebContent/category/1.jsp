<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<%
		
		ProductDao productDao = new ProductDao();
		ArrayList<Product> list = productDao.selectProductList();
	%>
	
	<h1>과일</h1>
	<table Class = "table">
		<thead>
			<%
				for(Product p:list){
			%>
			<tr>
				<td>
					<div class="card" style="width:200px, height:200px">
					
					<div class="card-body">
					<h4 class="card-title"><%=p.getProductName() %></h4>
					<p class="card-text"><%=p.getProductPrice() %></p>
					</div>
					</div>
				</td>
			</tr>
		<%
				}
		%>
		</thead>
	</table>
	</div>
</body>
</html>