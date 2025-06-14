<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConector.getConnection();
	String sql = "insert into goods_tbl_003 values(?, ?, ?, ?, ?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, request.getParameter("goods_cd"));
	stmt.setString(2, request.getParameter("goods_nm"));
	stmt.setString(3, request.getParameter("goods_price"));
	stmt.setString(4, request.getParameter("cost"));
	stmt.setString(5, request.getParameter("in_date"));
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