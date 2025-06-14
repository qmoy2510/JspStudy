<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String custno = (String)request.getAttribute("custno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	text-decoration: none;
	list-style: none;
}

header {
	height: 100px;
	width: 100%;
	background-color: blue;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
}

menu>ul {
	height: 70px;
	width: 100%;
	background-color: #ddd;
	display: flex;
	align-items: center;
}

menu>ul>li {
	margin-left: 60px;
}

section {
	background-color: #eee;
	height: 700px;
	display: flex;
	align-items: center;
	flex-direction: column;
}

section>h2 {
	align-self: center;
	margin-top: 30px;
	margin-bottom: 30px;
}

footer {
	height: 80px;
	width: 100%;
	background-color: blue;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
}
</style>
<body>
	<header>
		<h1>쇼핑몰 회원관리 ver 1.0</h1>
	</header>
	<menu>
		<ul>
			<li><a href = 'addMember.jsp')>회원등록</a></li>	
			<li><a href = 'GetMemberListCtrl')>회원목록조회/수정</a></li>	
			<li><a href = 'memberMoney.jsp')>회원매출조회</a></li>		
			<li><a href = '#')>홈으로.</a></li>	
		</ul>
	</menu>
	<section>
		<h2>홈쇼핑 회원 등록</h2>
		<form name="form" action="ActionCtrl" method="post" >
			<input type="hidden" name="action" value="insert">
			<table>
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno" 	value="<%=custno%>"></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="date" name="joindate"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP, B:일반, C:직원]</td>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"></td>
				</tr>
			</table>
			<input type ="submit" value="등록"/><button type="button">조회</button>
		</form>
	</section>
	<footer>
		<p>오늘따라 비가 추적추적 내리는 하루네요</p>
	</footer>
</body>
</html>