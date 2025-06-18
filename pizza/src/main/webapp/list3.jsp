<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnector.getConnection();
	String sql = "select l.pcode, pname, to_char(sum((cost*amount)),'l999,999,999') from tbl_salelist_01 l, tbl_pizza_01 p  where l.pcode = p.pcode group by l.pcode, pname order by 3 desc";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>(과정평가형 2018-12) 피자전문점 판매관리 프로그램 ver1.0</title>
<link rel="stylesheet" href="./css/style.css?after">
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h2>상품별 매출 현황</h2>
		<table>
			<tr>
				<td>피자 코드</td>
				<td>피자 명</td>
				<td>매출총액</td>
			</tr>
			<%while(rs.next()){ %>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
				</tr>
			<%} %>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>