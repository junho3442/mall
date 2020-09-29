<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<%
		int productId = Integer.parseInt(request.getParameter("productId"));
		ProductDao productDao = new ProductDao();
		Product product = productDao.selectProductOne(productId);
	%>
	<h1>상품 상세보기</h1>
	<form method="post" action="<%=request.getContextPath() %>/orders/addOrdersAction.jsp">
		<input type="hidden" value="<%=product.getProductId()%>" name="productId">
		<input type="hidden" value="<%=product.getProductPrice()%>" name="productPrice">
		<select name="ordersAmount">
		<div>
			<%
				for(int i=1;i<11;i++){
			%>	
				<option value="<%=i %>"	><%=i %></option>
			<% 		
				}
			%>
		</select>개
		</div>
		<div>
			배송 주소:
			<input type="text" name="ordersAddr">
		</div>
		<div><button type="submit">주문</button></div>
	</form>
	
	<table class="table">
		<thead>
			<tr>
				<td>product_pic</td>
				<td><%=product.getProductPic() %></td>
			</tr>
			<tr>
				<td>product_id</td>
				<td><%=product.getProductId() %></td>
			</tr>
			<tr>
				<td>category_id</td>
				<td><%=product.getCategoryId() %></td>
			</tr>
			
			<tr>
				<td>product_name</td>
				<td><%=product.getProductName() %></td>
			</tr>
			
			<tr>
				<td>product_price</td>
				<td><%=product.getProductPrice() %></td>
			</tr>
			
			<tr>
				<td>product_content</td>
				<td><%=product.getProductContent() %></td>
			</tr>
			
			<tr>
				<td>product_soldout</td>
				<td><%=product.getProductSoldout() %></td>
			</tr>
			
		</thead>
	</table>
</body>
</html>