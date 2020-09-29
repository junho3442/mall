<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*"%>
<%@ page import = "vo.*"%>
<% 
	if(session.getAttribute("loginMemberEmail")!=null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
	
	request.setCharacterEncoding("utf-8");
	// login.jsp로 부터 memberEmail, memberPw를 받는다
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	
	Member paramMember = new Member();
	paramMember.setMemberEmail(memberEmail);
	paramMember.setMemberPw(memberPw);
	
	MemberDao memberDao = new MemberDao();
	String loginMemberEmail = memberDao.login(paramMember);
	if(loginMemberEmail == null){
		response.sendRedirect(request.getContextPath()+"/member/loginForm.jsp");
	}else{
		session.setAttribute("loginMemberEmail",loginMemberEmail);
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}
%>