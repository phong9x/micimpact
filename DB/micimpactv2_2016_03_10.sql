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
  `channel_id` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `actor` (`actor`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.cards: ~30 rows (approximately)
DELETE FROM `cards`;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` (`id`, `user_id`, `category_id`, `thumbnail_url`, `target_url`, `title`, `body`, `type`, `count_like`, `share`, `runing_time`, `created_at`, `ad_is`, `ad_ment`, `ad_link`, `related_card_id`, `hit_count`, `comment_count`, `actor`, `actor_job`, `vertical_thumbnail_url`, `channel_id`) VALUES
	(1, 1, 4, 'thumbnail/a6d7c175-7b6a-4411-8acc-6778fba0b8b6.jpg', 'stream_output/2b3f202f-2e62-4fca-85fe-87dadbf349dd/2407d8aa038ef8d965823ab8632b75842fb3ca62c07e89786a2d065c8a701203.m3u8', '왜 우리는 불안한가', '현대인의 불안은 어디서 찾아오는 걸까요?. 알랭드 보통의 강연을 통해 살펴 봅시다.', 0, 4, 23, NULL, '2015-12-23 15:00:00', 1, '청춘 페스티벌 티켓 오픈 확인하기!', 'http://naver.com', 2, 1494, 9, '알랭 드 보통', '소설가', 'vertical_thumbnail/a61bce7c-2c87-4517-8c84-54b2f440817f.png', NULL),
	(2, 1, 2, 'thumbnail/6979a1ee-3164-4cb2-a441-fd83e637c2ab.jpg', NULL, '감정이 없을 때 좋은 가사가 나오는 원리', '김이나의 가사를 쓰는 법', 2, 4, 8, NULL, '2015-12-23 15:00:00', 0, NULL, NULL, NULL, 1553, 3, '김이나', '작사가', 'vertical_thumbnail/5b71efff-feb1-444a-9caa-76090c104463.png', NULL),
	(3, 1, 1, 'thumbnail/cc.jpg', NULL, '뚱뚱하고 섹시하게 사는 법', '옷에 몸을 맞추는 게 아니야', 2, 1, 8, NULL, '2016-01-04 15:00:00', 0, NULL, NULL, NULL, 1564, 16, '김지양', '디자이너', 'vertical_thumbnail/a8dab35d-1045-46ca-93bd-0a9af8a6b261.jpg', NULL),
	(4, 1, 3, 'thumbnail/cf578cf5-ca80-43be-be71-4974bd4ebe08.jpg', NULL, '아무리 힘들어도 꼭 가져야 할 마음', '“물론 나 자신이 밉고 한심할 때도 있으니 쉽지는 않지만, 내가 나를 좋아하려는 마음은 포기하지 않았으면 좋겠어요”', 2, 4, 3, NULL, '2016-01-11 01:40:52', 0, NULL, NULL, NULL, 1217, 5, '유병재', '방송인', 'vertical_thumbnail/c54900a4-101d-46a3-b43d-8bb481652fc4.png', NULL),
	(5, 1, 2, 'thumbnail/18ddcd0e-1e9a-47c9-a299-71fc9105285f.jpg', NULL, '벤처기업 대표가 생각하는 고비', '"솔직하게 얘길 나누면 의외로 사람들이 상식적인 수준에서 해결 방법들을 찾게 되는 것 같아요."', 2, 1, 1, NULL, '2016-01-11 01:40:52', 0, NULL, NULL, NULL, 508, 3, '김봉진', '사업가', 'vertical_thumbnail/1f68d83d-570f-4180-ac5f-b395cdd4078a.jpg', NULL),
	(6, 1, 1, 'thumbnail/e6270ac0-e969-40e1-a760-df619e7c223b.png', NULL, '대화의 기본', '“상대방 이야기를 잘 듣다 보면 그 이야기 속에 내가 더 얹어줄 수 있는 말이 있고요, 조금 빼줄 수 있는 이야기가 있고요, 조금 바꾸도록 조언해주고 싶은 부분이 있겠죠”', 2, 3, 4, NULL, '2016-01-11 01:41:28', 0, NULL, NULL, NULL, 391, 0, '표창원', '정치인', 'vertical_thumbnail/005b7884-0310-4662-8f1f-c35a98f4385f.png', NULL),
	(7, 1, 1, 'thumbnail/12829f20-c425-4d1f-9620-d61093a94579.jpg', NULL, '연애를 다른 길로 이끄는 것과 이를 되돌리는 방법', '"사랑이 계속되기 위해서는 상대에 대해 끝없이 물어봐야 합니다."', 2, 0, 0, NULL, '2016-01-11 07:53:36', 0, '마이크임팩트 스쿨에서 더 재밌는 강연을 확인하세요!', 'http://micimpact.com/', 0, 315, 1, '알랭 드 보통', '소설가', 'vertical_thumbnail/a77671ff-f8fc-4e0a-a448-fff88141f413.jpg', NULL),
	(24, 1, 5, 'thumbnail/8cf94796-9b4b-40f7-aa05-fe725b656a54.jpg', NULL, '실패가 두려운 사람들에게 하고 싶은 이야기', '저는 지금까지 실패한 경험 덕분에 성공에 더 가까워졌다고 생각해요', 2, 0, 0, NULL, '2016-01-14 05:15:27', 0, NULL, NULL, NULL, NULL, NULL, '사유리', '방송인', 'vertical_thumbnail/5d965e85-4433-44e4-843c-570d067038be.png', NULL),
	(25, 1, 3, 'thumbnail/b15f93ad-f258-40f7-b5fb-b9077c5ca483.jpg', 'stream_output/225dee84-de24-4084-a0d1-d5a682f0436b/5e8c90b2d20331e1355740c9c18983bc36070a41d828e9c3dd2db0afd3621bc1.m3u8', '병신 같지만 그럴싸한 멘토 설정하는 법', '나보다 훌륭하지 않은 사람을 멘토로 삼아야 하는 이유', 0, 1, 0, NULL, '2016-01-14 08:18:22', 0, NULL, NULL, NULL, 38, 0, '유병재', '방송인', NULL, NULL),
	(26, 1, 1, NULL, NULL, '어떤 사람을 계속 만나야 하는가', 'The World Changing Story 세상을 바꾸는 이야기 마이크임팩트 Copyrightⓒ2016 By MICIMPACT. All right reserved.', 2, 0, 0, NULL, '2016-01-18 07:17:35', 1, '그랜드 마스터 클래스 : 빅 퀘스천 2016', 'http://www.grandmasterclass.com/2016/index.php', NULL, 353, 0, '박웅현', '광고인', 'vertical_thumbnail/3b31418d-0d5f-4d3e-8d5e-c77907593076.png', NULL),
	(27, 1, 1, 'thumbnail/6c845465-4692-4037-b91c-02a91765cee1.mp4_000027977', 'stream_output/b14ac1d8-2505-4d9b-b07e-071a0ad963ea/d417f35dc2a9758505c0039a5f7c03fb37ef23dc89051d90c118f0a03aabcc33.m3u8', '정말 사랑하는 사람을 못 만나서 슬픈 당신에게', '청춘페스티벌 2015', 0, 1, 5, NULL, '2016-01-18 08:55:54', 0, NULL, NULL, NULL, 443, 31, '윤종신', '가수', NULL, NULL),
	(31, 1, 5, 'thumbnail/e0a2c0fe-0635-4b67-91ab-5dc5b4ffe6b2.mp4_20160309_153413', 'stream_output/05b34e89-2e94-4d9f-aa5f-1c0737387160/c35e4802edd330a242a9b4c51152c45e8e7a21f9e57ec54159d8fba88d906698.m3u8', '국가 브랜드를 정할 때 가장 중요한 것', '"대한민국의 브랜드는 오히려 우리와 같은 외국인들이 정하는 것입니다."', 0, 0, 0, NULL, '2016-03-09 06:29:56', 0, NULL, NULL, NULL, 16, 0, '기 소르망', '칼럼니스트', NULL, NULL),
	(35, 1, 2, 'thumbnail/d1c73d44-c2a9-4c1b-b7ee-b2a706f92678.mp4_20160309_163509', 'stream_output/ac641db3-1abb-4d20-ad1c-0d5ee4031e07/8dd2af83e6cacc8ccf466472f7d1604f0a6235f9119a7a1181bac35f5bfbcbaa.m3u8', '이루고 싶은 게 있는 사람들의 공통된 생각', '"저한테 그건 그냥 계속 하는 거예요. 생활이고 삶이에요."', 0, 0, 0, NULL, '2016-03-09 08:00:48', 0, NULL, NULL, NULL, 31, 0, '강레오', '쉐프', NULL, NULL),
	(36, 1, 6, 'thumbnail/08c5bafd-6807-4dd5-a804-841427a151ce.mp4_20160309_172655', 'stream_output/fce6532b-037c-4187-b844-5cc96ca7139c/fa3c4599d4ec6c4caddc2d24102b45d138a53ab9bd134403b494344c1fcda05b.m3u8', '별은 어떻게 태어나서 어떻게 죽는가', '"산소, 질소, 탄소는 우주 공간에 있던 게 아니고 별이 태어나고 죽어가는 과정에서 생겨나요."', 0, 0, 0, NULL, '2016-03-09 08:46:05', 0, NULL, NULL, NULL, 4, 0, '이명현', '천문학자', NULL, NULL),
	(38, 1, 4, 'thumbnail/27374f3b-4b57-4067-b36a-fef1ade0aedb.wmv_20160309_194127', 'stream_output/4b2c74e8-4ee0-47b7-8d91-a72c2a872a9d/688a89092c757f6f02931338d2d2be3497301ceb0addf7b9869641e86d49c40a.m3u8', '장기하와 얼굴들 앨범 커버의 제작 스토리', '"실제로 제가 의료기기 매장에 가서 심장 모형을 구입을 했고요."', 0, 0, 0, NULL, '2016-03-09 10:46:21', 0, NULL, NULL, NULL, 1, 0, '김기조', '타이포그래퍼', NULL, NULL),
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
	(53, 1, 7, 'thumbnail/43e4daee-6410-46f2-a61f-be4afbe57892.mp4_20160310_155052', 'stream_output/525058ea-2a94-42fa-9672-b53f1dda5f18/8c77c16fd27eb3a39da554dbdaabd75c896c546b9c3bfa05ddc2342645eba2fd.m3u8', '섹시하게 말 잘하는 사람이 되는 쉬운 방법', '"머리 속에 있는 이야기를 음성으로 바로 녹음을 해요."', 0, 0, 0, NULL, '2016-03-10 06:55:50', 0, NULL, NULL, NULL, 0, 0, '김지양', '66100 편집장', NULL, NULL);
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;


-- Dumping structure for table micimpact.card_tags
CREATE TABLE IF NOT EXISTS `card_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `card_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_name` (`card_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.card_tags: ~46 rows (approximately)
DELETE FROM `card_tags`;
/*!40000 ALTER TABLE `card_tags` DISABLE KEYS */;
INSERT INTO `card_tags` (`id`, `name`, `card_id`) VALUES
	(176, '불안', 1),
	(177, '알랭드보통', 1),
	(178, '철학', 1),
	(173, '김이나', 2),
	(174, '작사', 2),
	(175, '창작', 2),
	(201, '체형', 3),
	(202, '패션', 3),
	(170, '카', 6),
	(24, '백수', 18),
	(23, '아저씨', 18),
	(45, '백수', 19),
	(46, '아저씨', 19),
	(117, '테스트', 20),
	(118, '테스트', 21),
	(122, '테스트', 22),
	(120, '테스트', 23),
	(169, '위로', 24),
	(168, '#박웅현 #더메디치 #사랑 #연애', 26),
	(212, '#사랑 #연애 #고민 #윤종신 #청춘페스티벌', 27),
	(164, '#ㄹㄹ #ㄹㄹㄹ', 29),
	(211, '#문화 #브랜딩 #국가브랜딩 #기소르망 #칼럼니스트 #해외 #인터뷰', 31),
	(180, '#문화 #브랜딩 #국가브랜딩 #기소르망 #칼럼니스트 #해외 #외국할배', 32),
	(181, '#문화 #브랜딩 #국가브랜딩 #기소르망 #칼럼니스트 #해외 #외국할배', 33),
	(182, '#문화 #브랜딩 #국가브랜딩 #기소르망 #칼럼니스트 #해외 #외국할배', 34),
	(210, '#꿈 #열정 #의지 #동기부여 #강레오 #인터뷰', 35),
	(209, '#우주 #과학 #별 #이명현 #그랜드마스터클래스 #GMC', 36),
	(197, '#타이포그래퍼 #타이포그래피 #예술 #디자인 #김기조 #장기하 #앨범 #제작 #아트', 37),
	(208, '#타이포그래퍼 #타이포그래피 #예술 #디자인 #김기조 #장기하 #앨범 #제작 #아트 #메디치', 38),
	(207, '#과학 #인문학 #철학 #학문 #장대익 #그랜드마스터클래스 #GMC', 39),
	(229, '#에피소드 #의지 #열정 #김성모 #만화가 #청춘페스티벌', 40),
	(213, '#직장인 #직장 #번아웃 #스트레스 #과로 #퇴사 #고민 #일 #우종민 #의사 #인터뷰', 41),
	(230, '#직장인 #직장 #일 #고민 #유수연 #청춘고민상담소', 42),
	(216, '#사랑 #연애 #남녀 #이성 #김미경 #청춘페스티벌', 43),
	(218, '#조언 #성공 #방법 #김구라 #청춘페스티벌', 44),
	(219, '#인문사회 #인문 #소설 #글 #김영하 #그랜드마스터클래스 #GMC', 45),
	(227, '#사랑 #조건 #고민 #상담 #여성 #김어준 #청춘페스티벌', 46),
	(222, '#조언 #상담 #용기 #일 #김그래 #웹툰 #작가 #원더우먼페스티벌', 47),
	(226, '#에피소드 #예술 #패션 #김원중 #모델 #디자이너 #메디치 #더메디치', 48),
	(224, '#위로 #조언 #상담 #조건 #환경 #운명 #김미경 #인터뷰', 49),
	(225, '#에피소드 #장사 #사업 #김윤규 #청년장사꾼 #청춘페스티벌', 50),
	(231, '#위로 #고민 #두려움 #공포 #고비 #상담 #홍석천 #청춘페스티벌', 51),
	(232, '#여성 #섹시 #말 #습관 #방법 #김지양 #모델 #66100', 53);
/*!40000 ALTER TABLE `card_tags` ENABLE KEYS */;


-- Dumping structure for table micimpact.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.categories: ~11 rows (approximately)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `image_url`, `priority`) VALUES
	(1, '행복', 'category/img_happy.png', 1),
	(2, '꿈', 'category/img_dream.png', 2),
	(3, '사랑', 'category/img_love.png', 3),
	(4, '예술', 'category/img_art.png', 4),
	(5, '인문사회', 'category/img_society.png', 5),
	(6, '과학', 'category/img_science.png', 6),
	(7, '여성', 'category/img_woman.png', 7),
	(8, '직장인', 'category/img_worker.png', 8),
	(9, '위로', 'category/img_cheer_up.png', 9),
	(10, '조언', 'category/img_advice.png', 10),
	(11, '에피소드', 'category/img_episode.png', 11);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


-- Dumping structure for table micimpact.channel
CREATE TABLE IF NOT EXISTS `channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `introduce` varchar(500) DEFAULT NULL,
  `likes` int(11) DEFAULT '0',
  `favorite` int(11) DEFAULT '0',
  `is_show` int(1) DEFAULT '1',
  `type` int(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.channel: ~1 rows (approximately)
DELETE FROM `channel`;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` (`id`, `user_id`, `title`, `introduce`, `likes`, `favorite`, `is_show`, `type`, `created_at`) VALUES
	(13, 2, 'Channel test', 'This is introduce', 0, 0, 1, 1, '2016-03-10 14:03:15');
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;


-- Dumping structure for table micimpact.collections
CREATE TABLE IF NOT EXISTS `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id1` int(11) DEFAULT NULL,
  `card_id2` int(11) DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reveal` int(11) DEFAULT '0',
  `card_id3` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.collections: ~1 rows (approximately)
DELETE FROM `collections`;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` (`id`, `card_id1`, `card_id2`, `name`, `body`, `reveal`, `card_id3`) VALUES
	(1, 1, 2, '콜렉션1', '아주 좋아요', 1, 3);
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;


-- Dumping structure for table micimpact.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count_like` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.comments: ~35 rows (approximately)
DELETE FROM `comments`;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `card_id`, `user_id`, `body`, `created_at`, `count_like`) VALUES
	(1, 1, 1, 'adsfasdf', '2015-12-28 07:58:01', 1),
	(2, 1, 1, '1213123123', '2015-12-30 02:20:03', 0),
	(4, 1, 1, 'cdadsfasdf', '2015-12-30 02:21:35', 2),
	(5, 1, 8, '테테 테스트 시간지나 124356.#*+-.test', '2016-01-05 08:06:15', 0),
	(6, 1, 8, '댓글 test 123@#$★☞', '2016-01-05 08:12:56', 0),
	(8, 3, 8, 'test1', '2016-01-05 12:02:30', 0),
	(9, 3, 8, 'trst2', '2016-01-05 12:03:33', 0),
	(10, 3, 8, '댓글1', '2016-01-06 05:19:29', 0),
	(11, 3, 8, '댓글2', '2016-01-06 05:20:07', 0),
	(12, 3, 8, '내가 테스트', '2016-01-06 05:29:17', 0),
	(13, 3, 8, '내가 테스트', '2016-01-06 05:29:17', 0),
	(14, 3, 8, '댓글', '2016-01-06 05:37:11', 1),
	(16, 3, 8, '중복테스트', '2016-01-06 05:39:09', 1),
	(17, 3, 8, '두줄주뚜두두두두두두두두두두두두두두두두두두두두두두두두두또도도다다다다닫테스트으아우야그그구가대루가니러거가나238%9#&@*"-:?%¶®_•×~[°\\|[~[€\\€=hsjfjgwqwetupfozvzvxncmakagsfahdkgpoiiqyye¹11111111111111111111111111111&83&83&83&8&+$&+3:8$&8:8$&8%&+3*+$&+*+3&+&+3*+3&8&83*83&+%&+3&83&83*-83 ㅐ ㄷ핻핻핻핻래래헏럳럳렁러럳허렁러돚롣롲갣랟랟해핼랟래롣해도핻ㄹ핻핻핻ㄱ핻핻핻핻해하하대핟하핟하하햐하학핟하학핟핟하라핟핟핟핻헏핟핟헏핟ㅎㄷ핟핻하다더헏ㄹ핟허ㅏㄷ러덜뎌저럳러러러져젇러랃럳럳러렂렂럴재재으', '2016-01-06 12:43:41', 1),
	(18, 5, 8, '댓글댓글댓글댓글', '2016-01-11 17:54:33', 1),
	(19, 3, 8, '신기방기', '2016-01-13 04:20:58', 1),
	(20, 5, 17, '렝가 김봉진 수정 가능', '2016-01-13 04:39:42', 0),
	(21, 1, 17, '정말 유익하고 재미있어요!\n항상 감사하게 보고 있답니다.', '2016-01-13 04:49:19', 2),
	(22, 1, 17, '병아리  _(≥∇≤)ノミ☆특수문자', '2016-01-13 04:51:31', 0),
	(23, 2, 17, '서닌장 소오름 여자로\n랜스씨는 이제..', '2016-01-13 05:34:39', 0),
	(24, 4, 17, '카드 제목 4\n수정가능', '2016-01-13 05:36:10', 1),
	(25, 1, 17, 'SOS', '2016-01-13 05:39:27', 0),
	(26, 3, 17, '울랄라세션버스커버스커', '2016-01-13 05:40:02', 0),
	(27, 8, 17, '백작가 댓글\n\n', '2016-01-13 05:40:51', 1),
	(28, 1, 17, '수정이안돼요', '2016-01-13 06:12:12', 0),
	(29, 4, 19, '반갑습니다 서님장님', '2016-01-13 06:38:18', 0),
	(30, 3, 19, '심쿵하는 내용이네요ㅠㅠ', '2016-01-13 06:39:26', 3),
	(31, 2, 19, 'ㅎㅎㅎ웃고갑니다\n수정돼!', '2016-01-13 06:40:37', 1),
	(32, 8, 20, '임팩트있네요', '2016-01-14 05:11:36', 0),
	(33, 4, 17, '유병재 쥑이네~', '2016-01-14 06:04:42', 0),
	(36, 5, 17, '렛잇고\n자 이제 되지?', '2016-01-15 01:05:48', 0),
	(37, 2, 17, '10cm', '2016-01-15 01:06:53', 0),
	(41, 27, 8, '121231231231231\nqweqeqwqeqeq', '2016-02-01 02:36:48', 0),
	(42, 27, 8, 'asjdkajdkjsakdjkljaadas\nasdasdkaksdjkajsdlad\naldjalksjdklajdkljasdkl', '2016-02-01 02:57:05', 0),
	(43, 3, 97, '테스트', '2016-02-29 06:32:21', 1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


-- Dumping structure for table micimpact.comment_likes
CREATE TABLE IF NOT EXISTS `comment_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.comment_likes: ~18 rows (approximately)
DELETE FROM `comment_likes`;
/*!40000 ALTER TABLE `comment_likes` DISABLE KEYS */;
INSERT INTO `comment_likes` (`id`, `comment_id`, `card_id`, `user_id`) VALUES
	(1, 1, 1, 1),
	(13, 4, 1, 8),
	(16, 16, 3, 8),
	(17, 15, 3, 8),
	(22, 19, 3, 8),
	(23, 14, 3, 8),
	(25, 4, 1, 17),
	(26, 21, 1, 17),
	(27, 17, 3, 17),
	(28, 21, 1, 19),
	(29, 30, 3, 17),
	(30, 24, 4, 19),
	(31, 30, 3, 19),
	(32, 27, 8, 20),
	(33, 18, 5, 17),
	(34, 31, 2, 17),
	(37, 30, 3, 9),
	(38, 43, 3, 97);
/*!40000 ALTER TABLE `comment_likes` ENABLE KEYS */;


-- Dumping structure for table micimpact.errors
CREATE TABLE IF NOT EXISTS `errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error_code` varchar(255) NOT NULL,
  `error_massage` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.errors: ~0 rows (approximately)
DELETE FROM `errors`;
/*!40000 ALTER TABLE `errors` DISABLE KEYS */;
/*!40000 ALTER TABLE `errors` ENABLE KEYS */;


-- Dumping structure for table micimpact.heart_states
CREATE TABLE IF NOT EXISTS `heart_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.heart_states: ~22 rows (approximately)
DELETE FROM `heart_states`;
/*!40000 ALTER TABLE `heart_states` DISABLE KEYS */;
INSERT INTO `heart_states` (`id`, `name`) VALUES
	(1, '이루고 싶은 꿈이 있어요'),
	(2, '위로를 받고 싶어요'),
	(3, '사랑을 잘 하고 싶어요'),
	(4, '상담을 받고 싶어요'),
	(5, '지식과 지혜를 얻고 싶어요'),
	(6, '재밌는 이야기를 듣고 싶어요'),
	(7, '일을 잘 하고 싶어요'),
	(8, '행복하고 싶어요'),
	(9, '성공하고 싶어요'),
	(10, '새로운 자극이 필요해요'),
	(11, '아름다워지고 싶어요'),
	(12, '이루고 싶은 꿈이 있어요'),
	(13, '위로를 받고 싶어요'),
	(14, '사랑을 잘 하고 싶어요'),
	(15, '상담을 받고 싶어요'),
	(16, '지식과 지혜를 얻고 싶어요'),
	(17, '재밌는 이야기를 듣고 싶어요'),
	(18, '일을 잘 하고 싶어요'),
	(19, '행복하고 싶어요'),
	(20, '성공하고 싶어요'),
	(21, '새로운 자극이 필요해요'),
	(22, '아름다워지고 싶어요');
/*!40000 ALTER TABLE `heart_states` ENABLE KEYS */;


-- Dumping structure for table micimpact.images
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) NOT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.images: ~129 rows (approximately)
DELETE FROM `images`;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` (`id`, `card_id`, `image_url`) VALUES
	(4, 1, 'card_image/Blitzcrank_5.jpg'),
	(5, 1, 'card_image/Ezreal_5.jpg'),
	(15, 1, 'card_image/f44ab6c2-4451-4657-83d4-5bb66423c44e.jpg'),
	(16, 1, 'card_image/c66b8b24-2176-4d16-bd8e-2e299d7d4e86.jpg'),
	(23, 16, 'card_image/4f78bedf-9cfc-44ab-aad4-ae808d1fc0b5.jpg'),
	(24, 16, 'card_image/0077c329-d845-45fd-b303-cdb9072ad928.jpg'),
	(25, 18, 'card_image/1cbfe938-2fbb-4098-9500-a3ff942fb876.jpg'),
	(26, 18, 'card_image/86bd3cf2-0e91-46dc-a20f-6ba47a1def24.jpg'),
	(29, 19, 'card_image/7af97fd3-94bb-4e12-bf2c-970755c680b1.png'),
	(30, 2, 'card_image/75a712ab-d4c8-44b6-ba28-0d132f00fc93.png'),
	(31, 2, 'card_image/f305f705-4297-4b97-a4f8-27c3709c052d.png'),
	(32, 2, 'card_image/94498a3b-5f38-4f6b-9c01-01b0b235ba86.png'),
	(33, 2, 'card_image/a924cd1a-6188-4dcd-80b5-3416f4bbf974.png'),
	(34, 2, 'card_image/7e3f0752-2d4c-4fd7-b0a7-8f2e2c9f7b7a.png'),
	(35, 2, 'card_image/7c9e7b0c-40e5-419f-b8a6-774894276cf3.png'),
	(36, 2, 'card_image/6bcbf7ba-a1fc-488f-b8a7-0b2fa28b5fb8.png'),
	(37, 2, 'card_image/28267204-73ca-4896-b94e-bfcfbffc9948.png'),
	(39, 3, 'card_image/8ed7348e-7a80-4d4c-9b62-759d6d655305.jpg'),
	(40, 3, 'card_image/5123d107-da4f-4a5e-99f3-4f5c92f37c8e.jpg'),
	(41, 3, 'card_image/51eb46ec-33f3-4d63-985b-25d7f5d8b203.jpg'),
	(42, 3, 'card_image/61fbb05a-5e0a-4965-b293-0f1427caf52f.jpg'),
	(43, 3, 'card_image/5d1895e3-cfad-4ecc-abe3-515f1f2916ff.jpg'),
	(44, 3, 'card_image/97812518-0951-42c6-bfde-300333202157.jpg'),
	(45, 3, 'card_image/19222421-3dd3-4ff9-b73a-f1ead037086e.jpg'),
	(46, 3, 'card_image/ebd8f3e5-15e4-4755-b903-fd3d18795c16.jpg'),
	(47, 3, 'card_image/c8604011-5773-45e6-ba52-4e854b39d234.jpg'),
	(48, 3, 'card_image/6d322108-294a-4d27-b7e8-51cec150bcb2.jpg'),
	(49, 4, 'card_image/1660dac0-ab65-49e7-ba93-b1f425a1b4fb.jpg'),
	(50, 4, 'card_image/21d222f1-a6c5-4e52-a792-558049438380.jpg'),
	(51, 4, 'card_image/403d3adb-9c07-416f-99b5-b0eee0bc63fd.jpg'),
	(52, 4, 'card_image/c89fec5b-9111-4fe5-8929-fb9189c35ded.jpg'),
	(53, 4, 'card_image/70598604-f7c1-411d-9f08-be46610ef823.jpg'),
	(54, 4, 'card_image/34e213fa-6a21-47a9-bcb7-5b5ebbf90f1f.jpg'),
	(55, 4, 'card_image/7bfb35bf-8f1d-44bd-81f0-577d396f81bb.jpg'),
	(56, 4, 'card_image/9043b6c7-e0f7-460d-9947-4f4e9eedb231.jpg'),
	(57, 4, 'card_image/a4bb096e-58ed-4df2-ba69-69a9a33ff587.jpg'),
	(58, 5, 'card_image/753801d8-33c0-478f-a47b-f95e359dc96c.jpg'),
	(60, 5, 'card_image/7abaa349-052d-4c00-ac57-a4a9c8d2bf64.jpg'),
	(61, 5, 'card_image/4f4c414e-535f-4714-92f0-b23eb8024036.jpg'),
	(62, 5, 'card_image/c9be5b07-7c27-43e6-8f69-42429e395c51.jpg'),
	(63, 5, 'card_image/60105eef-b6cb-464d-8473-050f34da2f9f.jpg'),
	(64, 5, 'card_image/c5e04233-1445-42d3-8def-63540c20b9df.jpg'),
	(65, 5, 'card_image/24b05601-681e-4a75-9c47-855a7166b412.jpg'),
	(66, 5, 'card_image/75f0f9e3-75a6-413b-8bdf-2e9679c0aeb6.jpg'),
	(67, 5, 'card_image/d5544fcd-f903-48eb-bc04-2487f9e4e764.jpg'),
	(68, 5, 'card_image/cd956bd8-ac51-44a5-8ead-4e3669da75d6.jpg'),
	(69, 5, 'card_image/d349774e-8afb-42cb-8a30-df921bce127b.jpg'),
	(70, 5, 'card_image/49602984-06fa-4589-a5be-570e09994098.jpg'),
	(71, 6, 'card_image/8ed1568e-c3d8-4f7a-9ac6-18a3e85680a0.png'),
	(72, 6, 'card_image/ebb22463-ec34-4a2c-9367-319c3e4f312e.png'),
	(73, 6, 'card_image/6ce913f5-69b0-4d08-977e-bbc90b73e3a2.png'),
	(74, 6, 'card_image/78812274-d970-4c21-82c5-d3ce4d41370d.png'),
	(75, 6, 'card_image/8faeecda-c278-46e0-b56c-57cf1ded372e.png'),
	(76, 6, 'card_image/5af5c3dd-5a18-4756-a57f-6c22a00ded96.png'),
	(77, 6, 'card_image/77b54287-cf25-4cd5-8f16-83edc247ad38.png'),
	(78, 6, 'card_image/ce564e7d-f908-4265-9f42-183280266c3e.png'),
	(79, 6, 'card_image/6c9dbbef-91f4-4ef2-a1ae-2a5deadb9a97.png'),
	(80, 7, 'card_image/3717d2a5-9551-46d7-97d4-f34cfad069d2.jpg'),
	(81, 7, 'card_image/33c06243-f3ef-4634-907b-afebfa666abe.jpg'),
	(82, 7, 'card_image/4f8b1cb1-eb87-463d-8d7d-5143494dd2e9.jpg'),
	(83, 7, 'card_image/bc43dbf8-8ad4-41ff-8b0b-749868dd2028.jpg'),
	(84, 7, 'card_image/5c5e6dc3-fdcc-47f3-8dfe-2658d0fe60fe.jpg'),
	(85, 7, 'card_image/77143e47-f080-4ff1-a467-5f12bb392810.jpg'),
	(86, 7, 'card_image/f7320b04-5f37-444b-989e-1cdbbbadb525.jpg'),
	(87, 7, 'card_image/d5923eca-963f-4d0e-a6e7-dff610b240fa.jpg'),
	(88, 7, 'card_image/59bf0546-b910-441c-a3a0-9bd3a7b8585f.jpg'),
	(89, 7, 'card_image/c0c1d19c-c356-4f4b-89aa-6807eb52a47f.jpg'),
	(90, 7, 'card_image/d2a5b0b0-4c5f-44ab-b72a-91ef3b2e917a.jpg'),
	(91, 7, 'card_image/1ee4d8a4-735c-40a1-9f77-2ea2852c7527.jpg'),
	(92, 7, 'card_image/fa71d390-fa1b-4e9c-9111-9dd431b8c8ac.jpg'),
	(93, 7, 'card_image/0e422879-c5b5-4ab4-ab71-904366063ad9.jpg'),
	(94, 7, 'card_image/e8023650-90a7-4f27-b2ef-bfe966633df5.jpg'),
	(95, 7, 'card_image/56857bcf-4e71-4cda-b7b7-30bbfdf57e1c.jpg'),
	(96, 20, 'card_image/05628405-2474-48a0-9667-403a33756e8c.png'),
	(97, 20, 'card_image/35ac2edd-3a7a-42a2-a327-bd49d77137cd.png'),
	(98, 20, 'card_image/3aa1254e-b656-4e5b-a50c-8aefa471c12e.jpg'),
	(99, 20, 'card_image/ab9d7a95-ffce-462d-9f13-34d92b906269.jpg'),
	(100, 20, 'card_image/e7bf9a6a-680b-4736-9fb2-a66ecef70ab1.png'),
	(101, 20, 'card_image/e98807d1-472e-474c-b4a8-b9271959a287.png'),
	(102, 21, 'card_image/11040f37-3680-4c03-8c4d-7f1a5a3de4e8.JPG'),
	(103, 21, 'card_image/a6a68387-a51d-4d63-a9e8-06b3611711d2.JPG'),
	(104, 21, 'card_image/774d6da7-615f-41c0-a60d-e6003ad70af2.JPG'),
	(105, 21, 'card_image/a7143079-9019-4762-a46f-7c5ee06b2ba3.JPG'),
	(106, 21, 'card_image/81502ee5-913c-4504-a759-9ba92d479a68.JPG'),
	(107, 21, 'card_image/355a89a5-04fe-4ce5-bc28-b12c71c64d20.JPG'),
	(108, 21, 'card_image/4e65eff0-b675-4029-9f6d-79268495b2c6.JPG'),
	(109, 21, 'card_image/a4383d45-3494-4867-ad68-11b66f9c2b68.JPG'),
	(110, 21, 'card_image/7ee4ca8e-936f-4921-adb7-5197cb1c0a74.JPG'),
	(111, 21, 'card_image/91f07c8f-748c-4b23-b95a-805bf9c5c507.JPG'),
	(112, 22, 'card_image/83de77fb-2882-47d7-bb89-d1768ead0f71.jpg'),
	(113, 23, 'card_image/cf00720d-5814-4512-9595-7fd27339b883.jpg'),
	(114, 22, 'card_image/e99d08cc-7fd8-4770-b176-7e44a76c6656.jpg'),
	(115, 22, 'card_image/92f25b77-5fce-4673-92ce-d7e1fca89159.jpg'),
	(116, 8, 'card_image/d02ff758-c53c-414a-a710-d8fcaf288dfc.jpg'),
	(117, 8, 'card_image/d1788ec8-0729-471a-982b-f9a3967faa6d.jpg'),
	(118, 8, 'card_image/6cffdc55-7c22-4771-9651-0da7b7c412b4.jpg'),
	(119, 8, 'card_image/dfb413db-29ed-4cc2-b23f-56ca23c35623.jpg'),
	(120, 8, 'card_image/0a2b72b8-944d-44df-8600-f9f1382eb126.jpg'),
	(121, 8, 'card_image/fe6fed0c-4a36-4753-b438-2d1a29c30d88.jpg'),
	(122, 8, 'card_image/df223e88-57d9-4fd2-a798-ebbff50b0a30.jpg'),
	(123, 8, 'card_image/a61c1249-00fc-4aa8-b9ab-626d17b39f1d.jpg'),
	(124, 8, 'card_image/a46acb21-5b43-45d6-87c6-cb1509da0cf8.jpg'),
	(125, 8, 'card_image/596257d6-0707-4e70-bc1b-06d6574765ea.jpg'),
	(126, 8, 'card_image/8996b02a-c294-4beb-82b8-e5d3c5e65bf4.jpg'),
	(127, 8, 'card_image/f4be7968-c9ad-4df5-8a66-ac47e29b682e.jpg'),
	(128, 8, 'card_image/eb6e6064-116f-4e71-bd1c-6ae953db9e36.jpg'),
	(129, 8, 'card_image/c85be20c-5164-4f6a-9397-0bf19288ce40.jpg'),
	(142, 24, 'card_image/51e000ee-c1ca-4046-a3c7-ad522c41abf8.jpg'),
	(143, 24, 'card_image/8f1ad4d4-3ff8-4c00-8511-9f5be9f73e74.jpg'),
	(144, 24, 'card_image/2cf12419-32ae-4581-88f9-3cc2e090047c.jpg'),
	(145, 24, 'card_image/7f10c10a-1475-4553-adda-e570728e56d4.jpg'),
	(146, 24, 'card_image/ca16af32-1875-42ee-a3c2-9ae8f042adfe.jpg'),
	(147, 24, 'card_image/0ba85dfe-b027-4bc3-908e-fe233de62d89.jpg'),
	(148, 24, 'card_image/95a584f4-d2a4-4475-a481-7798c35bd4a0.jpg'),
	(149, 24, 'card_image/15a5a64d-c88e-423f-b5cc-ebd9778f72a2.jpg'),
	(150, 24, 'card_image/d4d4b54b-fa98-4774-a1b9-d8a809fa5310.jpg'),
	(151, 24, 'card_image/3783f3f0-4af1-4d1f-85d1-35acc537448d.jpg'),
	(152, 24, 'card_image/921d4584-a238-4b27-9191-33e22dbc2b20.jpg'),
	(153, 24, 'card_image/dac2f3cd-f7ef-405a-84ad-1c3ba3cf40a3.jpg'),
	(154, 26, 'card_image/da4e18af-45b5-408a-a94c-87c7bac959e0.png'),
	(155, 26, 'card_image/0eb0c971-0100-446e-9028-cfe17ef57596.png'),
	(156, 26, 'card_image/e6f2d88b-7484-4483-9634-59b1e369c55b.png'),
	(157, 26, 'card_image/416c5cbd-1018-4459-a647-d7107ab9d216.png'),
	(158, 26, 'card_image/3a33b94a-c89a-4b0c-8c19-e2eae589c4c9.png'),
	(159, 26, 'card_image/78ffc7c5-6e85-4ab9-877b-8a8a6ccc7372.png'),
	(160, 26, 'card_image/d1adbe14-0e3c-4467-85db-0235f89f2ce1.png'),
	(161, 26, 'card_image/57ae84d0-9f7c-49f2-ae54-e2f23c05efc3.png'),
	(162, 26, 'card_image/2fb612de-54e6-49b1-a6e6-27322c45a72c.png'),
	(163, 26, 'card_image/56376e00-49ba-4924-b8ae-74479eaac1a1.png');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;


-- Dumping structure for table micimpact.intial_tags
CREATE TABLE IF NOT EXISTS `intial_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.intial_tags: ~14 rows (approximately)
DELETE FROM `intial_tags`;
/*!40000 ALTER TABLE `intial_tags` DISABLE KEYS */;
INSERT INTO `intial_tags` (`id`, `name`) VALUES
	(2, '교육'),
	(7, '김이나'),
	(13, '백수'),
	(4, '불안'),
	(14, '아저씨'),
	(5, '알랭드보통'),
	(8, '작사'),
	(3, '정치'),
	(1, '죽음'),
	(9, '창작'),
	(6, '철학'),
	(10, '체형'),
	(12, '카'),
	(11, '패션');
/*!40000 ALTER TABLE `intial_tags` ENABLE KEYS */;


-- Dumping structure for table micimpact.likes
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.likes: ~18 rows (approximately)
DELETE FROM `likes`;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` (`id`, `card_id`, `user_id`, `created_at`) VALUES
	(1, 1, 1, '2015-12-30 02:21:50'),
	(8, 3, 8, '2016-01-11 04:22:35'),
	(9, 1, 8, '2016-01-11 05:25:23'),
	(19, 5, 8, '2016-01-12 08:23:59'),
	(21, 1, 17, '2016-01-13 04:48:45'),
	(22, 8, 17, '2016-01-13 05:02:07'),
	(23, 6, 17, '2016-01-13 05:02:19'),
	(25, 4, 19, '2016-01-13 07:00:43'),
	(27, 8, 20, '2016-01-14 05:11:55'),
	(28, 2, 17, '2016-01-14 06:56:39'),
	(38, 27, 8, '2016-01-31 15:56:34'),
	(40, 4, 8, '2016-02-26 09:27:43'),
	(41, 4, 8, '2016-02-26 09:27:43'),
	(42, 2, 8, '2016-02-26 09:38:39'),
	(43, 2, 8, '2016-02-26 09:38:39'),
	(44, 6, 8, '2016-02-26 09:46:10'),
	(45, 6, 8, '2016-02-26 09:46:10'),
	(46, 1, 114, '2016-03-01 05:17:29');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;


-- Dumping structure for table micimpact.list
CREATE TABLE IF NOT EXISTS `list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.list: ~0 rows (approximately)
DELETE FROM `list`;
/*!40000 ALTER TABLE `list` DISABLE KEYS */;
/*!40000 ALTER TABLE `list` ENABLE KEYS */;


-- Dumping structure for table micimpact.list_cards
CREATE TABLE IF NOT EXISTS `list_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `collection_id` (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.list_cards: ~0 rows (approximately)
DELETE FROM `list_cards`;
/*!40000 ALTER TABLE `list_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `list_cards` ENABLE KEYS */;


-- Dumping structure for table micimpact.locales
CREATE TABLE IF NOT EXISTS `locales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.locales: ~0 rows (approximately)
DELETE FROM `locales`;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;


-- Dumping structure for table micimpact.main_list
CREATE TABLE IF NOT EXISTS `main_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `card_id_UNIQUE` (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- Dumping data for table micimpact.main_list: ~12 rows (approximately)
DELETE FROM `main_list`;
/*!40000 ALTER TABLE `main_list` DISABLE KEYS */;
INSERT INTO `main_list` (`id`, `card_id`, `order`) VALUES
	(1, 1, 7),
	(4, 4, 1),
	(5, 5, 5),
	(6, 6, 2),
	(7, 7, 3),
	(8, 8, 8),
	(24, 3, 4),
	(35, 31, 9),
	(36, 35, 6);
/*!40000 ALTER TABLE `main_list` ENABLE KEYS */;


-- Dumping structure for table micimpact.popups
CREATE TABLE IF NOT EXISTS `popups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` char(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `image_url` char(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.popups: ~0 rows (approximately)
DELETE FROM `popups`;
/*!40000 ALTER TABLE `popups` DISABLE KEYS */;
/*!40000 ALTER TABLE `popups` ENABLE KEYS */;


-- Dumping structure for table micimpact.postings
CREATE TABLE IF NOT EXISTS `postings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(512) DEFAULT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_secret` bit(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4322ahjh8vo7t35todp2jcn1a` (`type_id`),
  KEY `FK_21gb1ype412ppqklj1dsivm5d` (`user_id`),
  CONSTRAINT `FK_21gb1ype412ppqklj1dsivm5d` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_4322ahjh8vo7t35todp2jcn1a` FOREIGN KEY (`type_id`) REFERENCES `posting_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.postings: ~4 rows (approximately)
DELETE FROM `postings`;
/*!40000 ALTER TABLE `postings` DISABLE KEYS */;
INSERT INTO `postings` (`id`, `title`, `body`, `created_at`, `updated_at`, `is_secret`, `parent_id`, `type_id`, `user_id`) VALUES
	(19, '테스트 공지사항 #6', '<p>asdf</p><p>안녕하세요 이스터에그입니다</p><p>&nbsp;</p><p>울랄라울랄라 울랄라세션입니다</p>', '2016-01-06 11:21:46', '2016-02-11 08:20:19', NULL, 19, 1, 1),
	(21, '테스트2', '<p>테스트2</p>', '2016-01-07 15:46:40', '2016-01-07 15:46:40', NULL, 21, 1, 1),
	(22, '테스트3', '<p>테스트3</p>', '2016-01-07 15:46:50', '2016-01-07 15:46:50', NULL, 22, 1, 1),
	(23, '테스트 #1입니다.', '<p><b><span style="font-size: 18pt;"><img title="Penguins.jpg" src="/201601150257347c993f2c-1320-4b76-b271-2177f1320471.jpg"><br style="clear: both;"></span></b></p><p><b><span style="font-size: 18pt;"><span style="color: rgb(255, 255, 255); font-size: 24pt; background-color: rgb(255, 0, 0);">펭균</span><span style="color: rgb(0, 117, 200);">은 북국에살까</span>?? <span style="color: rgb(255, 255, 255); background-color: rgb(0, 153, 153);">남극<span style="color: rgb(255, 255, 255); font-family: 굴림체,gulimche;">​</span></span>에살까??</span></b></p><p><b><span style="font-size: 18pt;"><br></span></b></p><p><b><span style="font-size: 18pt;">구글에서 찾아볼까나??&nbsp;</span></b></p><p><b><span style="font-size: 18pt;"><a href="https://www.google.co.kr/?gfe_rd=cr&amp;ei=dmCYVrO6JI_-8wfqn5FA&amp;gws_rd=ssl" target="_self">https://www.google.co.kr/?gfe_rd=cr&amp;ei=dmCYVrO6JI_-8wfqn5FA&amp;gws_rd=ssl</a><span style="text-decoration: none;">&nbsp;</span></span></b></p><p><b><span style="font-size: 18pt;"><br></span></b></p><p><b><span style="font-size: 18pt;">공<span style="font-size: 7pt;">지<span style="color: rgb(255, 0, 0); font-size: 24pt;">사<span style="font-size: 12pt;"><u>항</u></span></span></span></span></b></p>', '2016-01-14 05:12:40', '2016-01-15 02:59:33', NULL, 23, 1, 1);
/*!40000 ALTER TABLE `postings` ENABLE KEYS */;


-- Dumping structure for table micimpact.posting_types
CREATE TABLE IF NOT EXISTS `posting_types` (
  `id` int(11) NOT NULL,
  `posting_type` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posting_type` (`posting_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.posting_types: ~1 rows (approximately)
DELETE FROM `posting_types`;
/*!40000 ALTER TABLE `posting_types` DISABLE KEYS */;
INSERT INTO `posting_types` (`id`, `posting_type`) VALUES
	(1, '공지사항');
/*!40000 ALTER TABLE `posting_types` ENABLE KEYS */;


-- Dumping structure for table micimpact.report
CREATE TABLE IF NOT EXISTS `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `kind` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.report: ~1 rows (approximately)
DELETE FROM `report`;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` (`id`, `user_id`, `comment_id`, `kind`, `created_at`) VALUES
	(1, 8, 7, 3, '2016-01-05 08:34:49');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;


-- Dumping structure for table micimpact.resources
CREATE TABLE IF NOT EXISTS `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `logical_value` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `locale_id` int(11) NOT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.resources: ~0 rows (approximately)
DELETE FROM `resources`;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;


-- Dumping structure for table micimpact.search_tags
CREATE TABLE IF NOT EXISTS `search_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.search_tags: ~3 rows (approximately)
DELETE FROM `search_tags`;
/*!40000 ALTER TABLE `search_tags` DISABLE KEYS */;
INSERT INTO `search_tags` (`id`, `name`) VALUES
	(1, '인기1'),
	(2, '인기2'),
	(3, '인기3');
/*!40000 ALTER TABLE `search_tags` ENABLE KEYS */;


-- Dumping structure for table micimpact.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) DEFAULT '0',
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.tags: ~0 rows (approximately)
DELETE FROM `tags`;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;


-- Dumping structure for table micimpact.upload_files
CREATE TABLE IF NOT EXISTS `upload_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(512) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `extra1` varchar(255) DEFAULT NULL,
  `extra2` varchar(255) DEFAULT NULL,
  `domain` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.upload_files: ~0 rows (approximately)
DELETE FROM `upload_files`;
/*!40000 ALTER TABLE `upload_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_files` ENABLE KEYS */;


-- Dumping structure for table micimpact.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '2',
  `password` varchar(256) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fag` int(11) DEFAULT '1',
  `facebook_token` varchar(256) DEFAULT NULL,
  `kakaotalk_token` varchar(256) DEFAULT NULL,
  `line_token` varchar(256) DEFAULT NULL,
  `birthyear` char(4) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL COMMENT 'm 남자\nf 여자',
  `job` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `activity_point` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '1',
  `point` int(11) DEFAULT '0',
  `push_state` int(11) DEFAULT '1',
  `profile_url` varchar(128) DEFAULT NULL,
  `is_withdrawn` int(11) DEFAULT '0',
  `heart_state_id` int(11) DEFAULT NULL,
  `recent_card_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_krvotbtiqhudlkamvlpaqus0t` (`role_id`),
  CONSTRAINT `FK_krvotbtiqhudlkamvlpaqus0t` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.users: ~49 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `password`, `name`, `email`, `created_at`, `updated_at`, `fag`, `facebook_token`, `kakaotalk_token`, `line_token`, `birthyear`, `sex`, `job`, `city`, `activity_point`, `level`, `point`, `push_state`, `profile_url`, `is_withdrawn`, `heart_state_id`, `recent_card_id`) VALUES
	(1, 1, 'f865b53623b121fd34ee5426c792e5c33af8c227', '마이크임팩트', 'admin@micimpact.co.kr', '2015-12-22 04:07:14', '2015-12-22 04:07:14', 1, NULL, NULL, NULL, NULL, NULL, '운영자', NULL, 0, 1, 0, 1, 'profile/25d7a198-a39a-4732-8ee0-39c986e17168.png', 0, NULL, 1),
	(3, 2, 'ab70e7ca49d2d4428569ee0bdd01e0bf04d9b1ac', 'sdsdsdsd', 'sdsdsdsd', '2015-12-28 10:08:47', '2015-12-28 10:08:47', 0, NULL, NULL, NULL, '2014', 'm', '취준생', '서울특별시', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(6, 2, 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'test', 'test@test.com', '2015-12-29 06:34:40', '2015-12-29 06:34:40', 0, NULL, NULL, NULL, '2010', 'm', '직장인', '서울특별시', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(7, 2, '99ebdbd711b0e1854a6c2e93f759efc2af291fd0', 'test', 'ttt@test.com', '2015-12-29 06:39:19', '2015-12-29 06:39:19', 1, NULL, NULL, NULL, '2012', 'm', '직장인', '강원도', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(8, 2, 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'testt', 'testuser@test.com', '2016-01-05 01:42:10', '2016-01-05 01:42:10', 1, NULL, NULL, NULL, '1991', 'm', '직장인', '서울특별시', NULL, NULL, NULL, NULL, NULL, NULL, 5, 1),
	(9, 2, 'f865b53623b121fd34ee5426c792e5c33af8c227', '차태수', 'ckxotn1@naver.com', '2016-01-05 02:12:36', '2016-01-05 02:12:36', 1, NULL, NULL, NULL, '2014', 'm', '취준생', '서울특별시', NULL, NULL, NULL, NULL, 'profile/aa29282a-facb-4962-9740-ad3a96effd6a.jpg', NULL, 2, 36),
	(15, 2, '3ef747ca146c564de8ebe3c761608f1fa9a4090e', '박정훈', 'mskyblue@hanmail.net', '2016-01-13 01:33:13', '2016-01-13 01:33:13', 1, NULL, NULL, NULL, '1986', 'm', '직장인', '서울특별시', NULL, NULL, NULL, NULL, NULL, NULL, 22, 4),
	(16, 2, 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', '테스터', 'test1@test.com', '2016-01-13 01:39:19', '2016-01-13 01:39:19', 1, NULL, NULL, NULL, '2015', 'm', '취준생', '서울특별시', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(17, 2, '2824da290cdbbb304fbbe1b347ac14dd20c6e800', '서닌장', 'shjera46@naver.com', '2016-01-13 04:25:37', '2016-01-13 04:25:37', 1, NULL, NULL, NULL, '1993', 'm', '학생', '인천광역시', NULL, NULL, NULL, NULL, 'profile/81668aa1-b882-4472-8cb3-b8b590ac7e41.png', NULL, 5, 7),
	(19, 2, 'b1e8130a3704404437d39dfe06ddc4339bf1bc48', '질 드 랜스보', 'shjera46@snu.ac.kr', '2016-01-13 06:37:32', '2016-01-13 06:37:32', 0, NULL, NULL, NULL, '1990', 'm', '취준생', '세종시', NULL, NULL, NULL, NULL, NULL, NULL, 2, 4),
	(22, 2, 'f62218766295c4ae8cac22d7f517607a230f4aed', '임세빈', 'sseban79@hanmail.net', '2016-01-15 07:01:13', '2016-01-15 07:01:13', 1, NULL, NULL, NULL, '1979', 'm', '직장인', '경기도', NULL, NULL, NULL, NULL, NULL, NULL, 20, 5),
	(23, 2, 'f62218766295c4ae8cac22d7f517607a230f4aed', '임세빈', 'sseban79@hotmail.com', '2016-01-15 08:23:08', '2016-01-15 08:23:08', 1, NULL, NULL, NULL, '1979', 'm', '직장인', '경기도', NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
	(36, 2, 'b60543dca43c343d5149717e8f40567a2febf495', 'tramstest', 'tramstest@trams.co.kr', '2016-02-11 05:49:37', '2016-02-11 05:49:37', 1, NULL, NULL, NULL, '1984', 'm', '직장인', '서울특별시', NULL, NULL, NULL, NULL, NULL, NULL, 2, 7),
	(38, 2, 'e483928827129eb02713c43ee7c775012ed98db2', '김동영', 'dykim@trams.co.kr', '2016-02-22 10:12:08', '2016-02-22 10:12:08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 7),
	(41, 2, '26e408ea220c5b09c3a8fd81ddd6027c05145aec', '채기정', 'kjchae3@trams.co.kr', '2016-02-26 00:52:33', '2016-02-26 00:52:33', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 5),
	(42, 2, '26e408ea220c5b09c3a8fd81ddd6027c05145aec', '채기정4', 'kjchae4@trams.co.kr', '2016-02-26 00:56:06', '2016-02-26 00:56:06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL),
	(45, 2, '26e408ea220c5b09c3a8fd81ddd6027c05145aec', '채기정', 'kjchae5@trams.co.kr', '2016-02-26 03:48:43', '2016-02-26 03:48:43', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 7),
	(49, 2, 'e483928827129eb02713c43ee7c775012ed98db2', '김동영', 'dykim1@tram.co.kr', '2016-02-26 09:19:56', '2016-02-26 09:19:56', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3),
	(62, 2, 'afa66c8f95132060d0a3d7ad0d54d97eb8e9c4d5', '배혜진', 'bbae088@naver.com', '2016-02-28 03:54:53', '2016-02-28 03:54:53', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(63, 2, 'afa66c8f95132060d0a3d7ad0d54d97eb8e9c4d5', '배혜진', 'bbae088@naver.com', '2016-02-28 03:54:53', '2016-02-28 03:54:53', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(69, 2, '26e408ea220c5b09c3a8fd81ddd6027c05145aec', '채기정6', 'kjchae6@trams.co.kr', '2016-02-29 01:53:29', '2016-02-29 01:53:29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(70, 2, '26e408ea220c5b09c3a8fd81ddd6027c05145aec', '채기정6', 'kjchae6@trams.co.kr', '2016-02-29 01:53:29', '2016-02-29 01:53:29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(71, 2, '26e408ea220c5b09c3a8fd81ddd6027c05145aec', '채기정7', 'kjchae7@trams co.kr', '2016-02-29 01:56:21', '2016-02-29 01:56:21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 7),
	(96, 2, '', '김동영', NULL, '2016-02-29 06:24:25', '2016-02-29 06:24:25', 1, NULL, 'mVdmbiNkNXk1c5kDblU1VL3TUISGRb7DZRIWDKwQTJgAAAFTK7D9Ow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 7),
	(97, 2, '', '채기정', NULL, '2016-02-29 06:31:37', '2016-02-29 06:31:37', 1, NULL, 'vndrLIuYd5imKwjnjqeH-LygXlnzCmGzrDVrXqwQQjIAAAFTK7lxiA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 7),
	(105, 2, '', '서 형진', NULL, '2016-02-29 06:45:21', '2016-02-29 06:45:21', 1, NULL, 'g8FH182E6NzMjuHpeqYwfZb958DnWbj5xfRZBKwQQHYAAAFTK8YDCA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 7),
	(108, 2, '', 'Ki-jung Chae', NULL, '2016-02-29 07:47:16', '2016-02-29 07:47:16', 1, '1114081751956764', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3),
	(112, 2, '', '혜진배', NULL, '2016-02-29 08:29:18', '2016-02-29 08:29:18', 1, NULL, 'knhtY_o9Ee5Eb3ZWUorRogy7ZLjyQhl7_yDpaawQTJgAAAFTLCU6DA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(113, 2, '', '혜진배', NULL, '2016-02-29 08:29:57', '2016-02-29 08:29:57', 1, NULL, 'KSbErvyHtrgegLONNchKfByz4aHH3Ml6wIqLRawQQjQAAAFTLCXRMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(114, 2, '', 'HyeJin Bae', 'iouboa@naver.com', '2016-02-29 08:31:23', '2016-02-29 08:31:23', 1, '1044093442325240', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile/5a893401-c188-49fd-a4c4-e6fd9effd867.jpg', NULL, NULL, 4),
	(124, 2, '8cb2237d0679ca88db6464eac60da96345513964', 'ksm', 'coin2@naver.com', '2016-02-29 11:22:27', '2016-02-29 11:22:27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile/4b1e7a85-526a-4309-8cd1-6a578623e3de.jpg', NULL, 4, NULL),
	(125, 2, '26e408ea220c5b09c3a8fd81ddd6027c05145aec', '채기정', 'kjchae31@trams.co.kr', '2016-02-29 11:26:39', '2016-02-29 11:26:39', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(126, 2, '', '최봉재', 'jjgod0124@gmail.com', '2016-02-29 11:31:03', '2016-02-29 11:31:03', 1, '958216844255078', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(129, 2, '', '선명', NULL, '2016-03-01 05:19:45', '2016-03-01 05:19:45', 1, NULL, 'ojPuEZAVkviceT5g1nSMzzLDlmjABIN2NXx8gawQQjQAAAFTMJ4DhQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
	(130, 2, '', '김선명', 'naskm007@naver.com', '2016-03-01 05:43:45', '2016-03-01 05:43:45', 1, NULL, NULL, 'coPYipl39L5B0Tep16nGfYuiiVv29ZWZYnh0khJgzzokSUHiprvaLlk6qfA92vXj8OsVKYYqzzwHuF97ip7NX9XakXN8DQc5msisevvL9ABlf156KsoUYGkmGy8sJaAHGhyX3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL),
	(131, 2, '', 'Sue Hyun Kim', 'mobilein@naver.com', '2016-03-07 01:59:25', '2016-03-07 01:59:25', 1, '10205685013747137', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 35),
	(132, 2, '', '수현', NULL, '2016-03-07 02:08:22', '2016-03-07 02:08:22', 1, NULL, NULL, 'BfkH6kipVfLfpkzxZ4h3docBf8y1fpjlH8JpfE1Nisq3TsmYLJDf1YOrKIGjTZJzRUv6w82jI5xUiihJPvf5xa2S7Yx0EXTWfu2isk0gh08AGYeJAu8Fx1e2jJUnOLaZOCDe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
	(133, 2, '', 'Sao Vũ', 'ptit.cn8.star@gmail.com', '2016-03-07 09:07:33', '2016-03-07 09:07:33', 1, '637781699695960', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 7),
	(134, 2, '', 'Seon Myeong Kim', 'naskm007@naver.com', '2016-03-07 09:12:10', '2016-03-07 09:12:10', 1, '921105848004095', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 7),
	(135, 2, '', 'Kham Kham', 'khamkham3210@gmail.com', '2016-03-07 09:21:20', '2016-03-07 09:21:20', 1, '127810260944487', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5),
	(136, 2, '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 'huydv0109', 'huydv0109@gmail.com', '2016-03-08 03:53:45', '2016-03-08 03:53:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile/5534e268-64e8-4612-82a7-8653f7d5447a.jpg', NULL, 1, 5),
	(137, 2, '', '배태준', NULL, '2016-03-09 05:54:40', '2016-03-09 05:54:40', 1, '853167178145014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile/ab03bc5b-0dc2-49fb-b199-8b1d8217be49.jpg', NULL, 5, 5),
	(138, 2, '', 'Huy Đặng', NULL, '2016-03-09 07:29:03', '2016-03-09 07:29:03', 1, '1736900489876543', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5),
	(139, 2, '', '혜진배', NULL, '2016-03-09 08:15:24', '2016-03-09 08:15:24', 1, NULL, 'gUOyEsdcAmdjAuyDJ277AX-gVFTZ-bQvGixwt6wQQjEAAAFTWnGvhQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4),
	(140, 2, '', 'Htest', NULL, '2016-03-09 09:06:17', '2016-03-09 09:06:17', 1, NULL, 'znmyURNWoyvRUwPepRloOuy_orcRouPNSPm_uawQTJgAAAFTWpqsrg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 27),
	(141, 2, '', 'Htest', NULL, '2016-03-09 09:22:15', '2016-03-09 09:22:15', 1, NULL, 'LQQgpEiW8N9VyUQ_qj9OfNc--o0h_s_anfF5y6wQQI4AAAFTWq7Teg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 27),
	(142, 2, '', 'Hoshi Takeshi', NULL, '2016-03-09 09:30:27', '2016-03-09 09:30:27', 1, NULL, 'Pxg_M5fbLvdA5Nj0qvg4qFlglx8qSPDt0JGmRawQQI4AAAFTWrZo2w', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 27),
	(143, 2, '8133715e93bfa739e926c2d6fe6edeaabe315caf', '김성애', 'tomato0422@hanmail.net', '2016-03-09 09:37:22', '2016-03-09 09:37:22', 1, NULL, NULL, NULL, '1982', '여', '취준생', '서울특별시', NULL, NULL, NULL, NULL, 'profile/120dab4e-bbe3-4c5e-b92c-998f6b868f4f.jpg', NULL, 5, 6),
	(144, 2, '356a192b7913b04c54574d18c28d46e6395428ab', 'Ptit.cn8.star@gmail.com', 'saovv', '2016-03-10 03:23:02', '2016-03-10 03:23:02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 7);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table micimpact.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.user_roles: ~3 rows (approximately)
DELETE FROM `user_roles`;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`id`, `role`) VALUES
	(1, 'ROLE_ADMIN'),
	(3, 'ROLE_RESU'),
	(2, 'ROLE_USER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;


-- Dumping structure for table micimpact.user_tags
CREATE TABLE IF NOT EXISTS `user_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_tag_index` (`user_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.user_tags: ~435 rows (approximately)
DELETE FROM `user_tags`;
/*!40000 ALTER TABLE `user_tags` DISABLE KEYS */;
INSERT INTO `user_tags` (`id`, `user_id`, `name`) VALUES
	(59, 1, 'test'),
	(23, 7, '가자'),
	(24, 7, '고고'),
	(20, 7, '교육'),
	(25, 7, '머지'),
	(21, 7, '정치'),
	(22, 7, '죽음'),
	(60, 8, '교육'),
	(61, 8, '백수'),
	(62, 8, '불안'),
	(126, 9, '김이나'),
	(127, 9, '알랭드보통'),
	(128, 9, '작사'),
	(11, 11, '교육'),
	(12, 11, '정치'),
	(13, 11, '죽음'),
	(26, 12, '교육'),
	(27, 12, '정치'),
	(28, 12, '죽음'),
	(32, 13, '교육'),
	(33, 13, '정치'),
	(34, 13, '죽음'),
	(35, 14, '교육'),
	(36, 14, '정치'),
	(37, 14, '죽음'),
	(38, 15, '교육'),
	(39, 15, '정치'),
	(40, 15, '죽음'),
	(41, 16, '교육'),
	(42, 16, '정치'),
	(43, 16, '죽음'),
	(111, 17, '교육'),
	(112, 17, '정치'),
	(113, 17, '죽음'),
	(47, 18, '교육'),
	(48, 18, '정치'),
	(49, 18, '죽음'),
	(53, 19, '교육'),
	(54, 19, '정치'),
	(55, 19, '죽음'),
	(75, 20, '김이나'),
	(76, 20, '알랭드보통'),
	(77, 20, '창작'),
	(63, 21, '교육'),
	(64, 21, '창작'),
	(65, 21, '철학'),
	(66, 22, '교육'),
	(67, 22, '창작'),
	(68, 22, '카'),
	(69, 23, '백수'),
	(70, 23, '불안'),
	(71, 23, '패션'),
	(72, 24, '김이나'),
	(73, 24, '불안'),
	(74, 24, '철학'),
	(78, 25, '김이나'),
	(79, 25, '백수'),
	(80, 25, '불안'),
	(81, 26, '교육'),
	(82, 26, '백수'),
	(83, 26, '창작'),
	(84, 27, '알랭드보통'),
	(85, 27, '작사'),
	(86, 27, '죽음'),
	(89, 28, '알랭드보통'),
	(88, 28, '작사'),
	(87, 28, '정치'),
	(90, 29, '김이나'),
	(91, 29, '백수'),
	(92, 29, '불안'),
	(93, 30, '작사'),
	(94, 30, '정치'),
	(95, 30, '죽음'),
	(96, 31, '작사'),
	(97, 31, '정치'),
	(98, 31, '죽음'),
	(99, 32, '김이나'),
	(100, 32, '백수'),
	(101, 32, '정치'),
	(102, 33, '교육'),
	(103, 33, '김이나'),
	(104, 33, '알랭드보통'),
	(105, 34, '백수'),
	(106, 34, '알랭드보통'),
	(107, 34, '철학'),
	(114, 35, '작사'),
	(115, 35, '정치'),
	(116, 35, '죽음'),
	(120, 36, '교육'),
	(121, 36, '아저씨'),
	(122, 36, '죽음'),
	(123, 37, '교육'),
	(124, 37, '창작'),
	(125, 37, '카'),
	(129, 38, '김이나'),
	(130, 38, '알랭드보통'),
	(131, 38, '작사'),
	(134, 39, '작사'),
	(136, 39, '정치'),
	(132, 39, '패션'),
	(135, 40, '작사'),
	(137, 40, '정치'),
	(133, 40, '패션'),
	(138, 41, '불안'),
	(139, 41, '알랭드보통'),
	(140, 41, '체형'),
	(141, 42, '불안'),
	(142, 42, '작사'),
	(143, 42, '체형'),
	(144, 43, '김이나'),
	(145, 43, '알랭드보통'),
	(146, 43, '작사'),
	(147, 44, '김이나'),
	(148, 44, '알랭드보통'),
	(149, 44, '작사'),
	(150, 45, '아저씨'),
	(151, 45, '알랭드보통'),
	(152, 45, '창작'),
	(153, 46, '김이나'),
	(154, 46, '알랭드보통'),
	(155, 46, '작사'),
	(156, 47, '김이나'),
	(157, 47, '알랭드보통'),
	(158, 47, '작사'),
	(159, 48, '김이나'),
	(160, 48, '알랭드보통'),
	(161, 48, '작사'),
	(162, 49, '김이나'),
	(163, 49, '알랭드보통'),
	(164, 49, '작사'),
	(165, 50, '교육'),
	(167, 50, '김이나'),
	(169, 50, '백수'),
	(166, 51, '교육'),
	(168, 51, '김이나'),
	(170, 51, '백수'),
	(171, 52, '교육'),
	(173, 52, '김이나'),
	(175, 52, '백수'),
	(172, 53, '교육'),
	(174, 53, '김이나'),
	(176, 53, '백수'),
	(179, 54, '교육'),
	(177, 54, '김이나'),
	(181, 54, '백수'),
	(180, 55, '교육'),
	(178, 55, '김이나'),
	(182, 55, '백수'),
	(183, 56, '교육'),
	(185, 56, '김이나'),
	(187, 56, '백수'),
	(184, 57, '교육'),
	(186, 57, '김이나'),
	(188, 57, '백수'),
	(189, 58, '교육'),
	(191, 58, '김이나'),
	(193, 58, '백수'),
	(190, 59, '교육'),
	(192, 59, '김이나'),
	(194, 59, '백수'),
	(195, 60, '교육'),
	(201, 60, '불안'),
	(203, 60, '작사'),
	(197, 60, '죽음'),
	(199, 60, '창작'),
	(196, 61, '교육'),
	(202, 61, '불안'),
	(204, 61, '작사'),
	(198, 61, '죽음'),
	(200, 61, '창작'),
	(219, 62, '교육'),
	(209, 62, '김이나'),
	(205, 62, '백수'),
	(211, 62, '정치'),
	(207, 62, '죽음'),
	(213, 62, '창작'),
	(215, 62, '철학'),
	(217, 62, '체형'),
	(220, 63, '교육'),
	(210, 63, '김이나'),
	(206, 63, '백수'),
	(212, 63, '정치'),
	(208, 63, '죽음'),
	(214, 63, '창작'),
	(216, 63, '철학'),
	(218, 63, '체형'),
	(221, 64, '아저씨'),
	(222, 64, '죽음'),
	(223, 64, '창작'),
	(224, 64, '철학'),
	(225, 65, '아저씨'),
	(226, 65, '작사'),
	(227, 65, '죽음'),
	(228, 66, '창작'),
	(229, 66, '철학'),
	(230, 66, '패션'),
	(235, 67, '김이나'),
	(231, 67, '정치'),
	(233, 67, '죽음'),
	(236, 68, '김이나'),
	(232, 68, '정치'),
	(234, 68, '죽음'),
	(237, 69, '교육'),
	(239, 69, '작사'),
	(241, 69, '정치'),
	(238, 70, '교육'),
	(240, 70, '작사'),
	(242, 70, '정치'),
	(243, 71, '김이나'),
	(244, 71, '알랭드보통'),
	(245, 71, '철학'),
	(246, 72, '김이나'),
	(247, 72, '알랭드보통'),
	(248, 72, '작사'),
	(249, 73, '교육'),
	(253, 73, '김이나'),
	(251, 73, '백수'),
	(250, 74, '교육'),
	(254, 74, '김이나'),
	(252, 74, '백수'),
	(255, 75, '김이나'),
	(256, 75, '알랭드보통'),
	(257, 75, '작사'),
	(258, 76, '김이나'),
	(259, 76, '알랭드보통'),
	(260, 76, '작사'),
	(261, 77, '김이나'),
	(262, 77, '알랭드보통'),
	(263, 77, '작사'),
	(264, 78, '죽음'),
	(265, 78, '창작'),
	(266, 78, '패션'),
	(267, 79, '죽음'),
	(268, 79, '창작'),
	(269, 79, '철학'),
	(270, 80, '작사'),
	(271, 80, '정치'),
	(272, 80, '철학'),
	(273, 81, '알랭드보통'),
	(275, 81, '작사'),
	(277, 81, '정치'),
	(274, 82, '알랭드보통'),
	(276, 82, '작사'),
	(278, 82, '정치'),
	(279, 83, '교육'),
	(281, 83, '김이나'),
	(283, 83, '백수'),
	(280, 84, '교육'),
	(282, 84, '김이나'),
	(284, 84, '백수'),
	(285, 85, '알랭드보통'),
	(289, 85, '정치'),
	(287, 85, '패션'),
	(286, 86, '알랭드보통'),
	(290, 86, '정치'),
	(288, 86, '패션'),
	(291, 87, '교육'),
	(293, 87, '김이나'),
	(295, 87, '백수'),
	(292, 88, '교육'),
	(294, 88, '김이나'),
	(296, 88, '백수'),
	(298, 89, '교육'),
	(300, 89, '김이나'),
	(302, 89, '백수'),
	(297, 90, '교육'),
	(299, 90, '김이나'),
	(301, 90, '백수'),
	(303, 91, '교육'),
	(305, 91, '알랭드보통'),
	(307, 91, '작사'),
	(304, 92, '교육'),
	(306, 92, '알랭드보통'),
	(308, 92, '작사'),
	(309, 93, '김이나'),
	(311, 93, '작사'),
	(313, 93, '패션'),
	(310, 94, '김이나'),
	(312, 94, '작사'),
	(314, 94, '패션'),
	(316, 95, '김이나'),
	(317, 95, '작사'),
	(315, 95, '카'),
	(318, 96, '김이나'),
	(319, 96, '알랭드보통'),
	(320, 96, '작사'),
	(321, 97, '백수'),
	(322, 97, '알랭드보통'),
	(323, 97, '창작'),
	(324, 98, '작사'),
	(326, 98, '정치'),
	(325, 98, '죽음'),
	(327, 99, '김이나'),
	(328, 99, '작사'),
	(329, 99, '죽음'),
	(330, 100, '불안'),
	(331, 100, '아저씨'),
	(332, 100, '체형'),
	(333, 101, '교육'),
	(334, 101, '김이나'),
	(335, 101, '백수'),
	(336, 102, '교육'),
	(337, 102, '김이나'),
	(338, 102, '백수'),
	(339, 103, '교육'),
	(340, 103, '김이나'),
	(341, 103, '작사'),
	(342, 104, '알랭드보통'),
	(343, 104, '작사'),
	(344, 104, '정치'),
	(345, 105, '김이나'),
	(346, 105, '백수'),
	(347, 105, '알랭드보통'),
	(348, 106, '교육'),
	(349, 106, '김이나'),
	(350, 106, '백수'),
	(351, 107, '김이나'),
	(352, 107, '작사'),
	(353, 107, '패션'),
	(354, 108, '작사'),
	(355, 108, '정치'),
	(356, 108, '체형'),
	(357, 109, '교육'),
	(358, 109, '김이나'),
	(359, 109, '철학'),
	(360, 110, '죽음'),
	(361, 110, '창작'),
	(362, 110, '철학'),
	(363, 111, '죽음'),
	(364, 111, '창작'),
	(365, 111, '패션'),
	(366, 112, '알랭드보통'),
	(368, 112, '카'),
	(367, 112, '패션'),
	(369, 113, '교육'),
	(370, 113, '작사'),
	(371, 113, '패션'),
	(372, 114, '교육'),
	(373, 114, '알랭드보통'),
	(374, 114, '작사'),
	(375, 114, '체형'),
	(378, 115, '백수'),
	(377, 115, '알랭드보통'),
	(376, 115, '창작'),
	(381, 116, '불안'),
	(380, 116, '작사'),
	(379, 116, '체형'),
	(383, 117, '교육'),
	(382, 117, '아저씨'),
	(384, 117, '죽음'),
	(386, 118, '교육'),
	(385, 118, '김이나'),
	(387, 118, '알랭드보통'),
	(389, 119, '아저씨'),
	(388, 119, '알랭드보통'),
	(390, 119, '창작'),
	(391, 120, '김이나'),
	(392, 120, '알랭드보통'),
	(393, 120, '창작'),
	(395, 121, '알랭드보통'),
	(396, 121, '작사'),
	(394, 121, '창작'),
	(397, 122, '알랭드보통'),
	(400, 122, '작사'),
	(398, 122, '창작'),
	(399, 122, '철학'),
	(401, 123, '김이나'),
	(403, 123, '작사'),
	(402, 123, '창작'),
	(405, 124, '알랭드보통'),
	(404, 124, '창작'),
	(406, 124, '체형'),
	(407, 125, '아저씨'),
	(408, 125, '죽음'),
	(409, 125, '패션'),
	(412, 126, '교육'),
	(410, 126, '백수'),
	(411, 126, '창작'),
	(415, 127, '아저씨'),
	(414, 127, '알랭드보통'),
	(413, 127, '창작'),
	(416, 128, '교육'),
	(417, 128, '알랭드보통'),
	(418, 128, '철학'),
	(419, 128, '패션'),
	(423, 129, '백수'),
	(422, 129, '알랭드보통'),
	(420, 129, '철학'),
	(421, 129, '체형'),
	(424, 130, '교육'),
	(425, 130, '알랭드보통'),
	(427, 130, '창작'),
	(426, 130, '철학'),
	(428, 131, '창작'),
	(429, 131, '철학'),
	(430, 131, '패션'),
	(431, 132, '김이나'),
	(432, 132, '불안'),
	(433, 132, '패션'),
	(434, 133, '교육'),
	(435, 133, '김이나'),
	(436, 133, '백수'),
	(437, 134, '교육'),
	(438, 134, '알랭드보통'),
	(439, 134, '철학'),
	(440, 135, '김이나'),
	(442, 135, '백수'),
	(441, 135, '알랭드보통'),
	(443, 136, '교육'),
	(444, 136, '김이나'),
	(445, 136, '백수'),
	(446, 136, '불안'),
	(447, 136, '알랭드보통'),
	(448, 136, '작사'),
	(449, 136, '정치'),
	(450, 136, '창작'),
	(451, 136, '철학'),
	(452, 136, '체형'),
	(453, 137, '알랭드보통'),
	(454, 137, '창작'),
	(455, 137, '철학'),
	(456, 138, '김이나'),
	(457, 138, '백수'),
	(458, 138, '불안'),
	(459, 138, '알랭드보통'),
	(460, 138, '작사'),
	(461, 138, '창작'),
	(462, 138, '철학'),
	(463, 138, '체형'),
	(464, 138, '카'),
	(466, 139, '불안'),
	(465, 139, '아저씨'),
	(467, 139, '죽음'),
	(468, 140, '죽음'),
	(469, 140, '창작'),
	(470, 140, '철학'),
	(471, 140, '카'),
	(472, 140, '패션'),
	(477, 141, '창작'),
	(476, 141, '철학'),
	(475, 141, '체형'),
	(474, 141, '카'),
	(473, 141, '패션'),
	(483, 142, '아저씨'),
	(482, 142, '알랭드보통'),
	(481, 142, '죽음'),
	(480, 142, '체형'),
	(479, 142, '카'),
	(478, 142, '패션'),
	(485, 143, '교육'),
	(484, 143, '알랭드보통'),
	(486, 143, '정치'),
	(487, 144, '김이나'),
	(489, 144, '아저씨'),
	(488, 144, '알랭드보통'),
	(490, 144, '정치'),
	(491, 144, '창작'),
	(492, 144, '카');
/*!40000 ALTER TABLE `user_tags` ENABLE KEYS */;


-- Dumping structure for trigger micimpact.comments_AFTER_DELETE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `comments_AFTER_DELETE` AFTER DELETE ON `comments` FOR EACH ROW BEGIN
 update cards set comment_count=comment_count-1 where id=OLD.card_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger micimpact.comments_AFTER_INSERT
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `comments_AFTER_INSERT` AFTER INSERT ON `comments` FOR EACH ROW BEGIN
	  update cards set comment_count=comment_count+1 where id=NEW.card_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger micimpact.comment_likes_AFTER_DELETE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `comment_likes_AFTER_DELETE` AFTER DELETE ON `comment_likes` FOR EACH ROW BEGIN
	update comments set count_like=count_like-1 where id=OLD.comment_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger micimpact.comment_likes_AFTER_INSERT
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `comment_likes_AFTER_INSERT` AFTER INSERT ON `comment_likes` FOR EACH ROW BEGIN
	update comments set count_like=count_like+1 where id=NEW.comment_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger micimpact.likes_AFTER_DELETE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `likes_AFTER_DELETE` AFTER DELETE ON `likes` FOR EACH ROW BEGIN
 update cards set count_like=count_like-1 where id=OLD.card_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger micimpact.likes_AFTER_INSERT
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `likes_AFTER_INSERT` AFTER INSERT ON `likes` FOR EACH ROW BEGIN
	update cards set count_like=count_like+1 where id=NEW.card_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
