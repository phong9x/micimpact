-- --------------------------------------------------------
-- Host:                         micimpact.cuu9lomuvg0o.ap-northeast-1.rds.amazonaws.com
-- Server version:               5.6.23-log - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
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
  KEY `FK_7cwih8xwjt0tvqrrig4jsvsav` (`channel_id`),
  CONSTRAINT `FK_7cwih8xwjt0tvqrrig4jsvsav` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.cards: ~59 rows (approximately)
DELETE FROM `cards`;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` (`id`, `user_id`, `category_id`, `thumbnail_url`, `target_url`, `title`, `body`, `type`, `count_like`, `share`, `runing_time`, `created_at`, `ad_is`, `ad_ment`, `ad_link`, `related_card_id`, `hit_count`, `comment_count`, `actor`, `actor_job`, `vertical_thumbnail_url`, `channel_id`) VALUES
	(31, 1, 5, 'thumbnail/e0a2c0fe-0635-4b67-91ab-5dc5b4ffe6b2.mp4_20160309_153413', 'stream_output/05b34e89-2e94-4d9f-aa5f-1c0737387160/c35e4802edd330a242a9b4c51152c45e8e7a21f9e57ec54159d8fba88d906698.m3u8', '국가 브랜드를 정할 때 가장 중요한 것', '"대한민국의 브랜드는 오히려 우리와 같은 외국인들이 정하는 것입니다."', 0, 0, 0, NULL, '2016-03-09 06:29:56', 0, NULL, NULL, NULL, 34, 0, '기 소르망', '칼럼니스트', NULL, NULL),
	(35, 1, 2, 'thumbnail/d1c73d44-c2a9-4c1b-b7ee-b2a706f92678.mp4_20160309_163509', 'stream_output/ac641db3-1abb-4d20-ad1c-0d5ee4031e07/8dd2af83e6cacc8ccf466472f7d1604f0a6235f9119a7a1181bac35f5bfbcbaa.m3u8', '이루고 싶은 게 있는 사람들의 공통된 생각', '"저한테 그건 그냥 계속 하는 거예요. 생활이고 삶이에요."', 0, 2, 3, NULL, '2016-03-09 08:00:48', 0, NULL, NULL, NULL, 159, 3, '강레오', '쉐프', NULL, NULL),
	(36, 1, 6, 'thumbnail/08c5bafd-6807-4dd5-a804-841427a151ce.mp4_20160309_172655', 'stream_output/fce6532b-037c-4187-b844-5cc96ca7139c/fa3c4599d4ec6c4caddc2d24102b45d138a53ab9bd134403b494344c1fcda05b.m3u8', '별은 어떻게 태어나서 어떻게 죽는가', '"산소, 질소, 탄소는 우주 공간에 있던 게 아니고 별이 태어나고 죽어가는 과정에서 생겨나요."', 0, 0, 0, NULL, '2016-03-09 08:46:05', 0, NULL, NULL, NULL, 5, 0, '이명현', '천문학자', NULL, NULL),
	(38, 1, 4, 'thumbnail/27374f3b-4b57-4067-b36a-fef1ade0aedb.wmv_20160309_194127', 'stream_output/4b2c74e8-4ee0-47b7-8d91-a72c2a872a9d/688a89092c757f6f02931338d2d2be3497301ceb0addf7b9869641e86d49c40a.m3u8', '장기하와 얼굴들 앨범 커버의 제작 스토리', '"실제로 제가 의료기기 매장에 가서 심장 모형을 구입을 했고요."', 0, 0, 0, NULL, '2016-03-09 10:46:21', 0, NULL, NULL, NULL, 1, 0, '김기조', '타이포그래퍼', NULL, NULL),
	(39, 1, 6, 'thumbnail/3be647c7-ca35-4ded-9eb6-2d84dea9a58f.mp4_20160310_112554', 'stream_output/6e029f4c-e2f4-45c8-98fe-1c6279782317/00504aa8dda4c77e2e5dd22cd942df2ce1839621db88bcab624291b5121fce15.m3u8', '과학이 인문학과 별개일 수 없는 이유', '"인문은 인간에 대한 탐구입니다. 인간에 대한 탐구로서 21세기에 어떤 분야들이 거기에 기여하고 있나요? 과학을 빼놓고 이야기 할 수 있나요?"', 0, 0, 0, NULL, '2016-03-10 02:26:42', 0, NULL, NULL, NULL, 4, 0, '장대익', '과학철학자', NULL, NULL),
	(40, 1, 11, 'thumbnail/59c43bc1-aadb-45ac-bc6f-7a90cbdef950.mp4_20160310_114112', 'stream_output/b379c0b9-c086-4f12-8081-901e30ac0690/83cef2c608e0269db3124c38b477f58ab279eaeb44e6973b7c1085b18a2ee757.m3u8', '건달한테 사채를 빌리고 가스총을 쏜 만화가', '"사채로 5천만원을 빌리고 1년을 안 갚아보자. 그러면 건달들이 어떻게 나오는지 보고 그 스토리를 쓰자."', 0, 0, 0, NULL, '2016-03-10 02:43:30', 0, NULL, NULL, NULL, 1, 0, '김성모', '근성의 만화가', NULL, NULL),
	(41, 1, 8, 'thumbnail/9de2c57d-3b0d-403a-af47-b36f8e71b41e.mp4_20160310_120828', 'stream_output/948dc989-d4ac-4d3b-b6df-a44ab401cd59/ff9e3c17f6912dbdfaa237783134e58108db8eebe0b22404eaf1505c47e3e3bb.m3u8', '번아웃이 되어서 퇴사하고 싶은 당신에게', '"마음 상태가 안 좋을 때는 우선 중요한 결정을 하지 마세요."', 0, 0, 0, NULL, '2016-03-10 03:12:22', 0, NULL, NULL, NULL, 1, 0, '우종민', '정신과 의사', NULL, NULL),
	(42, 1, 8, 'thumbnail/f426f95d-cf3e-4e1c-9c73-5f1d261b0caa.mp4_20160310_121912', 'stream_output/ae08677d-9674-4afd-b9a3-2bbe9cecd2dc/becefeff3acdd9723ef3553e61ee86fb846678bdb8410d53c3a464116c4eb15c.m3u8', '안정적인 직장이 보람이 없어 고민이라면', '"이 고민이 회사 때문은 아니에요. 이 고민은 본인 때문이에요."', 0, 0, 0, NULL, '2016-03-10 03:22:44', 0, NULL, NULL, NULL, 1, 0, '유수연', '독설 전문 영어강사', NULL, NULL),
	(43, 1, 3, 'thumbnail/671e4d9e-c949-4f0f-9384-5cceebf7aad0.mp4_20160310_141100', 'stream_output/3470608b-04c8-4e1d-8fa4-dc132395a975/8da84e91ed04ae448b01e552f889c91fbae58d2ba7d09cf0956f65c8748e35a6.m3u8', '딱 맞는 사람을 알기 위해 필요한 연애 경험', '"클럽에 가는 걸 싫어하는 남자한테 여러분이 어떻게 반응하는지 알려면, 여러분이 클럽을 가봐야 돼요."', 0, 2, 0, NULL, '2016-03-10 05:09:32', 0, NULL, NULL, NULL, 18, 0, '김미경', '스피치 강사', NULL, NULL),
	(44, 1, 10, 'thumbnail/7ee9cc7f-4171-437e-863e-a1a1a164a17f.jpg', 'stream_output/63fb9432-9735-4844-90cb-04a4a480c83d/d4bc3bb96bd9fcec7291a6198d4754493f99b4159117f12efd0a535175e1368c.m3u8', '새로운 게 나올 수 없는 환경에서 성공하는 방법', '"조금씩의 변주가 쌓이다보면 원심력이 생기면서 자기 것이 되는 거예요."', 0, 0, 0, NULL, '2016-03-10 05:18:56', 0, NULL, NULL, NULL, 0, 0, '김구라', 'MC', NULL, NULL),
	(45, 1, 5, 'thumbnail/e6d58f60-b2bd-4818-91b1-2af627bc0b81.mp4_20160310_142427', 'stream_output/4a1e9e37-8584-4090-ba52-309a27b4b39b/4a201b4487483e2fac7e8969a3ae3beccf4b3207b0c62b36ae0f798e67cc2e2e.m3u8', '영상의 홍수 속에서도 빛나는 소설의 강점', '"스마트폰만 보는 시대에 소설을 읽기가 쉽지 않죠. 하지만 소설이 가진 강점이 있어요."', 0, 0, 0, NULL, '2016-03-10 05:26:39', 0, NULL, NULL, NULL, 0, 0, '김영하', '소설가', NULL, NULL),
	(46, 1, 3, 'thumbnail/5f5d32fc-239c-4bbc-9d77-1c07d4994b98.mp4_20160310_143213', 'stream_output/aabd0e24-ab0c-4157-94d1-47a40361e521/ac9fe0bfd6f511b978352f5bd7da44c34dcc2a562747c49932235e8f693a0339.m3u8', '사랑과 조건 사이에서 고민하는 당신에게', '"20대, 30대 젊은 여성 분들의 고민상담 메일의 절반 이상은 이런 메일입니다."', 0, 0, 3, NULL, '2016-03-10 05:36:32', 0, NULL, NULL, NULL, 88, 1, '김어준', '딴지일보 총수', NULL, NULL),
	(47, 1, 10, 'thumbnail/5d63c444-d3a8-4e65-9a46-da96571b04be.wmv_20160310_145330', 'stream_output/c1635297-bb53-4e5d-b05b-434d13f16499/96509eb14ce0fefe18bfaecfe6e9d6134d7bbf5524d96a2d3538260a0da21267.m3u8', '좋아하는 일에 용기를 내게 해줬던 한마디', '"부끄러운 그림인지, 부끄럽지 않은 그림인지 판단하는 것은 작가의 일이 아니에요."', 0, 1, 1, NULL, '2016-03-10 05:49:42', 0, NULL, NULL, NULL, 2, 0, '김그래', '공감 웹툰 작가', NULL, NULL),
	(48, 1, 11, 'thumbnail/6207870e-5fc6-4dfa-ad0d-b842d0d679ae.wmv_20160310_150007', 'stream_output/8a3f2bc6-efbc-4baf-9190-bba0a12b27b1/5a39f5bd264106afec283745ebadaff5fd9a19d9fc42d5d8907f11d1b51abced.m3u8', '아무것도 모르던 스무살의 패션 입문기', '"고등학교 2학년 때 서울에 올라와서 청바지를 처음 입어봤어요."', 0, 0, 0, NULL, '2016-03-10 06:02:24', 0, NULL, NULL, NULL, 2, 0, '김원중', '모델킹', NULL, NULL),
	(49, 1, 9, 'thumbnail/dacab060-23f9-402a-853a-ff87f2c38b99.mp4_20160310_150456', 'stream_output/d41da298-c047-4692-8aa9-2e659dc9c515/6c9b862b7a21feb317a3e7d6e4bd011d007260a5969fcd327a779a26728e159f.m3u8', '힘든 조건과 환경 때문에 슬퍼하는 당신에게', '"저 사람들은 온 몸으로 운명을 해석하고 살았구나. 그래서 저 사람은 온 몸이 콘텐츠고 입만 벌리면 명언이구나."', 0, 0, 2, NULL, '2016-03-10 06:09:02', 0, NULL, NULL, NULL, 527, 2, '김미경', '스피치 강사', NULL, NULL),
	(50, 1, 11, 'thumbnail/b491a209-7686-4fd5-a49a-7daa81cd2725.mp4_20160310_151224', 'stream_output/8c3c8040-eade-4e39-9e2f-6a2e2902e3b9/fb845bf19875f6e6ea5e95f63b458c4599eb3681e0672617db8941b3b75ea8ee.m3u8', '연매출 30억 장사꾼의 비루했던 첫 시작', '"5명을 모아서 20만원씩 걷었어요."', 0, 0, 0, NULL, '2016-03-10 06:14:28', 0, NULL, NULL, NULL, 5, 0, '김윤규', '청년장사꾼', NULL, NULL),
	(51, 1, 9, 'thumbnail/83f70dec-1cd9-42a7-9eec-ddc9f8a0d275.mp4_20160310_152903', 'stream_output/58e18fa6-a916-44c0-a13d-2d0d59ab3845/727fc5a7417730977c6d6f1db5825c3c188883fee279d7b188cf20573b1024a6.m3u8', '새로운 고비 앞에서 두려워하는 당신에게', '"그 언덕을 넘어서 뒤에 있는 세상을 내가 모르니까 공포스러웠던 거예요."', 0, 1, 0, NULL, '2016-03-10 06:32:38', 0, NULL, NULL, NULL, 3, 0, '홍석천', '이태원 탑게이', NULL, NULL),
	(53, 1, 7, 'thumbnail/43e4daee-6410-46f2-a61f-be4afbe57892.mp4_20160310_155052', 'stream_output/525058ea-2a94-42fa-9672-b53f1dda5f18/8c77c16fd27eb3a39da554dbdaabd75c896c546b9c3bfa05ddc2342645eba2fd.m3u8', '섹시하게 말 잘하는 사람이 되는 쉬운 방법', '"머리 속에 있는 이야기를 음성으로 바로 녹음을 해요."', 0, 0, 0, NULL, '2016-03-10 06:55:50', 0, NULL, NULL, NULL, 1, 0, '김지양', '66100 편집장', NULL, NULL),
	(60, 1, 10, 'thumbnail/796f85f8-af59-4275-8587-1e9f45a37c1b.mp4_20160310_170213', 'stream_output/1a4f1974-7732-4ea0-8366-d0b4ef2022c8/5895662ea3eef7533bca4bed753aba37daaaf9e1a4312544ea951452b91298b7.m3u8', '지금 읽을 책을 고르는 방법', '"내가 보는 책들은 내가 만난 장애물로 결정되는 것 같아요."', 0, 1, 1, NULL, '2016-03-10 18:56:13', 0, NULL, NULL, NULL, 3, 0, '한동헌', '마이크임팩트 대표', NULL, NULL),
	(61, 1, 7, 'thumbnail/4d504871-7baf-43c8-8a61-6428cdb2f01e.mp4_20160310_190458', 'stream_output/91c647e9-8f7c-40e0-9689-1a1901c1a35d/fa78cd738e772746669fe9547bbe9d027d040a7e0cb7a6a3ff8a831c9d5c3aa9.m3u8', '남자만 바라보고 있는 여자들에게', '"도시락 같은 거 안 싸줘도 돼요."', 0, 0, 0, NULL, '2016-03-10 19:11:09', 0, NULL, NULL, NULL, 4, 1, '레이디 제인', '가수', NULL, NULL),
	(62, 1, 10, 'thumbnail/6a3adcb5-ea11-4502-865d-060f0fef85de.png', NULL, '매 순간 내 감정의 주인이 되어야 하는 이유', '"여러분이 자신의 감정을 당당하게 지키지 못하는 순간, 그 피해는 누구에게 갈까요?"', 2, 1, 0, NULL, '2016-03-10 23:44:40', 0, NULL, NULL, NULL, 4, 0, '강신주', '철학자', NULL, NULL),
	(65, 1, 11, 'thumbnail/4ef6fa64-d931-4a2b-a38d-0010d0ff456d.mp4_20160311_001517', 'stream_output/6902970d-6c40-44a6-b512-a6caf812d911/7bb591c3c492669a6372ad8cb2b0df58a6a4459ba3ab3f682285aeb46371c7f0.m3u8', '서점에서 처음 만났던 10살 연하의 아내', '"나이 차이 얼마 안 났어요. 그저 10살 차이?"', 0, 0, 0, NULL, '2016-03-11 00:18:05', 0, NULL, NULL, NULL, 0, 0, '장진', '영화감독', NULL, NULL),
	(66, 1, 10, 'thumbnail/1e0889e9-bead-4dd1-9dcf-3e568dde08eb.mp4_20160311_004753', 'stream_output/8950ce37-8184-4c50-8680-65e4901ca863/3db06368b67621b973fbec557aa708794d1ade12f185fea09019a5620ab5dba6.m3u8', '열심히만 산다고 추억을 못 만들고 있지 않나요?', '"열심히만 사는 게 진짜 잘 사는 건지 생각을 해봤어요."', 0, 1, 1, NULL, '2016-03-11 00:48:29', 0, NULL, NULL, NULL, 3, 0, '최현석', '크레이지 셰프', NULL, NULL),
	(67, 1, 9, 'thumbnail/92755401-0739-4bf6-93b3-a280563381c9.mp4_20160311_014059', 'stream_output/f54873b2-bbaa-4a91-9a3e-280cad6a4c4e/c0daf0205f13fa481c3aa3a41c081107b95ceb3c6a1e39948a5ff2947fe9e881.m3u8', '수많은 단점 때문에 자존감이 낮은 당신에게', '"전 제 자신에 대해서 싫은 점이 좋은 점보다 훨씬 많아요."', 0, 0, 0, NULL, '2016-03-11 01:48:14', 0, NULL, NULL, NULL, 0, 0, '타블로', '펀치라인킹', NULL, NULL),
	(68, 1, 11, 'thumbnail/1a4010f3-0533-453e-ad88-28d2d357e2e6.mp4_20160311_014857', 'stream_output/62617d85-77de-4b2a-a2b1-8010d471b9c9/bd8ed8f434ec08a8bd14aa551f332d6b87afaf09ed485601a5079ef40ac5973a.m3u8', '동양의 파바로티가 겪었던 힘든 유년시절', '"그 14살에 서울에 올라와서 성수동 공장지대에 다녔는데 그 옆에 고등학교가 있었습니다."', 0, 0, 0, NULL, '2016-03-11 01:53:55', 0, NULL, NULL, NULL, 0, 0, '조용갑', '동양의 파바로티', NULL, NULL),
	(69, 1, 3, 'thumbnail/e72cb5cb-546f-4c1a-a1d5-a9de425130f2.mp4_20160311_015714', 'stream_output/32e64b13-90df-4cfe-967c-c0a58c3c5d5b/52e7f60f4e6f0712abc418e236783f79f16f0db5c015885ef420e367d40756a0.m3u8', '연애가 좋은 이유', '"그냥 온전한 품이 하나 더 생긴다고 생각해요."', 0, 1, 0, NULL, '2016-03-11 01:58:13', 0, NULL, NULL, NULL, 11, 3, '김그래', '공감 웹툰 작가', NULL, NULL),
	(71, 1, 5, 'thumbnail/bdfe56ec-2736-4f23-a467-d37246d42e55.jpg', NULL, '경쟁자보다 환경이 훨씬 더 중요한 이유', '"현대의 실패는 경쟁자와의 경쟁에서 오지 않습니다."', 2, 2, 11, NULL, '2016-03-15 15:59:39', 0, NULL, NULL, NULL, 508, 18, '김난도', '트렌드코리아 저자', 'thumbnail/35db5ede-a0c4-4180-bf0d-2b81f68b1029.jpg', NULL),
	(72, 1, 10, 'thumbnail/b58f45ba-82e0-4193-bc45-66bf296bb749.jpg', NULL, '창의력을 높이는 3가지 방법', '"창의력은 결국 관계없던 것들을 연결시키는 능력이잖아요."', 2, 0, 0, NULL, '2016-03-15 16:13:50', 0, NULL, NULL, NULL, 37, 0, '데니스 홍', '로봇공학자', 'thumbnail/d6e3678d-d86f-4d5a-9529-f7fe995befdd.jpg', NULL),
	(73, 1, 10, 'thumbnail/4f6dafa7-5eeb-4151-a868-e063dca7e53e.jpg', NULL, 'ㅄ을 멘토로 삼으세요', '"정확한 표현을 위해 2번만 비속어를 쓰겠습니다."', 2, 4, 8, NULL, '2016-03-15 16:25:38', 0, NULL, NULL, NULL, 691, 6, '유병재', '병맛 작가', 'vertical_thumbnail/4363d7bd-bc83-49db-ae0b-32f21406fb18.jpg', NULL),
	(74, 1, 10, 'thumbnail/144f7019-cb4e-4e83-b354-5d970bc64cfb.jpg', NULL, '돈을 못 벌어도 좋아하는 일을 해야 할까요', '"제 주위에 하기 싫어도 돈을 잘 벌 수 있는 일을 했던 분들은."', 2, 0, 0, NULL, '2016-03-15 16:37:31', 0, NULL, NULL, NULL, 40, 0, '윤종신', '월간 가수', 'thumbnail/e388740c-c76c-460a-90dc-ddd84d0f0eeb.jpg', NULL),
	(75, 1, 1, 'thumbnail/498984fe-5d15-4d7a-9bdd-2789fa1053fc.jpg', NULL, '돈과 명예로도 못 구하는 행복의 필수 요소 3가지', '"에피쿠로스는 우리가 행복하기 위해 정말 필요한 것 3가지를 찾았습니다."', 2, 0, 1, NULL, '2016-03-15 16:54:27', 0, NULL, NULL, NULL, 295, 0, '알랭 드 보통', '소설가', 'vertical_thumbnail/67a2cc67-0996-4438-ad9a-54359c362fd2.jpg', NULL),
	(76, 1, 3, 'thumbnail/884abb7b-cd00-43e4-8b22-d44c7167052e.mp4_20160310_164642', 'stream_output/ae8c1c9f-0d32-4f18-bc97-6b1f7ed0e922/dff2a59a0d18558ba878d01940a33448994b45f16733bbfe031faa80dc5d1b80.m3u8', '연인과 싸워도 절대 잊지 말아야 할 것', '"사랑이 참 좋은 그림인데도 준비가 안 되어 있어서 오래 못가는 경우가 많아."', 0, 0, 0, NULL, '2016-03-15 18:17:15', 0, NULL, NULL, NULL, 43, 0, '홍석천', '이태원 탑게이', NULL, NULL),
	(77, 1, 5, 'thumbnail/af0acdcb-bba7-4e0a-80f5-878a6563765e.wmv_20160310_165625', 'stream_output/94b1052b-70c4-4dc1-9d9e-2118d1383f46/2ce9d11817dc438eb29dd909eddf1b6eb6853a228f4e95f3aa7612fafe0b9cee.m3u8', '나를 위해 정치에 관심을 가져야 하는 이유', '"우리는 정치적 상상력이 막혀있습니다."', 0, 0, 0, NULL, '2016-03-15 18:20:20', 0, NULL, NULL, NULL, 2, 0, '진중권', '문화평론가', NULL, NULL),
	(78, 1, 11, 'thumbnail/bcedece6-0301-49c0-9c1a-217e22e733a4.wmv_20160310_163705', 'stream_output/ab16bd44-a728-4421-9a83-31523bb3f08d/691757f8ac1fc377ab59293f0bfdc8b2323dbd5b234cafd97a3637e36886437f.m3u8', '공항패션과 출근길은 디스패치가 원조였다', '"파파라치로 디스패치를 인식하는 분들이 많은데, 디스패치는 1년에 단 4번 밖에 파파라치 기사를 쓰지 않아요."', 0, 0, 0, NULL, '2016-03-15 18:25:59', 0, NULL, NULL, NULL, 2, 0, '이명구', '디스패치 대표', NULL, NULL),
	(79, 1, 8, 'thumbnail/c8b84381-0723-48d6-bda0-7fc98ade20b5.mp4_20160310_161330', 'stream_output/33d6a43c-a5a4-48a4-9a9c-fbc4417f3357/befe5d966153aba06f4b13b22544aa98c9f5f506204234f8d399410e28171d40.m3u8', '기발한 아이디어를 내는 방법', '"이 아이디어 마지막에 누가 뽑았냐고 물어보니 아무도 모르는 거예요."', 0, 0, 0, NULL, '2016-03-15 18:27:36', 0, NULL, NULL, NULL, 4, 0, '김봉진', '배달의민족 대장', NULL, NULL),
	(80, 1, 2, 'thumbnail/fdb274bb-86b4-42bb-af3c-0b22ac0c9ca6.mp4_20160310_160809', 'stream_output/2b223543-7dab-43ce-b9e0-64c3e421f990/fb3a07149dc8b4bb642194e41f595bef7905c666e8793c4f19051dedbdda20fc.m3u8', '꿈을 즐기는 마음이 더 현실적인 이유', '"전 되게 현실주의자예요. 그런데 저한테는 평범한 사람들이 사는 과정이 비현실적이었어요. 음악이 제 감정에 와닿는 현실적인 것들이었어요."', 0, 0, 0, NULL, '2016-03-15 18:30:01', 0, NULL, NULL, NULL, 56, 0, '가리온', '힙합시조새', NULL, NULL),
	(81, 1, 4, 'thumbnail/ada93c83-3540-45c4-bf3d-51cd85de3696.mp4_20160310_160255', 'stream_output/ea1b1446-1a40-416a-a835-37486ded61ae/53fb68573145926c44ab56c5d6393b9ad4a4eda1a4e993b4b541051f96ce0f4e.m3u8', '가사를 쓸 때 핵심은 상황 설정', '"똑같은 사랑 이야기지만 캐릭터가 주어지면 이야기가 달라져요."', 0, 0, 0, NULL, '2016-03-15 18:34:30', 0, NULL, NULL, NULL, 3, 0, '김이나', '요즘 대세 작사가', NULL, NULL),
	(82, 1, 11, 'thumbnail/a077b24c-ec45-4bf4-abfa-7c87328de4c7.mp4_20160309_181426', 'stream_output/13870d0d-525c-4922-ab60-0a2394791495/3d9279bc5c03cce871c9b5a89a11b3177a8498c59fbb64c20d35a2dbf98d5a27.m3u8', '유희열 덕후가 스케치북 MC가 되기까지', '"나랑 라디오 고정으로 하는 여자 연예인은 네가 처음이야"', 0, 0, 0, NULL, '2016-03-15 18:42:42', 0, NULL, NULL, NULL, 1, 0, '박지선', '희열바라기', NULL, NULL),
	(83, 1, 5, 'thumbnail/bd0e498b-2ede-411c-8299-e18001912b0f.wmv_20160316_122413', 'stream_output/ee1aacf8-3f99-43ce-b68b-2ea52c43446a/4fbb5f69b2cd5c2ffe2fde58a5f3d8bcc5b4435c48c4e094bcd9641114f24c36.m3u8', '강점을 관리하고 약점을 채워야 하는 이유', '"모든 사람은 태어나는 순간 치우쳐져 있어요."', 0, 0, 0, NULL, '2016-03-16 12:27:02', 0, NULL, NULL, NULL, 0, 0, '고미숙', '문학평론가', NULL, NULL),
	(84, 1, 9, 'thumbnail/017a9a96-e3e9-4200-a1b9-21e4b54e9044.mp4_20160316_135321', 'stream_output/dfa69bde-e7d7-4ad9-bb11-46ccf8113996/6712fb9a28982193a833f786bf69a9d375a3ab8b60e275f024cb46f279ba8b82.m3u8', '계속되는 실패로 자책감이 드는 당신에게', '"계속 실패하면 마음이 어려울 수 있어요. 실패가 자존감으로 연결될 수 있기 때  문이에요."', 0, 0, 0, NULL, '2016-03-16 13:51:53', 0, NULL, NULL, NULL, 0, 0, '한동헌', '마이크임팩트 대표', NULL, NULL),
	(85, 1, 7, 'thumbnail/6a7ba87b-b859-46fd-92e5-04e4f9671545.wmv_20160316_135714', 'stream_output/833bb45f-d194-46bf-8889-bbfd7c4d3358/f6c99ee9ebc3e1316c81bf76fcc93a3aa4b6f6daff071d80e823bd3e8d476407.m3u8', '자존감 없이 연애를 하는 여성들에게', '"몇 년 전에 유희열 씨와 프로그램을 할 때 우리끼리 격하게 공감했던 게 있어요."', 0, 0, 0, NULL, '2016-03-16 14:02:54', 0, NULL, NULL, NULL, 2, 0, '임경선', '걸크러쉬 작가', NULL, NULL),
	(86, 1, 2, 'thumbnail/32bd50d9-827d-4c60-89c9-eaa2c1cea33a.mp4_20160316_144313', 'stream_output/1a5cba32-f529-4e5d-96ad-d17ba1b2b400/bbdc96d30c91eb8aa16e569c784161e044278be4fbf32231cf2cf76ff18d1e85.m3u8', '독한 마음이 필요한 당신을 위한 영상', '"인생에 일정 기간에는 노력을 내놓아야 해요. 그걸 언제 내놓으실 거예요?"', 0, 0, 1, NULL, '2016-03-16 14:56:16', 0, NULL, NULL, NULL, 5, 0, '유수연', '독설 전문 영어강사', NULL, NULL),
	(87, 1, 4, 'thumbnail/d491173e-6364-461d-8b40-a3852e011ff6.wmv_20160316_152510', 'stream_output/fda6fc27-c377-4e1f-9837-a31a3f0c6b53/a935b64e11973ff9f49fd01d9b3f6dbd852f69c0e328d1efeffd5961e22efa1f.m3u8', '디자이너로서 경험했던 서울 패션 위크', '"저희 팀이 처음 서울 컬렉션을 하고 정말 욕을 많이 먹었어요."', 0, 0, 0, NULL, '2016-03-16 15:28:41', 0, NULL, NULL, NULL, 4, 0, '김원중', '모델킹', NULL, NULL),
	(88, 1, 6, 'thumbnail/3c7e04e0-1c09-4b79-8ab6-8cef23884f6f.mp4_20160316_153121', 'stream_output/ab6c2061-764f-45d7-9349-3d98aa08cba6/4e6a5005ada668ec6f43f9fce8c0ee3c77f459914cae67ac92c5f15c69626b45.m3u8', '신박한 로봇 BEST 5', '"신기하죠? 저는 이 로봇보다 더 장애물을 잘 올라가는 로봇은 본 적이 없습니다."', 0, 0, 0, NULL, '2016-03-16 15:34:31', 0, NULL, NULL, NULL, 2, 0, '데니스 홍', '로봇공학자', NULL, NULL),
	(89, 1, 3, 'thumbnail/1ee57121-d3d7-4ba9-aae9-a298666821dc.mp4_20160316_153832', 'stream_output/1a4f44d5-642d-4abb-8a2e-1402af60420c/91d0fa9884e9cf438490603fe331a880775c0c53af3ecb0183061ff99fad40ec.m3u8', '연애로 성장하는 사람들의 마인드', '"내 세계의 문을 하나씩 열 때마다 내 세계가 점점 넓어지는 거죠."', 0, 0, 0, NULL, '2016-03-16 15:42:05', 0, NULL, NULL, NULL, 23, 1, '레이디 제인', '가수', NULL, NULL),
	(90, 1, 4, 'thumbnail/371851f4-1181-45ed-9c51-0f213be66daf.wmv_20160316_154845', 'stream_output/57dbddb6-e8e6-4b0e-ad02-c7ab83254057/fac7c867017f2620debfe75966ea902d5c791ad7bd980eb61afc7d80823211ab.m3u8', '콘텐츠 제작자에게 중요한 것', '"단언하건데 앞으로 학벌이나 스펙보다는 자기만의 콘텐츠나 취향을 갖고 있는 사람들이 인정받는 사회가 될 겁니다."', 0, 0, 0, NULL, '2016-03-16 15:50:11', 0, NULL, NULL, NULL, 1, 0, '박지호', '아레나 편집장', NULL, NULL),
	(91, 1, 4, 'thumbnail/b4413cb8-1219-4bba-af90-83c957739f16.wmv_20160316_155303', 'stream_output/239474dd-e662-47f0-8ec2-3d350998de8e/49c6a07f4e933589370ec5d8d9566148de5f79310259e9b2b76b9fd49b737d15.m3u8', '디자이너 세종의 한글이 대단한 이유', '"세계 역사상 글자를 디자인한 나라는 없었어요. 글자를 개인이 만든 예도 없었죠."', 0, 0, 0, NULL, '2016-03-16 16:00:41', 0, NULL, NULL, NULL, 16, 0, '안상수', '디자이너', NULL, NULL),
	(92, 1, 2, 'thumbnail/4ceab3f3-04b8-4a7e-97b9-abc27906aba9.mp4_20160316_160435', 'stream_output/795e6ba4-7fbc-456e-977a-c326611e894d/b347b420e0ec32d9bbe582b5a58211d64599993fa9f4bf644243ad6c2c1f521a.m3u8', '다짐한 것을 실천으로 옮기는 법', '"작은 성공을 계속 경험하세요."', 0, 0, 0, NULL, '2016-03-16 16:08:34', 0, NULL, NULL, NULL, 24, 0, '김형철', '철학자', NULL, NULL),
	(93, 1, 9, 'thumbnail/8c62e807-7ca5-40ff-b5dc-d3a7ac1d0330.mp4_20160316_164445', 'stream_output/58d13b49-486e-4e13-9438-aedc028dea97/a278a252d50d9f9feaadea27e4a0875e5b22e952f6d779a2e920070668c19fee.m3u8', '아직 꿈이 없고 이뤄낸 게 없어도 괜찮은 이유', '"혹시 할랜드 샌더슨이란 사람 아세요?"', 0, 0, 0, NULL, '2016-03-16 16:48:05', 0, NULL, NULL, NULL, 0, 0, '김봉진', '배달의민족 대장', NULL, NULL),
	(94, 1, 7, 'thumbnail/5085c179-b731-42f5-a723-beb3578242eb.jpg', NULL, '다이어트하지 않고도 예쁘게 옷 입는 방법', '"내 체형이 정확히 어떤지 아는 것."', 2, 0, 0, NULL, '2016-03-16 18:09:20', 0, NULL, NULL, NULL, 23, 0, '김지양', '66100 편집장', 'thumbnail/2dc22f4f-8eaf-4769-90b9-0b7abc81c48a.jpg', NULL),
	(95, 1, 8, 'thumbnail/515e9bfb-78c1-4d63-935f-65c0330ba307.jpg', NULL, '비즈니스 고비에 대한 태도와 대응법', '"솔직하게 얘길 나누면 의외로 사람들이 상식적인 수준에서 해결 방법들을 찾게 되는 것 같아요."', 2, 0, 0, NULL, '2016-03-16 18:22:53', 0, NULL, NULL, NULL, 1, 0, '김봉진', '배달의민족 대장', 'thumbnail/4ee5b81c-d2db-4871-b84a-729f590c5e1f.jpg', NULL),
	(96, 1, 9, 'thumbnail/f8907a92-b637-449d-825d-703a22fd1a48.jpg', NULL, '아무리 힘들어도 이건 포기하지 말아요', '"그 마음만 있으면 어느 때에도 다시 시작할 수 있는 환경이 조성될 것 같아요."', 2, 0, 0, NULL, '2016-03-16 18:27:11', 0, NULL, NULL, NULL, 22, 0, '유병재', '청춘의 아이콘', 'thumbnail/cee9bfb4-8611-4aea-9ca3-09fc695c0d07.jpg', NULL),
	(97, 1, 3, 'thumbnail/b0815dbe-d2ff-4896-8ec8-a6d3cceaa973.jpg', NULL, '우리의 연애가 잘못되는 이유와 해결 방법', '"연애가 잘못되어 가는 가장 중요한 이유는 무엇일까요."', 2, 4, 73, NULL, '2016-03-16 18:47:30', 0, NULL, NULL, NULL, 717, 55, '알랭 드 보통', '소설가', 'thumbnail/eb2d9260-d2ea-4e18-8113-50262b4a7b09.jpg', NULL),
	(98, 1, 10, 'thumbnail/82f9de42-5429-4a03-97fe-fb8fa7a1c092.mp4_20160316_190353', 'stream_output/d17b69e9-f004-405a-a4e8-703786fc6013/8c809f955ba57c7178d60b9cc5fc9e6119fa94ea9b1d6b6e4a102bf77c065932.m3u8', '실패가 두려운 사람에게 들려주는 사유리의 인생', '"저는 살면서 99% 정도 실패해온 것 같아요."', 0, 0, 0, NULL, '2016-03-16 19:08:39', 0, NULL, NULL, NULL, 2, 0, '사유리', '4차원', NULL, NULL),
	(99, 1, 3, 'thumbnail/bf75aebc-0f32-4024-a454-9b6c4b94157a.mp4_20160316_191207', 'stream_output/d37c144f-3de6-464b-8beb-a68d68f11b71/cd8fc80571cfe43af69b4e13ab35325f34b22de552ba9d70ed8be4dfddb7831e.m3u8', '정말 사랑하는 사람을 못 만나서 슬픈 당신에게', '"어딘가 있다?"', 0, 0, 0, NULL, '2016-03-16 19:15:02', 0, NULL, NULL, NULL, 5, 1, '윤종신', '월간 가수', NULL, NULL),
	(100, 1, 1, 'thumbnail/d90312e6-5703-4ae0-ad51-21260582e27e.mp4_20160316_194553', 'stream_output/2e452e19-f827-4ff9-9d64-ccdb744c7eb9/9f073e2e7f36c915d95cfc324db73d69ef16ea73883ea3818b246e1c613884df.m3u8', '인식할 수 있어야만 행복일까', '"아이들은 행복을 일부러 깨닫지 않고도 그냥 행복합니다."', 0, 2, 3, NULL, '2016-03-16 19:49:08', 0, NULL, NULL, NULL, 36, 8, '탈 벤 샤하르', '심리학자', NULL, NULL),
	(101, 1, 1, 'thumbnail/2f63968b-a973-4679-8441-200ab6c191c0.jpg', 'stream_output/2a9b33a9-d207-453c-a2fd-24f0664db9b9/448a4301ab757988e75c6cbc1fcbae61d68060a2d51605b8cd543242f5d67d5f.m3u8', '인생이 행복해지기 위한 게임인 이유', '"신은 여러분이 성공했는지에 대해서는 관심이 없지만, 여러분이 현재 행복한지에 대해서는 많은 관심을 가지고 계실 겁니다."', 0, 1, 0, NULL, '2016-03-17 13:38:49', 0, NULL, NULL, NULL, 60, 3, '신해철', '가수', NULL, NULL),
	(106, 133, NULL, NULL, 'youtube.com://test', 'test', 'Tes', NULL, 0, 0, NULL, '2016-03-29 19:00:03', NULL, NULL, NULL, NULL, 0, 0, 'test', 'test', NULL, NULL),
	(107, 133, NULL, NULL, 'youtube.com://test', 'test', 'Tes', NULL, 0, 0, NULL, '2016-03-29 19:00:03', NULL, NULL, NULL, NULL, 0, 0, 'test', 'test', NULL, NULL);
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;


-- Dumping structure for table micimpact.card_tags
CREATE TABLE IF NOT EXISTS `card_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `card_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_name` (`card_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.card_tags: ~87 rows (approximately)
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
	(299, '#인문사회 #문화 #브랜딩 #국가브랜딩 #기소르망 #칼럼니스트 #해외 #인터뷰', 31),
	(180, '#문화 #브랜딩 #국가브랜딩 #기소르망 #칼럼니스트 #해외 #외국할배', 32),
	(181, '#문화 #브랜딩 #국가브랜딩 #기소르망 #칼럼니스트 #해외 #외국할배', 33),
	(182, '#문화 #브랜딩 #국가브랜딩 #기소르망 #칼럼니스트 #해외 #외국할배', 34),
	(210, '#꿈 #열정 #의지 #동기부여 #강레오 #인터뷰', 35),
	(300, '#과학 #우주 #별 #이명현 #그랜드마스터클래스 #GMC', 36),
	(197, '#타이포그래퍼 #타이포그래피 #예술 #디자인 #김기조 #장기하 #앨범 #제작 #아트', 37),
	(298, '#예술 #아트 #창작 #디자인 #장기하 #앨범 #김기조 #타이포그래퍼 #타이포그래피 #더메디치 #메디치', 38),
	(207, '#과학 #인문학 #철학 #학문 #장대익 #그랜드마스터클래스 #GMC', 39),
	(302, '#에피소드 #의지 #열정 #근성 #김성모 #만화가 #청춘페스티벌 #청페', 40),
	(323, '#직장인 #직장 #번아웃 #스트레스 #과로 #퇴사 #고민 #일 #우종민 #의사 #인터뷰', 41),
	(230, '#직장인 #직장 #일 #고민 #유수연 #청춘고민상담소', 42),
	(303, '#사랑 #연애 #남녀 #이성 #김미경 #청춘페스티벌 #청페', 43),
	(304, '#조언 #성공 #방법 #김구라 #청춘페스티벌 #청페', 44),
	(219, '#인문사회 #인문 #소설 #글 #김영하 #그랜드마스터클래스 #GMC', 45),
	(305, '#사랑 #조건 #고민 #상담 #여성 #김어준 #청춘페스티벌 #청페', 46),
	(306, '#조언 #상담 #용기 #일 #김그래 #웹툰 #작가 #원더우먼페스티벌 #원페', 47),
	(307, '#에피소드 #예술 #패션 #김원중 #모델 #디자이너 #더메디치 #메디치', 48),
	(224, '#위로 #조언 #상담 #조건 #환경 #운명 #김미경 #인터뷰', 49),
	(309, '#에피소드 #장사 #사업 #김윤규 #청년장사꾼 #청춘페스티벌 #청페', 50),
	(310, '#위로 #고민 #두려움 #공포 #고비 #상담 #홍석천 #청춘페스티벌 #청페', 51),
	(311, '#여성 #섹시 #말 #습관 #방법 #김지양 #모델 #66100 #인터뷰', 53),
	(313, '#조언 #상담 #독서 #책 #한동헌 #마이크임팩트#인터뷰', 60),
	(314, '#여성 #여자 #남자 #사랑 #연애 #레이디제인 #청춘페스티벌 #청페', 61),
	(245, '#조언 #인문사회 #인문 #감정 #고민 #상담 #강신주 #철학 #철학자 #그랜드마스터클래스 #GMC', 62),
	(246, '#조언 #인문사회 #인문 #감정 #고민 #상담 #강신주 #철학 #철학자 #그랜드마스터클래스 #GMC', 63),
	(247, '#조언 #인문사회 #인문 #감정 #고민 #상담 #강신주 #철학 #철학자 #그랜드마스터클래스 #GMC', 64),
	(315, '#에피소드 #사랑 #연애 #남녀 #장진 #영화감독 #더메디치 #메디치', 65),
	(316, '#조언 #상담 #인생 #추억 #노력 #최현석 #셰프 #청춘페스티벌 #청페', 66),
	(250, '#위로 #상담 #조언 #단점 #자존감 #자신감 #열등감 #타블로 #인터뷰', 67),
	(251, '#에피소드 #고생 #조용갑 #테너 #인터뷰', 68),
	(252, '#사랑 #연애 #행복 #남녀 #김그래 #작가 #인터뷰', 69),
	(255, '#조언 #상담 #감정 #강신주 #철학자 #철학 #그랜드마스터클래스 #GMC', 70),
	(256, '#인문사회 #사회 #미래 #트렌드 #김난도 #그랜드마스터클래스 #GMC', 71),
	(262, '#조언 #방법 #창의력 #데니스홍 #로봇공학자 #그랜드마스터클래스 #GMC', 72),
	(317, '#조언 #멘토 #븅신 #유병재 #병맛 #청춘페스티벌 #청페', 73),
	(297, '#조언 #상담 #돈 #일 #진로 #윤종신 #청춘페스티벌 #청페', 74),
	(265, '#행복 #조언 #돈 #명예 #알랭드보통 #그랜드마스터클래스 #GMC', 75),
	(266, '#사랑 #연애 #남녀 #홍석천 #인터뷰', 76),
	(267, '#인문사회 #사회 #정치 #진중권 #그랜드마스터클래스 #GMC', 77),
	(318, '#에피소드 #언론 #디스패치 #연예 #이명구 #더메디치 #메디치', 78),
	(269, '#직장인 #직장 #일 #아이디어 #김봉진 #배달의민족 #인터뷰', 79),
	(270, '#꿈 #열정 #현실 #가리온 #청춘페스티벌 #청페', 80),
	(319, '#예술 #노래 #작사 #가사 #창작 #김이나 #작사가 #더메디치 #메디치', 81),
	(272, '#에피소드 #유희열 #스케치북 #박지선 #청춘페스티벌 #청페', 82),
	(273, '#인문사회 #인문 #사주 #팔자 #고미숙 #그랜드마스터클래스 #GMC', 83),
	(275, '#위로 #실패 #상담 #조언 #방법 #한동헌 #마이크임팩트 #인터뷰', 84),
	(295, '#여성 #사랑 #연애 #조언 #상담 #임경선 #칼럼니스트 #작가 #원더우먼페스티벌 #원페', 85),
	(277, '#꿈 #열정 #노력 #성공 #유수연 #청춘고민상담소', 86),
	(278, '#예술 #문화 #패션 #김원중 #디자이너 #모델 #더메디치 메디치', 87),
	(279, '#과학 #기술 #로봇 #데니스홍 #그랜드마스터클래스 #GMC', 88),
	(280, '#사랑 #연애 #성장 #조언 #상담 #레이디제인 #청춘페스티벌 #청페', 89),
	(281, '#예술 #문화 #잡지 #콘텐츠 #크리에이터 #박지호 #아레나 #더메디치 #메디치', 90),
	(285, '#예술 #문화 #디자인 #세종 #한글 #안상수 #디자이너 #더메디치 #메디치', 91),
	(286, '#꿈 #조언 #상담 #다짐 #실천 #방법 #김형철 #철학자 #인터뷰', 92),
	(287, '#위로 #꿈 #불안 #김봉진 #배달의민족 #청춘페스티벌 #청페', 93),
	(288, '#여성 #다이어트 #옷 #패션 #김지양 #인터뷰', 94),
	(289, '#직장인 #직장 #비즈니스 #위기 #고비 #태도 #방법 #김봉진 #배달의민족 #인터뷰', 95),
	(290, '#위로 #고생 #우울 #자존감 #유병재 #청춘페스티벌 #청페', 96),
	(291, '#사랑 #연애 #방법 #알랭드보통 #그랜드마스터클래스 #GMC', 97),
	(293, '#조언 #실패 #불안 #인생 #사유리 #청춘페스티벌 #청페', 98),
	(294, '#사랑 #고민 #우울 #윤종신 #청춘페스티벌 #청페', 99),
	(320, '#행복 #인문사회 #심리 #탈벤샤하르 #인터뷰', 100),
	(324, '#행복 #인생 #신해철 #더메디치 #메디치', 101),
	(325, 'food', 106),
	(326, 'food', 107);
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.channel: ~8 rows (approximately)
DELETE FROM `channel`;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` (`id`, `user_id`, `cards_recent_id`, `title`, `introduce`, `likes`, `favorite`, `is_show`, `is_liked`, `is_favorited`, `type`, `created_at`) VALUES
	(26, 150, NULL, 'ㅅㅈ', '', 0, 1, 1, 0, 0, 0, NULL),
	(27, 133, NULL, 'test', '', 1, 1, 0, 0, 0, 0, NULL),
	(28, 133, NULL, 'test 2', '', 1, 0, 0, 0, 0, 0, NULL),
	(29, 165, NULL, 'Haudau', '마이크 임팩트의 네번째 채널 입니다', 1, 0, 0, 0, 0, 0, NULL),
	(30, 165, NULL, 'Hbjnb b', '마이크 임팩트의 네번째 채널 입니다', 1, 0, 0, 0, 0, 0, NULL),
	(31, 136, NULL, 'adasdsa', '', 0, 0, 1, 0, 0, 0, NULL),
	(32, 136, NULL, 'dadasdsadasd', '', 0, 0, 1, 0, 0, 0, NULL),
	(33, 136, NULL, 'ghjhgjgjgh', '', 0, 0, 1, 0, 0, 0, NULL);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;


-- Dumping structure for table micimpact.channel_favorite
CREATE TABLE IF NOT EXISTS `channel_favorite` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.channel_favorite: ~2 rows (approximately)
DELETE FROM `channel_favorite`;
/*!40000 ALTER TABLE `channel_favorite` DISABLE KEYS */;
INSERT INTO `channel_favorite` (`_id`, `channel_id`, `user_id`, `created_at`) VALUES
	(10, 26, 165, '2016-03-28 17:05:33'),
	(15, 27, 165, '2016-03-29 18:05:19');
/*!40000 ALTER TABLE `channel_favorite` ENABLE KEYS */;


-- Dumping structure for table micimpact.channel_like
CREATE TABLE IF NOT EXISTS `channel_like` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.channel_like: ~4 rows (approximately)
DELETE FROM `channel_like`;
/*!40000 ALTER TABLE `channel_like` DISABLE KEYS */;
INSERT INTO `channel_like` (`_id`, `channel_id`, `user_id`, `created_at`) VALUES
	(6, 29, 165, '2016-03-28 17:04:10'),
	(10, 28, 165, '2016-03-28 19:51:45'),
	(11, 27, 165, '2016-03-28 19:51:48'),
	(12, 30, 165, '2016-03-29 18:04:38');
/*!40000 ALTER TABLE `channel_like` ENABLE KEYS */;


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

-- Dumping data for table micimpact.collections: ~0 rows (approximately)
DELETE FROM `collections`;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` (`id`, `card_id1`, `card_id2`, `name`, `body`, `reveal`, `card_id3`) VALUES
	(31, 31, 35, '콜렉션1', '아주 좋아요', 1, 36);
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;


-- Dumping structure for table micimpact.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count_like` int(11) DEFAULT '0',
  `is_like` tinyint(1) DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.comments: ~137 rows (approximately)
DELETE FROM `comments`;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `card_id`, `user_id`, `body`, `created_at`, `count_like`, `is_like`, `user_name`) VALUES
	(1, 1, 1, 'adsfasdf', '2015-12-28 07:58:01', 1, NULL, NULL),
	(2, 1, 1, '1213123123', '2015-12-30 02:20:03', 0, NULL, NULL),
	(4, 1, 1, 'cdadsfasdf', '2015-12-30 02:21:35', 2, NULL, NULL),
	(5, 1, 8, '테테 테스트 시간지나 124356.#*+-.test', '2016-01-05 08:06:15', 0, NULL, NULL),
	(6, 1, 8, '댓글 test 123@#$★☞', '2016-01-05 08:12:56', 0, NULL, NULL),
	(8, 3, 8, 'test1', '2016-01-05 12:02:30', 0, NULL, NULL),
	(9, 3, 8, 'trst2', '2016-01-05 12:03:33', 0, NULL, NULL),
	(10, 3, 8, '댓글1', '2016-01-06 05:19:29', 0, NULL, NULL),
	(11, 3, 8, '댓글2', '2016-01-06 05:20:07', 0, NULL, NULL),
	(12, 3, 8, '내가 테스트', '2016-01-06 05:29:17', 0, NULL, NULL),
	(13, 3, 8, '내가 테스트', '2016-01-06 05:29:17', 0, NULL, NULL),
	(14, 3, 8, '댓글', '2016-01-06 05:37:11', 1, NULL, NULL),
	(16, 3, 8, '중복테스트', '2016-01-06 05:39:09', 1, NULL, NULL),
	(17, 3, 8, '두줄주뚜두두두두두두두두두두두두두두두두두두두두두두두두두또도도다다다다닫테스트으아우야그그구가대루가니러거가나238%9#&@*"-:?%¶®_•×~[°\\|[~[€\\€=hsjfjgwqwetupfozvzvxncmakagsfahdkgpoiiqyye¹11111111111111111111111111111&83&83&83&8&+$&+3:8$&8:8$&8%&+3*+$&+*+3&+&+3*+3&8&83*83&+%&+3&83&83*-83 ㅐ ㄷ핻핻핻핻래래헏럳럳렁러럳허렁러돚롣롲갣랟랟해핼랟래롣해도핻ㄹ핻핻핻ㄱ핻핻핻핻해하하대핟하핟하하햐하학핟하학핟핟하라핟핟핟핻헏핟핟헏핟ㅎㄷ핟핻하다더헏ㄹ핟허ㅏㄷ러덜뎌저럳러러러져젇러랃럳럳러렂렂럴재재으', '2016-01-06 12:43:41', 1, NULL, NULL),
	(18, 5, 8, '댓글댓글댓글댓글', '2016-01-11 17:54:33', 1, NULL, NULL),
	(19, 3, 8, '신기방기', '2016-01-13 04:20:58', 1, NULL, NULL),
	(20, 5, 17, '렝가 김봉진 수정 가능', '2016-01-13 04:39:42', 0, NULL, NULL),
	(21, 1, 17, '정말 유익하고 재미있어요!\n항상 감사하게 보고 있답니다.', '2016-01-13 04:49:19', 2, NULL, NULL),
	(22, 1, 17, '병아리  _(≥∇≤)ノミ☆특수문자', '2016-01-13 04:51:31', 0, NULL, NULL),
	(23, 2, 17, '서닌장 소오름 여자로\n랜스씨는 이제..', '2016-01-13 05:34:39', 0, NULL, NULL),
	(24, 4, 17, '카드 제목 4\n수정가능', '2016-01-13 05:36:10', 1, NULL, NULL),
	(25, 1, 17, 'SOS', '2016-01-13 05:39:27', 0, NULL, NULL),
	(26, 3, 17, '울랄라세션버스커버스커', '2016-01-13 05:40:02', 0, NULL, NULL),
	(27, 8, 17, '백작가 댓글\n\n', '2016-01-13 05:40:51', 1, NULL, NULL),
	(28, 1, 17, '수정이안돼요', '2016-01-13 06:12:12', 0, NULL, NULL),
	(29, 4, 19, '반갑습니다 서님장님', '2016-01-13 06:38:18', 0, NULL, NULL),
	(30, 3, 19, '심쿵하는 내용이네요ㅠㅠ', '2016-01-13 06:39:26', 3, NULL, NULL),
	(31, 2, 19, 'ㅎㅎㅎ웃고갑니다\n수정돼!', '2016-01-13 06:40:37', 1, NULL, NULL),
	(32, 8, 20, '임팩트있네요', '2016-01-14 05:11:36', 0, NULL, NULL),
	(33, 4, 17, '유병재 쥑이네~', '2016-01-14 06:04:42', 0, NULL, NULL),
	(36, 5, 17, '렛잇고\n자 이제 되지?', '2016-01-15 01:05:48', 0, NULL, NULL),
	(37, 2, 17, '10cm', '2016-01-15 01:06:53', 0, NULL, NULL),
	(41, 27, 8, '121231231231231\nqweqeqwqeqeq', '2016-02-01 02:36:48', 0, NULL, NULL),
	(42, 27, 8, 'asjdkajdkjsakdjkljaadas\nasdasdkaksdjkajsdlad\naldjalksjdklajdkljasdkl', '2016-02-01 02:57:05', 0, NULL, NULL),
	(43, 3, 97, '테스트', '2016-02-29 06:32:21', 1, NULL, NULL),
	(83, 97, 108, '테스트', '2016-03-23 13:35:19', 0, NULL, NULL),
	(84, 97, 9, '11', '2016-03-23 14:00:03', 0, NULL, NULL),
	(85, 97, 108, '테스트', '2016-03-23 16:00:53', 0, NULL, NULL),
	(86, 97, 108, '테스트', '2016-03-23 16:00:55', 0, NULL, NULL),
	(87, 97, 108, '테스트', '2016-03-23 16:00:56', 0, NULL, NULL),
	(88, 97, 108, '테스트', '2016-03-23 16:00:56', 0, NULL, NULL),
	(89, 97, 108, '테스트', '2016-03-23 16:00:57', 0, NULL, NULL),
	(90, 97, 108, '테스트', '2016-03-23 16:00:57', 0, NULL, NULL),
	(91, 97, 108, '테스트', '2016-03-23 16:00:58', 0, NULL, NULL),
	(92, 97, 108, '테스트', '2016-03-23 16:00:59', 0, NULL, NULL),
	(93, 97, 108, '테스트', '2016-03-23 16:00:59', 0, NULL, NULL),
	(94, 35, 9, '테', '2016-03-23 16:02:40', 0, NULL, NULL),
	(95, 35, 9, '테', '2016-03-23 16:02:44', 0, NULL, NULL),
	(96, 35, 9, '테', '2016-03-23 16:03:05', 0, NULL, NULL),
	(97, 97, 9, '테스트', '2016-03-23 16:03:32', 0, NULL, NULL),
	(98, 97, 9, 'test', '2016-03-23 16:03:55', 0, NULL, NULL),
	(99, 97, 9, 'test', '2016-03-23 16:03:56', 0, NULL, NULL),
	(100, 97, 9, 'test', '2016-03-23 16:03:56', 0, NULL, NULL),
	(101, 97, 9, 'test', '2016-03-23 16:03:57', 0, NULL, NULL),
	(102, 97, 9, 'test', '2016-03-23 16:04:01', 0, NULL, NULL),
	(103, 73, 9, '댓글', '2016-03-23 16:06:21', 0, NULL, NULL),
	(107, 97, 108, 'test', '2016-03-23 18:37:53', 0, NULL, NULL),
	(108, 97, 108, 'test', '2016-03-23 18:37:55', 0, NULL, NULL),
	(109, 97, 108, 'test', '2016-03-23 18:37:55', 0, NULL, NULL),
	(110, 97, 108, 'test', '2016-03-23 18:37:56', 0, NULL, NULL),
	(111, 97, 108, 'test', '2016-03-23 18:37:57', 0, NULL, NULL),
	(112, 97, 108, 'test', '2016-03-23 18:37:57', 0, NULL, NULL),
	(142, 97, 9, '테스트', '2016-03-24 15:25:26', 0, NULL, NULL),
	(143, 97, 9, '텨', '2016-03-24 15:26:11', 0, NULL, NULL),
	(144, 97, 149, 'ㅎㅎㅎㅎㅎㅎ', '2016-03-24 15:27:42', 0, NULL, NULL),
	(145, 97, 149, 'ㅎㅎㅎㅎㅎㅎ', '2016-03-24 15:27:45', 0, NULL, NULL),
	(146, 97, 149, 'ㅎㅎㅎㅎㅎㅎ', '2016-03-24 15:27:46', 0, NULL, NULL),
	(147, 97, 149, 'ㅎㅎㅎㅎㅎㅎ', '2016-03-24 15:27:47', 1, NULL, NULL),
	(148, 97, 149, 'ㅎㅎㅎㅎㅎㅎ', '2016-03-24 15:27:48', 1, NULL, NULL),
	(172, 97, 108, '테스트', '2016-03-25 14:13:02', 1, NULL, NULL),
	(173, 97, 9, '테스트', '2016-03-25 14:36:02', 0, NULL, NULL),
	(176, 97, 150, 'ㅅ든', '2016-03-25 15:36:32', 0, NULL, NULL),
	(177, 73, 108, 'ㅇㅇ', '2016-03-25 15:37:55', 0, NULL, NULL),
	(178, 73, 108, '테스트', '2016-03-25 15:40:14', 0, NULL, NULL),
	(179, 101, 150, 'ㅅ두', '2016-03-25 15:40:24', 0, NULL, NULL),
	(180, 97, 9, '테스트', '2016-03-25 15:41:43', 1, NULL, NULL),
	(181, 99, 150, 'ᆞ스즈ㅡㅅᆞ', '2016-03-25 15:47:14', 0, NULL, NULL),
	(182, 97, 108, '테스트', '2016-03-25 15:54:23', 0, NULL, NULL),
	(183, 97, 159, 'ooooooo', '2016-03-25 15:54:24', 1, NULL, NULL),
	(184, 97, 108, 'ㅇㅇㅇㅇ', '2016-03-25 15:56:21', 0, NULL, NULL),
	(185, 97, 108, '테스트', '2016-03-25 15:56:49', 0, NULL, NULL),
	(186, 97, 9, '테스트', '2016-03-25 16:00:18', 0, NULL, NULL),
	(187, 97, 9, '테스트\n', '2016-03-25 16:00:42', 0, NULL, NULL),
	(188, 97, 9, '테스트', '2016-03-25 16:01:34', 0, NULL, NULL),
	(189, 97, 9, '테스트', '2016-03-25 16:02:50', 0, NULL, NULL),
	(191, 97, 136, 'futztuxtuzutxtuxguxhi', '2016-03-25 14:09:44', 0, NULL, NULL),
	(192, 97, 136, 'futztuxtuzutxtuxguxhi', '2016-03-25 14:10:05', 0, NULL, NULL),
	(193, 97, 136, 'futztuxtuzutxtuxguxhi', '2016-03-25 14:11:43', 0, NULL, NULL),
	(194, 97, 136, 'fyfycyfy', '2016-03-25 14:14:25', 0, NULL, NULL),
	(195, 97, 9, 'fixed', '2016-03-25 16:53:39', 0, NULL, NULL),
	(196, 97, 9, 'test', '2016-03-25 16:56:46', 0, NULL, NULL),
	(197, 97, 9, 'oopppppp', '2016-03-25 17:00:06', 0, NULL, NULL),
	(198, 97, 9, 'test', '2016-03-25 17:04:25', 0, NULL, NULL),
	(199, 71, 9, 'Test', '2016-03-25 17:10:16', 1, NULL, NULL),
	(201, 71, 9, 'Test', '2016-03-25 17:11:44', 0, NULL, NULL),
	(210, 71, 147, 'Hshjsnsn\n\n\n\n\n', '2016-03-25 18:01:41', 0, NULL, NULL),
	(211, 71, 147, 'Bsnnss', '2016-03-25 18:01:48', 1, NULL, NULL),
	(212, 71, 147, 'Tesst ngay 25.3 hsjjd\n', '2016-03-25 18:02:57', 1, NULL, NULL),
	(213, 71, 147, 'Hahabbs', '2016-03-25 18:03:39', 0, NULL, NULL),
	(214, 71, 147, 'Haudau\n', '2016-03-25 18:03:51', 0, NULL, NULL),
	(215, 71, 147, 'Vab', '2016-03-25 18:04:02', 0, NULL, NULL),
	(216, 71, 147, 'Haha', '2016-03-25 18:04:12', 0, NULL, NULL),
	(217, 71, 147, 'Bsjjsnsn', '2016-03-25 18:04:40', 0, NULL, NULL),
	(218, 71, 147, 'Mcmdkdhd\n\n\n\nNxmfmf\n\n\n\n\n\n\n\nJcjcjfkdjd', '2016-03-25 18:06:56', 0, NULL, NULL),
	(219, 71, 147, 'Ax Ax Ax    Axx ', '2016-03-25 18:11:39', 0, NULL, NULL),
	(220, 71, 147, 'Bsjsnnxnxbnx        ', '2016-03-25 18:12:14', 0, NULL, NULL),
	(221, 71, 147, 'Bncnmsndnsjdndjnvbnnghsns               ', '2016-03-25 18:12:31', 1, NULL, NULL),
	(222, 97, 159, '', '2016-03-25 19:36:37', 0, NULL, NULL),
	(223, 69, 163, 'ㅋㅋㅋㅋ\n', '2016-03-26 16:52:02', 1, NULL, NULL),
	(224, 69, 163, 'ㅋㅋㅋㅋ\n', '2016-03-26 16:52:07', 0, NULL, NULL),
	(225, 71, 147, 'Higoho', '2016-03-28 10:42:33', 1, NULL, NULL),
	(226, 71, 147, 'Bannsnsnd                 ', '2016-03-28 15:38:56', 1, NULL, NULL),
	(227, 71, 147, 'Up cmt ', '2016-03-28 15:41:22', 1, NULL, NULL),
	(228, 100, 165, 'Viet cmt ', '2016-03-28 16:15:47', 0, NULL, NULL),
	(229, 100, 165, 'Cmt ', '2016-03-28 16:16:42', 0, NULL, NULL),
	(230, 100, 165, 'Cmt fb', '2016-03-28 16:17:03', 0, NULL, NULL),
	(231, 100, 165, 'Cmt ', '2016-03-28 16:17:42', 0, NULL, NULL),
	(232, 100, 165, 'Patanjali, người thầy vĩ đại của môn phái Yoga ở thế kỷ thứ 7 trước Công nguyên, đã kết luận: "Thở, suy nghĩ và tư tưởng có mối liên hệ sâu xa. Tư tưởng bình yên nhờ sự luân phiên vào ra của việc thở sâu, điều hoà’’. Khi vừa thức dậy bạn không nên quá áp vội vã bắt đầu ngày mới, trạng thái này sẽ khiến hơi thở của bạn ngắn và nông. Hãy tập làm quen với việc hít sâu, thở đều đặn, giữ tâm thái ổn định sẽ đem lại cho bạn trạng thái dễ chịu, bình tĩnh.', '2016-03-28 16:20:03', 2, NULL, NULL),
	(233, 101, 165, 'Hien thi tren fb', '2016-03-28 16:33:54', 0, NULL, NULL),
	(234, 49, 165, 'Tesst', '2016-03-28 16:40:31', 0, NULL, NULL),
	(235, 97, 159, 'viết cmt ', '2016-03-28 17:27:00', 0, NULL, NULL),
	(236, 89, 165, 'Cmt nay ', '2016-03-28 18:07:18', 0, NULL, NULL),
	(237, 61, 165, 'Vieef cmt', '2016-03-28 18:08:24', 0, NULL, NULL),
	(238, 46, 165, 'Crash', '2016-03-28 18:13:20', 0, NULL, NULL),
	(239, 49, 165, 'Crash ddi', '2016-03-28 18:15:49', 1, NULL, NULL),
	(240, 71, 165, 'Aay da. ', '2016-03-28 18:26:58', 0, NULL, NULL),
	(241, 97, 166, 'hellu', '2016-03-29 11:40:45', 0, NULL, NULL),
	(242, 73, 159, 'hellu', '2016-03-29 15:14:36', 1, NULL, NULL),
	(243, 73, 159, 'new', '2016-03-29 15:16:05', 0, NULL, NULL),
	(244, 100, 159, 'abc abc \n\n\n\n\n\n\n\n\n\n\n', '2016-03-29 15:17:45', 1, NULL, NULL),
	(245, 100, 159, 'jkklmmnnn\n\n\n\n\n\n\n\n\n\n\n\n\n\n', '2016-03-29 15:18:24', 1, NULL, NULL),
	(246, 100, 159, 'au khi hoàn thành các câu hỏi liên quan chuyên môn, đại diện Google muốn biết mình sẽ chọn thực tập tại nơi nào trong các văn phòng của họ. Không suy nghĩ gì, mình hỏi lại rằng: \'Có phải tôi đã được chọn hay không?\'. Họ khá bất ngờ và bật cười trước câu trả lời của mình" - Thanh nói.\n\nChàng trai tiết lộ thêm, sau khi vượt qua vòng phỏng vấn online, ứng viên sẽ trải qua tiếp một vòng phỏng vấn điện thoại trực tiếp. Tiêu chí của vòng này là để Google kiểm tra thêm một lần kỹ năng giao tiếp b\n', '2016-03-29 15:25:47', 1, NULL, NULL),
	(247, 97, 159, 'cmt share web', '2016-03-29 15:35:00', 0, NULL, NULL),
	(248, 69, 159, 'lỗi đi.', '2016-03-29 15:56:08', 0, NULL, NULL),
	(249, 73, 159, 'oh yeah!!!!!!!', '2016-03-29 16:03:12', 0, NULL, NULL),
	(250, 101, 165, 'Crash nay', '2016-03-29 17:57:40', 0, NULL, NULL),
	(251, 97, 159, 'viết cmt', '2016-03-30 11:02:20', 0, NULL, NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


-- Dumping structure for table micimpact.comment_likes
CREATE TABLE IF NOT EXISTS `comment_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.comment_likes: ~39 rows (approximately)
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
	(38, 43, 3, 97),
	(45, 175, 97, 159),
	(47, 172, 97, 159),
	(48, 180, 97, 159),
	(50, 148, 97, 159),
	(51, 147, 97, 159),
	(52, 183, 97, 159),
	(53, 199, 71, 9),
	(54, 212, 71, 147),
	(55, 211, 71, 147),
	(71, 221, 71, 147),
	(72, 223, 69, 163),
	(73, 227, 71, 165),
	(74, 226, 71, 165),
	(75, 225, 71, 165),
	(76, 232, 100, 165),
	(77, 239, 49, 165),
	(78, 242, 73, 159),
	(79, 232, 100, 159),
	(80, 246, 100, 159),
	(81, 245, 100, 159),
	(82, 244, 100, 159);
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
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.images: ~309 rows (approximately)
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
	(163, 26, 'card_image/56376e00-49ba-4924-b8ae-74479eaac1a1.png'),
	(165, 62, 'card_image/37239d49-e253-41e3-b42a-66ebc7962153.png'),
	(166, 62, 'card_image/36491467-fc14-4f47-9b7c-7cfee29cfe5a.png'),
	(167, 62, 'card_image/3e40aff0-9bc5-4f09-a51a-81566092f3bd.png'),
	(168, 62, 'card_image/481c67ba-5d95-4acd-8d5f-56c22d23aef6.png'),
	(169, 62, 'card_image/cdaa05ab-0c10-408f-9dd8-e1a6f9af98cd.png'),
	(170, 62, 'card_image/7843727b-90fd-4fbd-9361-94b11bea6c66.png'),
	(171, 62, 'card_image/5498db36-ae82-4b17-a121-8840aed92184.png'),
	(172, 62, 'card_image/8f3ab347-2bf4-451f-bce2-9c1f378dcee0.png'),
	(173, 62, 'card_image/9d739a1f-6679-4361-9fdc-592f0e4aea0f.png'),
	(174, 62, 'card_image/20da6bc2-2d10-4b32-9130-f226a086ed9a.png'),
	(175, 62, 'card_image/6de6b0bb-0451-4ded-ab9a-a5449c5c2e48.png'),
	(176, 62, 'card_image/95dbc645-83b7-49b0-99bd-a0b1e97ec119.png'),
	(177, 62, 'card_image/e4a4215e-7c0d-4759-94ed-c0a2e4a701ae.png'),
	(178, 62, 'card_image/cd8bf383-b418-41aa-b84e-04d569eca759.png'),
	(179, 62, 'card_image/56382c59-681f-4fc2-99f8-cd3f9fa6348f.png'),
	(180, 62, 'card_image/470375a3-5b6a-4d18-bfc9-ee11a37ec572.png'),
	(181, 62, 'card_image/666ba4e7-ab71-4534-adcf-f9c7b08b4bda.png'),
	(182, 62, 'card_image/f44da149-9e2e-47aa-8f6a-24aa634c04bd.png'),
	(183, 63, 'card_image/72913a1a-c99f-4b31-a67b-ec78ca9f6893.png'),
	(184, 63, 'card_image/b230396f-b3f9-4a0c-8fac-d18ec86eb28d.png'),
	(185, 63, 'card_image/b0497e91-a9d6-496c-92a1-a06cbc06ecff.png'),
	(186, 63, 'card_image/c1981903-a7c0-4704-ad78-410e3b5d6c60.png'),
	(187, 63, 'card_image/4cc6f2f6-0e88-4ba0-af4e-3f0ffbf16b37.png'),
	(188, 63, 'card_image/81ed36d2-1a2b-400c-b272-743badba6b28.png'),
	(189, 63, 'card_image/d0e9f37f-91c4-4ed9-8572-8705157a6bc0.png'),
	(190, 63, 'card_image/645f4794-d024-4a33-bfae-c4ad7415cd02.png'),
	(191, 63, 'card_image/17216eb8-432d-4da5-9dc6-95efede01273.png'),
	(192, 63, 'card_image/432d82c6-c97d-495b-9ca5-3a9a02cf34a6.png'),
	(193, 63, 'card_image/873aac3b-5552-49ab-b5d2-cb1640aa2a2f.png'),
	(194, 63, 'card_image/9c89ea7b-dd3c-46de-9698-55a7406ee8f5.png'),
	(195, 63, 'card_image/f79310f1-addb-49ea-993b-82f11ef13cf4.png'),
	(196, 63, 'card_image/c026668c-3f32-4c4f-ba68-6c0a00803079.png'),
	(197, 63, 'card_image/370d9a8f-f842-4e46-a9fe-45f02e12c41b.png'),
	(198, 63, 'card_image/5ee99f43-1439-4b9e-87ac-358a7824c299.png'),
	(199, 63, 'card_image/5daebd3d-713f-4097-b24d-cb35f55b8251.png'),
	(200, 63, 'card_image/b0280631-e89b-4e1b-a866-e5d721468954.png'),
	(201, 70, 'card_image/16c71bef-9144-4295-8936-31055b1ce6d1.png'),
	(202, 70, 'card_image/603e3e76-80b1-48f1-a08b-8de81589e79f.png'),
	(203, 70, 'card_image/8fdbde0e-2a07-4eee-ae40-7d63cb37b185.png'),
	(204, 70, 'card_image/f66ab8c6-edd3-45b6-ae39-dc061e70b65f.png'),
	(205, 70, 'card_image/c135a83a-21f9-4edd-92fb-9704d51fe34c.png'),
	(206, 70, 'card_image/d5fc4dfe-8a4d-46bf-9d04-9ea6f26e7649.png'),
	(207, 70, 'card_image/6693cf74-d7d0-468f-b14f-c1cb3ff73649.png'),
	(208, 70, 'card_image/d08a20fe-401e-4322-9b44-62a0f1792c74.png'),
	(209, 70, 'card_image/34026bfa-6631-4340-b8fd-7400455c42c8.png'),
	(210, 70, 'card_image/c439206d-a05e-4d8b-a463-7eeb36666a13.png'),
	(211, 70, 'card_image/d4fdaf43-163e-47c6-bdff-86a32c0f8bf8.png'),
	(212, 70, 'card_image/349ca3f8-f521-4c60-866c-1806b21b1cca.png'),
	(213, 70, 'card_image/814ba60f-91c5-4a53-bee4-9bcc43cdae48.png'),
	(214, 70, 'card_image/645ea3f8-0679-40cb-86cc-6470c5e08506.png'),
	(215, 70, 'card_image/549db68d-b348-4bd3-9ff7-9fea1feb3743.png'),
	(216, 70, 'card_image/67532ab7-acd4-44b6-a4d1-1435507b7d1b.png'),
	(217, 70, 'card_image/261f24bc-9c91-4d56-a460-6f69fd285788.png'),
	(218, 70, 'card_image/151071a5-47f8-4e9f-9fd3-ee8d7d544f47.png'),
	(219, 71, 'card_image/6701ba88-b4f1-4e6b-b1ad-ef762e6a2dcc.jpg'),
	(220, 71, 'card_image/eb3a5e7a-8f6f-45d5-b8c4-0e4fd5f84e0b.jpg'),
	(221, 71, 'card_image/7fd5e5f0-dcea-4455-9ce8-cbe602c0ddd6.jpg'),
	(222, 71, 'card_image/e6fcf44d-9645-4601-821f-194521ead161.jpg'),
	(223, 71, 'card_image/fb055c8a-aab3-4ec0-b581-1a615876161e.jpg'),
	(224, 71, 'card_image/38690ad2-292f-451c-8fc7-2c20676dfb41.jpg'),
	(225, 71, 'card_image/a9ac356c-d32e-404c-b9b5-2a1580ce501d.jpg'),
	(226, 71, 'card_image/1b36d573-d641-4521-8fa3-f15d9cd448ba.jpg'),
	(227, 71, 'card_image/25dbe2db-a58a-419c-aa17-c427adef7c9e.jpg'),
	(228, 71, 'card_image/58b05cf5-d7c9-4882-9514-985a276a5991.jpg'),
	(229, 71, 'card_image/c72e1948-4130-426e-8732-f6aa1c6ea6b3.jpg'),
	(230, 71, 'card_image/838d623e-a51a-45f0-a62b-ce39466a3007.jpg'),
	(231, 71, 'card_image/d810bf34-30fd-4404-af16-7407265cc840.jpg'),
	(232, 71, 'card_image/d9da61d3-a134-42bc-9813-38d43306a4ba.jpg'),
	(233, 71, 'card_image/b739ac2c-ecb0-4e99-b89e-2e95e05389b6.jpg'),
	(234, 72, 'card_image/cb32d116-e0b5-4942-b51e-0050878c9b74.jpg'),
	(235, 72, 'card_image/6284eb11-eff1-4603-b142-926c3456d40e.jpg'),
	(236, 72, 'card_image/a50319a9-03d5-48a1-bfd8-b7cd88da583e.jpg'),
	(237, 72, 'card_image/88fabe97-a4e8-4da9-bf84-88b9ed190b6a.jpg'),
	(238, 72, 'card_image/50b1335b-40e8-435d-a60f-f50c3a42153e.jpg'),
	(239, 72, 'card_image/10d0a263-30ab-41bb-a2fc-3198e8e122ed.jpg'),
	(240, 72, 'card_image/34c742d2-f05a-494b-971f-864e6fb456a8.jpg'),
	(241, 72, 'card_image/8a62c888-ec58-4aae-b0d5-6274ca43034e.jpg'),
	(242, 72, 'card_image/18c81d7a-1bec-47ab-ae9d-37c1d398b736.jpg'),
	(243, 72, 'card_image/4428c73b-a5d2-452e-b948-e39f31b48b18.jpg'),
	(244, 72, 'card_image/4070b54f-3303-4041-b35e-23bd1cbfd325.jpg'),
	(245, 72, 'card_image/9529e012-7704-43cd-9d25-6cc7dc81709a.jpg'),
	(246, 73, 'card_image/cb8cd27e-e3cc-40e0-87d8-b00445beda09.jpg'),
	(247, 73, 'card_image/372a2a9c-0fcc-4a50-b5f5-fcca1d39d3c3.jpg'),
	(248, 73, 'card_image/c82ad5be-e369-4b40-aa2c-41f532963611.jpg'),
	(249, 73, 'card_image/d3f104a6-07f0-4fc0-b6a8-2cc4887e705a.jpg'),
	(250, 73, 'card_image/087dd555-de4a-482b-86df-d1f2bc78193c.jpg'),
	(251, 73, 'card_image/efb1c711-4723-4136-ae27-1197c2cd81f7.jpg'),
	(252, 73, 'card_image/fa09bcff-782d-4bdd-836b-d0dac403a1c4.jpg'),
	(253, 73, 'card_image/647f06bf-87c9-4e72-a973-10c9420983db.jpg'),
	(254, 73, 'card_image/6ae1e574-1a16-49f8-a7d8-1ca16d40f4cb.jpg'),
	(255, 74, 'card_image/c74ef401-a30c-4bca-8b9d-a815f24d815d.jpg'),
	(256, 74, 'card_image/066285af-9b92-4338-b0a5-721f06e0fde7.jpg'),
	(257, 74, 'card_image/9bd029a1-c0fe-4ade-96ed-d6921e4ed620.jpg'),
	(258, 74, 'card_image/4c997a02-dd58-492c-83e7-1e765b0bc82f.jpg'),
	(259, 74, 'card_image/e8dec447-f8a0-4d18-9de4-dcdf9db576df.jpg'),
	(260, 74, 'card_image/23113c47-fc30-43e9-811c-aa4a52c8e34f.jpg'),
	(261, 74, 'card_image/e271bc82-25e4-4cbf-8049-026f343ca655.jpg'),
	(262, 74, 'card_image/77288fb7-1c5f-4e66-84d8-4516cc082d93.jpg'),
	(263, 75, 'card_image/f121926f-2d42-4c2b-b5aa-aa00615ae450.jpg'),
	(264, 75, 'card_image/fa00f0e3-e1f3-440a-afd9-1c14fd281bfc.jpg'),
	(265, 75, 'card_image/b3d3938d-245b-44c5-865f-99615bde458f.jpg'),
	(266, 75, 'card_image/1873a64f-2abd-49df-94f5-bed40eb0a8d2.jpg'),
	(267, 75, 'card_image/6446560e-fe1a-4691-9222-a61f97b5e8b2.jpg'),
	(268, 75, 'card_image/911833f8-d67c-485d-ad27-3d77e9de9f6a.jpg'),
	(269, 75, 'card_image/9d77c2d4-6ed3-4e55-804e-cd2fe38607de.jpg'),
	(270, 75, 'card_image/8644de83-a16d-41d4-863f-d95591fd3c23.jpg'),
	(271, 75, 'card_image/c51301ff-7031-459b-ad6a-35ce5b19703f.jpg'),
	(272, 75, 'card_image/1b993182-bf94-4758-87e0-cd80e9a320a8.jpg'),
	(273, 75, 'card_image/db8d3af0-a679-4721-a475-c3d9ebe208d4.jpg'),
	(274, 75, 'card_image/eb76a35d-8f57-42fb-bbe8-52b4a8370a0b.jpg'),
	(275, 75, 'card_image/432991f3-5f68-4bb3-997a-6efb7614de7d.jpg'),
	(276, 94, 'card_image/86c6fb09-f09e-49c3-be03-b021646db141.jpg'),
	(277, 94, 'card_image/206a93de-f8a0-438a-b903-be485a73fbc8.jpg'),
	(278, 94, 'card_image/754e9045-e4c1-499e-b6f4-db542e7852f5.jpg'),
	(279, 94, 'card_image/2d655dd9-06a5-4a4e-a3d7-9dddfaf67c1d.jpg'),
	(280, 94, 'card_image/a89afbb5-f008-4d24-a1b6-625ca53568af.jpg'),
	(281, 94, 'card_image/c61c4cec-2b5c-45a8-9310-6c8b1124f16f.jpg'),
	(282, 94, 'card_image/f1604beb-ec19-4054-8ecf-32d8de2a2650.jpg'),
	(283, 94, 'card_image/a76765dc-15a0-43a2-843a-db60a9606ba3.jpg'),
	(284, 94, 'card_image/1e6fd086-7509-483f-8c20-fb9d7d05e067.jpg'),
	(285, 94, 'card_image/72874613-e025-4916-a478-049f06c7c763.jpg'),
	(286, 94, 'card_image/7ee0449a-fbe7-45d4-9222-967caf6df404.jpg'),
	(287, 94, 'card_image/36f4aa88-8f54-4fe3-8cbb-287cd3ceb1ee.jpg'),
	(288, 94, 'card_image/e5bc80ff-81ad-45db-a1ae-bef7e317547e.jpg'),
	(289, 94, 'card_image/15aa0c31-6564-4af3-afc9-318c04fc087b.jpg'),
	(290, 94, 'card_image/5e1092c5-2924-4cb6-8d92-27bd4162905e.jpg'),
	(291, 94, 'card_image/fa9ef42e-1f4b-4dfa-b7c7-0dff41661aca.jpg'),
	(292, 95, 'card_image/6b227d08-70d5-424c-9d61-d7fafd3acb7d.jpg'),
	(293, 95, 'card_image/4568e32d-c334-494f-9088-18094ad7a063.jpg'),
	(294, 95, 'card_image/f8a2d1b2-0757-4248-84e2-d36e489d077d.jpg'),
	(295, 95, 'card_image/084e6178-6729-416a-8c79-b9c54f9c2c46.jpg'),
	(296, 95, 'card_image/80cbd05e-cef2-45d8-b35a-d7dd351136fe.jpg'),
	(297, 95, 'card_image/a97ebfe8-8c5e-43ab-a7e5-565011a1e286.jpg'),
	(298, 95, 'card_image/ad0de94f-7b19-495d-82f0-564d87eb1780.jpg'),
	(299, 95, 'card_image/aa4b1ba2-ecbf-468f-bfb5-44e4d0951c56.jpg'),
	(300, 95, 'card_image/34e2c4b0-1666-43c6-9c58-2dbe026cfa38.jpg'),
	(301, 95, 'card_image/a4d19f27-bca4-489c-8f31-790fcf3f1534.jpg'),
	(302, 95, 'card_image/b451d558-b30d-4995-b96d-6c83c32f89fb.jpg'),
	(303, 95, 'card_image/b56c642b-15f7-4433-913c-85f913455739.jpg'),
	(304, 96, 'card_image/e52373b8-1f28-4ed5-b991-606d39244c6e.jpg'),
	(305, 96, 'card_image/2fecfbb9-68e8-4126-8123-61a38ec91701.jpg'),
	(306, 96, 'card_image/87d72c7a-6ae4-4da0-88b5-4750397c4921.jpg'),
	(307, 96, 'card_image/abdddb75-853f-4ba8-b581-68d2020d9461.jpg'),
	(308, 96, 'card_image/ed25bf1e-f987-408b-84b5-50b0fc3ef69e.jpg'),
	(309, 96, 'card_image/22243e84-c40d-4ea7-8159-a12c74d10d2e.jpg'),
	(310, 96, 'card_image/33894c4c-8213-44f8-b57a-dbe2c7e3ab21.jpg'),
	(311, 96, 'card_image/1e1db254-6564-4bf4-8989-f8e48412c95f.jpg'),
	(312, 96, 'card_image/8d1d044d-c4da-41d5-8258-8c5617b1e11b.jpg'),
	(313, 97, 'card_image/d4d2619f-2305-4301-b868-399ab3824fd8.jpg'),
	(314, 97, 'card_image/b1f27ea7-a06b-40ca-8379-38794754d636.jpg'),
	(315, 97, 'card_image/2602977c-1a75-4ed6-9958-c7e54de6064e.jpg'),
	(316, 97, 'card_image/a5210f89-76c1-4e05-a90a-71db52f5bf85.jpg'),
	(317, 97, 'card_image/3dbc6316-1124-41a5-b1bd-a4feafa4797d.jpg'),
	(318, 97, 'card_image/f1423a0b-75b1-43f0-9cee-02137a75d428.jpg'),
	(319, 97, 'card_image/ee646885-344c-40f5-80c2-9db9e40bdf67.jpg'),
	(320, 97, 'card_image/7d2636c8-90f9-4bea-a7f1-1d8deaacc4ca.jpg'),
	(321, 97, 'card_image/5b4e0bc3-6287-4066-a848-f9819615dbbf.jpg'),
	(322, 97, 'card_image/8370c922-c467-419b-86b5-984ce4cf342c.jpg'),
	(323, 97, 'card_image/ebc75400-44b2-4787-8a47-06553635cc78.jpg'),
	(324, 97, 'card_image/ce48fe2c-8910-4734-9cee-e78a3fa7f86b.jpg'),
	(325, 97, 'card_image/6cbbfecd-7711-4bb0-88f6-2a323c84f43f.jpg'),
	(326, 97, 'card_image/3c5dcc99-b2cc-43a0-8c87-6fb25a1896c6.jpg'),
	(327, 97, 'card_image/532a0fe9-924e-4299-90a2-4aee96da8eeb.jpg'),
	(328, 97, 'card_image/431bab08-4728-426e-ac93-740b19f52847.jpg'),
	(329, 97, 'card_image/78bada7d-8853-478c-abbb-c715c45d8bbe.mp4_20160316_183643'),
	(330, 97, 'card_image/d23754c6-bafd-4dd3-acc3-d6a6e4c148eb.mp4_20160316_183657'),
	(331, 97, 'card_image/6c09fdca-4877-4a3b-ad40-88756845cf2b.mp4_20160316_183706'),
	(332, 97, 'card_image/65167192-c357-47a3-abb3-eacec8996871.mp4_20160316_183710'),
	(333, 97, 'card_image/faccca0b-c42d-4107-9461-f52ab22a983c.mp4_20160316_183723'),
	(334, 97, 'card_image/ddfdb031-33b5-4c01-854f-781420cad802.mp4_20160316_183851'),
	(335, 97, 'card_image/b5e962b6-3e27-4b8b-9e37-58eb6b2596d6.mp4_20160316_183858'),
	(336, 97, 'card_image/0f83e3a1-cb92-435f-906d-47a4ef7d27be.mp4_20160316_183904'),
	(337, 97, 'card_image/fa44ef32-3fb6-4a34-aae8-f4fe75710b86.mp4_20160316_183913'),
	(338, 97, 'card_image/f6b66101-ba71-401c-ab53-456ab6be7ad0.mp4_20160316_183916'),
	(339, 97, 'card_image/3674f7df-b294-4b1d-982a-95cc42f9d1b3.mp4_20160316_183925'),
	(340, 97, 'card_image/d784f5e3-3d50-4865-9e4f-b6c779ccf55b.mp4_20160316_183939'),
	(341, 97, 'card_image/acaf486b-ec6f-4c1b-a701-cc76cb79db51.mp4_20160316_183954'),
	(342, 97, 'card_image/ed269d0d-2571-440f-afbd-f0dcd9599fee.mp4_20160316_184007'),
	(343, 97, 'card_image/952fe164-d95a-4213-8353-87cd61bba8d4.mp4_20160316_184010'),
	(344, 97, 'card_image/5f68e4cd-52cf-46d3-8fbb-98a892f462f3.mp4_20160316_184037');
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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.likes: ~44 rows (approximately)
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
	(46, 1, 114, '2016-03-01 05:17:29'),
	(58, 70, 9, '2016-03-16 04:53:55'),
	(59, 70, 136, '2016-03-16 04:54:12'),
	(60, 3, 136, '2016-03-16 06:09:09'),
	(61, 43, 136, '2016-03-16 09:39:16'),
	(62, 97, 136, '2016-03-17 08:35:01'),
	(63, 35, 22, '2016-03-18 06:22:45'),
	(64, 51, 108, '2016-03-18 11:17:46'),
	(68, 43, 138, '2016-03-24 04:10:03'),
	(69, 97, 149, '2016-03-24 06:27:03'),
	(70, 73, 149, '2016-03-24 06:39:53'),
	(71, 73, 108, '2016-03-25 02:09:00'),
	(72, 62, 108, '2016-03-25 02:09:48'),
	(73, 47, 108, '2016-03-25 02:10:25'),
	(74, 60, 108, '2016-03-25 02:10:57'),
	(75, 66, 108, '2016-03-25 02:21:36'),
	(77, 35, 151, '2016-03-25 05:08:17'),
	(83, 97, 163, '2016-03-26 07:46:41'),
	(84, 73, 163, '2016-03-26 07:48:46'),
	(85, 69, 163, '2016-03-26 07:51:12'),
	(111, 71, 147, '2016-03-28 06:47:56'),
	(120, 100, 165, '2016-03-28 07:14:35'),
	(122, 101, 165, '2016-03-28 07:59:23'),
	(123, 97, 9, '2016-03-28 10:45:44'),
	(125, 73, 159, '2016-03-29 06:16:34'),
	(128, 100, 159, '2016-03-29 06:33:30'),
	(130, 71, 165, '2016-03-29 09:08:17');
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

-- Dumping data for table micimpact.main_list: ~15 rows (approximately)
DELETE FROM `main_list`;
/*!40000 ALTER TABLE `main_list` DISABLE KEYS */;
INSERT INTO `main_list` (`id`, `card_id`, `order`) VALUES
	(38, 71, 1),
	(39, 49, 2),
	(40, 46, 6),
	(41, 72, 10),
	(42, 73, 4),
	(43, 74, 9),
	(44, 75, 3),
	(45, 76, 8),
	(48, 80, 7),
	(49, 96, 11),
	(50, 97, 5),
	(51, 94, 13),
	(52, 92, 12),
	(53, 91, 14),
	(54, 89, 15);
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

-- Dumping data for table micimpact.posting_types: ~0 rows (approximately)
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

-- Dumping data for table micimpact.report: ~0 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.users: ~71 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `password`, `name`, `email`, `created_at`, `updated_at`, `fag`, `facebook_token`, `kakaotalk_token`, `line_token`, `birthyear`, `sex`, `job`, `city`, `activity_point`, `level`, `point`, `push_state`, `profile_url`, `is_withdrawn`, `heart_state_id`, `recent_card_id`) VALUES
	(1, 1, 'f865b53623b121fd34ee5426c792e5c33af8c227', '마이크임팩트', 'admin@micimpact.co.kr', '2015-12-22 04:07:14', '2015-12-22 04:07:14', 1, NULL, NULL, NULL, NULL, NULL, '운영자', NULL, 0, 1, 0, 1, 'profile/25d7a198-a39a-4732-8ee0-39c986e17168.png', 0, NULL, 1),
	(3, 2, 'ab70e7ca49d2d4428569ee0bdd01e0bf04d9b1ac', 'sdsdsdsd', 'sdsdsdsd', '2015-12-28 10:08:47', '2015-12-28 10:08:47', 0, NULL, NULL, NULL, '2014', 'm', '취준생', '서울특별시', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(6, 2, 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'test', 'test@test.com', '2015-12-29 06:34:40', '2015-12-29 06:34:40', 0, NULL, NULL, NULL, '2010', 'm', '직장인', '서울특별시', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(7, 2, '99ebdbd711b0e1854a6c2e93f759efc2af291fd0', 'test', 'ttt@test.com', '2015-12-29 06:39:19', '2015-12-29 06:39:19', 1, NULL, NULL, NULL, '2012', 'm', '직장인', '강원도', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(8, 2, 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'testt', 'testuser@test.com', '2016-01-05 10:42:10', '2016-01-05 10:42:10', 1, NULL, NULL, NULL, '1991', 'm', '직장인', '서울특별시', NULL, NULL, NULL, NULL, NULL, NULL, 5, 5),
	(9, 2, 'f865b53623b121fd34ee5426c792e5c33af8c227', '차태수', 'ckxotn1@naver.com', '2016-01-05 02:12:36', '2016-01-05 02:12:36', 1, NULL, NULL, NULL, '2014', 'm', '취준생', '서울특별시', NULL, NULL, NULL, NULL, 'profile/90f68094-c923-40cf-a63c-66c5b81f6053.png', NULL, 2, 73),
	(15, 2, '3ef747ca146c564de8ebe3c761608f1fa9a4090e', '박정훈', 'mskyblue@hanmail.net', '2016-01-13 01:33:13', '2016-01-13 01:33:13', 1, NULL, NULL, NULL, '1986', 'm', '직장인', '서울특별시', NULL, NULL, NULL, NULL, NULL, NULL, 22, 4),
	(16, 2, 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', '테스터', 'test1@test.com', '2016-01-13 01:39:19', '2016-01-13 01:39:19', 1, NULL, NULL, NULL, '2015', 'm', '취준생', '서울특별시', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(17, 2, '2824da290cdbbb304fbbe1b347ac14dd20c6e800', '서닌장', 'shjera46@naver.com', '2016-01-13 04:25:37', '2016-01-13 04:25:37', 1, NULL, NULL, NULL, '1993', 'm', '학생', '인천광역시', NULL, NULL, NULL, NULL, 'profile/81668aa1-b882-4472-8cb3-b8b590ac7e41.png', NULL, 5, 7),
	(19, 2, 'b1e8130a3704404437d39dfe06ddc4339bf1bc48', '질 드 랜스보', 'shjera46@snu.ac.kr', '2016-01-13 06:37:32', '2016-01-13 06:37:32', 0, NULL, NULL, NULL, '1990', 'm', '취준생', '세종시', NULL, NULL, NULL, NULL, NULL, NULL, 2, 4),
	(22, 2, 'f62218766295c4ae8cac22d7f517607a230f4aed', '임세빈', 'sseban79@hanmail.net', '2016-01-15 16:01:13', '2016-01-15 16:01:13', 1, NULL, NULL, NULL, '1979', 'm', '직장인', '경기도', NULL, NULL, NULL, NULL, NULL, NULL, 20, 97),
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
	(96, 2, '', '김동영', NULL, '2016-02-29 15:24:25', '2016-02-29 15:24:25', 1, NULL, 'mVdmbiNkNXk1c5kDblU1VL3TUISGRb7DZRIWDKwQTJgAAAFTK7D9Ow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 73),
	(97, 2, '', '채기정', NULL, '2016-02-29 06:31:37', '2016-02-29 06:31:37', 1, NULL, 'vndrLIuYd5imKwjnjqeH-LygXlnzCmGzrDVrXqwQQjIAAAFTK7lxiA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 7),
	(105, 2, '', '서 형진', NULL, '2016-02-29 06:45:21', '2016-02-29 06:45:21', 1, NULL, 'g8FH182E6NzMjuHpeqYwfZb958DnWbj5xfRZBKwQQHYAAAFTK8YDCA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 7),
	(108, 2, '', 'Ki-jung Chae', NULL, '2016-02-29 16:47:16', '2016-02-29 16:47:16', 1, '1114081751956764', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 97),
	(112, 2, '', '혜진배', NULL, '2016-02-29 08:29:18', '2016-02-29 08:29:18', 1, NULL, 'knhtY_o9Ee5Eb3ZWUorRogy7ZLjyQhl7_yDpaawQTJgAAAFTLCU6DA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(113, 2, '', '혜진배', NULL, '2016-02-29 08:29:57', '2016-02-29 08:29:57', 1, NULL, 'KSbErvyHtrgegLONNchKfByz4aHH3Ml6wIqLRawQQjQAAAFTLCXRMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(114, 2, '', 'HyeJin Bae', 'iouboa@naver.com', '2016-02-29 08:31:23', '2016-02-29 08:31:23', 1, '1044093442325240', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile/5a893401-c188-49fd-a4c4-e6fd9effd867.jpg', NULL, NULL, 4),
	(124, 2, '8cb2237d0679ca88db6464eac60da96345513964', 'ksm', 'coin2@naver.com', '2016-02-29 11:22:27', '2016-02-29 11:22:27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile/4b1e7a85-526a-4309-8cd1-6a578623e3de.jpg', NULL, 4, NULL),
	(125, 2, '26e408ea220c5b09c3a8fd81ddd6027c05145aec', '채기정', 'kjchae31@trams.co.kr', '2016-02-29 11:26:39', '2016-02-29 11:26:39', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(126, 2, '', '최봉재', 'jjgod0124@gmail.com', '2016-02-29 11:31:03', '2016-02-29 11:31:03', 1, '958216844255078', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(129, 2, '', '선명', NULL, '2016-03-01 05:19:45', '2016-03-01 05:19:45', 1, NULL, 'ojPuEZAVkviceT5g1nSMzzLDlmjABIN2NXx8gawQQjQAAAFTMJ4DhQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
	(130, 2, '', '김선명', 'naskm007@naver.com', '2016-03-01 05:43:45', '2016-03-01 05:43:45', 1, NULL, NULL, 'coPYipl39L5B0Tep16nGfYuiiVv29ZWZYnh0khJgzzokSUHiprvaLlk6qfA92vXj8OsVKYYqzzwHuF97ip7NX9XakXN8DQc5msisevvL9ABlf156KsoUYGkmGy8sJaAHGhyX3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL),
	(131, 2, '', 'Sue Hyun Kim', 'mobilein@naver.com', '2016-03-07 10:59:25', '2016-03-07 10:59:25', 1, '10205685013747137', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 49),
	(132, 2, '', '수현', NULL, '2016-03-07 02:08:22', '2016-03-07 02:08:22', 1, NULL, NULL, 'BfkH6kipVfLfpkzxZ4h3docBf8y1fpjlH8JpfE1Nisq3TsmYLJDf1YOrKIGjTZJzRUv6w82jI5xUiihJPvf5xa2S7Yx0EXTWfu2isk0gh08AGYeJAu8Fx1e2jJUnOLaZOCDe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 97),
	(133, 2, '', 'Sao Vũ', 'ptit.cn8.star@gmail.com', '2016-03-07 09:07:33', '2016-03-07 09:07:33', 1, '637781699695960', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 101),
	(134, 2, '', 'Seon Myeong Kim', 'naskm007@naver.com', '2016-03-07 09:12:10', '2016-03-07 09:12:10', 1, '921105848004095', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 7),
	(135, 2, '', 'Kham Kham', 'khamkham3210@gmail.com', '2016-03-07 09:21:20', '2016-03-07 09:21:20', 1, '127810260944487', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5),
	(136, 2, '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 'huydv0109', 'huydv0109@gmail.com', '2016-03-08 03:53:45', '2016-03-08 03:53:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile/5534e268-64e8-4612-82a7-8653f7d5447a.jpg', NULL, 1, 97),
	(137, 2, '', '배태준', NULL, '2016-03-09 14:54:40', '2016-03-09 14:54:40', 1, '853167178145014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile/ab03bc5b-0dc2-49fb-b199-8b1d8217be49.jpg', NULL, 5, 97),
	(138, 2, '', 'Huy Đặng', NULL, '2016-03-09 07:29:03', '2016-03-09 07:29:03', 1, '1736900489876543', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 73),
	(139, 2, '', '혜진배', NULL, '2016-03-09 08:15:24', '2016-03-09 08:15:24', 1, NULL, 'gUOyEsdcAmdjAuyDJ277AX-gVFTZ-bQvGixwt6wQQjEAAAFTWnGvhQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4),
	(140, 2, '', 'Htest', NULL, '2016-03-09 09:06:17', '2016-03-09 09:06:17', 1, NULL, 'znmyURNWoyvRUwPepRloOuy_orcRouPNSPm_uawQTJgAAAFTWpqsrg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 27),
	(141, 2, '', 'Htest', NULL, '2016-03-09 09:22:15', '2016-03-09 09:22:15', 1, NULL, 'LQQgpEiW8N9VyUQ_qj9OfNc--o0h_s_anfF5y6wQQI4AAAFTWq7Teg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 27),
	(142, 2, '', 'Hoshi Takeshi', NULL, '2016-03-09 09:30:27', '2016-03-09 09:30:27', 1, NULL, 'Pxg_M5fbLvdA5Nj0qvg4qFlglx8qSPDt0JGmRawQQI4AAAFTWrZo2w', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 27),
	(143, 2, '8133715e93bfa739e926c2d6fe6edeaabe315caf', '김성애', 'tomato0422@hanmail.net', '2016-03-09 18:37:22', '2016-03-09 18:37:22', 1, NULL, NULL, NULL, '1982', '여', '취준생', '서울특별시', NULL, NULL, NULL, NULL, 'profile/120dab4e-bbe3-4c5e-b92c-998f6b868f4f.jpg', NULL, 5, 49),
	(144, 2, '356a192b7913b04c54574d18c28d46e6395428ab', 'Ptit.cn8.star@gmail.com', 'saovv', '2016-03-10 12:23:02', '2016-03-10 12:23:02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 27),
	(145, 2, '', 'Kenny Phong', NULL, '2016-03-14 13:56:22', '2016-03-14 13:56:22', 1, '739877492778691', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 73),
	(146, 2, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'sam', 'samsam123@gmail.com', '2016-03-21 13:16:26', '2016-03-21 13:16:26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
	(147, 2, '', 'Phong Thần', 'kennyphong1190@gmail.com', '2016-03-23 15:11:03', '2016-03-23 15:11:03', 1, '940082386111310', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 71),
	(148, 2, '', '채기정', NULL, '2016-03-24 00:02:38', '2016-03-24 00:02:38', 1, NULL, 'tB3pTKNqAu4B3rj9kFV46yGE66XomQGfJ9_HZqwQQjQAAAFTo_-YGw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 97),
	(149, 2, 'f62218766295c4ae8cac22d7f517607a230f4aed', '임세빈', 'sbim@micimpact.com', '2016-03-24 10:24:37', '2016-03-24 10:24:37', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile/688868ca-80b4-4d31-a7bd-6e3b985e8ab7.jpg', NULL, 8, 74),
	(150, 2, '', '김진우', NULL, '2016-03-25 11:01:27', '2016-03-25 11:01:27', 1, NULL, '2WyG5j2P-jTvckebnRlWljd0ZYQvqqmrMdeu0awQQjQAAAFTq38A7w', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile/833dda40-f295-44e4-b753-22d5c53cc202.jpg', NULL, 4, 73),
	(151, 2, '', 'Kim  Jinwoo', NULL, '2016-03-25 13:05:58', '2016-03-25 13:05:58', 1, '853233888136554', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 73),
	(152, 2, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', '', '2016-03-25 13:09:28', '2016-03-25 13:09:28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 73),
	(153, 2, '6d3236ec3c88039ca534b81acad564e847ecb062', 'ㄴ', 'df', '2016-03-25 13:16:01', '2016-03-25 13:16:01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 97),
	(154, 2, 'bed4eb698c6eeea7f1ddf5397d480d3f2c0fb938', 'ㅅㄴ', 'rcfctctc', '2016-03-25 13:37:35', '2016-03-25 13:37:35', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(155, 2, 'bed4eb698c6eeea7f1ddf5397d480d3f2c0fb938', '김김', 'dhdjdjdbssj@snsbs.com', '2016-03-25 13:38:23', '2016-03-25 13:38:23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 73),
	(156, 2, 'bed4eb698c6eeea7f1ddf5397d480d3f2c0fb938', 'ㅈㄴㄷㄴ', 'vghd', '2016-03-25 13:39:42', '2016-03-25 13:39:42', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 73),
	(157, 2, '4cf997735475afd79f8711e22efaa9d306294785', 'ㅡㅡ', 'vvb', '2016-03-25 13:41:47', '2016-03-25 13:41:47', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 73),
	(158, 2, '842ff16e64e4d52a1d1bda517a758b8425a09105', '김진우', 'helbreth@naver.com', '2016-03-25 13:47:09', '2016-03-25 13:47:09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 73),
	(159, 2, '', 'Hậu Trần', NULL, '2016-03-25 13:50:05', '2016-03-25 13:50:05', 1, '990476391045043', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 73),
	(160, 2, '', 'helb****', NULL, '2016-03-25 15:02:25', '2016-03-25 15:02:25', 1, NULL, NULL, 'abvlnCdnut2nD4is9WQx6isJzF46iiNXUlDJOB5YQiiIxSWrSstRsKoXUFRQgLbsF8Q0MZASzQJQmN43LCNywQiihgvFKrhN87ldipr3zaqYBisykisrb6E1hb1zBH2lK1dipmisDm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 97),
	(161, 2, 'a056c8d05ae9ac6ca180bc991b93b7ffe37563e0', 'qqq', 'qqq', '2016-03-25 15:08:33', '2016-03-25 15:08:33', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 97),
	(162, 2, '', '박재현', NULL, '2016-03-25 16:00:29', '2016-03-25 16:00:29', 1, '967963219986554', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 73),
	(163, 2, '', '임세빈', NULL, '2016-03-26 16:46:20', '2016-03-26 16:46:20', 1, NULL, 'oW9Hyaqaf2hY2FmVYlU3-S-l8U2Za4swqQxmL6wQQjQAAAFTseKosA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile/72d039eb-7d6a-418a-8e23-2a2950f26e90.jpg', NULL, 12, 73),
	(164, 2, '', '임세빈', NULL, '2016-03-28 10:09:19', '2016-03-28 10:09:19', 1, NULL, 'J0fp4RaB8vFXpqL5lMRT0AsayoPmgo0dyjpX3qwQQjQAAAFTusRqYA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 71),
	(165, 2, '', 'Hau Dau', 'tranhau10b6@gmail.com', '2016-03-28 15:50:31', '2016-03-28 15:50:31', 1, '217023421995762', NULL, NULL, '2015', '여', '직장인', '경기도', NULL, NULL, NULL, NULL, NULL, NULL, 2, 73),
	(166, 2, '', 'SUPER T', NULL, '2016-03-29 11:37:13', '2016-03-29 11:37:13', 1, NULL, 'UZTwWthmFFkkT1ma3keUmoEapqc5iiuaQPFFbawQTJgAAAFTwDmocQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 73);
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
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table micimpact.user_tags: ~533 rows (approximately)
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
	(492, 144, '카'),
	(493, 145, '김이나'),
	(494, 145, '백수'),
	(495, 145, '작사'),
	(496, 146, '교육'),
	(497, 146, '김이나'),
	(498, 146, '백수'),
	(499, 147, '교육'),
	(500, 147, '김이나'),
	(501, 147, '알랭드보통'),
	(502, 147, '작사'),
	(503, 147, '죽음'),
	(504, 148, '교육'),
	(505, 148, '아저씨'),
	(506, 148, '창작'),
	(507, 149, '교육'),
	(508, 149, '알랭드보통'),
	(509, 149, '창작'),
	(510, 150, '교육'),
	(511, 150, '철학'),
	(512, 150, '체형'),
	(513, 151, '불안'),
	(514, 151, '작사'),
	(515, 151, '창작'),
	(516, 152, '김이나'),
	(517, 152, '아저씨'),
	(518, 152, '정치'),
	(519, 153, '아저씨'),
	(520, 153, '정치'),
	(521, 153, '철학'),
	(522, 154, '김이나'),
	(523, 154, '아저씨'),
	(524, 154, '알랭드보통'),
	(526, 155, '작사'),
	(527, 155, '창작'),
	(528, 155, '패션'),
	(529, 156, '죽음'),
	(530, 156, '카'),
	(531, 156, '패션'),
	(532, 157, '교육'),
	(533, 157, '김이나'),
	(534, 157, '백수'),
	(535, 158, '작사'),
	(536, 158, '창작'),
	(537, 158, '패션'),
	(538, 159, '교육'),
	(539, 159, '김이나'),
	(540, 159, '죽음'),
	(541, 160, '불안'),
	(542, 160, '작사'),
	(543, 160, '창작'),
	(544, 161, '교육'),
	(545, 161, '불안'),
	(546, 161, '작사'),
	(547, 162, '교육'),
	(548, 162, '체형'),
	(549, 162, '패션'),
	(550, 163, '교육'),
	(551, 163, '백수'),
	(552, 163, '창작'),
	(553, 164, '교육'),
	(554, 164, '아저씨'),
	(555, 164, '죽음'),
	(556, 164, '체형'),
	(557, 165, '김이나'),
	(558, 165, '알랭드보통'),
	(559, 165, '작사'),
	(563, 165, '죽음'),
	(560, 165, '창작'),
	(562, 165, '철학'),
	(564, 165, '카'),
	(561, 165, '패션'),
	(565, 166, '불안'),
	(566, 166, '아저씨'),
	(567, 166, '알랭드보통'),
	(568, 166, '작사');
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
