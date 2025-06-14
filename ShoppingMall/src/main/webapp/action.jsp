<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "dbConnection.jsp" %>
<%
	String action = request.getParameter("action");
	String move_url = "./";
	String msg = null;
	//회원등록화면에서 입력한 내용 받아오기
	//성명, 전화 주소, 가입일자, 고객등급, 도시코드
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	Date joindate = Date.valueOf(request.getParameter("joindate"));
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	String sql = null;
	
	switch(action){
	case "insert":
		sql = "insert into member_tbl_02 values ((select nvl (max (custno), 100000) + 1 from member_tbl_02),?,?,?,?,?,?)";
		move_url="addMember.jsp";
		msg = "회원등록이 완료되었습니다.";
	case "update":
		sql = "update member_tbl_02 set custname = ?, phone = ?, address =?, joindate = ?, grade = ?, city = ? where custno = ?";
		move_url="getMember.jsp?custno=" + custno;
		msg = "회원정보 수정이 완료되었습니다.";
	}
	PreparedStatement stmt = conn.prepareStatement(sql);
	//DB에 저장하기
	//저장후 이동할 화면 알려주기
	//3. 질의문 준비

	//4. 질의문 세팅
	stmt.setString(1, custname);
	stmt.setString(2, phone);
	stmt.setString(3, address);
	stmt.setDate(4, joindate);
	stmt.setString(5, grade);
	stmt.setString(6, city);
	if(action.equals("update")){
		stmt.setString(7, custno);
	}
		
	//5. 질의문 실행
	stmt.executeUpdate();
	
	//6. 닫기
	if(conn != null){
		conn.close();
	}
	if(stmt != null){
		stmt.close();
	}
	
%>
<script>
	alert('<%=msg%>');
	location.replace('<%=move_url%>')
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>