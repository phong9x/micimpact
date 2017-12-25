
function submitContents() {
	if (!isEmpty()) {
		var index = $("#index").val();
		var file = "#file"+index;
		$(file).remove();
		try {
			$('#cards_form').ajaxSubmit({
				url : $(this).attr('action'),
				type : "POST",
				data : $(this).serialize(),
				dataType : 'json',
				success : function(data) {
					var jdata = data;
					var root = root_url.length;
					if(root_url.charAt(root_url.length-1)=='/'){
						root_url=root_url.substring(0,root_url.length-1);
					}
					if (jdata.success != true){
						console.log(1);
						alert(jdata.message);
					}else{
						console.log(2);
						if(index != 0){
							$('#file-form').ajaxSubmit({
								url : $('#file-form').attr('action') +"/"+jdata.cardId,
								type : "POST",
								data : $(this).serialize(),
								dateType : 'json',
								success : function(data) {
									var jdata = data;
									
									if (jdata.success != true){
										alert(jdata.message);
									}else{
										var url = jdata.url;    
										$(location).attr('href',root_url+url);
									}
								},
								error : function(response) {
									console.log(3);
									alert(JSON.stringify(response));
									var url = jdata.url;    
									$(location).attr('href',root_url+url);
								}
							});
						}else{
							console.log(4);
							var url = jdata.url;    
							$(location).attr('href',root_url+url);
						}
					}
				},
				error : function(response) {
					//console.log(5);
					//$(location).attr('href',root_url+url);
					window.location.assign(url)
					$(location).attr('href',root_url+url);
					//alert(response);
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
	var userId = $("#cards_userId").val();
	var categoryId = $("#categoryId").val();
//	var targetUrl = $("#cards_targetUrl").val();
	var title = $("#cards_title").val();
	var body = $("#cards_body").val();
	var type = $("#card_type").val();
//	var adIs = $("#cards_adIs").val();
//	var adMent = $("#cards_adMent").val();
//	var adLink = $("#cards_adLink").val();
//	var relatedCardId = $("#cards_relatedCardId").val();
	
	if (stringIsEmpty(userId)) {
		alert("사용자 아이디를 입력해 주세요.");
		result = true;
	} else if(selectIsEmpty(categoryId)){
		alert("카테고리를 선택해 주세요.");
		result = true;
//	} else if (stringIsEmpty(targetUrl)) {
//		alert("타겟URL을 입력해 주세요.");
//		result = true;
	} else if (stringIsEmpty(title)) {
		alert("제목을 입력해 주세요.");
		result = true;
	} else if (stringIsEmpty(body)) {
		alert("내용을 입력해 주세요.");
		result = true;
	} else if (selectIsEmpty(type)) {
		alert("타입을 입력해 주세요.");
		result = true;
//	} else if (stringIsEmpty(adIs)) {
//		alert("adIs를 입력해 주세요.");
//		result = true;
//	} else if (stringIsEmpty(adMent)) {
//		alert("adMent를 입력해 주세요.");
//		result = true;
//	} else if (stringIsEmpty(adLink)) {
//		alert("adLink를 입력해 주세요.");
//		result = true;
//	} else if (stringIsEmpty(relatedCardId)) {
//		alert("relatedCardId를 입력해 주세요.");
//		result = true;
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


function submitContents2(url) {
	console.log(url);
	if (!isEmpty()) {
		var index = $("#index").val();
		var file = "#file"+index;
		$(file).remove();
		try {
			$('#cards_form').ajaxSubmit({
				url : $(this).attr('action'),
				type : "POST",
				data : $(this).serialize(),
				dataType : 'json',
				success : function(data) {
					window.location.assign(url)
					$(location).attr('href',url);
				},
				error : function(response) {
					window.location.assign(url)
					$(location).attr('href',url);
				}
			});
			return false;
		} catch (e) {
			alert(e);
		}
	}
}