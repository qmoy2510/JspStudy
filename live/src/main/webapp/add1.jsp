<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn = DBConnector.getConnection();
	String sql = "select to_char(sysdate,'yyyymmdd'), to_char(nvl(max(rent_no), 00000)+1, 'fm00000'), to_char(sysdate,'yyyymmdd')+7 from rental_tbl_001 where rent_ymd = to_char(sysdate,'yyyymmdd')";
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
<script>
	function apple() {
		if(!form.rent_book.value){
			alert("도서코드를 입력하지 않았습니다.");
			return false;
		}
		else if(!form.rent_rent.value){
			alert("고객번호를 입력하지 않았습니다.");
			return false;
		}
		else{
			alert("대여도서 등록이 완료되었습니다.");
			return true;
		}
	}
</script>
</head>
<body>
	<header><h1>도서대여관리 ver1.0</h1></header>
	<%@include file="nav.jsp"%>
	<section>
	<h2>대여도서등록</h2>
		<form action="action1.jsp" name="form" onsubmit="return apple();">
			<table>
				<%while(rs.next()){ %>
				<tr>
					<td>대여일자</td>
					<td><input type="text" value="<%=rs.getString(1)%>" name="rent_ymd"></td>
				</tr>
				<tr>
					<td>대여번호(자동채번)</td>
					<td><input type="text" value="<%=rs.getString(2)%>" name="rent_no"></td>
				</tr>
				<tr>
					<td>도서코드</td>
					<td><input type="text"  name="rent_book"></td>
				</tr>
				<tr>
					<td>고객번호</td>
					<td><input type="text" name="rent_rent"></td>
				</tr>
				<tr>
					<td>반납기한(대여일 7일후)</td>
					<td><input type="text" value="<%=rs.getString(3)%>" name="close_ymd"></td>
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