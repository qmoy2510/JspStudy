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
	String sql = "select substr(book_code,1,1), to_char(max(substr(book_code, 2, 4))+1, 'fm0000'), to_char(sysdate, 'yyyy-mm-dd') from book_tbl_001 group by substr(book_code,1,1)";
	PreparedStatement stmt = conn.prepareStatement(sql);

	ResultSet rs = stmt.executeQuery();
	
	String genre="", book_code="", inDate="";
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
	
	sql = "select * from book_tbl_001 where book_code = ?";
	stmt = conn.prepareStatement(sql);
	
	String bookCode = request.getParameter("book_code");
	stmt.setString(1, bookCode);
	
	rs = stmt.executeQuery();
%>
<script>
	var myMap = new Map();
</script>
<body>
	<header>
		<h1>도서대여관리 ver 1.0</h1>
	</header>
	<%@include file="menu.jsp"%>
	<section>
		<div align="center">
			<h2>도서 수정</h2>
		</div>
		<form name="form" action="EditBookActionCtrl" method="post" onSubmit="return validation()">
			<input type="hidden" name="action" value="insert">
			<%while(rs.next()){ %>
			<table>
				<tr>
					<td>도서코드(자동채번)</td>
					<td><input type="text" name="book_code" value="<%=rs.getString("book_code")%>"readonly/></td>
				</tr>
				<tr>
					<td>도서명<td>	
					<input type="text" name="book_name" value="<%=rs.getString("book_name")%>"/>
				</tr>
				<tr>
					<td>장르(A:에세이,B:인문,C소설)</td>
					<td><input type="text" name="book_type" style="text-transform: uppercase" onchange="setValue()" value="<%=rs.getString("book_type")%>"/></td>
				</tr>
				<tr>
					<td>작가</td>
					<td><input type="text" name="book_author" value="<%=rs.getString("book_author")%>"/></td>
				</tr>
				<tr>
					<td>입고일자</td>
					<td><input type="text" name="in_date" value="<%=rs.getDate("in_date")%>"/></td>
				</tr>
				<tr>
					<td>도서상태</td>
					<%if(rs.getString("stat_fg").equals("0")){%>
					<td><select name ="stat_fg">
						<option value="0" selected>대여가능</option>
						<option value="1" >대여중</option>
					</select></td>
					<%} else if(rs.getString("stat_fg").equals("1")){%>
					<td><select name ="stat_fg">
						<option value="0" >대여가능</option>
						<option value="1" selected>대여중</option>
					</select></td>
					<%} %>
				</tr>
				<tr>
					<td colspan=2 align=center><input type="submit" value="등록" />
						<button type="button" onclick="location.href='BookMemberListCtrl';">조회</button></td>
				</tr>
			</table>
			<%} %>
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