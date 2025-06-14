<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	Connection conn = DBConector.getConnection();
	String sql = "select goods_cd, goods_nm, to_char(goods_price, 'l9999,9999,9999'), cost, to_char(in_date, 'yyyy-mm-dd') from goods_tbl_003 order by goods_cd asc";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css?after">
<style type="text/css">
	table{
		margin: 0 auto;
		border: 1px solid black;
	}
	tr{		
		border: 1px solid black;
	}
	td{		
		border: 1px solid black;
		padding: 10px;
	}
	
</style>
<title>편의점 메출 관리 ver 1.0</title>
</head>
<body>
	<header><h1>편의점 메출 관리 ver 1.0</h1></header>
	<%@include file="nav.jsp" %>	
	<section>
		<h2>상품 관리</h2>
		<table >
			<tr>
				<td>상품코드</td>
				<td>상품명</td>
				<td>단가</td>
				<td>원가</td>
				<td>입고일자</td>
			</tr>
			<%while(rs.next()) {%>
			<tr>
				<td><a href="edit.jsp?num=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
			</tr>
			<%} %>
			<tr>
				<td colspan="5"><button onclick="location.href='add1.jsp	'">등록</button></td>
			</tr>
		</table>
	</section>
	<footer>
		<p>HRDKOREA Copyright@2016 All rights reserved, Human Resorces Development Service of Korea</p>
	</footer>
</body>
</html>