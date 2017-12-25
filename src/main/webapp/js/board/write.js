var oEditors = [];

nhn.husky.EZCreator.createInIFrame({
	oAppRef : oEditors,
	elPlaceHolder : "body",
	sSkinURI : root_url+"smartEditor/SmartEditor2Skin.html",
	htParams : {
		bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : false, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	},

	fCreator : "createSEditor2"
});
function submitContents() {
	oEditors.getById["body"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
	console.log(">>>>>>>>>>>");
	if (!isEmpty()) {
		var index = $("#index").val();
		var file = "#file"+index;
		$(file).remove();
		try {
			$('#write-form').ajaxSubmit({
				url : $(this).attr('action'),
				type : "POST",
				data : $(this).serialize(),
				dataType : 'text',
				success : function(data) {
					data = data.replace(/[<][^>]*[>]/gi, '');
					var jdata = JSON.parse(data);
//					alert(JSON.stringify(jdata));
					if (jdata.success != "true"){
						alert(jdata.message);
					}else{
						if(index != 0){
							$('#file-form').ajaxSubmit({
								url : $('#file-form').attr('action') +"/"+jdata.message,
								type : "POST",
								data : $(this).serialize(),
								dateType : 'text',
								success : function(data) {
									data = data.replace(/[<][^>]*[>]/gi, '');
									var jdata = JSON.parse(data);
							
									if (jdata.success != "true"){
										alert(jdata.message);
									}else{
										var url = jdata.url+"?bType="+jdata.bType;    
										$(location).attr('href',url);
									}
								},
								error : function(response) {
									alert(JSON.stringify(response));
									var url = jdata.url+"?bType="+jdata.bType;    
									$(location).attr('href',url);
								}
							});
						}else{
							var url = jdata.url+"?bType="+jdata.bType;    
							$(location).attr('href',url);
						}
					}
				},
				error : function(response) {
					alert(response);
				}
			});
			return false;
		} catch (e) {
			
			alert(e);
		}
	}
}
function isEmpty() {
	var result = false;
	var type = $("#posting-type").val();
	var title = $("#title").val();
	var body = $("#body").val();
	
	
	if(selectIsEmpty(type)){
		alert("글 종류를 선택해 주세요.");
		result = true;
	}else if (stringIsEmpty(title)) {
		alert("제목을 입력해 주세요.");
		result = true;
	} else if (bodyIsEmpty(body)) {
		alert("내용을 입력해 주세요.");
		result = true;
	}
	
	return result;
}
function stringIsEmpty(str) {
	var blank_pattern = /^\s+|\s+$/g;
	if (str == '' || str == null) {
		return true;
	} else if (str.replace(blank_pattern, '') == "") {
		return true;
	}

	return false;
}
function bodyIsEmpty(body) {
	if (body === "<p>&nbsp;</p>") {
		return true;
	}
	return false;
}
function selectIsEmpty(select) {
	var result = true;
	if (select) {
		result = false;
	}
	return result;
}
