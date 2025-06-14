<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="vo.RentalVO"%>
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
	Connection conn = DBConnector.getConnection();
	//각 장르별 최대 북코드 가져오기
	String sql = "select substr(book_code,1,1), to_char(max(substr(book_code, 2, 4))+1, 'fm0000'), to_char(sysdate, 'yyyy-mm-dd') from book_tbl_001 group by substr(book_code,1,1)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	ResultSet rs = stmt.executeQuery();
	String genre="", book_code="", inDate="";
%>
<script>
	var myMap = new Map();
</script>
<%
	while(rs.next()){
		genre = rs.getString(1);
		book_code = genre + rs.getString(2);
		inDate = rs.getString(3);
		%>
		<script>
			myMap.set('<%=genre%>', '<%=book_code%>')
		</script>
		<%
	}

%>
<body>
	<header>
		<h1>도서대여관리 ver 1.0</h1>
	</header>
	<%@include file="menu.jsp"%>
	<section>
		<div align="center">
			<h2>도서 등록</h2>
		</div>
		<form name="form" action="AddBookActionCtrl" method="post" onSubmit="return validation()">
			<input type="hidden" name="action" value="insert">
			<table>
				<tr>
					<td>도서코드(자동채번)</td>
					<td><input type="text" name="book_code" value=""readonly/></td>
				</tr>
				<tr>
					<td>도서명<td>	
					<input type="text" name="book_name" value=""/>
				</tr>
				<tr>
					<td>장르(A:에세이,B:인문,C소설)</td>
					<td><input type="text" name="book_type" style="text-transform: uppercase" onchange="setValue()"/></td>
				</tr>
				<tr>
					<td>작가</td>
					<td><input type="text" name="book_author" /></td>
				</tr>
				<tr>
					<td>입고일자</td>
					<td><input type="text" name="in_date" value="<%=inDate%>"/></td>
				</tr>
				<tr>
					<td>도서상태</td>
					<td><select name ="stat_fg">
						<option value="0" >대여가능</option>
						<option value="1" >대여중</option>
					</select></td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type="submit" value="등록" />
						<button type="button" onclick="location.href='BookMemberListCtrl';">조회</button></td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<p>오늘따라 비가 추적추적 내리는 하루네요</p>
	</footer>
</body>
<script>
	function setValue() {
		var book_type = form.book_type.value.toUpperCase();
		form.book_code.value=myMap.get(book_type);
	}
</script>
</html>