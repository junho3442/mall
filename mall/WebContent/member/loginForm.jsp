<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if(session.getAttribute("loginMemberEmail") != null){
		response.sendRedirect("/mall/index.jsp"); // 로그아웃 하지 않았으면 index.jsp
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form method="post" action="/mall/member/loginAction.jsp">
	<table>
		<thead>
			<tr>
				<td>member_email</td>
				<td><input type="text" name="memberEmail"></td>
			</tr>
			<tr>
				<td>member_pw</td>
				<td><input type="text" name="memberPw"></td>
			</tr>
		</thead>
	</table>
	<button type="submit">로그인</button>
		<a href="/mall/member/signup.jsp">회원가입</a>
	</form>
</body>
</html>