<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">

	<div class="card align-middle" style="width:20rem; border-radius:20px; margin-top:30px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">회원가입</h2>
		</div>
		<div class="card-body">
	<form method="post" action="<%=request.getContextPath()%>/member/signupAction.jsp">
	<h5 class="form-signin-heading text-center">정보를 입력해주세요</h5>
				<label for="uname" style="margin-top:10px;">닉네임:</label>
		        <input type="text" id="uname" class="form-control" name="memberName" required autofocus><br>
		        
		        <label for="uid">ID:</label>
		        <input type="text" id="uid" class="form-control" name="memberEmail" required><br>
		        
		        <label for="upw">Password:</label>
		        <input type="password" id="upw" class="form-control" name="memberPw" required><br>
		        
				<div style="text-align:right;">
					<button type="submit" class="btn btn-primary">회원가입</button>
				</div>
			</form>
		</div>
	</div>

</div>
</body>
</html>