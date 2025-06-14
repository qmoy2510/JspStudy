<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	Connection conn = DBConnector.getConnection();
	String sql = "insert into score_tbl values(?, ?, ?, ?,?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, request.getParameter("id"));
	stmt.setInt(2, Integer.parseInt(request.getParameter("korean")));
	stmt.setInt(3, Integer.parseInt(request.getParameter("english")));
	stmt.setInt(4, Integer.parseInt(request.getParameter("math")));
	stmt.setInt(5, Integer.parseInt(request.getParameter("history")));
	stmt.executeUpdate();
	response.sendRedirect("addGrade.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>