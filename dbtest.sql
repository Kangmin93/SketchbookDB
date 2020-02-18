-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.11-MariaDB-1:10.4.11+maria~bionic - mariadb.org binary distribution
-- 서버 OS:                        debian-linux-gnu
-- HeidiSQL 버전:                  10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- sketchbook 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `sketchbook`;
CREATE DATABASE IF NOT EXISTS `sketchbook` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `sketchbook`;

-- 테이블 sketchbook.book 구조 내보내기
DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `book_isbn` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'book_isbn',
  `book_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'book_name',
  `publisher` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'publisher',
  `writer` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'writer',
  `genre` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'genre',
  `rating` double DEFAULT NULL COMMENT 'rating',
  `img` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT 'img',
  PRIMARY KEY (`book_isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='book';

-- 테이블 데이터 sketchbook.book:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`book_isbn`, `book_name`, `publisher`, `writer`, `genre`, `rating`, `img`) VALUES
	('', '', '', '', NULL, 0, ''),
	('1134818106 9791134818104', '모모 환생 전기 18', '학산문화사', 'ERI SAKONDO', NULL, 0, 'https://bookthumb-phinf.pstatic.net/cover/152/580/15258097.jpg?type=m1&udate=20190729'),
	('1185455175 9791185455174', '네이버쇼핑 스마트스토어로 상위노출 하라 (무조건 1페이지에 올려라, 그래야 산다!)', '휴먼하우스', '김도균', NULL, 0, 'https://bookthumb-phinf.pstatic.net/cover/157/687/15768781.jpg?type=m1&udate=20191219'),
	('8931021054 9788931021059', '히틀러의 음식을 먹는 여자들', '문예출판사', '로셀라 포스토리노', NULL, 0, 'https://bookthumb-phinf.pstatic.net/cover/158/147/15814767.jpg?type=m1&udate=20200107'),
	('8935212865 9788935212866', '한 장으로 끝내는 비즈니스 모델 100 (끌리는 사업, 남다른 혁신, 지속 가능한 수익을 위한 모든 것)', '청림출판', '곤도 데쓰로', NULL, 0, 'https://bookthumb-phinf.pstatic.net/cover/151/335/15133563.jpg?type=m1&udate=20191113'),
	('8943306091 9788943306090', '사과가 쿵! (세계 걸작 그림책 지크)', '보림', '다다 히로시', NULL, 0, 'https://bookthumb-phinf.pstatic.net/cover/025/002/02500218.jpg?type=m1&udate=20150827'),
	('8954651828 9788954651820', '내게 무해한 사람 (최은영 소설)', '문학동네', '최은영', NULL, 0, 'https://bookthumb-phinf.pstatic.net/cover/137/333/13733364.jpg?type=m1&udate=20200123'),
	('8956747830 9788956747835', '스콧 켈비의 플래시 사진 촬영 비법 (플래시 사용법을 익히고 최대로 활용하여 촬영하는 방법)', '정보문화사', '스콧 켈비', NULL, 0, 'https://bookthumb-phinf.pstatic.net/cover/135/085/13508551.jpg?type=m1&udate=20180619'),
	('8980714548 9788980714544', '입이 큰 개구리', '미세기', '키스 포크너', NULL, 0, 'https://bookthumb-phinf.pstatic.net/cover/148/682/14868293.jpg?type=m1&udate=20190815');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;

