<%@page import="vo.RentalVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서대여관리 ver 1.0</title>
<link rel="stylesheet" href="style.css?after">
</head>
<%
	ArrayList<RentalVO> list = (ArrayList<RentalVO>) request.getAttribute("RentalList");
%>
<body>
	<header>
		<h1>도서대여관리 ver 1.0</h1>
	</header>
	<%@include file="menu.jsp"%>
	<section>
		<div align="center">
			<h2>도서대여 현황</h2>
		</div>
		<table>
				<tr>
					<td>대여일자</td>
					<td>대여번호</td>
					<td>도서코드</td>
					<td>대여도서명</td>
					<td>고객번호</td>
					<td>대여고객명</td>
					<td>반납기한</td>
				</tr>
				<% for(RentalVO vo : list){
				%>
				<tr>
					<td><%=vo.getRentYmd()%></td>
					<td><%=vo.getRentNo()%></td>
					<td><%=vo.getRentBook()%></td>
					<td><%=vo.getCloseYmd()%></td>
					<td><%=vo.getRentRent()%></td>
					<td><%=vo.getReturnYmd()%></td>
					<td><%=vo.getReturnFg()%></td>
				</tr>
				<%} 
					request.removeAttribute("RentalList");
				%>
			</table>
	</section>
	<footer>
		<p>오늘따라 비가 추적추적 내리는 하루네요</p>
	</footer>
</body>
</html>