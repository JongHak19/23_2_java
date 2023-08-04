<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="Board.BoardDAO"%>

<jsp:useBean id="dto" class="Board.BoardDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

	
<%	
	int id = Integer.parseInt(request.getParameter("id"));

	dto.setId(id);
	BoardDAO dao = new BoardDAO();
	dao.update(dto);
	
	response.sendRedirect("/");
%>