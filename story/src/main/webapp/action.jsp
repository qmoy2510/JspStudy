<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = DBConector.getConnection();
String sql = "insert into sale_tbl_003 values(?, ?, ?, ?, ?, ?, ?)";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, request.getParameter("sale_no"));
stmt.setString(2, request.getParameter("sale_ymd"));
stmt.setString(3, request.getParameter("sale_fg"));
stmt.setString(4, request.getParameter("store_cd"));
stmt.setString(5, request.getParameter("goods_cd"));
stmt.setString(6, request.getParameter("sale_cnt"));
stmt.setString(7, request.getParameter("pay_type"));
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