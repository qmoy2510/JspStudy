<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnector.getConnection();
String sql = "insert into rental_tbl_001 values(?, ?, ?,?, ?, null, 0)";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, request.getParameter("rent_ymd"));
stmt.setString(2, request.getParameter("rent_no"));
stmt.setString(3, request.getParameter("rent_book"));
stmt.setString(4, request.getParameter("rent_rent"));
stmt.setString(5, request.getParameter("close_ymd"));
stmt.executeUpdate();
response.sendRedirect("list3.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>