-- 테이블 sketchbook.bookmark 구조 내보내기
DROP TABLE IF EXISTS `bookmark`;
CREATE TABLE IF NOT EXISTS `bookmark` (
  `review_id` int(11) NOT NULL COMMENT 'review_id',
  `user_id` int(11) NOT NULL COMMENT 'user_id',
  PRIMARY KEY (`review_id`,`user_id`),
  KEY `FK_bookmark_user_id_user_user_id` (`user_id`),
  CONSTRAINT `FK_bookmark_review_id_review_review_id` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`),
  CONSTRAINT `FK_bookmark_user_id_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='bookmark';

-- 테이블 데이터 sketchbook.bookmark:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmark` ENABLE KEYS */;

-- 테이블 sketchbook.conversation 구조 내보내기
DROP TABLE IF EXISTS `conversation`;
CREATE TABLE IF NOT EXISTS `conversation` (
  `cv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'cv_id',
  `user_one` int(11) NOT NULL COMMENT 'user_one',
  `user_two` int(11) NOT NULL COMMENT 'user_two',
  `ip` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'ip',
  `conversation_time` datetime DEFAULT NULL COMMENT 'conversation_time',
  `status` int(11) DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`cv_id`),
  KEY `FK_conversation_user_one_user_user_id` (`user_one`),
  KEY `FK_conversation_user_two_user_user_id` (`user_two`),
  CONSTRAINT `FK_conversation_user_one_user_user_id` FOREIGN KEY (`user_one`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_conversation_user_two_user_user_id` FOREIGN KEY (`user_two`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='conversation';

-- 테이블 데이터 sketchbook.conversation:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `conversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation` ENABLE KEYS */;

-- 테이블 sketchbook.conversation_reply 구조 내보내기
DROP TABLE IF EXISTS `conversation_reply`;
CREATE TABLE IF NOT EXISTS `conversation_reply` (
  `cv_reply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'cv_reply_id',
  `user_id_fk` int(11) NOT NULL COMMENT 'user_id_fk',
  `cv_id_fk` int(11) NOT NULL COMMENT 'cv_id_fk',
  `ip` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'ip',
  `send_time` datetime DEFAULT NULL COMMENT 'send_time',
  `status` int(11) DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`cv_reply_id`),
  KEY `FK_conversation_reply_user_id_fk_user_user_id` (`user_id_fk`),
  KEY `FK_conversation_reply_cv_id_fk_conversation_cv_id` (`cv_id_fk`),
  CONSTRAINT `FK_conversation_reply_cv_id_fk_conversation_cv_id` FOREIGN KEY (`cv_id_fk`) REFERENCES `conversation` (`cv_id`),
  CONSTRAINT `FK_conversation_reply_user_id_fk_user_user_id` FOREIGN KEY (`user_id_fk`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cconversation_reply';

-- 테이블 데이터 sketchbook.conversation_reply:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `conversation_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_reply` ENABLE KEYS */;

-- 테이블 sketchbook.follow 구조 내보내기
DROP TABLE IF EXISTS `follow`;
CREATE TABLE IF NOT EXISTS `follow` (
  `user_one` int(11) NOT NULL COMMENT 'user_one',
  `user_two` int(11) NOT NULL COMMENT 'user_two',
  `date` datetime NOT NULL COMMENT 'date',
  PRIMARY KEY (`user_one`,`user_two`),
  KEY `FK_follow_user_two_user_user_id` (`user_two`),
  CONSTRAINT `FK_follow_user_one_user_user_id` FOREIGN KEY (`user_one`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_follow_user_two_user_user_id` FOREIGN KEY (`user_two`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='follow';

-- 테이블 데이터 sketchbook.follow:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` (`user_one`, `user_two`, `date`) VALUES
	(1, 2, '2020-02-16 10:24:16');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;

-- 테이블 sketchbook.heart 구조 내보내기
DROP TABLE IF EXISTS `heart`;
CREATE TABLE IF NOT EXISTS `heart` (
  `user_id` int(11) NOT NULL COMMENT 'user_id',
  `review_id` int(11) NOT NULL COMMENT 'review_id',
  PRIMARY KEY (`user_id`,`review_id`),
  KEY `FK_heart_review_id_review_review_id` (`review_id`),
  CONSTRAINT `FK_heart_review_id_review_review_id` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`),
  CONSTRAINT `FK_heart_user_id_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='heart';

-- 테이블 데이터 sketchbook.heart:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `heart` DISABLE KEYS */;
INSERT INTO `heart` (`user_id`, `review_id`) VALUES
	(1, 8),
	(2, 3),
	(2, 5);
/*!40000 ALTER TABLE `heart` ENABLE KEYS */;

-- 테이블 sketchbook.invitation 구조 내보내기
DROP TABLE IF EXISTS `invitation`;
CREATE TABLE IF NOT EXISTS `invitation` (
  `inviterelay_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'inviterelay_id',
  `relaynovel_id` int(11) NOT NULL COMMENT 'relaynovel_id',
  `user_id` int(11) NOT NULL COMMENT 'user_id',
  PRIMARY KEY (`inviterelay_id`),
  KEY `FK_invitation_relaynovel_id_relaynovel_relaynovel_id` (`relaynovel_id`),
  KEY `FK_invitation_user_id_user_user_id` (`user_id`),
  CONSTRAINT `FK_invitation_relaynovel_id_relaynovel_relaynovel_id` FOREIGN KEY (`relaynovel_id`) REFERENCES `relaynovel` (`relaynovel_id`),
  CONSTRAINT `FK_invitation_user_id_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 sketchbook.invitation:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;

-- 테이블 sketchbook.notification 구조 내보내기
DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `not_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'not_id',
  `send_user_id` int(11) NOT NULL COMMENT 'send_user_id',
  `receive_user_id` int(11) NOT NULL COMMENT 'receive_user_id',
  `not_type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'not_type',
  `not_content_id` int(11) DEFAULT NULL COMMENT 'not_content_id',
  `not_message` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT 'not_message',
  `not_url` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT 'not_url',
  `not_datetime` datetime DEFAULT NULL COMMENT 'not_datetime',
  `not_read_datetime` datetime DEFAULT NULL COMMENT 'not_read_datetime',
  PRIMARY KEY (`not_id`),
  KEY `FK_notification_send_user_id_user_user_id` (`send_user_id`),
  KEY `FK_notification_receive_user_id_user_user_id` (`receive_user_id`),
  CONSTRAINT `FK_notification_receive_user_id_user_user_id` FOREIGN KEY (`receive_user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_notification_send_user_id_user_user_id` FOREIGN KEY (`send_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 sketchbook.notification:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;

-- 테이블 sketchbook.relayheart 구조 내보내기
DROP TABLE IF EXISTS `relayheart`;
CREATE TABLE IF NOT EXISTS `relayheart` (
  `relaynovel_id` int(11) NOT NULL COMMENT 'relaynovel_id',
  `user_id` int(11) NOT NULL COMMENT 'user_id',
  PRIMARY KEY (`relaynovel_id`,`user_id`),
  KEY `FK_relayheart_user_id_user_user_id` (`user_id`),
  CONSTRAINT `FK_relayheart_relaynovel_id_relaynovel_relaynovel_id` FOREIGN KEY (`relaynovel_id`) REFERENCES `relaynovel` (`relaynovel_id`),
  CONSTRAINT `FK_relayheart_user_id_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 sketchbook.relayheart:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `relayheart` DISABLE KEYS */;
/*!40000 ALTER TABLE `relayheart` ENABLE KEYS */;

-- 테이블 sketchbook.relaynovel 구조 내보내기
DROP TABLE IF EXISTS `relaynovel`;
CREATE TABLE IF NOT EXISTS `relaynovel` (
  `relaynovel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'relaynovel_id',
  `title` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT 'title',
  `create_date` date DEFAULT NULL COMMENT 'create_date',
  `update_date` date DEFAULT NULL COMMENT 'update_date',
  `remain_turn` int(11) DEFAULT NULL COMMENT 'remain_turn',
  `description` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT 'description',
  `starter` int(11) NOT NULL COMMENT 'starter',
  `is_public` int(1) DEFAULT NULL COMMENT 'is_public',
  `writer_public` int(1) DEFAULT NULL COMMENT 'writer_public',
  `lock` int(1) DEFAULT NULL COMMENT 'lock',
  PRIMARY KEY (`relaynovel_id`),
  KEY `FK_relaynovel_starter_user_user_id` (`starter`),
  CONSTRAINT `FK_relaynovel_starter_user_user_id` FOREIGN KEY (`starter`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 sketchbook.relaynovel:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `relaynovel` DISABLE KEYS */;
INSERT INTO `relaynovel` (`relaynovel_id`, `title`, `create_date`, `update_date`, `remain_turn`, `description`, `starter`, `is_public`, `writer_public`, `lock`) VALUES
	(1, 'test1', '2020-02-16', '2020-02-16', 5, 'anything', 1, 1, 1, NULL),
	(2, 'test2', '2020-02-16', '2020-02-16', 3, 'anything', 2, 0, 1, NULL),
	(3, 'test3', '2020-02-16', '2020-02-16', 5, 'anything', 1, 0, 1, NULL),
	(4, 'test4', '2020-02-16', '2020-02-16', 5, 'anything', 2, 1, 1, NULL);
/*!40000 ALTER TABLE `relaynovel` ENABLE KEYS */;

-- 테이블 sketchbook.relayreply 구조 내보내기
DROP TABLE IF EXISTS `relayreply`;
CREATE TABLE IF NOT EXISTS `relayreply` (
  `user_id` int(11) NOT NULL COMMENT 'user_id',
  `relaynovel_id` int(11) NOT NULL COMMENT 'relaynovel_id',
  `create_time` date DEFAULT NULL COMMENT 'create_time',
  `comment` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT 'comment',
  PRIMARY KEY (`user_id`,`relaynovel_id`),
  KEY `FK_relayreply_relaynovel_id_relaynovel_relaynovel_id` (`relaynovel_id`),
  CONSTRAINT `FK_relayreply_relaynovel_id_relaynovel_relaynovel_id` FOREIGN KEY (`relaynovel_id`) REFERENCES `relaynovel` (`relaynovel_id`),
  CONSTRAINT `FK_relayreply_user_id_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 sketchbook.relayreply:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `relayreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `relayreply` ENABLE KEYS */;

-- 테이블 sketchbook.relaywriter 구조 내보내기
DROP TABLE IF EXISTS `relaywriter`;
CREATE TABLE IF NOT EXISTS `relaywriter` (
  `relaywriter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'relaywriter_id',
  `relaynovel_id` int(11) NOT NULL COMMENT 'relaynovel_id',
  `user_id` int(11) NOT NULL COMMENT 'user_id',
  `turn` int(11) DEFAULT NULL COMMENT 'turn',
  `content` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT 'content',
  `profile_img` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT 'profile_img',
  `nickname` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'nickname',
  PRIMARY KEY (`relaywriter_id`),
  KEY `FK_relaywriter_user_id_user_user_id` (`user_id`),
  KEY `FK_relaywriter_relaynovel_id_relaynovel_relaynovel_id` (`relaynovel_id`),
  CONSTRAINT `FK_relaywriter_relaynovel_id_relaynovel_relaynovel_id` FOREIGN KEY (`relaynovel_id`) REFERENCES `relaynovel` (`relaynovel_id`),
  CONSTRAINT `FK_relaywriter_user_id_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 sketchbook.relaywriter:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `relaywriter` DISABLE KEYS */;
INSERT INTO `relaywriter` (`relaywriter_id`, `relaynovel_id`, `user_id`, `turn`, `content`, `profile_img`, `nickname`) VALUES
	(1, 1, 1, 5, 'test', 'http://localhost:8080/static/learning.png', '채으니'),
	(2, 3, 1, 4, 'test1', NULL, NULL),
	(3, 2, 2, 3, 'test2', NULL, NULL),
	(4, 4, 2, 5, 'test3', NULL, NULL),
	(5, 1, 1, 4, 'test4', 'http://localhost:8080/static/learning.png', '채으니'),
	(6, 1, 2, 3, '알ㄴ얼ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ이채채채채채채채채채<br/>줄바꿈대대대대대대대대', 'http://localhost:8080/static/RsR2TqoA0qT8DVO76cs4.jpg', '채은');
/*!40000 ALTER TABLE `relaywriter` ENABLE KEYS */;

-- 테이블 sketchbook.reply 구조 내보내기
DROP TABLE IF EXISTS `reply`;
CREATE TABLE IF NOT EXISTS `reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'reply_id',
  `review_id` int(11) NOT NULL COMMENT 'review_id',
  `user_id` int(11) NOT NULL COMMENT 'user_id',
  `profile_img` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT 'profile_img',
  `nickname` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'nickname',
  `comment` varchar(500) COLLATE utf8_bin NOT NULL COMMENT 'comment',
  PRIMARY KEY (`reply_id`),
  KEY `FK_reply_review_id_review_review_id` (`review_id`),
  KEY `FK_reply_user_id_user_user_id` (`user_id`),
  CONSTRAINT `FK_reply_review_id_review_review_id` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`),
  CONSTRAINT `FK_reply_user_id_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='reply';

-- 테이블 데이터 sketchbook.reply:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` (`reply_id`, `review_id`, `user_id`, `profile_img`, `nickname`, `comment`) VALUES
	(2, 3, 2, NULL, '채은', '쌉가능');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;

-- 테이블 sketchbook.review 구조 내보내기
DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'review_id',
  `book_isbn_fk` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'book_isbn_fk',
  `user_id_fk` int(11) NOT NULL COMMENT 'user_id_fk',
  `title` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT 'title',
  `content` varchar(10000) COLLATE utf8_bin DEFAULT NULL COMMENT 'content',
  `date` datetime DEFAULT NULL COMMENT 'date',
  `rating` double DEFAULT NULL COMMENT 'rating',
  `isreply` int(11) DEFAULT NULL COMMENT 'isreply',
  `background_img` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT 'background_img',
  `font` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'font',
  `font_size` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'font_size',
  `font_color` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'font_color',
  `title_text` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `main_img` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT 'main_img',
  PRIMARY KEY (`review_id`),
  KEY `FK_review_book_isbn_fk_book_book_isbn` (`book_isbn_fk`),
  KEY `FK_review_user_id_fk_user_user_id` (`user_id_fk`),
  CONSTRAINT `FK_review_book_isbn_fk_book_book_isbn` FOREIGN KEY (`book_isbn_fk`) REFERENCES `book` (`book_isbn`),
  CONSTRAINT `FK_review_user_id_fk_user_user_id` FOREIGN KEY (`user_id_fk`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='review';

-- 테이블 데이터 sketchbook.review:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` (`review_id`, `book_isbn_fk`, `user_id_fk`, `title`, `content`, `date`, `rating`, `isreply`, `background_img`, `font`, `font_size`, `font_color`, `title_text`, `main_img`) VALUES
	(3, '1134818106 9791134818104', 2, '<div class="preview-area-wrapper" style="width: 100%; height: 300px; background-size: contain; background-position: center center; margin: auto; background-image: url(&quot;http://localhost:8080/static/img_pinkwoodtexture.jpg&quot;);"><div class="preview-area" style="width: 100%; height: 300px; display: table; table-layout: fixed; text-overflow: ellipsis; overflow: hidden;"><p contenteditable="false" style="text-align: center; height: 300px; text-overflow: ellipsis; display: table-cell; vertical-align: middle; font-family: MapoGoldenPier; font-size: 38px; font-weight: 400;">우리모모 환생전기는 휘향찬란하다</p></div></div>', '<h2>책쟁이의 책리뷰!</h2><p><strong>왜 이 책을 보았는가?</strong></p><p>직장인분들이라면 공감할 소재도 많은 듯 하다.20대분들이 보셔도 무난하다.<br>시간을 스스로 만들지 못해서 안 읽는다는 것이 더욱 맞을 수도 있지 않을까?<br>새벽에 가볍게 책을 보고자 이 책을 손에 <s>쥐었다.</s></p><p><code>더 높이 날 수 있지않을까..?</code></p><ul><li><p>독서 포인트!</p></li><li><p>하루는 작지만 일년이 지나면 커지고 한 해가 거듭될수록 거대해진다</p></li></ul><blockquote><p>"행동의 씨앗을 뿌리면 습관의 열매가 맺히고,<br>습관의 씨앗을 뿌리면 성격의 열매가 맺히고,<br>성격의 씨앗을 뿌리면 운명의 열매가 맺힌다."<br>- 나폴레옹 -</p></blockquote><p><img src="http://localhost:8080/static/1bIRsPhwRGSVwGylOo3Q.jpg" contenteditable="false" draggable="true"><br></p><p>그리다 스케치북</p>', '2020-02-15 00:00:00', 5, 0, 'img_pinkwoodtexture.jpg', 'MapoGoldenPier', '38', '400', '말말', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR1i5jc-k4ivPVcaLftfcg8BsjXF-K3kkQUeP0ml5_z0iRv2eBt'),
	(5, '8943306091 9788943306090', 2, '<div class="preview-area-wrapper" style="width: 100%; height: 500px; background-size: contain; background-position: center center; margin: auto; background-image: url(&quot;http://localhost:8080/static/img_sketchbook_wide.jpg&quot;);"><div class="preview-area" style="width: 100%; height: 100%; display: table; table-layout: fixed; text-overflow: ellipsis; overflow: hidden;"><p contenteditable="false" style="text-align: center; height: 100%; text-overflow: ellipsis; display: table-cell; vertical-align: middle; font-family: MapoGoldenPier; font-size: 40px; font-weight: 400;">사과가 쿵!하고 떨어지니 땅이 흔들리고 파도가 넘처 흐르니니니니라...</p></div></div>', '<h2>책쟁이의 책리뷰!</h2><p><strong>왜 이 책을 보았는가?</strong></p><p>직장인분들이라면 공감할 소재도 많은 듯 하다.20대분들이 보셔도 무난하다.<br>시간을 스스로 만들지 못해서 안 읽는다는 것이 더욱 맞을 수도 있지 않을까?<br>새벽에 가볍게 책을 보고자 이 책을 손에 <s>쥐었다.</s></p><p><code>더 높이 날 수 있지않을까..?</code></p><ul><li><p>독서 포인트!</p></li><li><p>하루는 작지만 일년이 지나면 커지고 한 해가 거듭될수록 거대해진다</p></li></ul><blockquote><p>"행동의 씨앗을 뿌리면 습관의 열매가 맺히고,<br>습관의 씨앗을 뿌리면 성격의 열매가 맺히고,<br>성격의 씨앗을 뿌리면 운명의 열매가 맺힌다."<br>- 나폴레옹 -</p></blockquote><p><img src="http://localhost:8080/static/pYXDgAy7GRkOhXDEskY3.jpg" contenteditable="false" draggable="true"><br></p><p>제 사진입니다 건들지 마시죠</p>', '2020-02-15 00:00:00', 4, 0, 'img_sketchbook_wide.jpg', 'MapoGoldenPier', '40', '400', '정말', NULL),
	(7, '8931021054 9788931021059', 1, '<div class="preview-area-wrapper" style="width: 100%; height: 450px; background-size: contain; background-position: center center; margin: auto; background-image: url(&quot;http://localhost:8080/static/img_pinkwoodtexture.jpg&quot;);"><div class="preview-area" style="width: 100%; height: 100%; display: table; table-layout: fixed; text-overflow: ellipsis; overflow: hidden;"><p contenteditable="false" style="text-align: center; height: 100%; text-overflow: ellipsis; display: table-cell; vertical-align: middle; font-family: RIDIBatang; font-size: 40px; font-weight: 800; color: white;">이 배경에는 흰색이<br>더 잘어울릴 것 같습니다</p></div></div>', '<h2>Simple is the best...</h2><p><strong>왜 이 책을 보았는가?</strong></p><p>직장인분들이라면 공감할 소재도 많은 듯 하다.20대분들이 보셔도 무난하다.<br>시간을 스스로 만들지 못해서 안 읽는다는 것이 더욱 맞을 수도 있지 않을까?<br>새벽에 가볍게 책을 보고자 이 책을 손에 <s>쥐었다.</s></p>', '2020-02-15 09:07:44', 5, 0, 'img_pinkwoodtexture.jpg', 'RIDIBatang', '40', '800', '말종', NULL),
	(8, '8956747830 9788956747835', 1, '<div class="preview-area-wrapper" style="width: 100%; height: 450px; background-size: contain; background-position: center center; margin: auto; background-image: url(&quot;http://localhost:8080/static/img_snow_wide.jpg&quot;);"><div class="preview-area" style="width: 100%; height: 100%; display: table; table-layout: fixed; text-overflow: ellipsis; overflow: hidden;"><p contenteditable="false" style="text-align: center; height: 100%; text-overflow: ellipsis; display: table-cell; vertical-align: middle; font-family: MapoGoldenPier; font-size: 40px; font-weight: 400; color: white;">별점 주세뵤</p></div></div>', '<h2>책쟁이의 책리뷰!</h2><p><strong>왜 이 책을 보았는가?</strong></p><p>직장인분들이라면 공감할 소재도 많은 듯 하다.20대분들이 보셔도 무난하다.<br>시간을 스스로 만들지 못해서 안 읽는다는 것이 더욱 맞을 수도 있지 않을까?<br>새벽에 가볍게 책을 보고자 이 책을 손에 <s>쥐었다.</s></p><p><code>더 높이 날 수 있지않을까..?</code></p><ul><li><p>독서 포인트!</p></li><li><p>하루는 작지만 일년이 지나면 커지고 한 해가 거듭될수록 거대해진다</p></li></ul><blockquote><p>"행동의 씨앗을 뿌리면 습관의 열매가 맺히고,<br>습관의 씨앗을 뿌리면 성격의 열매가 맺히고,<br>성격의 씨앗을 뿌리면 운명의 열매가 맺힌다."<br>- 나폴레옹 -</p></blockquote><p><img src="http://localhost:8080/static/RsR2TqoA0qT8DVO76cs4.jpg" contenteditable="false" draggable="true"><br></p>', '2020-02-16 05:41:47', 5, 0, 'img_snow_wide.jpg', 'MapoGoldenPier', '40', '400', '증말', NULL);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

-- 테이블 sketchbook.user 구조 내보내기
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'user_id',
  `email` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'email',
  `password` varchar(45) COLLATE utf8_bin NOT NULL COMMENT 'password',
  `nickname` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'nickname',
  `status` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'status',
  `google` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'google_email',
  `kakao` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'kakao_email',
  `naver` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'naver_email',
  `address` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'address',
  `profile_img` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT 'profile_img',
  `email_key` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT 'email_key',
  `is_confirm` int(11) DEFAULT NULL COMMENT 'is_confirm',
  `not_token` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'not_token',
  PRIMARY KEY (`user_id`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='user';

-- 테이블 데이터 sketchbook.user:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `email`, `password`, `nickname`, `status`, `google`, `kakao`, `naver`, `address`, `profile_img`, `email_key`, `is_confirm`, `not_token`) VALUES
	(1, 'dlcodms123@gmail.com', 'asdf1234', '채으니', NULL, NULL, NULL, NULL, NULL, 'https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2017%2F07%2Ftime-15-influential-video-game-characters-0.jpg?q=75&w=800&cbr=1&fit=max', 'u0AtY5741ciT9Giavob89ozwHm1IdqzIogF83Nz1KAH1eYNxcd', 1, NULL),
	(2, 'dlcodms123@naver.com', 'cd_TLVWPIme9yrd', '채은', NULL, NULL, 'dlcodms123@naver.com', NULL, NULL, 'http:localhost:8080/static/learning.png', NULL, 1, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;