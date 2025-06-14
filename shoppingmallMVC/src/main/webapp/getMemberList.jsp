<%@page import="java.util.ArrayList"%>
<%@page import="VO.MemberVO"%>
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
			<li><a href = 'getMemberList.jsp')>회원목록조회/수정</a></li>	
			<li><a href = 'memberMoney.jsp')>회원매출조회</a></li>	
			<li><a href = '#')>홈으로.</a></li>	
		</ul>
	</menu>
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
				<td><%=vo.getCustno()%></td>
				<td><%=vo.getCustname()%></td>
				<td><%=vo.getPhone()%></td>
				<td><%=vo.getAddress()%></td>
				<td><%=vo.getJoindate()%></td>
				<td><%=vo.getGrade()%></td>
				<td><%=vo.getCity()%></td>
			</tr>
			<% } %>
		</table>
	</section>
	<footer>
		<p>오늘따라 비가 추적추적 내리는 하루네요</p>
	</footer>
</body>
</html>