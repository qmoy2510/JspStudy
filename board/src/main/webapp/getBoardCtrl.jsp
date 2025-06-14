<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클릭한 번호에 해당하는 게시글 가져오기
	int seq = Integer.ParseInt(request.getParameter("seq"));
	
	//db에서 해당 seq번호의 게시글 가져오기
	//1. 드라이버 로드
	Class.forName("oracle.jdbc.OracleDriver");
	//2. 연결 설정
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "qmoy2510", "1234");
	//3. 질의문 준비
	String sql = "select * from board where seq = ? ";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	//4. 질의문 세팅
	stmt.setInt(1, seq);
	//5. 질의문 실행
	ResultSet rs = stmt.executeQuery();
	if(rs.next()){
		
	}
	//6. 질의문 닫기
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