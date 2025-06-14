<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//기본키 seq 받아오기
	//db에서 해당 seq글 지우기
	int seq = Integer.parseInt(request.getParameter("seq"));
	//1. 드라이버 로드
	Class.forName("oracle.jdbc.OracleDriver");
	//2. 연결 설정
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "qmoy2510", "1234");
	
	//질의문 준비
	String sql = "delete from board where seq =?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	//질의문 세팅
	stmt.setInt(1, seq);
	
	//질의문 실행
	stmt.executeUpdate();
	//닫기
	stmt.close();
	conn.close();
	
	response.sendRedirect("getBoardList.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>