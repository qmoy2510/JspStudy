<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		text-decoration: none;
		list-style: none;
	}
	header{
		height: 100px;
		width: 100%;
		background-color: blue;
		display: flex;
		align-items: center;
		justify-content: center;
		color: white;
	}
	menu > ul{
		height: 70px;
		width: 100%;
		background-color: #ddd;
		display: flex;	
		align-items: center;
	}
	menu > ul > li{
		margin-left: 60px;
	}
	section{
		background-color: #eee;
		height: 700px;
		display: flex;
		flex-direction: column;
		
		
	}
	section > h2{
		align-self: center;
		margin-top: 30px;
		margin-bottom: 30px;
	}
	footer{
		height: 80px;
		width: 100%;
		background-color: blue;
		display: flex;
		align-items: center;
		justify-content: center;
		color: white;
	}
</style>
<body>
	<header>
		<h1>쇼핑몰 회원관리 ver 1.0</h1>	
	</header>
	<menu>
		<ul>		
			<li><a href = 'AddMemberCtrl')>회원등록</a></li>	
			<li><a href = 'GetMemberListCtrl')>회원목록조회/수정</a></li>	
			<li><a href = 'MemberMoneyCtrl')>회원매출조회</a></li>	
			<li><a href = '#')>홈으로.</a></li>	
		</ul>
	</menu>
	<section>
		<h2>쇼핑몰 회원관리 프로그램</h2>
		<p>
		쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다. <br> 
		프로그램 	작성 순서 <br>
		1. 회원정보 테이블을 생성한다.<br>
		2. 매출정보 테이블을 생성한다.<br>
		3. 회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.<br>
		4. 회원정보 입력 화면프로그램을 작성한다.<br>
		5. 회원정보 조회 프로그램을 작성한다.<br>
		6. 회원매출정보 조회 프로그램을 작성한다.<br>
		</p>
	</section>
	<footer>
		<p>오늘따라 비가 추적추적 내리는 하루네요</p>
	</footer>
</body>
</html>