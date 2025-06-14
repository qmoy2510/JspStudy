<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConector.getConnection();
	String sql = "select to_char(text2.nextval, 'fm000000'), to_char(sysdate,'yyyy-mm-dd') from dual";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
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
		<h2>상품 등록</h2>
		<form action="action2.jsp">
			<table>
				<%while(rs.next()) {%>
				<tr>
					<td>상품코드(자동발생)</td>
					<td><input type="text" name="goods_cd" value="<%=rs.getString(1)%>"></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><input type="text" name="goods_nm" value=""></td>
				</tr>
				<tr>
					<td>단가</td>
					<td><input type="text" name="goods_price" value=""></td>
				</tr>
				<tr>
					<td>원가</td>
					<td><input type="text" name="cost" value=""></td>
				</tr>
				<tr>
					<td>판매일자(자동발생)</td>
					<td><input type="text" name="in_date" value="<%=rs.getString(2)%>"></td>
				</tr>
				<%} %>
				<tr>
					<td colspan="2">
						<button type="submit">등록</button>
						<input type="button" onclick="location.href='list2.jsp'" value="조회">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<p>HRDKOREA Copyright@2016 All rights reserved, Human Resorces Development Service of Korea</p>
	</footer>
</body>
</html>