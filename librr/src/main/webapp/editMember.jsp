<%@page import="vo.MemberVO"%>
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
	MemberVO vo = (MemberVO) request.getAttribute("MemberVO");
%>
<body>
	<header>
		<h1>도서대여관리 ver 1.0</h1>
	</header>
	<%@include file="menu.jsp"%>
	<section>
		<div align="center">
			<h2>회원 수정</h2>
		</div>
		<form name="form" action="EditMemberActionCtrl" method="post" onSubmit="return validation()">
			<input type="hidden" name="action" value="insert">
			<table>
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="cust_no" value="<%=vo.getCustNo()%>"readonly/></td>
				</tr>
				<tr>
					<td>회원성명<td>	
					<input type="text" name="cust_name" value="<%=vo.getCustName()%>"/>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td><input type="text" name="phone" value="<%=vo.getPhone()%>"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="<%=vo.getAddress()%>"/></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" value="<%=vo.getJoinDate()%>"readonly/></td>
				</tr>
				<tr>
					<td>상태구분</td>
					<%if(Integer.parseInt(vo.getStatFg()) == 0){%>
					<td><select name ="stat_fg">
						<option value="0" selected>정상</option>
						<option value="1" >휴면</option>
						<option value="2" >탈퇴</option>
					</select></td>
					<%}else if(Integer.parseInt(vo.getStatFg()) == 1){%>
					<td><select name ="stat_fg">
						<option value="0" >정상</option>
						<option value="1" selected>휴면</option>
						<option value="2" >탈퇴</option>
					</select></td>
					<%}else if(Integer.parseInt(vo.getStatFg()) == 2){%>
					<td><select name ="stat_fg">
						<option value="0" >정상</option>
						<option value="1" >휴면</option>
						<option value="2" selected>탈퇴</option>
					</select></td>
					<%}%>
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
</html>