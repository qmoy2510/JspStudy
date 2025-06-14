<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnector.getConnection();
	String sql = "select count(*) from course_tbl";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
	
	int num = 0;
	if(rs.next()){
		num = rs.getInt(1);
	}
	
	conn = DBConnector.getConnection();
	sql = "select id, c.name,credit, l.name, case when week = 1 then '월' when week = 2 then '화' when week = 3 then '수' when week = 4 then '목' when week = 5 then '금' when week = 6 then '토' end as week, to_char(start_hour, 'fm0000'), to_char(end_end, 'fm0000') from course_tbl c, lecturer_tbl l where lecturer = idx order by  id asc ";
	stmt = conn.prepareStatement(sql);
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
		<h2>총 <%=num%>개의 교과목이 있습니다.</h2>
		<table>
			<tr>
				<td>과목코드</td>
				<td>과목명</td>
				<td>학점</td>
				<td>담당강사</td>
				<td>요일</td>
				<td>시작시간</td>
				<td>종료시간</td>
				<td>관리</td>
			</tr>
			<%while(rs.next()){%>
			<tr>
				<td><%=rs.getInt(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getInt(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td>
					<a href="edit.jsp?id=<%=rs.getInt(1)%>">수정</a> / 
					<a href="delete.jsp?id=<%=rs.getInt(1)%>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
		<button onclick="location.href='add.jsp';">작성</button>
	</section>
	<footer>
		<p>Copyright @ 2018 정보처리 산업기사 All Right Reversed</p>
	</footer>
</body>
</html>