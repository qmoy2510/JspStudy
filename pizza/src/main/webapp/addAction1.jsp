<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnector.getConnection();
	String sql = "insert into tbl_salelist_01 values(?, ?, ?, ?, ?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, request.getParameter("saleno"));
	stmt.setString(2, request.getParameter("scode"));
	stmt.setString(3, request.getParameter("saledate"));
	stmt.setString(4, request.getParameter("pcode"));
	stmt.setString(5, request.getParameter("amount"));
	stmt.executeUpdate();
	response.sendRedirect("list1.jsp");
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