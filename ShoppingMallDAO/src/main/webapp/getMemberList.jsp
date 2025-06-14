<%@page import="java.lang.reflect.Member"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<MemberVO> list = (ArrayList<MemberVO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./style.css">
<title>쇼핑몰 회원관리 ver 1.0</title>
</head>
<body>
	<header>
		<h1>쇼핑몰 회원관리 ver 1.0</h1>
	</header>
	<nav><%@include file="nav.jsp" %></nav>
	<section>
		<h2>쇼핑몰 회원 조회/수정</h2>
		<table>
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>거주지역</td>
			</tr>
			<%
				for(MemberVO vo : list){
			%>
			<tr>
				<td><a href="GetMemberCtrl?custno=<%=vo.getCustno()%>"><%=vo.getCustno()%></a></td>
				<td><%=vo.getCustname()%></td>
				<td><%=vo.getPhone()%></td>
				<td><%=vo.getAddress()%></td>
				<td><%=vo.getJoindate()%></td>
				<td><%=vo.getGrade()%></td>
				<td><%=vo.getCity()%></td>
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