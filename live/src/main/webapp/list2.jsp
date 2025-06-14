<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn = DBConnector.getConnection();
	String sql = "select book_code, book_name, book_type, book_author, to_char(in_date,'yyyy-mm-dd'), case when stat_fg = '0' then '대여가능' when stat_fg = '1' then '대여중' end from book_tbl_001";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서대여관리 ver1.0</title>
<link rel="stylesheet" href="style.css?after">
<style>
table{
	margin: 0 auto;
}
	table, tr, td{
		padding: 10px 20px;
		border: 1px solid black;
	}
</style>
</head>	
<body>
	<header><h1>도서대여관리 ver1.0</h1></header>
	<%@include file="nav.jsp"%>
	<section>
	<h2>보유도서 관리</h2>
		<table>
				<tr>
					<td colspan="7"><input type="button" value="도서등록" onclick="location.href='add3.jsp'"></td>
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
				<%int count =1;while(rs.next()){ %>
					<tr>
					<td><%=count%></td>
					<td><a href="edit2.jsp?num=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td></tr>
				<%count++;} %>
			</table>
	</section>
	<footer>
		<p>오늘제가먹은음식은피자입니다정말맛있어요</p>
	</footer>
</body>
</html>