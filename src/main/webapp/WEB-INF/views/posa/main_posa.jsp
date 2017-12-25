<div class="wrap">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.trams.com/ctl/ui" prefix="ui" %>
    
    <div class="container">
    
    	<div class="first_row">
    		<div class="right_col">
    			<img alt="이벤트 슬라이드" src="#" />
    		</div>
    		<div class="left_col">
	    		<div class="exchange_rate_root">
		    		<div class="title">고시환율 정보</div>
		    		<div class="contents">
		    			<p>금주의 고시환율</p>
		    			<p><img alt="국기" src="/resources/images/flag_icon/ko.png">1029.80</p>
		    		</div>
		    	</div>
		    	
		    	<div class="link_button_root">
		    		<div class="ems_tracking_button">
			    		<div><img alt="물건위치조회" src="#" /></div>
			    		<div>EMS TRACKING</div>
			    		<div>EMS로 빠르게 물건 위치 조회하기</div>
		    		</div>
		    		<div class="charges_button">
			    		<div><img alt="이용요금" src="#" /></div>
			    		<div>이용요금 안내</div>
			    		<div>배송요금 및 부가서비스 요금 정보를 한 눈에!</div>
		    		</div>
		    	</div>
    		</div>
    	</div>
    	<div class="clear"></div>
    	
    	<div class="second_row">
    		<h2>지금 바로 구매가능한 우체국 쇼핑만의 추천상품!</h2>
			<div style="height: 200px; background: green;">
				
			</div>
    	</div>
    	<div class="clear"></div>
    	
    	<div class="third_row">
    		<div>
    			<h1>우체국 쇼핑과 함께하는 제휴사</h1>
	   			<a href="javascript:void()" class="slide_button">오</a>
	   			<a href="javascript:void()" class="slide_button">왼</a>
    		</div>
    		<div class="clear"></div>
    		<div class="banner_root">
    			<ul>
    				<li class="first"><img alt="제휴사1" src="#" /></li>
    				<li><img alt="제휴사2" src="#" /></li>
    				<li><img alt="제휴사3" src="#" /></li>
    			</ul>
    		</div>
    	</div>
    	<div class="clear"></div>
    
		<div class="fourth_row">
			<div class="board_box">
				<div class="board_box_title">
					<span>공지사항</span>
					<span class="more"><a href="#">+</a></span>
				</div>
				<div class="board_box_body" id="notice01_menu">
					<ul>
						<li><a href="">· 오픈 이벤트 10% 추가 포인트 적립..</a>
							<span class="date">2015-05-20 </span></li>
						<li><a href="">· 오픈 이벤트 10% 추가 포인트 적립..</a>
							<span class="date">2015-05-20 </span></li>
						<li><a href="">· 오픈 이벤트 10% 추가 포인트 적립..</a>
							<span class="date">2015-05-20 </span></li>
						<li><a href="">· 오픈 이벤트 10% 추가 포인트 적립..</a>
							<span class="date">2015-05-20 </span></li>
					</ul>
				</div>
			</div>
			
			<div class="board_box">
				<div class="board_box_title">
					<span>FAQ</span>
					<span class="more"><a href="#">+</a></span>
				</div>
				<div class="board_box_body" id="notice01_menu">
					<ul>
						<li><a href="">· 오픈 이벤트 10% 추가 포인트 적립..</a>
							<span class="date">2015-05-20 </span></li>
						<li><a href="">· 오픈 이벤트 10% 추가 포인트 적립..</a>
							<span class="date">2015-05-20 </span></li>
						<li><a href="">· 오픈 이벤트 10% 추가 포인트 적립..</a>
							<span class="date">2015-05-20 </span></li>
						<li><a href="">· 오픈 이벤트 10% 추가 포인트 적립..</a>
							<span class="date">2015-05-20 </span></li>
					</ul>
				</div>
			</div>
			
			<div class="contact_box">
				<p>02-3440-0000</p>
				<p>cs@emspack.com</p>
				<p>운영시간|09:00~18:00</p>
				<p>점심시간|12:00~13:00</p>
				<p>토요일, 일요일, 공유일은</p>
				<p>휴무이니 1:1 문의를 이용해주세요.</p>
			</div>
		</div>
    	<div class="clear"></div>
		
		<div id="quick_menu">
			<div class="title">퀵메뉴</div>
			<div class="menus">
				<img alt="배송신청" src="#"/>
				<div>배송신청</div>
			</div>
			<div class="menus">
				<img alt="나의 주소" src="#"/>
				<div>나의 주소</div>
			</div>
			<div class="menus">
				<img alt="이용가이드" src="#"/>
				<div>이용가이드</div>
			</div>
			<div class="menus">
				<img alt="커뮤니티" src="#"/>
				<div>커뮤니티</div>
			</div>
			
		</div>
		
    </div> <!-- /container -->
</div>
