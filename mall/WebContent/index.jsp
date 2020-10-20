<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.*" %>
<!-- 각 카테고리폼, 상품 검색   -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>
.card-title{
	overflow: hidden;
	text-overflow:e llipsis;
	white-space: nowrap;
	width: 260px;
	height: 100px;
}
</style>
</head>
<%
	
	CategoryDao categoryDao = new CategoryDao();
	//전체 카테고리
	ArrayList<Category> categoryList1 = categoryDao.selectCategoryList();
	
	//추천 카테고리
	ArrayList<Category> categoryList2 = categoryDao.selectCategoryCkList();
%>
<body>
<div class="container">
	<div> <!-- 검색  -->
		<div class="row">
		<div class="col"> <h1>Goodee Shop</h1></div>
		  
		  <div class="col">
		  	<form>
		  		<input type="text">
		  		<button type="submit">검색</button>
		  	</form>
		  </div>
		 <%
		 	if(session.getAttribute("loginMemberEmail")!=null){
		 %>
		  <div class="col">
		  		<a href="<%=request.getContextPath()%>/orders/myOrdersList.jsp?memberEmail=<%=session.getAttribute("loginMemberEmail")%>"><i class="fa fa-user" style="font-size:30px"></i></a>
		  		<i class='fas fa-shopping-cart' style='font-size:30px'></i>
		  </div>
		<%
		 	}
		%>
		</div>
	</div>
	
	<div> <!-- 로그인 회원가입 -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<%
		if(session.getAttribute("loginMemberEmail") == null){
	%>
	  <!-- 로그아웃 상태 -->
	   <ul class="navbar-nav">
	    <li class="nav-item">
	      <a class="nav-link" href="<%=request.getContextPath()%>/member/loginForm.jsp">로그인</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="<%=request.getContextPath()%>/member/signup.jsp">회원가입</a>
	    </li>                      
	  </ul>
  <%
		}else{
  %>
	  <!-- 로그인 상태 -->
	  <ul class="navbar-nav">
	    <li class="nav-item">
	      <a class="nav-link" href="<%=request.getContextPath()%>/member/logoutAction.jsp">로그아웃</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#">회원정보</a>
	    </li>
	  </ul>
<%
		}		
%>
	</nav>
	</div>

	<div class="row">
		<div class="col-sm-12, badge badge-primary">전체 카테고리</div>
	</div>
	<div>
		<div class="row">
		  <div class="col-sm-2">
		 	<div class="btn-group-vertical"> 
		 	 <%
		 	 	for(Category c : categoryList1){
		 	 %>
		 	 	<a href="<%=request.getContextPath()%>/category/<%=c.getCategoryId()%>.jsp?CategoryId=<%=c.getCategoryId()%>" class="btn btn-primary"><%=c.getCategoryName()%></a>
		 	 <% 
		 	 	}
		 	 %>
		 		</div>
		 	</div>
				<div class="col-sm-10">
				 	<img src="<%=request.getContextPath()%>/imges/11.jpg" width="750" height="150">
			 	</div>
		</div>
	</div>
			<!-- 추천 카테고리 이미지 링크 -->
		<%
				for(Category c : categoryList2){
		%>
				<a href="" class="btn"><img src="<%=request.getContextPath()%>/imges/<%=c.getCategoryPic()%>"class="rounded-circle" width="200" height="200"></a>
		<% 			
					
				}
		%>
	
		<%
			Calendar today = Calendar.getInstance();
		%>
	
	<div>
		<h3>오늘의 추천상품<span class="badge badge-primary"><%=today.get(Calendar.YEAR)%>.<%=today.get(Calendar.MONTH)+1 %>.<%=today.get(Calendar.DAY_OF_MONTH) %></span></h3>
	</div>
	<%
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = productDao.selectProductList();
	%>
		<table> <!-- 오늘의 추천 상품 정보 -->
			<tr>
				<%
					int i = 0;
					for(Product p : productList){
						i = i+1;
				%>	
					<td><div class="card" style="width:200px, height:200px">
						  <img class="card-img-top" src="<%=request.getContextPath()%>/imges/<%=p.getProductPic()%>"class="rounded-circle" width="150" height="150" alt="Card image">
						  <div class="card-body">
						    <h4 class="card-title"><a href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductName() %></a></h4>
						    <p class="card-text"><%=p.getProductPrice() %></p>
						
						  </div>
						</div>
					</td>
					<% 
					
				%>
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
		<h4>공지사항</h4> <!-- 최근공지 2개 -->
		<div>
		<% 
			NoticeDao noticeDao = new NoticeDao();
			ArrayList<Notice> list = noticeDao.selectNoticeList();
		%>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th>notice_id</th>
						<th>notice_title</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(Notice n : list){
					%>		
						<tr>
							<td><%=n.getNoticeId()%></td>
							<td><a href="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeTitle=<%=n.getNoticeTitle()%>"><%=n.getNoticeTitle()%></td>
						</tr>
					<% 	
						}
					%>
				</tbody>
			</table>
		</div>
		
		</div>
	</div>
</body>
</html>