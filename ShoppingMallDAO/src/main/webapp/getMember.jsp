<%@page import="vo.MemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberVO vo = (MemberVO) request.getAttribute("vo");
%>
<script>
	function validation() {
		const phoneRegexp = /^0\d{1,2}-\d{3,4}-\d{4}$/
		const dateRegexp = /^\d{4}-(0)[1-9]|(1)[012]-0[1-9]|[12][0-9]|(3) [01]$/
		const gradeRegexp = /^[ABC]$/
		const cityRegexp = /^\d{2}$/

		if (form.custname.value === "") {
			alert("회원 성명이 입력되지 않았습니다.")
			form.custname.focus();
			return false;
		}

		if (form.phone.value === "") {
			alert("전화번호가 입력되지 않았습니다.")
			form.phone.focus();
			return false
		} else {
			if (!phoneRegexp.test(form.phone.value)) {
				alert("전화번호를 형식에 맞게 입력하세요.")
				form.phone.focus();
				return false
			}
		}

		if (form.address.value === "") {
			alert("주소가 입력되지 않았습니다.")
			form.address.focus();
			return false;
		}

		if (form.joindate.value === "") {
			alert("가입일자가 입력되지 않았습니다.")
			form.joindate.focus();
			return false
		} else {
			if (!dateRegexp.test(form.joindate.value)) {
				alert("가입일자를 형식에 맞게 입력하세요.")
				form.joindate.focus();
				return false
			}
		}

		if (form.grade.value === "") {
			alert("등급이 입력되지 않았습니다.")
			form.grade.focus();
			return false;
		} else {
			if (!gradeRegexp.test(form.grade.value)) {
				alert("등급을 형식에 맞게 입력하세요.")
				form.grade.focus();
				return false
			}
		}

		if (form.city.value === "") {
			alert("도시코드가 입력되지 않았습니다.")
			form.city.focus();
			return false;
		}else{
			if (!cityRegexp.test(form.city.value)) {
				alert("도시코드를 형식에 맞게 입력하세요.")
				form.city.focus();
				return false
			}
		}
		return true;
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver 1.0</title>
<link rel="stylesheet" href="style.css">
<style>
table, th, td {
	border: 1px solid #a9a9a9;
}

th {
	border: 1px solid #a9a9a9;
}

td {
	border: 1px solid #a9a9a9;
}
</style>
</head>
<body>
	<header>
		<h1>쇼핑몰 회원관리 ver 1.0</h1>
	</header>
		<nav><%@include file="nav.jsp"%></nav>
	<section>
		<div align="center">
			<h2>홈쇼핑 회원 수정</h2>
		</div>
		<br> <br>
		<div align="center">
			<form name="form" action="EditActionCtrl" method="post" onSubmit="return validation()">
				<input type="hidden" name="action" value="insert">
				<table>
					<tr>
						<td>회원번호</td>
						<td><input type="text" name="custno" value="<%=vo.getCustno()%>"></td>
					</tr>
					<tr>
						<td>회원이름</td>
						<td><input type="text" name="custname"  value="<%=vo.getCustname()%>"/></td>
					</tr>
					<tr>
						<td>회원전화</td>
						<td><input type="text" name="phone" value="<%=vo.getPhone()%>" /></td>
					</tr>
					<tr>
						<td>회원주소</td>
						<td><input type="text" name="address" value="<%=vo.getAddress()%>" /></td>
					</tr>
					<tr>
						<td>가입일자</td>
						<td><input type="date" name="joindate" value="<%=vo.getJoindate()%>" /></td>
					</tr>
					<td>고객등급 [A:VIP,B:일반,C:직원]</td>
					<td><input type="text" name="grade" value="<%=vo.getGrade()%>" /></td>
					</tr>
					<td>도시코드</td>
					<td><input type="text" name="city" value="<%=vo.getCity()%>" /></td>
					</tr>
					<tr>
						<td colspan=2 align=center><input type="submit" value="수정" />
							<button type="button"
								onclick="location.href='GetMemberListCtrl';">조회</button></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<footer><%@include file="footer.jsp"%></footer>
</body>
</html>