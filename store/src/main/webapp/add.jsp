<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConector.getConnection();
	String sql = "select to_char(text.nextval, 'fm0000'), to_char(sysdate,'yyyymmdd') from dual";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css?after">
<style type="text/css">
	table{
		margin: 0 auto;
		border: 1px solid black;
	}
	tr{		
		border: 1px solid black;
	}
	td{		
		border: 1px solid black;
		padding: 10px;
	}
</style>
<title>편의점 메출 관리 ver 1.0</title>
</head>
<body>
	<header><h1>편의점 메출 관리 ver 1.0</h1></header>
	<%@include file="nav.jsp" %>	
	<section>
		<h2>매출 등록</h2>
		<form action="action.jsp">
			<table>
				<%while(rs.next()) {%>
				<tr>
					<td>판매번호(자동발생)</td>
					<td><input type="text" name="sale_no" value="<%=rs.getString(1)%>"></td>
				</tr>
				<tr>
					<td>판매일자(자동발생)</td>
					<td><input type="text" name="sale_ymd" value="<%=rs.getString(2)%>"></td>
				</tr>
				<%} %>
				<tr>
					<td>판매구분</td>
					<td>
						<select name="sale_fg">
							<option selected disabled hidden>선택</option>
							<option value="1">판매</option>
							<option value="2">판매취소</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>판매점포</td>
					<td><select name="store_cd">
							<option selected disabled hidden>선택</option>
							<%
							sql = "select store_cd ,store_nm from store_tbl_003";
							stmt = conn.prepareStatement(sql);
							rs = stmt.executeQuery();
							while(rs.next()) {%>
							<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
							<%} %>
						</select></td>
				</tr>
				<tr>
					<td>판매상품</td>
					<td><select name="goods_cd">
							<option selected disabled hidden>선택</option>
							<%
							sql = "select goods_cd ,goods_nm from goods_tbl_003";
							stmt = conn.prepareStatement(sql);
							rs = stmt.executeQuery();
							while(rs.next()) {%>
							<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
							<%} %>
						</select></td>
				</tr>
				<tr>
					<td>판매수량</td>
					<td><input type="text" name="sale_cnt" value=""></td>
				</tr>
				<tr>
					<td>수취구분</td>
					<td><select name="pay_type">
							<option selected disabled hidden>선택</option>
							<option value="01">현금</option>
							<option value="02">카드</option>
						</select></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">등록</button>
						<input type="button" onclick="location.href='list2.jsp'" value="조회">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<p>HRDKOREA Copyright@2016 All rights reserved, Human Resorces Development Service of Korea</p>
	</footer>
</body>
</html>