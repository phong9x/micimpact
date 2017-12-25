<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- File generated by Telosys Tools Generator ( version 2.1.0 ) - Date 2015-12-09 ( Time 16:26:40 ) -->

<div class="wrap">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s"    uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<%@ taglib tagdir="/WEB-INF/tags/input" prefix="input"%>
<%@ taglib tagdir="/WEB-INF/tags/display" prefix="display"%>
<%@ taglib tagdir="/WEB-INF/tags/trams" prefix="trams_c"%>
<c:url value="/" var="root"></c:url>
	<div class="container recommends">
		<div class="contents">
		<div class="search_box admin_user">
			<div class="title">
				추천카드 관리
				<a class="btn btn-info" href="javascript:void(0)" onclick="popupSearchCard()">카드추가</a>
			</div>
			<script type="text/javascript">
				$(function() {
				    $("#sortable").sortable();
				    $("#sortable").disableSelection();
				});
			</script>
		</div>
		<form id="recommend_rank">
			<div class="save_box" >
				<button type="button" class="btn btn-success" id="save_rank">순위 저장</button>
			</div>
			<ul id="sortable">
				<c:forEach items="${list}" var="mainList"  varStatus="status" begin="0" end="${fn:length(list)}">
					<li class="ui-state-default" value="${mainList.id}">
						<span id="item">
							<div class="title_box">
								<span class="title">
									<c:forEach var="cards" items="${listOfCardsListItem}">
										<c:if test="${cards.id == mainList.cardId}">${cards.title}</c:if>
									</c:forEach>
								</span>
								<span class="rank">
									${status.index+1}
								</span>
							</div>
							<c:forEach var="cards" items="${listOfCardsListItem}">
								<c:if test="${cards.id == mainList.cardId}">
									<c:url var="img_path" value="https://d3i0w6mgohqrwj.cloudfront.net/${cards.thumbnailUrl}"/>
								</c:if>
							</c:forEach>
							<div class="img_main" style="background-image: url('${img_path}');">
								<jsp:text/>
							</div>
							<div class="btn_option">
								<c:url var="path_delete" value="/admin/manage_recommend_cards/delete/${mainList.id}"></c:url>
								<button type="button" class="btn btn-danger" onclick="updateRecommend('${path_delete}')">추천 해제</button>
							</div>
						</span>
					</li>
				</c:forEach>
			</ul>
		</form>
		<SCRIPT type="text/javascript">
			function updateRecommend(url){
				if (confirm("추천을 해제하시겠습니까?")) {
					$.ajax({
						type:"POST",
						url:url,
						dataType : 'json',
						success:function(data) {
							var jdata = data;
							if (jdata.success != true){
								alert(jdata.message);
							}else{
								$(location).attr('href', 'manage_recommend_cards');
							}
						},
						error:function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							//alert("통신오류가 발생하였습니다. 재시도 해주세요.");
						}
					});
				}
			}
			
			$(function() {
				var arrData = [];
				var obj = {};
				$("#save_rank").click(function() {
					$("#sortable li" ).each(function( index ) {
						var setKey = "index"+ (index+1);
						var setValue = $( this ).attr("value");				
						obj[setKey] = setValue;
						arrData.push(obj)
					});	
					rankUpdate(arrData);
				});
			});
			
			function rankUpdate(data){
				var json = JSON.stringify(data);
				var formData = new FormData();
				formData.append("data", json);			
				jQuery.ajaxSettings.traditional = true;
	
				$.ajax({
					url : '/admin/manage_recommend_cards/update_sort',
					data : formData,
					dataType : 'json',
					processData : false,
					contentType : false,
					type : 'POST',
					success : function(data) {
						var jdata = data;
						if (jdata.success != true){
							alert(jdata.message);
						}else{
							alert(jdata.message);
							refreshPage();
						}
					},
					error : function(response) {
						alert(response);
					}
				});
			}
			
			function popupSearchCard() {
		        var popUrl = "${root}admin/manage_cards/popup_search_card/recommendCard";
		        var popOption = "width=750, height=800, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
		        var newWindow = window.open(popUrl, "", popOption);
		        newWindow.focus();
			}
			
			function refreshPage() {
				$(location).attr('href', '/admin/manage_recommend_cards');
			}
		</SCRIPT>
	</div>
	</div>
</div>