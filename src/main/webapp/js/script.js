function alert() {
	alert("다시 작성해주세요!");
}

function submit() {
	var frm = document.frm;
	
	if(frm.stid.value == "") {
		alert("학번이 입력되지 않았습니다!");
	}
	if(frm.subcode.value == "") {
		alert("과목코드가 입력되지 않았습니다!");
	}
	if(frm.mid.value == "") {
		alert("중간 점수가 입력되지 않았습니다!");
	}
	if(frm.fin.value == "") {
		alert("기말 점수가 입력되지 않았습니다!");
	}
	if(frm.attend.value == "") {
		alert("출석 점수가 입력되지 않았습니다!");
	}
	if(frm.report.value == "") {
		alert("레포트 점수가 입력되지 않았습니다!");
	}
	if(frm.etc.value == "") {
		alert("기타 점수가 입력되지 않았습니다!");
	}
	
	frm.submit();
}