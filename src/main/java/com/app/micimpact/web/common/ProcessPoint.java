package com.app.micimpact.web.common;


import javax.annotation.Resource;

import com.app.micimpact.business.service.PointService;
import com.app.micimpact.business.service.mapping.PointServiceMapper;


public class ProcessPoint{
	@Resource
	private PointService pointService;
	@Resource
	private PointServiceMapper pointServiceMapper;
	public static final Integer LOGIN_FIRST =50;
	public static final Integer POINT_LOGIN =20;
	public static final Integer POINT_COMMENT =4;
	public static final Integer POINT_SHARE =3;
	public static final Integer POINT_SEE_CONTENT =2;
	public static void main(String[] args) {
		System.out.println(level_up(2200, 31));
	}
	public static Integer level_up(Integer point,Integer level){
		if(level<21){
				return point/50+1;
		}else if(21<=level && level<31){
			point=point-1000;
				return (point/100)+21;
		}else if(30<=level && level<40){
			point=point-2000;
				return (point/200)+31;
			
		}else if(40<=level && level<50){
			point=point-4000;
				return (point/300)+41;
		}
		return level;
		}
	
//	public static Integer get_current_point(Integer point,Integer level){
//		if(point==null && level!=null){
//			return 0;
//		}
//		if(level<21){
//				point= (point-level*50);
//		}else if(21<=level && level<31){
//			point=point - 1000-(level-20)*100;
//		}else if(21<=level && level<41){
//			point=point - 2000-(level-30)*200;
//		}else if(41<=level && level<51){
//			point=point - 4000-(level-40)*300;
//		}else{
//			point=0;
//		}
//		return point;
//		}
	}
	



	

