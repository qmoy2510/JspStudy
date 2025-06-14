<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn = DBConnector.getConnection();
	String sql = "select rent_ymd, rent_no, rent_book, book_name, rent_rent, cust_name, close_ymd from book_tbl_001 b, rental_tbl_001 r, member_tbl_001 m where rent_rent = cust_no and book_code = rent_book order by rent_ymd, rent_no, rent_book asc";
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
					<td>대여일자</td>
					<td>대여번호</td>
					<td>도서코드</td>
					<td>대여도서명</td>
					<td>고객번호</td>
					<td>대여고객명</td>
					<td>반납기한</td>
				</tr>
				<%while(rs.next()){ %>
					<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					</tr>
				<%} %>
			</table>
	</section>
	<footer>
		<p>오늘제가먹은음식은피자입니다정말맛있어요</p>
	</footer>
</body>
</html>