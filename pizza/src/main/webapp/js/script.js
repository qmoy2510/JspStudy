function fnAdd() {
	if(!form.num2.value){
		alert("학번이 입력되지 않았습니다.");
		form.num2.focus();
		return false;
	}
	else if(!form.num3.value){
		alert("성명이 입력되지 않았습니다.");
		form.num3.focus();
		return false;
	}
	else if(!form.num4.value){
		alert("성별이 선택되지 않았습니다.");
		return false;
	}
	else{
		alert("저장되었습니다.");	
		return true;
	}
}
function fnReset() {
	alert("정보를 지우고 처음부터 다시 입력 합시다!");	
}