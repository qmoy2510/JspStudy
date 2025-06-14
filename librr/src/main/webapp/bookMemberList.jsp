<%@page import="vo.MemberVO"%>
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
	ArrayList<MemberVO> list = (ArrayList<MemberVO>) request.getAttribute("MemberList");
%>
<body>
	<header>
		<h1>도서대여관리 ver 1.0</h1>
	</header>
	<%@include file="menu.jsp"%>
	<section>
		<div align="center">
			<h2>회원정보 관리</h2>
		</div>
		<form name="form" action="AddBookMemberActionCtrl" method="post" onSubmit="return validation()">
			<input type="hidden" name="action" value="insert">
			<table>
				<tr>
					<td colspan='7'><button type="button" onclick="location.href='AddBookMemberCtrl';">회원등록</button></td>
				</tr>
				<tr>
					<td></td>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>핸드폰번호</td>
					<td>주소</td>
					<td>가입일자</td>
					<td>상태구분</td>
				</tr>
				<% for(int i=0; i<list.size(); i++){
					MemberVO vo = list.get(i);
				%>
				<tr>
					<td><%=i+1%></td>
					<td><a href="EditMemberCtrl?custNo=<%=vo.getCustNo()%>"><%=vo.getCustNo()%></a></td>
					<td><%=vo.getCustName()%></td>
					<td><%=vo.getPhone()%></td>
					<td><%=vo.getAddress()%></td>
					<td><%=vo.getJoinDate()%></td>
					<td><%=vo.getStatFg()%></td>
				</tr>
				<%} 
					request.removeAttribute("MemberList");
				%>
			</table>
		</form>
	</section>
	<footer>
		<p>오늘따라 비가 추적추적 내리는 하루네요</p>
	</footer>
</body>
</html>