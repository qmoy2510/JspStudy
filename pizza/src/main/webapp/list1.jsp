<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnector.getConnection();
	String sql = "select saleno, l.scode, sname, to_char(saledate, 'yyyy-mm-dd'), l.pcode, pname, amount,to_char((cost*amount), 'l999,999,999') from tbl_salelist_01 l, tbl_shop_01 s, tbl_pizza_01 p where l.scode = s.scode and l.pcode = p.pcode";
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
		<h2>통합매출현황조회</h2>
		<table>
			<tr>
				<td>매출전표번호</td>
				<td>지점</td>
				<td>판매일자</td>
				<td>피자코드</td>
				<td>피자명</td>
				<td>판매수량</td>
				<td>판매액</td>
			</tr>
			<%while(rs.next()){ %>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%>-<%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>
				</tr>
			<%} %>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>