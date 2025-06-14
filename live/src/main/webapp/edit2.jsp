<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
	Connection conn = DBConnector.getConnection();
	//각 장르별 최대 북코드 가져오기
	String sql = "select book_code,book_name,book_type,book_author,to_char(in_date,'yyyy-mm-dd'),stat_fg from book_tbl_001 where book_code = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, request.getParameter("num"));
	ResultSet rs = stmt.executeQuery();
%>

<body>
	<header><h1>도서대여관리 ver1.0</h1></header>
	<%@include file="nav.jsp"%>
	<section>
	<h2>보유도서관리(삭제)</h2>
		<form action="action4.jsp" name="form" >
			<table>
				<%while(rs.next()){ %>
				
				<tr>
					<td>도서코드(자동채번)</td>
					<td><input type="text" name="book_code" value="<%=rs.getString(1)%>"readonly/></td>
				</tr>
				<tr>
					<td>도서명<td>	
					<input type="text" name="book_name" value="<%=rs.getString(2)%>"readonly/>
				</tr>
				<tr>
					<td>장르(A:에세이,B:인문,C소설)</td>
					<td><input type="text" name="book_type" readonly style="text-transform: uppercase" value="<%=rs.getString(3)%>"/></td>
				</tr>
				<tr>
					<td>작가</td>
					<td><input type="text" name="book_author" value="<%=rs.getString(4)%>" readonly/></td>
				</tr>
				<tr>
					<td>입고일자</td>
					<td><input type="text" name="in_date" value="<%=rs.getString(5)%>" readonly/></td>
				</tr>
				<tr>
					<td>도서상태</td>
					<td><select name ="stat_fg" >
						<%=rs.getString(6).equals("0")?"<option value=\"0\" >대여가능</option>":"<option value=\"1\" >대여중</option>"%>
					</select></td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type="submit" value="삭제" />
						<button type="button" onclick="location.href='BookMemberListCtrl';">조회</button></td>
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