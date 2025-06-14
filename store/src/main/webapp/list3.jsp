	<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	Connection conn = DBConector.getConnection();
	String sql = "select sale_fg, sale_no, to_char(sale_ymd, 'yyyy-mm-dd'), goods_nm, sale_cnt, (sale_cnt*goods_price), pay_type from sale_tbl_003 s, goods_tbl_003 g, store_tbl_003 ss where s.goods_cd = g.goods_cd and ss.store_cd = s.store_cd and store_nm = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, request.getParameter("jname"));
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
	a{
		color: black;
	}
	
</style>
<title>편의점 메출 관리 ver 1.0</title>
</head>
<body>
	<header><h1>편의점 메출 관리 ver 1.0</h1></header>
	<%@include file="nav.jsp" %>	
	<section>
		<h2>매출 현황</h2>
		<table >
			<tr>
				<td>판매구분</td>
				<td>판매번호</td>
				<td>판매일자</td>
				<td>상품명</td>
				<td>판매수량</td>
				<td>판매금액</td>
				<td>수취구분</td>
			</tr>
			<%while(rs.next()) {%>
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
		<p>HRDKOREA Copyright@2016 All rights reserved, Human Resorces Development Service of Korea</p>
	</footer>
</body>
</html>