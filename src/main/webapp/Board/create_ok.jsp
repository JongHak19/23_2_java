<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Board.BoardDAO" %>

<jsp:useBean id="dto" class="Board.BoardDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

<%
	BoardDAO dao = new BoardDAO();

	//DAO의 id 최대값 구하기
	int maxId = dao.getId();
	dto.setId(maxId+1); //새로 들어가는 데이터의 id
	
	dao.create(dto);
	
	response.sendRedirect("/");
	
	
%>