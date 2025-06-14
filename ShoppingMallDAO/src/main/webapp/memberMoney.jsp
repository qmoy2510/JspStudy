<%@page import="vo.MenMonVo"%>
<%@page import="java.lang.reflect.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<MenMonVo> list = (ArrayList<MenMonVo>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver 1.0</title>
<link rel="stylesheet" href="./style.css">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
</head>
<body>
	<header>
		<h1>쇼핑몰 회원관리 ver 1.0</h1>
	</header>
	<nav>
		<%@include file="nav.jsp" %>
	</nav>
	<section>
		<h2>쇼핑몰 회원 조회/수정</h2>
		<table>
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>고객등급</td>
				<td>매출</td>
			</tr>
			<%
				for(MenMonVo vo : list){
			%>
			<tr>
				<td><%=vo.getCustno()%></a></td>
				<td><%=vo.getCustname()%></td>
				<td><%=vo.getGrade()%></td>
				<td><%=vo.getPrice()%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<footer>
		<%@include file="footer.jsp" %>
	</footer>
</body>
</html>