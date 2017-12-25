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
  `category_id` int(11) DEFAULT NULL,
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
  KEY `FK_cards_channel` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.cards: ~64 rows (approximately)
DELETE FROM `cards`;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` (`id`, `user_id`, `category_id`, `thumbnail_url`, `target_url`, `title`, `body`, `type`, `count_like`, `share`, `runing_time`, `created_at`, `ad_is`, `ad_ment`, `ad_link`, `related_card_id`, `hit_count`, `comment_count`, `actor`, `actor_job`, `vertical_thumbnail_url`, `channel_id`) VALUES
	(1, 1, 1, 'thumbnail/498984fe-5d15-4d7a-9bdd-2789fa1053fc.jpg', 'https://www.youtube.com/watch?v=4JLe7s976k0', '돈과 명예로도 못 구하는 행복의 필수 요소 3가지', '"에피쿠로스는 우리가 행복하기 위해 정말 필요한 것 3가지를 찾았습니다."', 1, 0, 0, NULL, '2016-03-15 16:54:27', 0, NULL, NULL, NULL, 139, 0, '알랭 드 보통', '소설가', 'vertical_thumbnail/67a2cc67-0996-4438-ad9a-54359c362fd2.jpg', NULL),
	(31, 1, 5, 'thumbnail/e0a2c0fe-0635-4b67-91ab-5dc5b4ffe6b2.mp4_20160309_153413', 'stream_output/05b34e89-2e94-4d9f-aa5f-1c0737387160/c35e4802edd330a242a9b4c51152c45e8e7a21f9e57ec54159d8fba88d906698.m3u8', '국가 브랜드를 정할 때 가장 중요한 것', '"대한민국의 브랜드는 오히려 우리와 같은 외국인들이 정하는 것입니다."', 0, 0, 0, NULL, '2016-03-09 06:29:56', 0, NULL, NULL, NULL, 30, 0, '기 소르망', '칼럼니스트', NULL, NULL),
	(35, 1, 2, 'thumbnail/d1c73d44-c2a9-4c1b-b7ee-b2a706f92678.mp4_20160309_163509', 'stream_output/ac641db3-1abb-4d20-ad1c-0d5ee4031e07/8dd2af83e6cacc8ccf466472f7d1604f0a6235f9119a7a1181bac35f5bfbcbaa.m3u8', '이루고 싶은 게 있는 사람들의 공통된 생각', '"저한테 그건 그냥 계속 하는 거예요. 생활이고 삶이에요."', 0, 1, 1, NULL, '2016-03-09 08:00:48', 0, NULL, NULL, NULL, 132, 3, '강레오', '쉐프', NULL, NULL),
	(36, 1, 6, 'thumbnail/08c5bafd-6807-4dd5-a804-841427a151ce.mp4_20160309_172655', 'stream_output/fce6532b-037c-4187-b844-5cc96ca7139c/fa3c4599d4ec6c4caddc2d24102b45d138a53ab9bd134403b494344c1fcda05b.m3u8', '별은 어떻게 태어나서 어떻게 죽는가', '"산소, 질소, 탄소는 우주 공간에 있던 게 아니고 별이 태어나고 죽어가는 과정에서 생겨나요."', 0, 0, 0, NULL, '2016-03-09 08:46:05', 0, NULL, NULL, NULL, 4, 0, '이명현', '천문학자', NULL, NULL),
	(38, 1, 4, 'thumbnail/27374f3b-4b57-4067-b36a-fef1ade0aedb.wmv_20160309_194127', 'stream_output/4b2c74e8-4ee0-47b7-8d91-a72c2a872a9d/688a89092c757f6f02931338d2d2be3497301ceb0addf7b9869641e86d49c40a.m3u8', '장기하와 얼굴들 앨범 커버의 제작 스토리', '"실제로 제가 의료기기 매장에 가서 심장 모형을 구입을 했고요."', 0, 0, 0, NULL, '2016-03-09 10:46:21', 0, NULL, NULL, NULL, 1, 0, '김기조', '타이포그래퍼', NULL, NULL),
	(39, 1, 6, 'thumbnail/3be647c7-ca35-4ded-9eb6-2d84dea9a58f.mp4_20160310_112554', 'stream_output/6e029f4c-e2f4-45c8-98fe-1c6279782317/00504aa8dda4c77e2e5dd22cd942df2ce1839621db88bcab624291b5121fce15.m3u8', '과학이 인문학과 별개일 수 없는 이유', '"인문은 인간에 대한 탐구입니다. 인간에 대한 탐구로서 21세기에 어떤 분야들이 거기에 기여하고 있나요? 과학을 빼놓고 이야기 할 수 있나요?"', 0, 0, 0, NULL, '2016-03-10 02:26:42', 0, NULL, NULL, NULL, 2, 0, '장대익', '과학철학자', NULL, NULL),
	(40, 1, 11, 'thumbnail/59c43bc1-aadb-45ac-bc6f-7a90cbdef950.mp4_20160310_114112', 'stream_output/b379c0b9-c086-4f12-8081-901e30ac0690/83cef2c608e0269db3124c38b477f58ab279eaeb44e6973b7c1085b18a2ee757.m3u8', '건달한테 사채를 빌리고 가스총을 쏜 만화가', '"사채로 5천만원을 빌리고 1년을 안 갚아보자. 그러면 건달들이 어떻게 나오는지 보고 그 스토리를 쓰자."', 0, 0, 0, NULL, '2016-03-10 02:43:30', 0, NULL, NULL, NULL, 1, 0, '김성모', '근성의 만화가', NULL, NULL),
	(41, 1, 8, 'thumbnail/9de2c57d-3b0d-403a-af47-b36f8e71b41e.mp4_20160310_120828', 'stream_output/948dc989-d4ac-4d3b-b6df-a44ab401cd59/ff9e3c17f6912dbdfaa237783134e58108db8eebe0b22404eaf1505c47e3e3bb.m3u8', '번아웃이 되어서 퇴사하고 싶은 당신에게', '"마음 상태가 안 좋을 때는 우선 중요한 결정을 하지 마세요."', 0, 0, 0, NULL, '2016-03-10 03:12:22', 0, NULL, NULL, NULL, 1, 0, '우종민', '정신과 의사', NULL, NULL),
	(42, 1, 8, 'thumbnail/f426f95d-cf3e-4e1c-9c73-5f1d261b0caa.mp4_20160310_121912', 'stream_output/ae08677d-9674-4afd-b9a3-2bbe9cecd2dc/becefeff3acdd9723ef3553e61ee86fb846678bdb8410d53c3a464116c4eb15c.m3u8', '안정적인 직장이 보람이 없어 고민이라면', '"이 고민이 회사 때문은 아니에요. 이 고민은 본인 때문이에요."', 0, 0, 0, NULL, '2016-03-10 03:22:44', 0, NULL, NULL, NULL, 0, 0, '유수연', '독설 전문 영어강사', NULL, NULL),
	(43, 1, 3, 'thumbnail/671e4d9e-c949-4f0f-9384-5cceebf7aad0.mp4_20160310_141100', 'stream_output/3470608b-04c8-4e1d-8fa4-dc132395a975/8da84e91ed04ae448b01e552f889c91fbae58d2ba7d09cf0956f65c8748e35a6.m3u8', '딱 맞는 사람을 알기 위해 필요한 연애 경험', '"클럽에 가는 걸 싫어하는 남자한테 여러분이 어떻게 반응하는지 알려면, 여러분이 클럽을 가봐야 돼요."', 0, 1, 0, NULL, '2016-03-10 05:09:32', 0, NULL, NULL, NULL, 6, 0, '김미경', '스피치 강사', NULL, NULL),
	(44, 1, 10, 'thumbnail/7ee9cc7f-4171-437e-863e-a1a1a164a17f.jpg', 'stream_output/63fb9432-9735-4844-90cb-04a4a480c83d/d4bc3bb96bd9fcec7291a6198d4754493f99b4159117f12efd0a535175e1368c.m3u8', '새로운 게 나올 수 없는 환경에서 성공하는 방법', '"조금씩의 변주가 쌓이다보면 원심력이 생기면서 자기 것이 되는 거예요."', 0, 0, 0, NULL, '2016-03-10 05:18:56', 0, NULL, NULL, NULL, 0, 0, '김구라', 'MC', NULL, NULL),
	(45, 1, 5, 'thumbnail/e6d58f60-b2bd-4818-91b1-2af627bc0b81.mp4_20160310_142427', 'stream_output/4a1e9e37-8584-4090-ba52-309a27b4b39b/4a201b4487483e2fac7e8969a3ae3beccf4b3207b0c62b36ae0f798e67cc2e2e.m3u8', '영상의 홍수 속에서도 빛나는 소설의 강점', '"스마트폰만 보는 시대에 소설을 읽기가 쉽지 않죠. 하지만 소설이 가진 강점이 있어요."', 0, 0, 0, NULL, '2016-03-10 05:26:39', 0, NULL, NULL, NULL, 0, 0, '김영하', '소설가', NULL, NULL),
	(46, 1, 3, 'thumbnail/5f5d32fc-239c-4bbc-9d77-1c07d4994b98.mp4_20160310_143213', 'stream_output/aabd0e24-ab0c-4157-94d1-47a40361e521/ac9fe0bfd6f511b978352f5bd7da44c34dcc2a562747c49932235e8f693a0339.m3u8', '사랑과 조건 사이에서 고민하는 당신에게', '"20대, 30대 젊은 여성 분들의 고민상담 메일의 절반 이상은 이런 메일입니다."', 0, 0, 2, NULL, '2016-03-10 05:36:32', 0, NULL, NULL, NULL, 76, 0, '김어준', '딴지일보 총수', NULL, NULL),
	(47, 1, 10, 'thumbnail/5d63c444-d3a8-4e65-9a46-da96571b04be.wmv_20160310_145330', 'stream_output/c1635297-bb53-4e5d-b05b-434d13f16499/96509eb14ce0fefe18bfaecfe6e9d6134d7bbf5524d96a2d3538260a0da21267.m3u8', '좋아하는 일에 용기를 내게 해줬던 한마디', '"부끄러운 그림인지, 부끄럽지 않은 그림인지 판단하는 것은 작가의 일이 아니에요."', 0, 0, 0, NULL, '2016-03-10 05:49:42', 0, NULL, NULL, NULL, 6, 0, '김그래', '공감 웹툰 작가', NULL, NULL),
	(48, 1, 11, 'thumbnail/6207870e-5fc6-4dfa-ad0d-b842d0d679ae.wmv_20160310_150007', 'stream_output/8a3f2bc6-efbc-4baf-9190-bba0a12b27b1/5a39f5bd264106afec283745ebadaff5fd9a19d9fc42d5d8907f11d1b51abced.m3u8', '아무것도 모르던 스무살의 패션 입문기', '"고등학교 2학년 때 서울에 올라와서 청바지를 처음 입어봤어요."', 0, 0, 0, NULL, '2016-03-10 06:02:24', 0, NULL, NULL, NULL, 0, 0, '김원중', '모델킹', NULL, NULL),
	(49, 1, 9, 'thumbnail/dacab060-23f9-402a-853a-ff87f2c38b99.mp4_20160310_150456', 'stream_output/d41da298-c047-4692-8aa9-2e659dc9c515/6c9b862b7a21feb317a3e7d6e4bd011d007260a5969fcd327a779a26728e159f.m3u8', '힘든 조건과 환경 때문에 슬퍼하는 당신에게', '"저 사람들은 온 몸으로 운명을 해석하고 살았구나. 그래서 저 사람은 온 몸이 콘텐츠고 입만 벌리면 명언이구나."', 0, 0, 0, NULL, '2016-03-10 06:09:02', 0, NULL, NULL, NULL, 159, 0, '김미경', '스피치 강사', NULL, NULL),
	(50, 1, 11, 'thumbnail/b491a209-7686-4fd5-a49a-7daa81cd2725.mp4_20160310_151224', 'stream_output/8c3c8040-eade-4e39-9e2f-6a2e2902e3b9/fb845bf19875f6e6ea5e95f63b458c4599eb3681e0672617db8941b3b75ea8ee.m3u8', '연매출 30억 장사꾼의 비루했던 첫 시작', '"5명을 모아서 20만원씩 걷었어요."', 0, 0, 0, NULL, '2016-03-10 06:14:28', 0, NULL, NULL, NULL, 0, 0, '김윤규', '청년장사꾼', NULL, NULL),
	(51, 1, 9, 'thumbnail/83f70dec-1cd9-42a7-9eec-ddc9f8a0d275.mp4_20160310_152903', 'stream_output/58e18fa6-a916-44c0-a13d-2d0d59ab3845/727fc5a7417730977c6d6f1db5825c3c188883fee279d7b188cf20573b1024a6.m3u8', '새로운 고비 앞에서 두려워하는 당신에게', '"그 언덕을 넘어서 뒤에 있는 세상을 내가 모르니까 공포스러웠던 거예요."', 0, 1, 0, NULL, '2016-03-10 06:32:38', 0, NULL, NULL, NULL, 2, 0, '홍석천', '이태원 탑게이', NULL, NULL),
	(53, 1, 7, 'thumbnail/43e4daee-6410-46f2-a61f-be4afbe57892.mp4_20160310_155052', 'stream_output/525058ea-2a94-42fa-9672-b53f1dda5f18/8c77c16fd27eb3a39da554dbdaabd75c896c546b9c3bfa05ddc2342645eba2fd.m3u8', '섹시하게 말 잘하는 사람이 되는 쉬운 방법', '"머리 속에 있는 이야기를 음성으로 바로 녹음을 해요."', 0, 0, 0, NULL, '2016-03-10 06:55:50', 0, NULL, NULL, NULL, 0, 0, '김지양', '66100 편집장', NULL, NULL),
	(60, 1, 10, 'thumbnail/796f85f8-af59-4275-8587-1e9f45a37c1b.mp4_20160310_170213', 'stream_output/1a4f1974-7732-4ea0-8366-d0b4ef2022c8/5895662ea3eef7533bca4bed753aba37daaaf9e1a4312544ea951452b91298b7.m3u8', '지금 읽을 책을 고르는 방법', '"내가 보는 책들은 내가 만난 장애물로 결정되는 것 같아요."', 0, 0, 2, NULL, '2016-03-10 18:56:13', 0, NULL, NULL, NULL, 4, 0, '한동헌', '마이크임팩트 대표', NULL, NULL),
	(61, 1, 7, 'thumbnail/4d504871-7baf-43c8-8a61-6428cdb2f01e.mp4_20160310_190458', 'stream_output/91c647e9-8f7c-40e0-9689-1a1901c1a35d/fa78cd738e772746669fe9547bbe9d027d040a7e0cb7a6a3ff8a831c9d5c3aa9.m3u8', '남자만 바라보고 있는 여자들에게', '"도시락 같은 거 안 싸줘도 돼요."', 0, 0, 0, NULL, '2016-03-10 19:11:09', 0, NULL, NULL, NULL, 0, 0, '레이디 제인', '가수', NULL, NULL),
	(62, 1, 10, 'thumbnail/6a3adcb5-ea11-4502-865d-060f0fef85de.png', NULL, '매 순간 내 감정의 주인이 되어야 하는 이유', '"여러분이 자신의 감정을 당당하게 지키지 못하는 순간, 그 피해는 누구에게 갈까요?"', 2, 0, 1, NULL, '2016-03-10 23:44:40', 0, NULL, NULL, NULL, 7, 0, '강신주', '철학자', NULL, NULL),
	(65, 1, 11, 'thumbnail/4ef6fa64-d931-4a2b-a38d-0010d0ff456d.mp4_20160311_001517', 'stream_output/6902970d-6c40-44a6-b512-a6caf812d911/7bb591c3c492669a6372ad8cb2b0df58a6a4459ba3ab3f682285aeb46371c7f0.m3u8', '서점에서 처음 만났던 10살 연하의 아내', '"나이 차이 얼마 안 났어요. 그저 10살 차이?"', 0, 0, 0, NULL, '2016-03-11 00:18:05', 0, NULL, NULL, NULL, 0, 0, '장진', '영화감독', NULL, NULL),
	(66, 1, 10, 'thumbnail/1e0889e9-bead-4dd1-9dcf-3e568dde08eb.mp4_20160311_004753', 'stream_output/8950ce37-8184-4c50-8680-65e4901ca863/3db06368b67621b973fbec557aa708794d1ade12f185fea09019a5620ab5dba6.m3u8', '열심히만 산다고 추억을 못 만들고 있지 않나요?', '"열심히만 사는 게 진짜 잘 사는 건지 생각을 해봤어요."', 0, 0, 0, NULL, '2016-03-11 00:48:29', 0, NULL, NULL, NULL, 0, 0, '최현석', '크레이지 셰프', NULL, NULL),
	(67, 1, 9, 'thumbnail/92755401-0739-4bf6-93b3-a280563381c9.mp4_20160311_014059', 'stream_output/f54873b2-bbaa-4a91-9a3e-280cad6a4c4e/c0daf0205f13fa481c3aa3a41c081107b95ceb3c6a1e39948a5ff2947fe9e881.m3u8', '수많은 단점 때문에 자존감이 낮은 당신에게', '"전 제 자신에 대해서 싫은 점이 좋은 점보다 훨씬 많아요."', 0, 0, 0, NULL, '2016-03-11 01:48:14', 0, NULL, NULL, NULL, 0, 0, '타블로', '펀치라인킹', NULL, NULL),
	(68, 1, 11, 'thumbnail/1a4010f3-0533-453e-ad88-28d2d357e2e6.mp4_20160311_014857', 'stream_output/62617d85-77de-4b2a-a2b1-8010d471b9c9/bd8ed8f434ec08a8bd14aa551f332d6b87afaf09ed485601a5079ef40ac5973a.m3u8', '동양의 파바로티가 겪었던 힘든 유년시절', '"그 14살에 서울에 올라와서 성수동 공장지대에 다녔는데 그 옆에 고등학교가 있었습니다."', 0, 0, 0, NULL, '2016-03-11 01:53:55', 0, NULL, NULL, NULL, 0, 0, '조용갑', '동양의 파바로티', NULL, NULL),
	(69, 1, 3, 'thumbnail/e72cb5cb-546f-4c1a-a1d5-a9de425130f2.mp4_20160311_015714', 'stream_output/32e64b13-90df-4cfe-967c-c0a58c3c5d5b/52e7f60f4e6f0712abc418e236783f79f16f0db5c015885ef420e367d40756a0.m3u8', '연애가 좋은 이유', '"그냥 온전한 품이 하나 더 생긴다고 생각해요."', 0, 0, 0, NULL, '2016-03-11 01:58:13', 0, NULL, NULL, NULL, 2, 0, '김그래', '공감 웹툰 작가', NULL, NULL),
	(71, 1, 5, 'thumbnail/bdfe56ec-2736-4f23-a467-d37246d42e55.jpg', NULL, '경쟁자보다 환경이 훨씬 더 중요한 이유', '"현대의 실패는 경쟁자와의 경쟁에서 오지 않습니다."', 2, 0, 0, NULL, '2016-03-15 15:59:39', 0, NULL, NULL, NULL, 130, 2, '김난도', '트렌드코리아 저자', 'thumbnail/35db5ede-a0c4-4180-bf0d-2b81f68b1029.jpg', NULL),
	(72, 1, 10, 'thumbnail/b58f45ba-82e0-4193-bc45-66bf296bb749.jpg', NULL, '창의력을 높이는 3가지 방법', '"창의력은 결국 관계없던 것들을 연결시키는 능력이잖아요."', 2, 0, 0, NULL, '2016-03-15 16:13:50', 0, NULL, NULL, NULL, 34, 0, '데니스 홍', '로봇공학자', 'thumbnail/d6e3678d-d86f-4d5a-9529-f7fe995befdd.jpg', NULL),
	(73, 1, 10, 'thumbnail/4f6dafa7-5eeb-4151-a868-e063dca7e53e.jpg', NULL, 'ㅄ을 멘토로 삼으세요', '"정확한 표현을 위해 2번만 비속어를 쓰겠습니다."', 2, 0, 1, NULL, '2016-03-15 16:25:38', 0, NULL, NULL, NULL, 266, 1, '유병재', '병맛 작가', 'vertical_thumbnail/4363d7bd-bc83-49db-ae0b-32f21406fb18.jpg', NULL),
	(74, 1, 10, 'thumbnail/144f7019-cb4e-4e83-b354-5d970bc64cfb.jpg', NULL, '돈을 못 벌어도 좋아하는 일을 해야 할까요', '"제 주위에 하기 싫어도 돈을 잘 벌 수 있는 일을 했던 분들은."', 2, 0, 0, NULL, '2016-03-15 16:37:31', 0, NULL, NULL, NULL, 36, 0, '윤종신', '월간 가수', 'thumbnail/e388740c-c76c-460a-90dc-ddd84d0f0eeb.jpg', NULL),
	(76, 1, 3, 'thumbnail/884abb7b-cd00-43e4-8b22-d44c7167052e.mp4_20160310_164642', 'stream_output/ae8c1c9f-0d32-4f18-bc97-6b1f7ed0e922/dff2a59a0d18558ba878d01940a33448994b45f16733bbfe031faa80dc5d1b80.m3u8', '연인과 싸워도 절대 잊지 말아야 할 것', '"사랑이 참 좋은 그림인데도 준비가 안 되어 있어서 오래 못가는 경우가 많아."', 0, 0, 0, NULL, '2016-03-15 18:17:15', 0, NULL, NULL, NULL, 35, 0, '홍석천', '이태원 탑게이', NULL, NULL),
	(77, 1, 5, 'thumbnail/af0acdcb-bba7-4e0a-80f5-878a6563765e.wmv_20160310_165625', 'stream_output/94b1052b-70c4-4dc1-9d9e-2118d1383f46/2ce9d11817dc438eb29dd909eddf1b6eb6853a228f4e95f3aa7612fafe0b9cee.m3u8', '나를 위해 정치에 관심을 가져야 하는 이유', '"우리는 정치적 상상력이 막혀있습니다."', 0, 0, 0, NULL, '2016-03-15 18:20:20', 0, NULL, NULL, NULL, 1, 0, '진중권', '문화평론가', NULL, NULL),
	(78, 1, 11, 'thumbnail/bcedece6-0301-49c0-9c1a-217e22e733a4.wmv_20160310_163705', 'stream_output/ab16bd44-a728-4421-9a83-31523bb3f08d/691757f8ac1fc377ab59293f0bfdc8b2323dbd5b234cafd97a3637e36886437f.m3u8', '공항패션과 출근길은 디스패치가 원조였다', '"파파라치로 디스패치를 인식하는 분들이 많은데, 디스패치는 1년에 단 4번 밖에 파파라치 기사를 쓰지 않아요."', 0, 0, 0, NULL, '2016-03-15 18:25:59', 0, NULL, NULL, NULL, 2, 0, '이명구', '디스패치 대표', NULL, NULL),
	(79, 1, 8, 'thumbnail/c8b84381-0723-48d6-bda0-7fc98ade20b5.mp4_20160310_161330', 'stream_output/33d6a43c-a5a4-48a4-9a9c-fbc4417f3357/befe5d966153aba06f4b13b22544aa98c9f5f506204234f8d399410e28171d40.m3u8', '기발한 아이디어를 내는 방법', '"이 아이디어 마지막에 누가 뽑았냐고 물어보니 아무도 모르는 거예요."', 0, 0, 0, NULL, '2016-03-15 18:27:36', 0, NULL, NULL, NULL, 4, 0, '김봉진', '배달의민족 대장', NULL, NULL),
	(80, 1, 2, 'thumbnail/fdb274bb-86b4-42bb-af3c-0b22ac0c9ca6.mp4_20160310_160809', 'stream_output/2b223543-7dab-43ce-b9e0-64c3e421f990/fb3a07149dc8b4bb642194e41f595bef7905c666e8793c4f19051dedbdda20fc.m3u8', '꿈을 즐기는 마음이 더 현실적인 이유', '"전 되게 현실주의자예요. 그런데 저한테는 평범한 사람들이 사는 과정이 비현실적이었어요. 음악이 제 감정에 와닿는 현실적인 것들이었어요."', 0, 0, 0, NULL, '2016-03-15 18:30:01', 0, NULL, NULL, NULL, 46, 0, '가리온', '힙합시조새', NULL, NULL),
	(81, 1, 4, 'thumbnail/ada93c83-3540-45c4-bf3d-51cd85de3696.mp4_20160310_160255', 'stream_output/ea1b1446-1a40-416a-a835-37486ded61ae/53fb68573145926c44ab56c5d6393b9ad4a4eda1a4e993b4b541051f96ce0f4e.m3u8', '가사를 쓸 때 핵심은 상황 설정', '"똑같은 사랑 이야기지만 캐릭터가 주어지면 이야기가 달라져요."', 0, 0, 0, NULL, '2016-03-15 18:34:30', 0, NULL, NULL, NULL, 2, 0, '김이나', '요즘 대세 작사가', NULL, NULL),
	(82, 1, 11, 'thumbnail/a077b24c-ec45-4bf4-abfa-7c87328de4c7.mp4_20160309_181426', 'stream_output/13870d0d-525c-4922-ab60-0a2394791495/3d9279bc5c03cce871c9b5a89a11b3177a8498c59fbb64c20d35a2dbf98d5a27.m3u8', '유희열 덕후가 스케치북 MC가 되기까지', '"나랑 라디오 고정으로 하는 여자 연예인은 네가 처음이야"', 0, 0, 0, NULL, '2016-03-15 18:42:42', 0, NULL, NULL, NULL, 0, 0, '박지선', '희열바라기', NULL, NULL),
	(83, 1, 5, 'thumbnail/bd0e498b-2ede-411c-8299-e18001912b0f.wmv_20160316_122413', 'stream_output/ee1aacf8-3f99-43ce-b68b-2ea52c43446a/4fbb5f69b2cd5c2ffe2fde58a5f3d8bcc5b4435c48c4e094bcd9641114f24c36.m3u8', '강점을 관리하고 약점을 채워야 하는 이유', '"모든 사람은 태어나는 순간 치우쳐져 있어요."', 0, 0, 0, NULL, '2016-03-16 12:27:02', 0, NULL, NULL, NULL, 0, 0, '고미숙', '문학평론가', NULL, NULL),
	(84, 1, 9, 'thumbnail/017a9a96-e3e9-4200-a1b9-21e4b54e9044.mp4_20160316_135321', 'stream_output/dfa69bde-e7d7-4ad9-bb11-46ccf8113996/6712fb9a28982193a833f786bf69a9d375a3ab8b60e275f024cb46f279ba8b82.m3u8', '계속되는 실패로 자책감이 드는 당신에게', '"계속 실패하면 마음이 어려울 수 있어요. 실패가 자존감으로 연결될 수 있기 때  문이에요."', 0, 0, 0, NULL, '2016-03-16 13:51:53', 0, NULL, NULL, NULL, 1, 0, '한동헌', '마이크임팩트 대표', NULL, NULL),
	(85, 1, 7, 'thumbnail/6a7ba87b-b859-46fd-92e5-04e4f9671545.wmv_20160316_135714', 'stream_output/833bb45f-d194-46bf-8889-bbfd7c4d3358/f6c99ee9ebc3e1316c81bf76fcc93a3aa4b6f6daff071d80e823bd3e8d476407.m3u8', '자존감 없이 연애를 하는 여성들에게', '"몇 년 전에 유희열 씨와 프로그램을 할 때 우리끼리 격하게 공감했던 게 있어요."', 0, 0, 0, NULL, '2016-03-16 14:02:54', 0, NULL, NULL, NULL, 1, 0, '임경선', '걸크러쉬 작가', NULL, NULL),
	(86, 1, 2, 'thumbnail/32bd50d9-827d-4c60-89c9-eaa2c1cea33a.mp4_20160316_144313', 'stream_output/1a5cba32-f529-4e5d-96ad-d17ba1b2b400/bbdc96d30c91eb8aa16e569c784161e044278be4fbf32231cf2cf76ff18d1e85.m3u8', '독한 마음이 필요한 당신을 위한 영상', '"인생에 일정 기간에는 노력을 내놓아야 해요. 그걸 언제 내놓으실 거예요?"', 0, 0, 0, NULL, '2016-03-16 14:56:16', 0, NULL, NULL, NULL, 0, 0, '유수연', '독설 전문 영어강사', NULL, NULL),
	(87, 1, 4, 'thumbnail/d491173e-6364-461d-8b40-a3852e011ff6.wmv_20160316_152510', 'stream_output/fda6fc27-c377-4e1f-9837-a31a3f0c6b53/a935b64e11973ff9f49fd01d9b3f6dbd852f69c0e328d1efeffd5961e22efa1f.m3u8', '디자이너로서 경험했던 서울 패션 위크', '"저희 팀이 처음 서울 컬렉션을 하고 정말 욕을 많이 먹었어요."', 0, 0, 0, NULL, '2016-03-16 15:28:41', 0, NULL, NULL, NULL, 2, 0, '김원중', '모델킹', NULL, NULL),
	(88, 1, 6, 'thumbnail/3c7e04e0-1c09-4b79-8ab6-8cef23884f6f.mp4_20160316_153121', 'stream_output/ab6c2061-764f-45d7-9349-3d98aa08cba6/4e6a5005ada668ec6f43f9fce8c0ee3c77f459914cae67ac92c5f15c69626b45.m3u8', '신박한 로봇 BEST 5', '"신기하죠? 저는 이 로봇보다 더 장애물을 잘 올라가는 로봇은 본 적이 없습니다."', 0, 0, 0, NULL, '2016-03-16 15:34:31', 0, NULL, NULL, NULL, 1, 0, '데니스 홍', '로봇공학자', NULL, NULL),
	(89, 1, 3, 'thumbnail/1ee57121-d3d7-4ba9-aae9-a298666821dc.mp4_20160316_153832', 'stream_output/1a4f44d5-642d-4abb-8a2e-1402af60420c/91d0fa9884e9cf438490603fe331a880775c0c53af3ecb0183061ff99fad40ec.m3u8', '연애로 성장하는 사람들의 마인드', '"내 세계의 문을 하나씩 열 때마다 내 세계가 점점 넓어지는 거죠."', 0, 0, 0, NULL, '2016-03-16 15:42:05', 0, NULL, NULL, NULL, 13, 0, '레이디 제인', '가수', NULL, NULL),
	(90, 1, 4, 'thumbnail/371851f4-1181-45ed-9c51-0f213be66daf.wmv_20160316_154845', 'stream_output/57dbddb6-e8e6-4b0e-ad02-c7ab83254057/fac7c867017f2620debfe75966ea902d5c791ad7bd980eb61afc7d80823211ab.m3u8', '콘텐츠 제작자에게 중요한 것', '"단언하건데 앞으로 학벌이나 스펙보다는 자기만의 콘텐츠나 취향을 갖고 있는 사람들이 인정받는 사회가 될 겁니다."', 0, 0, 0, NULL, '2016-03-16 15:50:11', 0, NULL, NULL, NULL, 0, 0, '박지호', '아레나 편집장', NULL, NULL),
	(91, 1, 4, 'thumbnail/b4413cb8-1219-4bba-af90-83c957739f16.wmv_20160316_155303', 'stream_output/239474dd-e662-47f0-8ec2-3d350998de8e/49c6a07f4e933589370ec5d8d9566148de5f79310259e9b2b76b9fd49b737d15.m3u8', '디자이너 세종의 한글이 대단한 이유', '"세계 역사상 글자를 디자인한 나라는 없었어요. 글자를 개인이 만든 예도 없었죠."', 0, 0, 0, NULL, '2016-03-16 16:00:41', 0, NULL, NULL, NULL, 12, 0, '안상수', '디자이너', NULL, NULL),
	(92, 1, 2, 'thumbnail/4ceab3f3-04b8-4a7e-97b9-abc27906aba9.mp4_20160316_160435', 'stream_output/795e6ba4-7fbc-456e-977a-c326611e894d/b347b420e0ec32d9bbe582b5a58211d64599993fa9f4bf644243ad6c2c1f521a.m3u8', '다짐한 것을 실천으로 옮기는 법', '"작은 성공을 계속 경험하세요."', 0, 0, 0, NULL, '2016-03-16 16:08:34', 0, NULL, NULL, NULL, 15, 0, '김형철', '철학자', NULL, NULL),
	(93, 1, 9, 'thumbnail/8c62e807-7ca5-40ff-b5dc-d3a7ac1d0330.mp4_20160316_164445', 'stream_output/58d13b49-486e-4e13-9438-aedc028dea97/a278a252d50d9f9feaadea27e4a0875e5b22e952f6d779a2e920070668c19fee.m3u8', '아직 꿈이 없고 이뤄낸 게 없어도 괜찮은 이유', '"혹시 할랜드 샌더슨이란 사람 아세요?"', 0, 0, 0, NULL, '2016-03-16 16:48:05', 0, NULL, NULL, NULL, 0, 0, '김봉진', '배달의민족 대장', NULL, NULL),
	(94, 1, 7, 'thumbnail/5085c179-b731-42f5-a723-beb3578242eb.jpg', NULL, '다이어트하지 않고도 예쁘게 옷 입는 방법', '"내 체형이 정확히 어떤지 아는 것."', 2, 0, 0, NULL, '2016-03-16 18:09:20', 0, NULL, NULL, NULL, 19, 0, '김지양', '66100 편집장', 'thumbnail/2dc22f4f-8eaf-4769-90b9-0b7abc81c48a.jpg', NULL),
	(95, 1, 8, 'thumbnail/515e9bfb-78c1-4d63-935f-65c0330ba307.jpg', NULL, '비즈니스 고비에 대한 태도와 대응법', '"솔직하게 얘길 나누면 의외로 사람들이 상식적인 수준에서 해결 방법들을 찾게 되는 것 같아요."', 2, 0, 0, NULL, '2016-03-16 18:22:53', 0, NULL, NULL, NULL, 0, 0, '김봉진', '배달의민족 대장', 'thumbnail/4ee5b81c-d2db-4871-b84a-729f590c5e1f.jpg', NULL),
	(96, 1, 9, 'thumbnail/f8907a92-b637-449d-825d-703a22fd1a48.jpg', NULL, '아무리 힘들어도 이건 포기하지 말아요', '"그 마음만 있으면 어느 때에도 다시 시작할 수 있는 환경이 조성될 것 같아요."', 2, 0, 0, NULL, '2016-03-16 18:27:11', 0, NULL, NULL, NULL, 18, 0, '유병재', '청춘의 아이콘', 'thumbnail/cee9bfb4-8611-4aea-9ca3-09fc695c0d07.jpg', NULL),
	(97, 1, 3, 'thumbnail/b0815dbe-d2ff-4896-8ec8-a6d3cceaa973.jpg', NULL, '우리의 연애가 잘못되는 이유와 해결 방법', '"연애가 잘못되어 가는 가장 중요한 이유는 무엇일까요."', 2, 1, 29, NULL, '2016-03-16 18:47:30', 0, NULL, NULL, NULL, 209, 35, '알랭 드 보통', '소설가', 'thumbnail/eb2d9260-d2ea-4e18-8113-50262b4a7b09.jpg', NULL),
	(98, 1, 10, 'thumbnail/82f9de42-5429-4a03-97fe-fb8fa7a1c092.mp4_20160316_190353', 'stream_output/d17b69e9-f004-405a-a4e8-703786fc6013/8c809f955ba57c7178d60b9cc5fc9e6119fa94ea9b1d6b6e4a102bf77c065932.m3u8', '실패가 두려운 사람에게 들려주는 사유리의 인생', '"저는 살면서 99% 정도 실패해온 것 같아요."', 0, 0, 0, NULL, '2016-03-16 19:08:39', 0, NULL, NULL, NULL, 0, 0, '사유리', '4차원', NULL, NULL),
	(99, 1, 3, 'thumbnail/bf75aebc-0f32-4024-a454-9b6c4b94157a.mp4_20160316_191207', 'stream_output/d37c144f-3de6-464b-8beb-a68d68f11b71/cd8fc80571cfe43af69b4e13ab35325f34b22de552ba9d70ed8be4dfddb7831e.m3u8', '정말 사랑하는 사람을 못 만나서 슬픈 당신에게', '"어딘가 있다?"', 0, 0, 0, NULL, '2016-03-16 19:15:02', 0, NULL, NULL, NULL, 0, 0, '윤종신', '월간 가수', NULL, NULL),
	(100, 1, 1, 'thumbnail/d90312e6-5703-4ae0-ad51-21260582e27e.mp4_20160316_194553', 'stream_output/2e452e19-f827-4ff9-9d64-ccdb744c7eb9/9f073e2e7f36c915d95cfc324db73d69ef16ea73883ea3818b246e1c613884df.m3u8', '인식할 수 있어야만 행복일까', '"아이들은 행복을 일부러 깨닫지 않고도 그냥 행복합니다."', 0, 0, 0, NULL, '2016-03-16 19:49:08', 0, NULL, NULL, NULL, 5, 4, '탈 벤 샤하르', '심리학자', NULL, NULL),
	(101, 1, 1, 'thumbnail/2f63968b-a973-4679-8441-200ab6c191c0.jpg', 'stream_output/2a9b33a9-d207-453c-a2fd-24f0664db9b9/448a4301ab757988e75c6cbc1fcbae61d68060a2d51605b8cd543242f5d67d5f.m3u8', '인생이 행복해지기 위한 게임인 이유', '"신은 여러분이 성공했는지에 대해서는 관심이 없지만, 여러분이 현재 행복한지에 대해서는 많은 관심을 가지고 계실 겁니다."', 0, 0, 0, NULL, '2016-03-17 13:38:49', 0, NULL, NULL, NULL, 1, 0, '신해철', '가수', NULL, NULL),
	(117, 144, NULL, 'http://img.youtube.com/vi/5aT9recIUJY/0.jpg', 'https://www.youtube.com/watch?v=5aT9recIUJY', 'dasdas', 'dasdas', 1, 0, 0, NULL, '2016-03-30 13:54:32', NULL, NULL, NULL, NULL, 0, 0, 'dasdas', 'dasd', NULL, NULL),
	(118, 144, NULL, 'http://img.youtube.com/vi/5aT9recIUJY/0.jpg', 'https://www.youtube.com/watch?v=5aT9recIUJY', 'dasdas', 'dasdas', 1, 0, 0, NULL, '2016-03-30 13:54:32', NULL, NULL, NULL, NULL, 0, 0, 'dasdas', 'dasd', NULL, NULL),
	(120, 144, NULL, 'http://img.youtube.com/vi/5aT9recIUJY/0.jpg', 'https://www.youtube.com/watch?v=5aT9recIUJY', 'dasdas', 'dasdas', 1, 0, 0, NULL, '2016-03-30 13:59:42', NULL, NULL, NULL, NULL, 0, 0, 'dasdas', 'dasd', NULL, NULL),
	(121, 144, NULL, 'http://img.youtube.com/vi/5aT9recIUJY/0.jpg', 'https://www.youtube.com/watch?v=5aT9recIUJY', 'dasdas', 'dasdas', 1, 0, 0, NULL, '2016-03-30 14:00:03', NULL, NULL, NULL, NULL, 0, 0, 'dasdas', 'dasd', NULL, 1),
	(122, 144, NULL, 'http://img.youtube.com/vi/5aT9recIUJY/0.jpg', 'https://www.youtube.com/watch?v=5aT9recIUJY', 'dasdas', 'dasdas', 1, 0, 0, NULL, '2016-03-30 14:09:01', NULL, NULL, NULL, NULL, 0, 0, 'dasdas', 'dasd', NULL, 2),
	(123, 144, NULL, 'http://img.youtube.com/vi/5aT9recIUJY/0.jpg', 'https://www.youtube.com/watch?v=5aT9recIUJY', 'dasdas', 'dasdas', 1, 0, 0, NULL, '2016-03-30 14:09:17', NULL, NULL, NULL, NULL, 0, 0, 'dasdas', 'dasd', NULL, 1),
	(125, 144, NULL, 'http://img.youtube.com/vi/5aT9recIUJY/0.jpg', 'https://www.youtube.com/watch?v=5aT9recIUJY', 'dasdas', 'dasdas', 1, 0, 0, NULL, '2016-03-30 15:03:52', NULL, NULL, NULL, NULL, 0, 0, 'dasdas', 'dasd', NULL, 2);
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;


-- Dumping structure for table micimpact.channel
CREATE TABLE IF NOT EXISTS `channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `introduce` varchar(500) DEFAULT NULL,
  `likes` int(11) DEFAULT '0',
  `favorite` int(11) DEFAULT '0',
  `is_show` int(1) DEFAULT '1',
  `is_liked` int(1) DEFAULT '0',
  `is_favorited` int(1) DEFAULT '0',
  `type` int(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cards_recent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_channel_users` (`user_id`),
  KEY `FK_o3gbltcer4tv7yyygw20m2m62` (`cards_recent_id`),
  CONSTRAINT `FK_channel_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_o3gbltcer4tv7yyygw20m2m62` FOREIGN KEY (`cards_recent_id`) REFERENCES `cards` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.channel: ~2 rows (approximately)
DELETE FROM `channel`;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` (`id`, `user_id`, `title`, `introduce`, `likes`, `favorite`, `is_show`, `is_liked`, `is_favorited`, `type`, `created_at`, `cards_recent_id`) VALUES
	(1, 144, 'channel', 'introduce', 0, 0, 1, 0, 0, 0, '2016-03-30 13:54:04', 123),
	(2, 144, 'channel 2', 'introduce', 0, 0, 1, 0, 0, 0, '2016-03-30 13:54:04', 125);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
