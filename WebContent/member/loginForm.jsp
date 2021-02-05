<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	.card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
</style>

</head>
<body>
	<div class="container text-center">
	<h2 style="margin-top:30px;">공지사항</h2> <!-- 최근공지 2개 -->
		<div>
		<% 
			NoticeDao noticeDao = new NoticeDao();
			ArrayList<Notice> list = noticeDao.selectNoticeList();
		%>
		<div>
			<table class="table table-striped" style="width:80%; margin-left: auto; margin-right: auto;">
				<thead>
					<tr>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(Notice n : list){
					%>		
						<tr>
							<td><%=n.getNoticeTitle()%></td>
							<td><%=n.getNoticeDate()%></td>
						</tr>
					<% 	
						}
					%>
				</tbody>
			</table>
		</div>
		</div>

	<div class="card align-middle" style="width:20rem; border-radius:20px; margin-top:30px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">로그인</h2>
		</div>
		<div class="card-body">
			<form method="post" action="/mall/member/loginAction.jsp">
				 <h5 class="form-signin-heading">로그인 정보를 입력해주세요</h5>
		        <label for="inputEmail" class="sr-only">ID</label>
		        <input type="text" id="uid" class="form-control" name="memberEmail" value="admin" required autofocus><br>
		        <label for="inputPassword" class="sr-only">Password</label>
		        <input type="password" id="upw" class="form-control" name="memberPw" value="1234" required><br>
				<div style="text-align:right;">
					<button type="submit" class="btn btn-primary">로그인</button>
				</div>
			</form>
		</div>
	</div>
</div>	
</body>
</html>