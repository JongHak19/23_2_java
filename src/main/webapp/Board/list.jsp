<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="Board.BoardDAO" %>
<%@ page import="Board.BoardDTO" %>
<%@page import="java.util.List"%>

<%
	BoardDAO dao = new BoardDAO(); 
	List<BoardDTO> lists = dao.readAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판</title>

<link rel="stylesheet" type="text/css" href="Board/css/style.css"/>
<link rel="stylesheet" type="text/css" href="Board/css/list.css"/>

</head>
<body>
<div id="BoardList">
	<div id = "BoardList_Title">
		게시판
	</div>
	
	<div id = "BoardList_Article">
		<div id="BoardList_header">
			<div id="rightHeader">
				<input type="button" value=" 글올리기 " class="btn2" 
				onclick="javascript:location.href='/Board/create.jsp';"/>			
			</div>
		</div>
		
		<div id = "BoardList_List">
			<div id = "title">
				<dl>
					<dt class="id">번호</dt>
					<dt class="subject">제목</dt>
				</dl>
			</div>
			
			<div id="Lists">
			<%for(BoardDTO dto : lists){ %>	
				<dl>
					<dd class="id"><%=dto.getId() %></dd>
					<dd class="subject">
						<a href="Board/article.jsp?id=<%=dto.getId()%>">
							<%=dto.getSubject() %>
						</a>
						
					</dd>
				</dl>
			<%} %>
			</div>
		</div>
	</div>
</div>
</body>
</html> 