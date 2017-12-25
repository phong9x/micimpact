/*
 * mail content body
 * 
 */
package com.app.micimpact.mail;

public class MailForm {
	public String emailJoinedBody()
	{
		String strRet = 
"				<div class='body' style='height:100%; width: 680px; margin: 0 auto; background-color:#fff;font-size:12px;color:#373535;line-height:1.5;'>"+
"					<div class='header'>"+
"						<img alt='Take Jeju' src='http://www.trams.co.kr:5678/resources/images/email/header.png'>"+
"					</div>"+
"					<div class='contents' style='position: relative; text-align: center; background-color:#EFEEEE;'>"+
"						<div class='main_img' style='height: 300px; width: 100%; background: url(http://www.trams.co.kr:5678/resources/images/email/img_main.jpg); background-size: 680px 300px; background-repeat: no-repeat;'>"+
"							<div class='main_img_button_root' style='padding-top: 85px;'>"+
"								<div><img alt='Take Jeju' src='http://www.trams.co.kr:5678/resources/images/email/img_01_top.png'></div>"+
"								<div style='margin-top: 22px;'><a href='http://www.trams.co.kr:5678/' target='_blank'><img alt='둘러보기' src='http://www.trams.co.kr:5678/resources/images/email/btn_top_reservation.png'></a></div>"+
"							</div>"+
"						</div>"+
"						<div class='stripe_bg' style='width: 100%; height: 31px; background: url(http://www.trams.co.kr:5678/resources/images/email/pttn.png);'></div>"+
"						<div class='middle_txt' style='margin-top: 47px; color: #4d4c4d; font-size: 20px; line-height: 40px; letter-spacing: -3px;'>"+
"							<p>안녕하세요!</p>"+
"							<p><span class='txt_bold' style='font-weight: bold;'>TAKEJEJU</span> 에 가입해주셔서 감사합니다.</p>"+
"							<p>테이크제주는 원하는 <span class='txt_bold' style='font-weight: bold;'>제주 펜션</span>을 손쉽게 검색, 예약할 수 있습니다.</p>"+
"							<p>테이크제주의 추천 펜션을 확인해보세요.</p>"+
"						</div>"+
"						<div class='reservation_root' style='clear: left; padding: 60px 0 124px 0;'>"+
"							<a href='http://www.trams.co.kr:5678/' target='_blank'><img alt='예약하러 가기' src='http://www.trams.co.kr:5678/resources/images/email/btn_02_go.png'></a>"+
"						</div>"+
"						<div class='infomations_root'>"+
"							<table cellpadding='0' cellspacing='0' border='0' style='width: 680px'>"+
"								<tr>"+
"									<td><img alt='문의전화' src='http://www.trams.co.kr:5678/resources/images/email/img_l_call.png' style='width: 340px;'/></td>"+
"									<td><img alt='입금계좌안내' src='http://www.trams.co.kr:5678/resources/images/email/img_r_bank.png' style='width: 340px; margin-left: -1px;'/></td>"+
"								</tr>"+
"							</table>"+
"						</div>"+
"						<div class='footer'><img alt='footer' src='http://www.trams.co.kr:5678/resources/images/email/footer.png'></div>"+
"					</div>"+
"				</div>";
		return strRet;
	}
	
