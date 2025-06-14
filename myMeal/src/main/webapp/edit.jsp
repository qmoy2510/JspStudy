<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnector.getConnection();
	String sql = "select name from lecturer_tbl";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
	ArrayList<String> str = new ArrayList();
	while(rs.next()){
		str.add(rs.getString(1));
	}
	
	sql = "select id, name, lecturer, credit,week, to_char(start_hour, 'fm0000') as start_hour, to_char(end_end, 'fm0000') as end_end from course_tbl where id = ?";
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, request.getParameter("id"));
	rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적 조회 프로그램 ver 1.0</title>
<link rel="stylesheet" href="style.css?after">
</head>
<body>
	<header>
		<h1>수강신청 도우미 사이트</h1>
	</header>
	<section>
		<h2>교과목 추가</h2>
		<%while(rs.next()){ %>
		<form action="editAction.jsp">
			<table>
			<tr>
				<td>교과목 코드</td>
				<td><input name="id" type="text" value="<%=rs.getString(1)%>"></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td><input name="name" type="text" value="<%=rs.getString(2)%>"></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td>
					<select name="lecturer">
						<%for(int i=0;i<str.size();i++){
							%>
						<option value="<%=i+1%>" <%=rs.getInt(3)== i+1?"selected":""%>><%=str.get(i) %></option>
						<%} %>
					</select>
				</td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input name="credit" type="text" value="<%=rs.getString(4)%>"></td>
			</tr>
			<tr>
				<td>요일</td>
				<td>
					<input id="1" name="week" type="radio" value="1" <%=rs.getInt(5)==1?"checked":""%>>
					<label for="1">월</label>
					<input id="2" name="week" type="radio" value="2"<%=rs.getInt(5)==2?"checked":""%>>
					<label for="2">화</label>
					<input id="3" name="week" type="radio" value="3"<%=rs.getInt(5)==3?"checked":""%>>
					<label for="3">수</label>
					<input id="4" name="week" type="radio" value="4"<%=rs.getInt(5)==4?"checked":""%>>
					<label for="4">목</label>
					<input id="5" name="week" type="radio" value="5"<%=rs.getInt(5)==5?"checked":""%>>
					<label for="5">금</label>
					<input id="6" name="week" type="radio" value="6"<%=rs.getInt(5)==6?"checked":""%>>
					<label for="6">토</label>
				</td>
			</tr>
			<tr>
				<td>시작</td>
				<td><input name="start_hour" type="text"value="<%=rs.getString(6)%>"></td>
			</tr>
			<tr>
				<td>종료</td>
				<td><input name="end_end" type="text"value="<%=rs.getString(7)%>"></td>
			</tr>
			<tr>
				<td><button type="submit">완료</button>
				<input type="button" value="목록" onclick="location.href='index.jsp';"></button>
				<input type="button" value="취소" onclick="location.href='index.jsp';"></button></td>
			</tr>
			</table>
		</form>
		<%} %>
	</section>
	<footer>
		<p>Copyright @ 2018 정보처리 산업기사 All Right Reversed</p>
	</footer>
</body>
</html>