<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적 조회 프로그램 ver 1.0</title>
<link rel="stylesheet" href="style.css?after">
</head>
<body>
	<header>
		<h1>학생 성적 관리 프로그램 ver 1.0</h1>	
	</header>	
	<%@include file="menu.jsp" %>
	<section>
		<h2>학생 조회</h2>
		<form action="action.jsp">
		<table>
				<tr>
					<td>학번</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>국어</td>
					<td><input type="text" name="korean"></td>
				</tr>
				<tr>
					<td>수학</td>
					<td><input type="text" name="math"></td>
				</tr>
				<tr>
					<td>영어</td>
					<td><input type="text" name="english"></td>
				</tr>
				<tr>
					<td>역사</td>
					<td><input type="text" name="history"></td>
				</tr>
				<tr>
					<td><input type="submit" value="등록"/></td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<p>Copyright @ 2018 All right reserved High School</p>
	</footer>
</body>
</html>