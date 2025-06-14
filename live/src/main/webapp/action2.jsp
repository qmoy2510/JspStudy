<%@page import="java.sql.Date"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn = DBConnector.getConnection();
	String sql = "insert into MEMBER_TBL_001 values(?, ?, ?, ?, ?, ?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, request.getParameter("cust_no"));
	stmt.setString(2, request.getParameter("cust_name"));
	stmt.setString(3, request.getParameter("phone"));
	stmt.setString(4, request.getParameter("address"));
	stmt.setDate(5, Date.valueOf(request.getParameter("join_date")));
	stmt.setString(6, request.getParameter("stat_fg"));
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