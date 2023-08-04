<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="Board.BoardDAO"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));

	BoardDAO dao = new BoardDAO();
	
	dao.delete(id);
	
	response.sendRedirect("/");
%>