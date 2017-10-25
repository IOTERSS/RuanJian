<%@ page language="java" pageEncoding="utf-8"%>
<%
	session.invalidate();
	response.sendRedirect("index.jsp");
%>