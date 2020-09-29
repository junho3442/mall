<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%
	if(session.getAttribute("loginMemberEmail")!=null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
	request.setCharacterEncoding("utf-8");
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	
	
	MemberDao memberDao = new MemberDao();
	Member member = memberDao.selectMemberEmailCk(memberEmail);
	
		if(member != null){
			
			response.sendRedirect(request.getContextPath()+"/signup.jsp");
			return;
		}
		Member paramMember = new Member();
		paramMember.setMemberEmail(memberEmail);
		paramMember.setMemberPw(memberPw);
		paramMember.setMemberName(memberName);
		memberDao.insertMember(paramMember);
	response.sendRedirect(request.getContextPath()+"/member/loginForm.jsp");
%>
