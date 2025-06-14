<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnector.getConnection();
	String sql = "select m.id, m.name,substr(m.id, 1, 1), substr(m.id, 2, 2), substr(m.id, 4, 2), m.gender, s.korean, s.english, s.math, s.history,(s.korean + s.english +s.math +s.history) as sum, (s.korean + s.english +s.math +s.history)/4 as avg,RANK() OVER(ORDER BY (s.korean + s.english +s.math +s.history) asc) rank from member_tbl m, score_tbl s where m.id = s.id";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
%>
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
		<table>
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>학년</td>
				<td>반</td>
				<td>번호</td>
				<td>성별</td>
				<td>국어</td>
				<td>수학</td>
				<td>영어</td>
				<td>역사</td>
				<td>합계</td>
				<td>평균</td>
				<td>순위</td>
			</tr>
			<%while(rs.next()){%>
			<tr>
				<td><%=rs.getInt(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getInt(7) %></td>
				<td><%=rs.getInt(8) %></td>
				<td><%=rs.getInt(9) %></td>
				<td><%=rs.getInt(10) %></td>
				<td><%=rs.getInt(11) %></td>
				<td><%=rs.getInt(12) %></td>
				<td><%=rs.getInt(13) %></td>
			</tr>
			<%} %>
		</table>
	</section>
	<footer>
		<p>Copyright @ 2018 All right reserved High School</p>
	</footer>
</body>
</html>