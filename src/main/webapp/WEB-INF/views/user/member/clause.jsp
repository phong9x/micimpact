<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- File generated by Telosys Tools Generator ( version 2.1.1 ) - Date 2015-04-30 ( Time 14:31:38 ) -->

<div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s"    uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<%@ taglib tagdir="/WEB-INF/tags/input" prefix="input"%>
	<div class="container">
		<div class="wrap_menber">
			<h3 class="tit_member"><img src="/resources/images/member/tit_join.gif" alt="이용약관" /></h3>
			<!-- 약관정의 -->
			<div class="clause_contents">
				<div class="clause_box">
					<div class="title">
						xxxx <s:message code="terms.title"/>
						
					</div>
					<div class="clause_scroll">
						<jsp:include page="/WEB-INF/views/user/member/clause/access_terms.jsp"/>
					</div>
					<input type="checkbox" class="clause" name="check1" value="이용약관에 동의합니다."/>이용약관에 동의합니다.
				</div>
				<div class="clause_box">
					<div class="title">
						<s:message code="terms.privacy"/>
					</div>
					<div class="clause_scroll">
						<jsp:include page="/WEB-INF/views/user/member/clause/privacy_policy.jsp"/>
					</div>
					<input type="checkbox" class="clause" name="check2" value="개인정보 취급방침"/>이용약관에 동의합니다.
				</div>
				<div class="clause_box">
					<div class="title">
						제3자 제공에 대한 동의
					</div>
					<div class="clause_scroll" style="overflow: hidden;">
						<jsp:include page="/WEB-INF/views/user/member/clause/consent_parties.jsp"/>
					</div>
					<input type="checkbox" class="clause" name="check3" value="개인정보 취급방침"/>이용약관에 동의합니다.
				</div>
				<div class="all_check_box">
					<input type="checkbox" id="selecctall"  value="개인정보 취급방침"/><span>전체 약관에 동의합니다.</span>
				</div>
			</div>			
			<!--  -->
			<!-- //약관정의 -->
			<div class="btn_gp" style="margin-bottom: 50px;">
				<a href="#none" id="btn_clause_true">동의</a>
				<a href="/" id="btn_clause_false">비동의</a>
			</div>
			
			<SCRIPT type="text/javascript">
				$(function(){
					 $('#selecctall').click(function(event) {  //on click 
				        if(this.checked) { // check select status
				            $('.clause').each(function() { //loop through each checkbox
				                this.checked = true;  //select all checkboxes with class "checkbox1"               
				            });
				        }else{
				            $('.clause').each(function() { //loop through each checkbox
				                this.checked = false; //deselect all checkboxes with class "checkbox1"                       
				            });         
				        }	        
				    });
					 
					$('.clause').click(function(event){
						if ($("input:checkbox[name='check1']").is(":checked") && 
							$("input:checkbox[name='check2']").is(":checked") && 
							$("input:checkbox[name='check3']").is(":checked")) {
							$("#selecctall").prop('checked', true);
						}else{
							$("#selecctall").prop('checked', false);
						}
					});
				});
				
				$("#btn_clause_true").click(function(){
					if($("input:checkbox[id='selecctall']").is(":checked")){
						location.href = "/join";
					}else{
						alert("모든약관을 동의해주세요.");
					}
				});
				
				
			</SCRIPT>
		</div>
	</div>
	
</div>