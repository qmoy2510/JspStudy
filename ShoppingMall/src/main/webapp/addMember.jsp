<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbConnection.jsp"%>
<%
//회원번호 자동생성하기
//DB작업

//3. 질의문 준비
String sql = "select nvl(max(custno),0) + 1 custno from member_tbl_02";
PreparedStatement stmt = conn.prepareStatement(sql);
//4. 질의문 세팅
//5. 질의문 실행
int custno = 0;
ResultSet rs = stmt.executeQuery();
if (rs.next())
	custno = rs.getInt("custno");
//6. 질의문 닫기
if(conn != null) conn.close();
if(stmt != null) stmt.close();
%>
<script>
	function validation(){
		const phoneRegexp = /^0\d{1,2}-\d{3,4}-\d{4}$/;
		const dateRegexp = /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/;
		const gradeRegexp = /^[ABC]$/;
		const cityRegexp = /^\d{2}$/;
		
		if(form.custname.value === ""){
			alert("회원 성명이 입력되지 않았습니다.");
			form.custname.focus();
			return false;
		}
		
		if(form.phone.value === ""){
			alert("전화번호가 입력되지 않았습니다.");
			form.phone.focus();
			return false;
		}
		else{
			if(!phoneRegexp.test(form.phone.value)){
				alert("전화번호를 형식에 맞게 입력하세요");
				form.phone.focus();
				return false;
			}
		}

		if(form.address.value === ""){
			alert("주소가 입력되지 않았습니다.");
			form.address.focus();
			return false;
		}

		if(form.joindate.value === ""){
			alert("가입일자가 입력되지 않았습니다.");
			form.joindate.focus();
			return false;
		}
		else{
			if(!dateRegexp.test(form.joindate.value)){
				alert("가입일자를 형식에 맞게 입력하세요");
				form.joindate.focus();
				return false;
			}
		}

		if(form.grade.value === ""){
			alert("등급이 입력되지 않았습니다.");
			form.grade.focus();
			return false;
		}
		else{
			if(!gradeRegexp.test(form.grade.value)){
				alert("등급은 A,B,C중에서 입력하세요");
				form.grade.focus();
				return false;
			}
		}

		if(form.city.value === ""){
			alert("도시코드가 입력되지 않았습니다.");
			form.city.focus();
			return false;
		}
		else{
			if(!cityRegexp.test(form.city.value)){
				alert("도시코드를 똑바로 입력해주세요");
				form.city.focus();
				return false;
			}
		}

		return true;
	}
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	text-decoration: none;
	list-style: none;
}

header {
	height: 100px;
	width: 100%;
	background-color: blue;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
}

menu>ul {
	height: 70px;
	width: 100%;
	background-color: #ddd;
	display: flex;
	align-items: center;
}

menu>ul>li {
	margin-left: 60px;
}

section {
	background-color: #eee;
	height: 700px;
	display: flex;
	align-items: center;
	flex-direction: column;
}

section>h2 {
	align-self: center;
	margin-top: 30px;
	margin-bottom: 30px;
}

footer {
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
			<li><a href = 'addMember.jsp')>회원등록</a></li>	
			<li><a href = 'getMemberList.jsp')>회원목록조회/수정</a></li>	
			<li><a href = 'memberMoney.jsp')>회원매출조회</a></li>		
			<li><a href = '#')>홈으로.</a></li>	
		</ul>
	</menu>
	<section>
		<h2>홈쇼핑 회원 등록</h2>
		<form name="form" action="action.jsp" method="post" onsubmit="return validation()">
			<input type="hidden" name="action" value="insert">
			<table>
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno" value=<%=custno%>></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="date" name="joindate"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP, B:일반, C:직원]</td>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"></td>
				</tr>
			</table>
			<input type ="submit" value="등록"/><button type="button"  onclick="location.href='getMember.jsp'">조회</button>
		</form>
	</section>
	<footer>
		<p>오늘따라 비가 추적추적 내리는 하루네요</p>
	</footer>
</body>
</html>