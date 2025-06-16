function fnSave() {
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
function fnResetMsg() {
	alert("입력을 초기화 합니다.");	
}
function fnSearch() {
	if(form.num1.value == 1){
		alert("조회항목을 선택하지 않았습니다.");
		form.num1.focus();
		return false;
	}
	else if(!form.num2.value){
		alert("조회내용을 입력되지 않았습니다.");
		form.num2.focus();
		return false;
	}
	else{
		alert("저장되었습니다.");	
		return true;
	}
}