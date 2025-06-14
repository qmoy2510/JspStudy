<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css?after">
<title>편의점 메출 관리 ver 1.0</title>
</head>
<body>
	<header><h1>편의점 메출 관리 ver 1.0</h1></header>
	<%@include file="nav.jsp" %>	
	<section>
		<h2>편의점 메출관리 프로그램</h2>
		<p>
			편의점 매출정보와 상품관리를 위한 데이터베이스를 구축하고 편의점매출관리 프로그램을 작성하는 프로그램이다.<br>
			프로그램 작성순서<br>
			1. 상품정보 테이블을 생성한다.<br>
			2. 매출정보 테이블을 생성한다.<br>
			3. 점포정보 테이블을 생성한다.<br>
			4. 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.<br>
			5. 매출등록 프로그램을 작성한다.<br>
			6. 상품관리 (등록, 수정, 삭제) 프로그램을 작성한다.<br>
			7. 매출현황 조회 프로그램을 작성한다.<br>
		</p>
	</section>
	<footer>
		<p>HRDKOREA Copyright@2016 All rights reserved, Human Resorces Development Service of Korea</p>
	</footer>
</body>
</html>