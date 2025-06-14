<%@page import="vo.RentalVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서대여관리 ver 1.0</title>
<link rel="stylesheet" href="style.css?after">
</head>
<%
	String msg = (String) session.getAttribute("msg");
	if(msg != null && msg.equals("대여도서등록이 완료되었습니다.") != true){
		%>
		<script type = "text/javascript">
		alert('<%=msg %>');
		</script>
		<%
		session.removeAttribute("msg");
	}
	RentalVO vo = (RentalVO) request.getAttribute("vo");
%>
<script>
	function validation() {

		if (form.rent_ymd.value === "") {
			alert("대여일자가 입력되지 않았습니다.")
			form.custname.focus();
			return false;
		}

		if (form.rent_no.value === "") {
			alert("대여번호가 입력되지 않았습니다.")
			form.phone.focus();
			return false
		} 

		if (form.rent_book.value === "") {
			alert("도서코드가 입력되지 않았습니다.")
			form.address.focus();
			return false;
		}

		if (form.rent_rent.value === "") {
			alert("고객번호가 입력되지 않았습니다.")
			form.joindate.focus();
			return false
		}

		if (form.close_ymd.value === "") {
			alert("반납기한이 입력되지 않았습니다.")
			form.grade.focus();
			return false;
		}
		return true;
	}
</script>
<body>
	<header>
		<h1>도서대여관리 ver 1.0</h1>
	</header>
	<%@include file="menu.jsp"%>
	<section>
		<div align="center">
			<h2>대여도서 등록</h2>
		</div>
		<form name="form" action="AddRentalBookActionCtrl" method="post" onSubmit="return validation()">
			<input type="hidden" name="action" value="insert">
			<table>
				<tr>
					<td>대여일자</td>
					<td><input type="text" name="rent_ymd" value="<%=vo.getRentYmd()%>"/></td>
				</tr>
				<tr>
					<td>대여번호(자동채번)</td>
					<td><input type="text" name="rent_no" value="<%=vo.getRentNo()%>"/></td>
				</tr>
				<tr>
					<td>도서코드</td>
					<td><input type="text" name="rent_book" /></td>
				</tr>
				<tr>
					<td>고객번호</td>
					<td><input type="text" name="rent_rent" /></td>
				</tr>
				<tr>
					<td>반납기한(대여일 7일후)</td>
					<td><input type="text" name="close_ymd" value="<%=vo.getReturnYmd()%>"/></td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type="submit" value="등록" />
						<button type="button" onclick="location.href='BookMemberListCtrl';">조회</button></td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<p>오늘따라 비가 추적추적 내리는 하루네요</p>
	</footer>
</body>
</html>