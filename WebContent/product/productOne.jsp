<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container text-center">
	<%
		int productId = Integer.parseInt(request.getParameter("productId"));
		ProductDao productDao = new ProductDao();
		Product product = productDao.selectProductOne(productId);
	%>
	<h1>상품 상세보기</h1>
	
	<table class="table table-borderless table-primary" style="width: 500px; margin-left: auto; margin-right: auto;">
		<tr>
			<td>
				<img src="<%=request.getContextPath()%>/product-img/<%=product.getProductPic()%>"class="rounded-circle" width="300px" height="150px">
			</td>
		</tr>
			
		<tr>
			<td>상품: &emsp;<%=product.getProductName() %></td>
		</tr>
		
		<tr>
			<td>가격: &emsp;<%=product.getProductPrice() %></td>
		</tr>
		
		<tr>
			<td>상품 설명: &emsp;<%=product.getProductContent() %></td>
		</tr>
			
		<tr>
			<td>재고 여부: &emsp;<%=product.getProductSoldout() %></td>
		</tr>
	</table>
<%
	if(product.getProductSoldout().equals("Y")){
%>	
	<form method="post" action="<%=request.getContextPath() %>/orders/addOrdersAction.jsp">
		<input type="hidden" value="<%=product.getProductId()%>" name="productId">
		<input type="hidden" value="<%=product.getProductPrice()%>" name="productPrice">
		<select name="ordersAmount">
			<%
				for(int i=1;i<11;i++){
			%>	
				<option value="<%=i %>"	><%=i %>개</option>
			<% 		
				}
			%>
		</select>
		<span>
			&nbsp; 배송 주소: &emsp;<input type="text" name="ordersAddr">
			<button type="submit" class="btn btn-outline-success">주문</button>
		</span>
	</form>
<%
	}
%>	
</div>	
</body>
</html>