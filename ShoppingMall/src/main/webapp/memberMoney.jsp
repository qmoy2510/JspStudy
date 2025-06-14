<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbConnection.jsp"%>
<%
//화면에 들어오자마자
//DB에서 ㅁ든 회원 목록을 가져와서
//3. 질의문 준비
String sql = "select me.custno, custname, grade, sum(price) price from member_tbl_02 me, money_tbl_02 mo where me.custno = mo.custno group by me.custno, custname, grade  order by 4 desc " ;
//4. 질의문 세팅
//5. 질의문 실행
PreparedStatement stmt = conn.prepareStatement(sql);
ResultSet rs = stmt.executeQuery();
//화면에 보여주기
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
				<td>고객등급</td>
				<td>매출</td>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("custno") %></td>
				<td><%=rs.getString("custname")%></td>
				<td><%=rs.getString("grade")%></td>
				<td><%=rs.getString("price")%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<footer>
		<p>오늘따라 비가 추적추적 내리는 하루네요</p>
	</footer>
</body>
</html>