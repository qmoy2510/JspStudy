<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   //스크릿트릿
   //여기에 쓴 주석은 백앤드 주석이라 프런트에서 보이지 않음
   
   //아이디와 비밀번호를 입력받은 내용 받아오기
   String id = request.getParameter("id");
   String password = request.getParameter("password");
   //받아온 아이디와 밀번호를 DB에 가서 있는지 확인
	//1,. 드라이버 로드
	Class.forName("oracle.jdbc.OracleDriver");
   //2. 연결 설정
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
   Connection conn = DriverManager.getConnection(url, "qmoy2510", "1234");
   //3. 질의문 준비
   String sql = "select * from users where id = ? and password = ?";
   PreparedStatement stmt = conn.prepareStatement(sql);
   //4. 질의문 세팅
   stmt.setString(1, id);
   stmt.setString(2, password);
   //5. 질의문 실행
   ResultSet rs = stmt.executeQuery();
   //아이디와 비밀번호가 있으면 로그인 처리
   if (rs.next()){
	   //아이디와 이름을 session scope에 저장
	   session.setAttribute("id", rs.getString("id"));
	   session.setAttribute("name", rs.getString("name"));
	   response.sendRedirect("getBoardList.jsp");
   }
   else{
	   response.sendRedirect("login.jsp");
   }
   //없으면 다시 로그인 화면으로 가기
   
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