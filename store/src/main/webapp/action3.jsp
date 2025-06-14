<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConector.getConnection();
	String sql = "update goods_tbl_003 set goods_nm=?, goods_price=?, cost=? where goods_cd=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, request.getParameter("goods_nm"));
	stmt.setString(2, request.getParameter("goods_price"));
	stmt.setString(3, request.getParameter("cost"));
	stmt.setString(4, request.getParameter("goods_cd"));
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