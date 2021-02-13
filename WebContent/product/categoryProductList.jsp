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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container text-center">
	<div>
		<div class="row">
			<div class="col"> 
				<h1 style="text-align:left;"><a style="color: black" href="<%=request.getContextPath()%>/index.jsp">Shopping Mall</a></h1>
			</div>
		</div>
	</div>
		<%
			ProductDao productDao = new ProductDao();	
			int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		
			int currentPage = 1; // 시작 페이지
			if(request.getParameter("currentPage")!=null){
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			int rowPerPage = 9; // 페이지에 나타날 상품 갯수
			int totalCount = productDao.productCount(categoryId);
			int lastPage = totalCount/rowPerPage; // 총상품 갯수 / 페이지에 나타날 상품갯수 
			
			if(totalCount % rowPerPage != 0){
				lastPage +=1;
			}
			
			int limit1 = (currentPage -1)*rowPerPage;
			int limit2 = rowPerPage;
			
			ArrayList<Product> productList = productDao.selectCategoryProductList(categoryId,limit1,limit2);
		%>
		
		<%
			CategoryDao categoryDao = new CategoryDao();
			Category category = categoryDao.categoryName(categoryId);
			List<Category> categoryList = categoryDao.selectCategoryList();
		%>
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<ul class="navbar-nav">
		<%
			for(Category c : categoryList){
		%>	
					<li class="nav-item">
						<a class="nav-link text-white" href="<%=request.getContextPath()%>/product/categoryProductList.jsp?categoryId=<%=c.getCategoryId()%>&currentPage=1"><%=c.getCategoryName()%></a>
					</li>                     
		<% 		
			}
		%>
				</ul>
			</nav>
		<div class="row">
			<div class="col-md-2">
				<h1 style="margin-top:50px;" class="border-border"><%=category.getCategoryName() %></h1>
			</div>
		
			<div class="col-md-10">
				<img src="<%=request.getContextPath()%>/imges/<%=category.getCategoryPic()%>" style="text-align:center; margin-top:10px; width:100%; height:200px;">
			</div>
		</div>	
		
		<table style="width:80%; margin-left: auto; margin-right: auto; margin-top:30px;">
			<tr>
		<%
			int i = 0;
			for(Product p : productList){
				i=i+1;
		%>
			<td>
				<div class="card" style="width:200px, height:200px">
					<img class="card-img-top" src="<%=request.getContextPath()%>/product-img/<%=p.getProductPic()%>"class="rounded-circle" width="100px" height="150px" alt="Card image">
					<div class="card-body">
						<h4 class="card-title"><a href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductName() %></a></h4>
						<p class="card-text"><%=p.getProductPrice() %>원</p>
					</div>
				</div>
			</td>
		<%
			if(i%3 == 0){
		%>
			<tr></tr>
		<%
			}
			}
		%>	
			</tr>
		</table>
		<%
			if(currentPage<lastPage){
		%>
			<a href="<%=request.getContextPath()%>/product/categoryProductList.jsp?categoryId=<%=categoryId%>&currentPage=<%=currentPage+1%>">다음</a>
		<%		
			}
		%>
		<%
			if(currentPage>1){
		%>
			<a href="<%=request.getContextPath()%>/product/categoryProductList.jsp?categoryId=<%=categoryId%>&currentPage=<%=currentPage-1%>">이전</a>
		<%		
			}
		%>
	</div>		
</body>
</html>