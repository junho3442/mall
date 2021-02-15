<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	Orders orders = new Orders();
	String memberEmail = request.getParameter("memberEmail");
	OrdersDao ordersDao = new OrdersDao();
	ArrayList<Orders> ordersList = ordersDao.selectOrdersListByEmail(memberEmail);
%>
	
	<h1> <%=memberEmail %>회원님 주문내역</h1>
	<table class="table">
		<thead>
			<tr>	
				<th>가격</th>
				<th>orders_id</th>
				<th>orders_id</th>
				<th>orders_id</th>
				<th>orders_id</th>
			</tr>	
		<%
			for(Orders o : ordersList ){
		%>
			<tr>
				<td><%=o.getOrdersPrice() %></td>
				<td><%=o.getOrdersAmount() %></td>
				<td><%=o.getOrdersAddr() %></td>
				<td><%=o.getOrdersState() %></td>
				<td><%=o.getOrdersDate() %></td>
			</tr>
		<% 
			
			}
		%>
	</thead>
</table>
</body>
</html>