	public String emailBody()
	{
		String strRet = 
"			<div class='body' style='height:100%; width: 680px; margin: 0 auto; background-color:#fff;font-size:12px;color:#373535;line-height:1.5;'>"+
"				<div class='header'>"+
"					<img alt='Take Jeju' src='http://www.trams.co.kr:5678/resources/images/email/header.png'>"+
"				</div>"+
"				<div class='contents' style='position: relative; text-align: center; background-color:#EFEEEE;'>"+
"					<div class='main_img' style='height: 300px; width: 100%; background: url(http://www.trams.co.kr:5678/resources/images/email/img_main.jpg); background-size: 680px 300px; background-repeat: no-repeat;'>"+
"						<div class='main_img_button_root' style='padding-top: 85px;'>"+
"							<div><img alt='Take Jeju' src='http://www.trams.co.kr:5678/resources/images/email/img_01_top.png'></div>"+
"							<div style='margin-top: 22px;'><a href='http://www.trams.co.kr:5678/' target='_blank'><img alt='둘러보기' src='http://www.trams.co.kr:5678/resources/images/email/btn_top_reservation.png'></a></div>"+
"						</div>"+
"					</div>"+
"					<div class='stripe_bg' style='width: 100%; height: 31px; background: url(http://www.trams.co.kr:5678/resources/images/email/pttn.png);'></div>"+
"					<div class='middle_title_root' style='margin-top: 16px;'>"+
"						<img alt='check' src='http://www.trams.co.kr:5678/resources/images/email/icon_01.png' class='img_check' style='margin-right: 9px;'><img alt='제주 펜션' src='http://www.trams.co.kr:5678/resources/images/email/txt_01.png'>"+
"					</div>"+
"					<div class='middle_image_root' style='margin-top: 30px;'>"+
"						<table cellpadding='0' cellspacing='0' border='0' style='margin-left: 20px;'>"+
"							<tr>"+
"								<td style='position: relative; width: 310px;'>"+
"									<a href='http://www.trams.co.kr:5678/' target='_blank'>"+
"										<img alt='실시간 펜션 검색' src='http://www.trams.co.kr:5678/resources/images/email/img_main.jpg' style='width: 310px;'>"+
"										<div>"+
"											<img alt='실시간 펜션 검색' src='http://www.trams.co.kr:5678/resources/images/email/box_01.png' style='width: 310px;'>"+
"										</div>"+
//"										<div class='hover_root' style='position: absolute; top: 0px; width: 310px; height: 100%; background: black; opacity: 0; text-align: center;' onmouseover='this.style.opacity=.5;' onmouseout='this.style.opacity=0;'>"+
//"											<img alt='자세히 보기' src='http://www.trams.co.kr:5678/resources/images/email/icon_02.png' style='width: 31px; height: 35px; margin-top: 58px;'>"+
//"										</div>"+
"									</a>"+
"								</td>"+
"								<td style='position: relative; width: 310px; padding-left: 19px;'>"+
"									<a href='http://www.trams.co.kr:5678/' target='_blank'>"+
"										<img alt='추천 펜션리스트' src='http://www.trams.co.kr:5678/resources/images/email/img_main.jpg' style='width: 310px;'>"+
"										<div>"+
"											<img alt='추천 펜션리스트' src='http://www.trams.co.kr:5678/resources/images/email/box_02.png' style='width: 310px;'>"+
"										</div>"+
//"										<div class='hover_root' style='position: absolute; top: 0px; width: 310px; height: 100%; background: black; opacity: 0; text-align: center;' onmouseover='this.style.opacity=.5;' onmouseout='this.style.opacity=0;'>"+
//"											<img alt='자세히 보기' src='http://www.trams.co.kr:5678/resources/images/email/icon_03.png' style='width: 30px; height: 43px; margin-top: 58px;'>"+
//"										</div>"+
"									</a>"+
"								</td>"+
"							</tr>"+
"						</table>"+
"					</div>"+
"					<div class='reservation_root' style='clear: left; padding: 34px 0 42px 0;'>"+
"						<a href='http://www.trams.co.kr:5678/' target='_blank'><img alt='예약하러 가기' src='http://www.trams.co.kr:5678/resources/images/email/btn_go.png'></a>"+
"					</div>"+
"					<div class='infomations_root'>"+
"						<table cellpadding='0' cellspacing='0' border='0' style='width: 680px'>"+
"							<tr>"+
"								<td><img alt='문의전화' src='http://www.trams.co.kr:5678/resources/images/email/img_l_call.png' style='width: 340px;'/></td>"+
"								<td><img alt='입금계좌안내' src='http://www.trams.co.kr:5678/resources/images/email/img_r_bank.png' style='width: 340px; margin-left: -1px;'/></td>"+
"							</tr>"+
"						</table>"+
"					</div>"+
"				</div>"+
"				<div><img alt='footer' src='http://www.trams.co.kr:5678/resources/images/email/footer.png'></div>"+
"			</div>";
		
		return strRet;
	}
}
