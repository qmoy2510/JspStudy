<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn = DBConnector.getConnection();
	String sql = "select cust_no, cust_name, phone, address, to_char(join_date, 'yyyy-mm-dd'), case when stat_fg = 0 then '정상' when stat_fg = 1 then '휴면'when stat_fg = 2 then '탈퇴' end from member_tbl_001";
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
	<h2>회원정보관리</h2>
		<table>
				<tr>
					<td colspan="7"><input type="button" value="회원등록" onclick="location.href='add2.jsp';"></td>
				</tr>
				<tr>
					<td></td>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>핸드폰번호</td>
					<td>주소</td>
					<td>가입일자</td>
					<td>상태구분</td>
				</tr>
				<%int count =1;while(rs.next()){ %>
					<tr>
					<td><%=count%></td>
					<td><a href="edit1.jsp?num=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></td>
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