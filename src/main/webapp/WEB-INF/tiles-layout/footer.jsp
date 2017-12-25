<%@page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ page session="true" %>
<div id="Footer">
	<div class="inner_top">
		<div class="center_root">
			<ul>
				<li><a href="#">회사소개</a></li>
				<li><a href="#">제휴문의</a></li>
				<li><a href="#">이용약관</a></li>
				<li><a href="#">Privacy Notice</a></li>
			</ul>
			<select onchange="window.open(value,'_blank');">
				<option value="" hidden="true">관련 사이트 바로가기</option>
				<option value="http://www.naver.com">네이버</a></option>
				<option value="http://www.daum.net">다음</a></option>
			</select>
		</div>
	</div>
	<div class="inner_bottom">
		<div class="center_root">
			<div class="bottom_logo">
				<img src="/resources/images/common/logo_footer.gif" alt="하단 POSA 로고" />
			</div>
			<div class="address">
				<dl>
					<dd>한국우편산업 진흥원 (150-987) 서울시 영등포구 영중로83(영등포동7가) | Tel. 02-3443-1351-2 | Fax. 02-3443-1354</dd>
					<dd>EMS Onepack © Copyright 2015 EMS Onepack. All rights reserved.</dd>
				</dl>
			</div>
		</div>
	</div>
</div>