
function GetQueryStringParams(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');

    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam)
        {
            return sParameterName[1];
        }
    }
} 

//아이디에 한글 포함
function isKorean(objStr) {
	for (i = 0; i < objStr.length; i++) {
        if (((objStr.charCodeAt(i) > 0x3130 && objStr.charCodeAt(i) < 0x318F) || (objStr.charCodeAt(i) >= 0xAC00 && objStr.charCodeAt(i) <= 0xD7A3))) {
            return false;      // 한글 포함이면 false 반환
        } else {
            return true;       // 한글 미포함이면 true 반환
        }
    }
}

//이메일 형식 체크
function fn_emailChk(mail) {
	var bol = true;
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if (exptext.test(mail) != true) {
		//alert('이메일 형식이 올바르지 않습니다.');
		bol = false;
	}
	return bol; // bol 값을 반환 . 이메일 형식이 아니면 false
}

//콤마 찍기
function inputNumber(element) { 
//	console.log(element.value);
	element.value = comma(uncomma(element.value));
//	console.log(element.value);
}
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

// row 삭제(row로 쓰는 모든곳)
function row_delete(url) {
	if (confirm('삭제하시겠습니까?')){
		$.ajax({
			type:"GET",
			url:url,
			success:function(result) {
				if(result=="true"){
					history.go(0);
				}else{
					alert("오류입니다. 관리자에게 문의해주시기 바랍니다.");
				}
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				//alert("통신오류가 발생하였습니다. 재시도 해주세요.");
			}
		});	
	};
}