<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
Connection conn = DBConector.getConnection();
String sql = "    select store_nm, sum(case when pay_type = '01' then goods_price*sale_cnt else 0 end) , sum(case when pay_type = '02' then goods_price*sale_cnt else 0 end), (sum(case when pay_type = '01' then goods_price*sale_cnt else 0 end)+ sum(case when pay_type = '02' then goods_price*sale_cnt else 0 end))   from goods_tbl_003 g, store_tbl_003 s, sale_tbl_003 ss  where s.store_cd = ss.store_cd and g.goods_cd = ss.goods_cd group by store_nm order by 4 desc";
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
				<td>점포명</td>
				<td>현금매출</td>
				<td>카드매출</td>
				<td>총매출</td>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				
				<td><a href='list3.jsp?num=<%=rs.getString(1) %>'><%=rs.getString(1) %></a></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
			</tr>		
				<%} %>
		</table>
	</section>
	<footer>
		<p>HRDKOREA Copyright@2016 All rights reserved, Human Resorces Development Service of Korea</p>
	</footer>
</body>
</html>