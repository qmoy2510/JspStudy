<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn = DBConnector.getConnection();
	String sql = "select cust_no ,cust_name,phone ,address ,to_char(join_date,'yyyy-mm-dd') ,stat_fg from MEMBER_TBL_001 where cust_no = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, request.getParameter("num"));
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
	<h2>회원정보관리(수정)</h2>
		<form action="editAction1.jsp" name="form" >
			<table>
				<%while(rs.next()){ %>
				<tr>
					<td>회원번호</td>
					<td><input type="text" value="<%=rs.getString(1)%>" name="cust_no"></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" value="<%=rs.getString(2)%>" name="cust_name"></td>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td><input type="text" name="phone" value="<%=rs.getString(3)%>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="<%=rs.getString(4)%>"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" value="<%=rs.getString(5)%>" name="join_date"></td>
				</tr>
				<tr>
					<td>상태구분</td>
					<td>
						<select name="stat_fg">
							<option value="0" <%=rs.getString(6).equals("0")?"SELECTED":""%>>정상</option>
							<option value="1"<%=rs.getString(6).equals("1")?"SELECTED":""%>>휴면</option>
							<option value="2"<%=rs.getString(6).equals("2")?"SELECTED":""%>>탈퇴</option>
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