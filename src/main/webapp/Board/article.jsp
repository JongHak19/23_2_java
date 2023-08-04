<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Board.BoardDAO" %>
<%@ page import="Board.BoardDTO" %>
<%@page import="java.util.List"%>


<%
	BoardDAO dao = new BoardDAO();
	int id = Integer.parseInt(request.getParameter("id"));
	
	BoardDTO dto = dao.read(id); //dto에 하나의 데이터가 들어간다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>

<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/article.css"/>

</head>
<body>

<div id="Board">
	<div id="Article_title">
		게시판
	</div>
	<div id = "Article">
		<div id="Article_header">
			<%=dto.getSubject()%>
		</div>
		
	</div>
	
	<div id ="Article_content">
		<table width="600" border="0">
			<tr>
				<td style="padding-left: 20px 80px 20px 62px;" valign="top" height="200">
				<%=dto.getContent() %>
				</td>
			</tr>
		</table>
	</div>
	
	<div id = "Article_footer">
		<div id = "leftFooter">
			<input type="button" value="수정" class="btn2"
			onclick="javascript:location.href='/Board/update.jsp?id=<%=dto.getId()%>';"/>
			<input type="button" value="삭제" class="btn2"
			onclick="javascript:location.href='/Board/delete_ok.jsp?id=<%=dto.getId()%>';"/>
		</div>
		
		<div id = "rightFooter">
			<input type="button" value = "목록" class="btn2"
			onclick="javascript:location.href='/';"/>
		</div>
	</div>
	
</div>

</body>
</html>