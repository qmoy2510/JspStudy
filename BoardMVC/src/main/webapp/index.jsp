<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<title>Index Page</title>
</head>
<body>
	<div align="center" style="margin: auto auto; height: 100%">
		<h1>게시판 제작 예제</h1>
		<br>
		<br>
		if(<%=session.getAttribute("name") %> == null){
		<div style="width: 800px;">
			<a href="login.jsp">로그인</a> | 
			<a href="GetBoardListCtrl">글 목록</a> | 
			<a href="addBoard.jsp">글 쓰기</a>
		</div>
		}else{
		<div style="width: 800px">
			<a href="LogoutCtrl.jsp">로그아웃</a> | 
			<a href="GetBoardListCtrl">글 목록</a> | 
			<a href="addBoard.jsp">글 쓰기</a>
		</div>
		}
	</div>
</body>
</html>