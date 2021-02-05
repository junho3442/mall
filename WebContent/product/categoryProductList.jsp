<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = productDao.selectCategoryProductList(categoryId);
		
		CategoryDao categoryDao = new CategoryDao();
		Category category = categoryDao.categoryName(categoryId);
	%>
	<h1><%=category.getCategoryName() %></h1>
	<%
		for(Product p : productList){
	%>
		<h1><%=p.getProductName()%></h1>
	<%
		}
	%>	
</body>
</html>