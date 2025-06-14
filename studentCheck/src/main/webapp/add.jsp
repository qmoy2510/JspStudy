<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출결관리 프로그램 ver1.0</title>
</head>
<link rel="stylesheet" href="style.css?after">
<body>
	<%@include file="header.jsp"%>
	<%@include file="nav.jsp"%>
	<section>
		<h2>학생 등록</h2> <br>
		<form action="list.jsp" name="form" onsubmit="return beck()">
			<table>
				<tr>
					<td>학번</td>
					<td><input type="text" name="std_no"></td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input type="text" name="std_name"></td>
				</tr>
				<tr>
					<td colspan="2"><button type="submit" >등록</button></td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp"%>
</body>
<script>
	function beck() {
		if(!form.std_no.value){
			alert("학번이 입력되지 않았습니다.")
			form.std_no.focus();
			return false;
		}
		else if(!form.std_name.value){
			alert("성명이 입력되지 않았습니다.")
			form.std_name.focus();
			return false;
		}
		else{
			alert("학생 등록이 완료되었습니다.")
			return true;
		}
	}
</script>
</html>