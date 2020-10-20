<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	Orders orders = new Orders();
	String memberEmail = request.getParameter("memberEmail");
	OrdersDao ordersDao = new OrdersDao();
	ArrayList<Orders> ordersList = ordersDao.selectOrdersListByEmail(memberEmail);
%>
	
	<h1><div> <%=memberEmail %>회원님 주문내역</div></h1>
	<table class="table">
		<thead>
		<%
			for(Orders o : ordersList ){
		%>
			
			<tr>	
				<td>orders_id</td>
				<td>Product_id</td>
				<td>orders_price</td>
				<td>orders_amount</td>
				<td>orders_addr</td>
				<td>orders_state</td>
				<td>orders_date</td>
			</tr>	
			<tr>
				<td><%=o.getOrdersId() %></td>
				<td><%=o.getProductId() %></td>
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