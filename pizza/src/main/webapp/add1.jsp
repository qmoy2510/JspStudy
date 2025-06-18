<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>(과정평가형 2018-12) 피자전문점 판매관리 프로그램 ver1.0</title>
<link rel="stylesheet" href="./css/style.css?after">
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
		<h2>매출전표등록</h2>
		<form name="form" action="addAction1.jsp" onreset="fnReset()" onsubmit="return fnAdd()">
			<table>
				<tr>
					<td>매출전표번호</td>
					<td><input type="text" name="saleno"></td>
				</tr>
				<tr>
					<td>지점코드</td>
					<td><input type="text" name="scode"></td>
				</tr>
				<tr>
					<td>판매일자</td>
					<td><input type="text" name="saledate"></td>
				</tr>
				<tr>
					<td>피자코드</td>
					<td><select name="pcode">
						<option value="" hidden selected>피자선택</option>
						<option value="AA01">고르곤졸라피자</option>
						<option value="AA02">치즈피자</option>
						<option value="AA03">페퍼로니피자</option>
						<option value="AA04">콤비네이션피자</option>
						<option value="AA05">고구마피자</option>
						<option value="AA06">포테이토피자</option>
						<option value="AA07">불고기피자</option>
						<option value="AA08">나폴리피자</option>
					</select></td>
				</tr>
				<tr>
					<td>판매수량</td>
					<td><input type="text" name="amount"></td>
				</tr>
				<tr>
					<td colspan="2"><button type="submit">전표등록</button>
						<button type="reset">다시쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="footer.jsp" %>	
	<script>
	function fnAdd() {
		if(!form.saleno.value){
			alert("매출전표번호가 입력되지 않았습니다.");
			form.saleno.focus();
			return false;
		}
		else if(!form.scode.value){
			alert("지점코드가 입력되지 않았습니다.");
			form.scode.focus();
			return false;
		}
		else if(!form.saledate.value){
			alert("판매일자가 입력되지 않았습니다.");
			form.saledate.focus();
			return false;
		}
		else if(!form.pcode.value){
			alert("피자코드가 입력되지 않았습니다.");
			form.pcode.focus();
			return false;
		}
		else if(!form.amount.value){
			alert("판매수량이 입력되지 않았습니다.");
			form.amount.focus();
			return false;
		}
		else{
			alert("매출전표가 정상적으로 등록 되었습니다.");	
			return true;
		}
	}
		
		function fnReset() {
			alert("정보를 지우고 처음부터 다시 입력 합시다!");	
		}
	</script>
</body>
</html>