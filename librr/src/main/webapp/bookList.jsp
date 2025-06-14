<%@page import="vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서대여관리 ver 1.0</title>
<link rel="stylesheet" href="style.css?after">
</head>
<%
	ArrayList<BookVO> list = (ArrayList<BookVO>) request.getAttribute("BookList");
%>
<body>
	<header>
		<h1>도서대여관리 ver 1.0</h1>
	</header>
	<%@include file="menu.jsp"%>
	<section>
		<div align="center">
			<h2>보유도서 관리</h2>
		</div>
		<form name="form" action="AddBookActionCtrl" method="post" onSubmit="return validation()">
			<input type="hidden" name="action" value="insert">
			<table>
				<tr>
					<td colspan='7'><button type="button" onclick="location.href='addBook.jsp';">도서등록</button></td>
				</tr>
				<tr>
					<td></td>
					<td>도서코드</td>
					<td>도서명</td>
					<td>장르</td>
					<td>작가</td>
					<td>입고일자</td>
					<td>도서상태</td>
				</tr>
				<% for(int i=0; i<list.size(); i++){
					BookVO vo = list.get(i);
				%>
				<tr>
					<td><%=i+1%></td>
					<td><a href="editBook.jsp?book_code=<%=vo.getBookCode()%>"><%=vo.getBookCode()%></a></td>
					<td><%=vo.getBookName()%></td>
					<td><%=vo.getBookType()%></td>
					<td><%=vo.getBookAuthor()%></td>
					<td><%=vo.getInDate()%></td>
					<td><%=vo.getStatFg()%></td>
				</tr>
				<%} 
					request.removeAttribute("BookList");
				%>
			</table>
		</form>
	</section>
	<footer>
		<p>오늘따라 비가 추적추적 내리는 하루네요</p>
	</footer>
</body>
</html>