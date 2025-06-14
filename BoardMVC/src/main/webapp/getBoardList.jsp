<%@page import="board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<BoardVO> list = (ArrayList<BoardVO>)request.getAttribute("boardList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<title>글 목록</title>
</head>

<body>
	<div align="center" style="margin: auto auto">
		<h1>글 목록</h1>
		<h3>
			<%=session.getAttribute("name") %>님 환영합니다...... <a href="LogoutCtrl">Log-out</a>
		</h3>

		<!-- 검색 시작 -->
		<form method="post">
			<table class="table" style="width: 800px">
				<tr>
					<td align="right">
					<select name="searchCondition">
							<option value="TITLE">제목
							<option value="CONTENT">내용
					</select>
					<input name="searchKeyword" type="text" />
					<input type="submit" value="검색" /></td>
				</tr>
			</table>
		</form>
		<!-- 검색 종료 -->

		<table class="table" style="width: 800px">
			<tr>
				<th width="100">번호</th>
				<th width="200">제목</th>
				<th width="150">작성자</th>
				<th width="150">등록일</th>
				<th width="100">조회수</th>
			</tr>
			<% 
			for(BoardVO vo : list){
			%>
			<tr>
				<td><a href=GetBoardCtrl?seq=<%=vo.getSeq() %>><%=vo.getSeq() %></a></td>
				<td><%=vo.getTitle() %></td>
				<td><%=vo.getNickname() %></td>
				<td><%=vo.getRegdate() %></td>
				<td><%=vo.getCnt() %></td>
			</tr>
			<%
			}
			%>
		</table>
		<br> <a href="addBoard.jsp">새글 등록</a>
	</div>
</body>
</html>



