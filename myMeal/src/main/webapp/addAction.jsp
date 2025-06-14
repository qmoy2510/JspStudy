<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnector.getConnection();
	String sql = "insert into course_tbl values (?, ?, ?, ?, ?, to_char(?, 'fm0000'), to_char(?, 'fm0000'))";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, request.getParameter("id"));
	stmt.setString(2, request.getParameter("name"));
	stmt.setString(3, request.getParameter("credit"));
	stmt.setString(4, request.getParameter("lecturer"));
	stmt.setString(5, request.getParameter("week"));
	stmt.setString(6, request.getParameter("start_hour"));
	stmt.setString(7, request.getParameter("end_end"));
	stmt.executeUpdate();
	response.sendRedirect("index.jsp");
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