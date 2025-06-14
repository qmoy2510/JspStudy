<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn = DBConnector.getConnection();
	String sql = "select nvl(max(cust_no), 10000)+1, to_char(sysdate, 'yyyy-mm-dd') from member_tbl_001";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서대여관리 ver1.0</title>
<link rel="stylesheet" href="style.css?after">
<style>
table{
	margin: 0 auto;
}
	table, tr, td{
		padding: 10px 20px;
		border: 1px solid black;
	}
</style>
</head>
<body>
	<header><h1>도서대여관리 ver1.0</h1></header>
	<%@include file="nav.jsp"%>
	<section>
	<h2>회원정보관리(등록)</h2>
		<form action="action2.jsp" name="form" >
			<table>
				<%while(rs.next()){ %>
				<tr>
					<td>회원번호</td>
					<td><input type="text" value="<%=rs.getString(1)%>" name="cust_no"></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" value="" name="cust_name"></td>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td><input type="text"  name="phone"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" value="<%=rs.getString(2)%>" name="join_date"></td>
				</tr>
				<tr>
					<td>상태구분</td>
					<td>
						<select name="stat_fg">
							<option value="0">정상</option>
							<option value="1">휴면</option>
							<option value="2">탈퇴</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2"><button type="submit" >등록</button>
					<input type="button" value="조회" onclick="location.href='list1.jsp'"></td>
				</tr>
				<%} %>
			</table>
		</form>
	</section>
	<footer>
		<p>오늘제가먹은음식은피자입니다정말맛있어요</p>
	</footer>
</body>
</html>