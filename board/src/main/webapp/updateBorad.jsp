<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인코딩
	request.setCharacterEncoding("UTF-8");
	//키에 해당하는 seq받아오기
	int seq = Integer.parseInt(request.getParameter("seq"));
	//수정되는 항목 받아오기(제목,내용)
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//DB에 수정내용 저장
	//1. 드라이버 로드
	Class.forName("oracle.jdbc.OracleDriver");
	
	//2. 연결설정
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "qmoy2510","1234");
	
	//3. 질의문 준비
	String sql = "update board set title=?, content = ? where seq = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	//4. 질의문 세팅
	stmt.setString(1, title);
	stmt.setString(2, content);
	stmt.setInt(3,seq);
	
	//5. 질의문 실행
	stmt.executeUpdate();
	//6.닫기
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