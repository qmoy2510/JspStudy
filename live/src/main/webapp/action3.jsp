<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = DBConnector.getConnection();
String sql = "insert into book_tbl_001 values(?,?, ?, ?, ?, ?)";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, request.getParameter("book_code"));
stmt.setString(2, request.getParameter("book_name"));
stmt.setString(3, request.getParameter("book_type"));
stmt.setString(4, request.getParameter("book_author"));
stmt.setString(5, request.getParameter("in_date"));
stmt.setString(6, request.getParameter("stat_fg"));
stmt.executeUpdate();
response.sendRedirect("list2.jsp");
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