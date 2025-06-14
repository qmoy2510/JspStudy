<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//인코딩
	request.setCharacterEncoding("UTF-8");
	
	//수정되는 항목 받아오기(제목,내용)
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	//세션에 들어있는 값 (id,이름)
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	
	
	//DB에 수정내용 저장
	//1. 드라이버 로드
	Class.forName("oracle.jdbc.OracleDriver");
	
	//2. 연결설정
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "qmoy2510","1234");
	
	//3. 질의문 준비
	String sql = "insert into board (seq, title, nickname, content, userid)"
		 + "values((select nvl(max(seq), 0) + 1 from board), ?, ?, ?, ?)";

	PreparedStatement stmt = conn.prepareStatement(sql);
	//4. 질의문 세팅
	stmt.setString(1,title);
	stmt.setString(2,name);
	stmt.setString(3,content);
	stmt.setString(4,id);
	
	//5. 질의문 실행
	stmt.executeUpdate();
	
	//6. 닫기
	stmt.close();
	conn.close();
	
	//글 목록 화면으로 이동
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