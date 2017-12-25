-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.35-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table micimpact.cards
CREATE TABLE IF NOT EXISTS `cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `thumbnail_url` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_url` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) DEFAULT '0' COMMENT '0 우리영상\n1 youtube\n2 image or gif',
  `count_like` int(11) NOT NULL DEFAULT '0',
  `share` int(11) NOT NULL DEFAULT '0',
  `runing_time` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ad_is` int(11) DEFAULT '0',
  `ad_ment` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_link` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `related_card_id` int(11) DEFAULT NULL,
  `hit_count` int(11) DEFAULT '0',
  `comment_count` int(11) DEFAULT '0',
  `actor` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `actor_job` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `vertical_thumbnail_url` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `actor` (`actor`),
  KEY `FK_cards_channel` (`channel_id`),
  CONSTRAINT `FK_cards_channel` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.cards: ~29 rows (approximately)
DELETE FROM `cards`;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` (`id`, `user_id`, `category_id`, `thumbnail_url`, `target_url`, `title`, `body`, `type`, `count_like`, `share`, `runing_time`, `created_at`, `ad_is`, `ad_ment`, `ad_link`, `related_card_id`, `hit_count`, `comment_count`, `actor`, `actor_job`, `vertical_thumbnail_url`, `channel_id`) VALUES
	(1, 1, 4, 'thumbnail/a6d7c175-7b6a-4411-8acc-6778fba0b8b6.jpg', 'stream_output/2b3f202f-2e62-4fca-85fe-87dadbf349dd/2407d8aa038ef8d965823ab8632b75842fb3ca62c07e89786a2d065c8a701203.m3u8', '왜 우리는 불안한가', '현대인의 불안은 어디서 찾아오는 걸까요?. 알랭드 보통의 강연을 통해 살펴 봅시다.', 0, 4, 23, NULL, '2015-12-23 15:00:00', 1, '청춘 페스티벌 티켓 오픈 확인하기!', 'http://naver.com', 2, 1494, 9, '알랭 드 보통', '소설가', 'vertical_thumbnail/a61bce7c-2c87-4517-8c84-54b2f440817f.png', NULL),
	(2, 1, 2, 'thumbnail/6979a1ee-3164-4cb2-a441-fd83e637c2ab.jpg', NULL, '감정이 없을 때 좋은 가사가 나오는 원리', '김이나의 가사를 쓰는 법', 2, 4, 8, NULL, '2015-12-23 15:00:00', 0, NULL, NULL, NULL, 1553, 3, '김이나', '작사가', 'vertical_thumbnail/5b71efff-feb1-444a-9caa-76090c104463.png', NULL),
	(3, 1, 1, 'thumbnail/cc.jpg', NULL, '왜 우리는 불안한가', '현대인의 불안은 어디서 찾아오는 걸까요?. 알랭드 보통의 강연을 통해 살펴 봅시다.', 2, 1, 8, NULL, '2016-01-04 15:00:00', 0, NULL, NULL, NULL, 1575, 16, '???', '????', 'vertical_thumbnail/a8dab35d-1045-46ca-93bd-0a9af8a6b261.jpg', 14),
	(4, 1, 3, 'thumbnail/cf578cf5-ca80-43be-be71-4974bd4ebe08.jpg', NULL, '왜 우리는 불안한가', '현대인의 불안은 어디서 찾아오는 걸까요?. 알랭드 보통의 강연을 통해 살펴 봅시다.', 2, 4, 3, NULL, '2016-01-11 01:40:52', 0, NULL, NULL, NULL, 1226, 4, '???', '???', 'vertical_thumbnail/c54900a4-101d-46a3-b43d-8bb481652fc4.png', 14),
	(5, 1, 2, 'thumbnail/18ddcd0e-1e9a-47c9-a299-71fc9105285f.jpg', NULL, '왜 우리는 불안한가', '현대인의 불안은 어디서 찾아오는 걸까요?. 알랭드 보통의 강연을 통해 살펴 봅시다.', 2, 1, 1, NULL, '2016-01-11 01:40:52', 0, NULL, NULL, NULL, 520, 3, '???', '???', 'vertical_thumbnail/1f68d83d-570f-4180-ac5f-b395cdd4078a.jpg', NULL),
	(6, 1, 1, 'thumbnail/e6270ac0-e969-40e1-a760-df619e7c223b.png', NULL, '왜 우리는 불안한가', '현대인의 불안은 어디서 찾아오는 걸까요?. 알랭드 보통의 강연을 통해 살펴 봅시다.', 2, 3, 4, NULL, '2016-01-11 01:41:28', 0, NULL, NULL, NULL, 408, 0, '???', '???', 'vertical_thumbnail/005b7884-0310-4662-8f1f-c35a98f4385f.png', NULL),
	(7, 1, 1, 'thumbnail/12829f20-c425-4d1f-9620-d61093a94579.jpg', NULL, '왜 우리는 불안한가', '현대인의 불안은 어디서 찾아오는 걸까요?. 알랭드 보통의 강연을 통해 살펴 봅시다.', 2, 0, 0, NULL, '2016-01-11 07:53:36', 0, '?????? ???? ? ??? ??? ?????!', 'http://micimpact.com/', 0, 327, 1, '?? ? ??', '???', 'vertical_thumbnail/a77671ff-f8fc-4e0a-a448-fff88141f413.jpg', NULL),
	(24, 1, 5, 'thumbnail/8cf94796-9b4b-40f7-aa05-fe725b656a54.jpg', NULL, '실패가 두려운 사람들에게 하고 싶은 이야기', '저는 지금까지 실패한 경험 덕분에 성공에 더 가까워졌다고 생각해요', 2, 0, 0, NULL, '2016-01-14 05:15:27', 0, NULL, NULL, NULL, NULL, NULL, '사유리', '방송인', 'vertical_thumbnail/5d965e85-4433-44e4-843c-570d067038be.png', NULL),
	(25, 1, 3, 'thumbnail/b15f93ad-f258-40f7-b5fb-b9077c5ca483.jpg', 'stream_output/225dee84-de24-4084-a0d1-d5a682f0436b/5e8c90b2d20331e1355740c9c18983bc36070a41d828e9c3dd2db0afd3621bc1.m3u8', '병신 같지만 그럴싸한 멘토 설정하는 법', '나보다 훌륭하지 않은 사람을 멘토로 삼아야 하는 이유', 0, 1, 0, NULL, '2016-01-14 08:18:22', 0, NULL, NULL, NULL, 38, 0, '유병재', '방송인', NULL, NULL),
	(26, 1, 1, NULL, NULL, '어떤 사람을 계속 만나야 하는가', 'The World Changing Story 세상을 바꾸는 이야기 마이크임팩트 Copyrightⓒ2016 By MICIMPACT. All right reserved.', 2, 0, 0, NULL, '2016-01-18 07:17:35', 1, '그랜드 마스터 클래스 : 빅 퀘스천 2016', 'http://www.grandmasterclass.com/2016/index.php', NULL, 353, 0, '박웅현', '광고인', 'vertical_thumbnail/3b31418d-0d5f-4d3e-8d5e-c77907593076.png', NULL),
	(27, 1, 1, 'thumbnail/6c845465-4692-4037-b91c-02a91765cee1.mp4_000027977', 'stream_output/b14ac1d8-2505-4d9b-b07e-071a0ad963ea/d417f35dc2a9758505c0039a5f7c03fb37ef23dc89051d90c118f0a03aabcc33.m3u8', '정말 사랑하는 사람을 못 만나서 슬픈 당신에게', '청춘페스티벌 2015', 0, 1, 5, NULL, '2016-01-18 08:55:54', 0, NULL, NULL, NULL, 443, 29, '윤종신', '가수', NULL, NULL),
	(31, 1, 5, 'thumbnail/e0a2c0fe-0635-4b67-91ab-5dc5b4ffe6b2.mp4_20160309_153413', 'stream_output/05b34e89-2e94-4d9f-aa5f-1c0737387160/c35e4802edd330a242a9b4c51152c45e8e7a21f9e57ec54159d8fba88d906698.m3u8', '국가 브랜드를 정할 때 가장 중요한 것', '"대한민국의 브랜드는 오히려 우리와 같은 외국인들이 정하는 것입니다."', 0, 0, 0, NULL, '2016-03-09 06:29:56', 0, NULL, NULL, NULL, 16, 0, '기 소르망', '칼럼니스트', NULL, NULL),
	(35, 1, 2, 'thumbnail/d1c73d44-c2a9-4c1b-b7ee-b2a706f92678.mp4_20160309_163509', 'stream_output/ac641db3-1abb-4d20-ad1c-0d5ee4031e07/8dd2af83e6cacc8ccf466472f7d1604f0a6235f9119a7a1181bac35f5bfbcbaa.m3u8', '이루고 싶은 게 있는 사람들의 공통된 생각', '"저한테 그건 그냥 계속 하는 거예요. 생활이고 삶이에요."', 0, 0, 0, NULL, '2016-03-09 08:00:48', 0, NULL, NULL, NULL, 31, 0, '강레오', '쉐프', NULL, NULL),
	(36, 1, 6, 'thumbnail/08c5bafd-6807-4dd5-a804-841427a151ce.mp4_20160309_172655', 'stream_output/fce6532b-037c-4187-b844-5cc96ca7139c/fa3c4599d4ec6c4caddc2d24102b45d138a53ab9bd134403b494344c1fcda05b.m3u8', '별은 어떻게 태어나서 어떻게 죽는가', '"산소, 질소, 탄소는 우주 공간에 있던 게 아니고 별이 태어나고 죽어가는 과정에서 생겨나요."', 0, 0, 0, NULL, '2016-03-09 08:46:05', 0, NULL, NULL, NULL, 4, 0, '이명현', '천문학자', NULL, NULL),
	(38, 1, 4, 'thumbnail/27374f3b-4b57-4067-b36a-fef1ade0aedb.wmv_20160309_194127', 'stream_output/4b2c74e8-4ee0-47b7-8d91-a72c2a872a9d/688a89092c757f6f02931338d2d2be3497301ceb0addf7b9869641e86d49c40a.m3u8', '장기하와 얼굴들 앨범 커버의 제작 스토리', '"실제로 제가 의료기기 매장에 가서 심장 모형을 구입을 했고요."', 0, 0, 0, NULL, '2016-03-09 10:46:21', 0, NULL, NULL, NULL, 1, -1, '김기조', '타이포그래퍼', NULL, NULL),
	(39, 1, 6, 'thumbnail/3be647c7-ca35-4ded-9eb6-2d84dea9a58f.mp4_20160310_112554', 'stream_output/6e029f4c-e2f4-45c8-98fe-1c6279782317/00504aa8dda4c77e2e5dd22cd942df2ce1839621db88bcab624291b5121fce15.m3u8', '과학이 인문학과 별개일 수 없는 이유', '"인문은 인간에 대한 탐구입니다. 인간에 대한 탐구로서 21세기에 어떤 분야들이 거기에 기여하고 있나요? 과학을 빼놓고 이야기 할 수 있나요?"', 0, 0, 0, NULL, '2016-03-10 02:26:42', 0, NULL, NULL, NULL, 1, 0, '장대익', '과학철학자', NULL, NULL),
	(40, 1, 11, 'thumbnail/59c43bc1-aadb-45ac-bc6f-7a90cbdef950.mp4_20160310_114112', 'stream_output/b379c0b9-c086-4f12-8081-901e30ac0690/83cef2c608e0269db3124c38b477f58ab279eaeb44e6973b7c1085b18a2ee757.m3u8', '건달한테 사채를 빌리고 가스총을 쏜 만화가', '"사채로 5천만원을 빌리고 1년을 안 갚아보자. 그러면 건달들이 어떻게 나오는지 보고 그 스토리를 쓰자."', 0, 0, 0, NULL, '2016-03-10 02:43:30', 0, NULL, NULL, NULL, 1, 0, '김성모', '근성의 만화가', NULL, NULL),
	(41, 1, 8, 'thumbnail/9de2c57d-3b0d-403a-af47-b36f8e71b41e.mp4_20160310_120828', 'stream_output/948dc989-d4ac-4d3b-b6df-a44ab401cd59/ff9e3c17f6912dbdfaa237783134e58108db8eebe0b22404eaf1505c47e3e3bb.m3u8', '번아웃이 되어서 퇴사하고 싶은 당신에게', '"마음 상태가 안 좋을 때는 우선 중요한 결정을 하지 마세요."', 0, 0, 0, NULL, '2016-03-10 03:12:22', 0, NULL, NULL, NULL, 1, 0, '우종민', '정신과 의사', NULL, NULL),
	(42, 1, 8, 'thumbnail/f426f95d-cf3e-4e1c-9c73-5f1d261b0caa.mp4_20160310_121912', 'stream_output/ae08677d-9674-4afd-b9a3-2bbe9cecd2dc/becefeff3acdd9723ef3553e61ee86fb846678bdb8410d53c3a464116c4eb15c.m3u8', '안정적인 직장이 보람이 없어 고민이라면', '"이 고민이 회사 때문은 아니에요. 이 고민은 본인 때문이에요."', 0, 0, 0, NULL, '2016-03-10 03:22:44', 0, NULL, NULL, NULL, 0, 0, '유수연', '독설 전문 영어강사', NULL, NULL),
	(43, 1, 3, 'thumbnail/671e4d9e-c949-4f0f-9384-5cceebf7aad0.mp4_20160310_141100', 'stream_output/3470608b-04c8-4e1d-8fa4-dc132395a975/8da84e91ed04ae448b01e552f889c91fbae58d2ba7d09cf0956f65c8748e35a6.m3u8', '딱 맞는 사람을 알기 위해 필요한 연애 경험', '"클럽에 가는 걸 싫어하는 남자한테 여러분이 어떻게 반응하는지 알려면, 여러분이 클럽을 가봐야 돼요."', 0, 0, 0, NULL, '2016-03-10 05:09:32', 0, NULL, NULL, NULL, 1, 0, '김미경', '스피치 강사', NULL, NULL),
	(44, 1, 10, 'thumbnail/7ee9cc7f-4171-437e-863e-a1a1a164a17f.jpg', 'stream_output/63fb9432-9735-4844-90cb-04a4a480c83d/d4bc3bb96bd9fcec7291a6198d4754493f99b4159117f12efd0a535175e1368c.m3u8', '새로운 게 나올 수 없는 환경에서 성공하는 방법', '"조금씩의 변주가 쌓이다보면 원심력이 생기면서 자기 것이 되는 거예요."', 0, 0, 0, NULL, '2016-03-10 05:18:56', 0, NULL, NULL, NULL, 0, 0, '김구라', 'MC', NULL, NULL),
	(45, 1, 5, 'thumbnail/e6d58f60-b2bd-4818-91b1-2af627bc0b81.mp4_20160310_142427', 'stream_output/4a1e9e37-8584-4090-ba52-309a27b4b39b/4a201b4487483e2fac7e8969a3ae3beccf4b3207b0c62b36ae0f798e67cc2e2e.m3u8', '영상의 홍수 속에서도 빛나는 소설의 강점', '"스마트폰만 보는 시대에 소설을 읽기가 쉽지 않죠. 하지만 소설이 가진 강점이 있어요."', 0, 0, 0, NULL, '2016-03-10 05:26:39', 0, NULL, NULL, NULL, 0, 0, '김영하', '소설가', NULL, NULL),
	(46, 1, 3, 'thumbnail/5f5d32fc-239c-4bbc-9d77-1c07d4994b98.mp4_20160310_143213', 'stream_output/aabd0e24-ab0c-4157-94d1-47a40361e521/ac9fe0bfd6f511b978352f5bd7da44c34dcc2a562747c49932235e8f693a0339.m3u8', '사랑과 조건 사이에서 고민하는 당신에게', '"20대, 30대 젊은 여성 분들의 고민상담 메일의 절반 이상은 이런 메일입니다."', 0, 0, 0, NULL, '2016-03-10 05:36:32', 0, NULL, NULL, NULL, 0, 0, '김어준', '딴지일보 총수', NULL, NULL),
	(47, 1, 10, 'thumbnail/5d63c444-d3a8-4e65-9a46-da96571b04be.wmv_20160310_145330', 'stream_output/c1635297-bb53-4e5d-b05b-434d13f16499/96509eb14ce0fefe18bfaecfe6e9d6134d7bbf5524d96a2d3538260a0da21267.m3u8', '좋아하는 일에 용기를 내게 해줬던 한마디', '"부끄러운 그림인지, 부끄럽지 않은 그림인지 판단하는 것은 작가의 일이 아니에요."', 0, 0, 0, NULL, '2016-03-10 05:49:42', 0, NULL, NULL, NULL, 0, 0, '김그래', '웹툰 작가', NULL, NULL),
	(48, 1, 11, 'thumbnail/6207870e-5fc6-4dfa-ad0d-b842d0d679ae.wmv_20160310_150007', 'stream_output/8a3f2bc6-efbc-4baf-9190-bba0a12b27b1/5a39f5bd264106afec283745ebadaff5fd9a19d9fc42d5d8907f11d1b51abced.m3u8', '아무것도 모르던 스무살의 패션 입문기', '"고등학교 2학년 때 서울에 올라와서 청바지를 처음 입어봤어요."', 0, 0, 0, NULL, '2016-03-10 06:02:24', 0, NULL, NULL, NULL, 0, 0, '김원중', '모델킹', NULL, NULL),
	(49, 1, 9, 'thumbnail/dacab060-23f9-402a-853a-ff87f2c38b99.mp4_20160310_150456', 'stream_output/d41da298-c047-4692-8aa9-2e659dc9c515/6c9b862b7a21feb317a3e7d6e4bd011d007260a5969fcd327a779a26728e159f.m3u8', '힘든 조건과 환경 때문에 슬퍼하는 당신에게', '"저 사람들은 온 몸으로 운명을 해석하고 살았구나. 그래서 저 사람은 온 몸이 콘텐츠고 입만 벌리면 명언이구나."', 0, 0, 0, NULL, '2016-03-10 06:09:02', 0, NULL, NULL, NULL, 0, 0, '김미경', '스피치 강사', NULL, NULL),
	(50, 1, 11, 'thumbnail/b491a209-7686-4fd5-a49a-7daa81cd2725.mp4_20160310_151224', 'stream_output/8c3c8040-eade-4e39-9e2f-6a2e2902e3b9/fb845bf19875f6e6ea5e95f63b458c4599eb3681e0672617db8941b3b75ea8ee.m3u8', '연매출 30억 청년장사꾼의 비루했던 첫 시작', '"5명을 모아서 20만원씩 걷었어요."', 0, 0, 0, NULL, '2016-03-10 06:14:28', 0, NULL, NULL, NULL, 0, 0, '김윤규', '청년장사꾼', NULL, NULL),
	(51, 1, 9, 'thumbnail/83f70dec-1cd9-42a7-9eec-ddc9f8a0d275.mp4_20160310_152903', 'stream_output/58e18fa6-a916-44c0-a13d-2d0d59ab3845/727fc5a7417730977c6d6f1db5825c3c188883fee279d7b188cf20573b1024a6.m3u8', '새로운 고비 앞에서 두려워하는 당신에게', '"그 언덕을 넘어서 뒤에 있는 세상을 내가 모르니까 공포스러웠던 거예요."', 0, 0, 0, NULL, '2016-03-10 06:32:38', 0, NULL, NULL, NULL, 1, 0, '홍석천', '이태원 탑게이', NULL, NULL),
	(53, 1, 7, 'thumbnail/43e4daee-6410-46f2-a61f-be4afbe57892.mp4_20160310_155052', 'https://www.youtube.com/watch?v=_2jRVKqYuVs', '섹시하게 말 잘하는 사람이 되는 쉬운 방법', '"머리 속에 있는 이야기를 음성으로 바로 녹음을 해요."', 1, 0, 0, NULL, '2016-03-10 06:55:50', 0, NULL, NULL, NULL, 0, 0, '김지양', '66100 편집장', NULL, NULL);
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;


-- Dumping structure for table micimpact.channel
CREATE TABLE IF NOT EXISTS `channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `cards_recent_id` int(11) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `introduce` varchar(500) DEFAULT NULL,
  `likes` int(11) DEFAULT '0',
  `favorite` int(11) DEFAULT '0',
  `is_show` int(1) DEFAULT '1',
  `is_liked` int(1) DEFAULT '0',
  `is_favorited` int(1) DEFAULT '0',
  `type` int(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_channel_cards` (`cards_recent_id`),
  KEY `FK_channel_users` (`user_id`),
  CONSTRAINT `FK_channel_cards` FOREIGN KEY (`cards_recent_id`) REFERENCES `cards` (`id`),
  CONSTRAINT `FK_channel_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.channel: ~2 rows (approximately)
DELETE FROM `channel`;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` (`id`, `user_id`, `cards_recent_id`, `title`, `introduce`, `likes`, `favorite`, `is_show`, `is_liked`, `is_favorited`, `type`, `created_at`) VALUES
	(14, 144, 1, 'Fairy Tale', 'This is introduce', 1, 1, 1, 1, 1, 1, '2016-03-17 10:30:34'),
	(25, 136, NULL, 'asdas', '', 0, 0, 1, 1, 1, 0, '2016-03-21 10:42:19');
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;


-- Dumping structure for table micimpact.channel_favorite
CREATE TABLE IF NOT EXISTS `channel_favorite` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.channel_favorite: ~1 rows (approximately)
DELETE FROM `channel_favorite`;
/*!40000 ALTER TABLE `channel_favorite` DISABLE KEYS */;
INSERT INTO `channel_favorite` (`_id`, `channel_id`, `user_id`, `created_at`) VALUES
	(3, 14, 144, '2016-03-22 11:43:32');
/*!40000 ALTER TABLE `channel_favorite` ENABLE KEYS */;


-- Dumping structure for table micimpact.channel_like
CREATE TABLE IF NOT EXISTS `channel_like` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.channel_like: ~1 rows (approximately)
DELETE FROM `channel_like`;
/*!40000 ALTER TABLE `channel_like` DISABLE KEYS */;
INSERT INTO `channel_like` (`_id`, `channel_id`, `user_id`, `created_at`) VALUES
	(3, 14, 144, '2016-03-22 13:40:50');
/*!40000 ALTER TABLE `channel_like` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
