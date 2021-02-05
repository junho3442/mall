<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String noticeTitle = request.getParameter("noticeTitle");
		Notice notice = new Notice();
		NoticeDao noticeDao = new NoticeDao();
		notice = noticeDao.selectNoticeOne(noticeTitle);	
	%>
	<h1>공지사항</h1>
	<table>
		<tr>
			<td>notice_id</td>
			<td><%=notice.getNoticeId() %></td>
		</tr>
		<tr>
			<td>notice_title</td>
			<td><%=notice.getNoticeTitle() %></td>
		</tr>
		<tr>
			<td>notice_content</td>
			<td><%=notice.getNoticeContent() %></td>
		</tr>
		<tr>
			<td>notice_date</td>
			<td><%=notice.getNoticeDate() %></td>
		</tr>
	</table>
</body>
</html>