-- Generation time: Sun, 09 Yul 2023 18:06:47 +0000
-- Host: mysql.hostinger.ro
-- DB name: u57945697_23
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `apps`;
CREATE TABLE `apps` (
                        `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                        `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
                        `is_free` enum('free','paid') COLLATE utf8_unicode_ci DEFAULT NULL,
                        `admin_user_id` bigint(20) unsigned NOT NULL,
                        UNIQUE KEY `id` (`id`),
                        KEY `apps_name_idx` (`name`),
                        KEY `admin_user_id` (`admin_user_id`),
                        CONSTRAINT `apps_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `apps` VALUES ('1','numquam','free','1'),
                          ('2','beatae','free','2'),
                          ('3','accusantium','paid','3'),
                          ('4','est','free','4'),
                          ('5','ad','free','5'),
                          ('6','vel','paid','6'),
                          ('7','aliquam','paid','7'),
                          ('8','sit','free','8'),
                          ('9','velit','paid','9'),
                          ('10','vel','paid','10'),
                        

DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities` (
                               `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                               `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
                               `admin_user_id` bigint(20) unsigned NOT NULL,
                               UNIQUE KEY `id` (`id`),
                               KEY `communities_name_idx` (`name`),
                               KEY `admin_user_id` (`admin_user_id`),
                               CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `communities` VALUES ('1','consequuntur','1'),
                                 ('2','est','2'),
                                 ('3','consequatur','3'),
                                 ('4','ab','4'),
                                 ('5','neque','5'),
                                 ('6','et','6'),
                                 ('7','fugit','7'),
                                 ('8','sint','8'),
                                 ('9','neque','9'),
                                 ('10','est','10');


DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE `friend_requests` (
                                   `initiator_user_id` bigint(20) unsigned NOT NULL,
                                   `target_user_id` bigint(20) unsigned NOT NULL,
                                   `status` enum('requested','approved','unfriended','declined') COLLATE utf8_unicode_ci DEFAULT NULL,
                                   `requested_at` datetime DEFAULT current_timestamp(),
                                   `confirmed_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
                                   PRIMARY KEY (`initiator_user_id`,`target_user_id`),
                                   KEY `target_user_id` (`target_user_id`),
                                   CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
                                   CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `friend_requests` VALUES ('1','1','approved','2008-02-22 05:48:20','2009-01-29 22:09:47'),
                                     ('2','2','declined','1992-06-18 23:27:04','2007-01-19 23:45:25'),
                                     ('3','3','declined','1998-05-12 11:54:26','1992-08-08 00:49:11'),
                                     ('4','4','unfriended','1979-10-24 13:25:07','2009-02-24 19:09:34'),
                                     ('5','5','approved','1992-09-27 08:33:58','2011-02-10 02:16:27'),
                                     ('6','6','unfriended','1995-09-09 10:36:00','2003-05-16 02:16:24'),
                                     ('7','7','declined','1972-05-14 07:04:51','1980-10-30 14:45:36'),
                                     ('8','8','unfriended','1998-12-29 23:38:23','2014-02-03 03:27:54'),
                                     ('9','9','unfriended','1979-05-04 11:35:13','1971-04-16 09:17:34'),
                                     ('10','10','approved','1972-09-10 12:38:13','2009-10-21 01:58:34');


DROP TABLE IF EXISTS `goods_categories`;
CREATE TABLE `goods_categories` (
                                    `category_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                                    `category_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                                    `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                                    PRIMARY KEY (`category_id`),
                                    UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Таблица категорий товаров';

INSERT INTO `goods_categories` VALUES ('1','enim','1994-06-18 13:55:19'),
                                      ('2','fugiat','1990-01-29 12:30:57'),
                                      ('3','blanditiis','2016-12-09 15:31:48'),
                                      ('4','asperiores','1992-12-16 18:30:51'),
                                      ('5','animi','1989-07-31 08:19:08'),
                                      ('6','fuga','1996-09-02 09:13:57'),
                                      ('7','quasi','1982-03-21 20:18:54'),
                                      ('8','non','1994-01-16 12:50:31'),
                                      ('9','consectetur','2013-03-14 15:28:40'),
                                      ('10','itaque','2014-08-25 22:09:26');


DROP TABLE IF EXISTS `goods_description`;
CREATE TABLE `goods_description` (
                                     `goods_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                                     `goods_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                                     `goods_photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                                     `goods_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
                                     `goods_price` decimal(10,2) DEFAULT NULL,
                                     `goods_category` bigint(20) unsigned NOT NULL,
                                     `user_posted_id` bigint(20) unsigned NOT NULL,
                                     PRIMARY KEY (`goods_id`),
                                     KEY `goods_category_idx` (`goods_category`),
                                     KEY `user_posted_id` (`user_posted_id`),
                                     CONSTRAINT `fk_goods_category` FOREIGN KEY (`goods_category`) REFERENCES `goods_categories` (`category_id`),
                                     CONSTRAINT `goods_description_ibfk_1` FOREIGN KEY (`user_posted_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Таблица с описанием товара';



DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
                         `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                         `user_id` bigint(20) unsigned NOT NULL,
                         `media_id` bigint(20) unsigned NOT NULL,
                         `created_at` datetime DEFAULT current_timestamp(),
                         UNIQUE KEY `id` (`id`),
                         KEY `user_id` (`user_id`),
                         KEY `media_id` (`media_id`),
                         CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
                         CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `likes` VALUES ('1','1','1','2002-04-18 23:27:36'),
                           ('2','2','2','1991-12-25 05:06:33'),
                           ('3','3','3','1976-10-27 14:04:21'),
                           ('4','4','4','1987-05-22 03:17:25'),
                           ('5','5','5','2003-12-09 20:58:08'),
                           ('6','6','6','2018-01-22 19:17:16'),
                           ('7','7','7','1976-08-04 02:50:14'),
                           ('8','8','8','1988-02-20 19:05:28'),
                           ('9','9','9','1977-03-07 04:44:35'),
                           ('10','10','10','1998-08-28 22:36:19');


DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
                         `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                         `media_type_id` bigint(20) unsigned NOT NULL,
                         `user_id` bigint(20) unsigned NOT NULL,
                         `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
                         `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                         `size` int(11) DEFAULT NULL,
                         `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
                         `created_at` datetime DEFAULT current_timestamp(),
                         `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
                         UNIQUE KEY `id` (`id`),
                         KEY `user_id` (`user_id`),
                         KEY `media_type_id` (`media_type_id`),
                         CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
                         CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media` VALUES ('1','1','1','Omnis sint et et itaque. Veniam quis unde sint velit omnis impedit. Unde ad officiis eum debitis et. Eum occaecati debitis ut iste ea assumenda repellat. Suscipit non blanditiis saepe maiores.','illum','329360939',NULL,'1983-02-05 14:55:45','2004-09-10 19:01:59'),
                           ('2','2','2','Ea quia harum ab nesciunt qui. Nobis nihil rerum iure voluptates magni autem. Et omnis fugiat ut iste tempore. Error ipsum ducimus quam quidem.','tenetur','83',NULL,'1984-09-03 08:55:22','1995-06-24 16:50:53'),
                           ('3','3','3','Magnam aut ut quae ea tempore rerum nesciunt. Suscipit ut quia optio aut. Consequatur quaerat molestiae at suscipit temporibus tempore assumenda in. Temporibus voluptatem cumque ut odio et et.','perspiciatis','0',NULL,'2016-10-02 11:03:18','2012-12-29 05:33:43'),
                           ('4','4','4','Dolor ipsam minus omnis fuga magni sint. Tempore aspernatur neque tempore nobis qui est. Itaque consequatur voluptatem et accusantium dignissimos tenetur sit. Quibusdam cum culpa expedita neque.','veniam','8765',NULL,'2006-05-18 20:15:43','2004-07-12 18:28:01'),
                           ('5','1','5','Repellendus totam voluptates est eos beatae. Exercitationem praesentium dolorum est dolorem sit. Nihil omnis dolor sed natus beatae aut.','est','18855377',NULL,'2010-12-15 18:02:26','2014-01-20 19:37:38'),
                           ('6','2','6','Natus sint placeat odio ducimus quod. Velit sit rem ad eligendi dolorem odio laboriosam. Quisquam maiores doloribus aspernatur excepturi quaerat. Ut autem dolor odit quod eligendi et.','autem','8393591',NULL,'2012-11-29 05:38:56','1982-12-24 16:26:34'),
                           ('7','3','7','Corrupti maiores est eligendi quo. Et quisquam nulla quia qui. Quia labore facilis quos aliquid.','consequuntur','665563963',NULL,'1989-05-17 23:34:20','2015-07-02 20:35:59'),
                           ('8','4','8','Sunt dolores autem praesentium ut aliquam voluptatibus. Soluta consequatur sunt saepe reprehenderit. Quaerat cum tempore sapiente aut perferendis. Ipsum tempore consequatur quis est excepturi.','ut','596795',NULL,'1976-02-06 22:29:51','1987-04-11 23:34:49'),
                           ('9','1','9','Eum non in sed et. Reprehenderit ea ab sequi voluptates consequuntur. Alias quidem ipsa temporibus doloremque repudiandae quo. Veritatis quia sint vel aperiam voluptas magni. Voluptatem dolor debitis aut dolorem.','voluptas','684376',NULL,'2015-10-05 18:14:56','2012-12-06 23:27:31'),
                           ('10','2','10','Dolorem omnis minima et laborum explicabo aut harum. Et molestiae ea rem aut. Aperiam consequuntur quam fugiat quasi distinctio. Non commodi adipisci reprehenderit et exercitationem.','voluptatibus','923333',NULL,'1980-09-29 11:02:47','2017-11-25 14:07:47');


DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types` (
                               `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                               `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                               `created_at` datetime DEFAULT current_timestamp(),
                               `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
                               UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media_types` VALUES ('1','sint','2011-08-10 01:09:17','1973-08-15 00:55:47'),
                                 ('2','illum','2019-02-03 01:10:01','2015-07-02 02:00:28'),
                                 ('3','ratione','1989-09-01 04:03:45','1995-06-08 22:43:28'),
                                 ('4','numquam','1989-12-03 01:48:58','1993-02-15 00:24:59');


DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
                            `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                            `from_user_id` bigint(20) unsigned NOT NULL,
                            `to_user_id` bigint(20) unsigned NOT NULL,
                            `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
                            `created_at` datetime DEFAULT current_timestamp(),
                            UNIQUE KEY `id` (`id`),
                            KEY `from_user_id` (`from_user_id`),
                            KEY `to_user_id` (`to_user_id`),
                            CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
                            CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `messages` VALUES ('1','1','1','Impedit totam pariatur beatae quos magni ducimus repellendus sunt. Quidem qui nam optio repudiandae omnis. Modi explicabo illum dolores voluptate. Aut accusamus molestias ea quia praesentium pariatur rem. Atque vero provident corrupti dolores fugiat quos.','1987-06-21 12:07:54'),
                              ('2','2','2','Voluptatibus dignissimos iusto ut excepturi quibusdam libero inventore. Iusto dolore et nisi dicta nam qui. Voluptas facere in eaque.','2010-08-10 17:12:05'),
                              ('3','3','3','Libero expedita beatae maiores consequuntur. Quia fugit non sit distinctio ullam placeat. Eum voluptatem nobis nisi commodi. Qui nihil odio ipsa necessitatibus consequuntur ea.','1976-10-20 07:02:39'),
                              ('4','4','4','Libero architecto distinctio quibusdam occaecati et modi. Similique cumque eveniet sunt fuga. Eos sed consequuntur est sit sit aut qui. Aut sunt laborum qui pariatur similique. Incidunt voluptatem rem et voluptas sapiente voluptas sit.','1983-01-13 07:01:44'),
                              ('5','5','5','Quos tempore quia suscipit occaecati. Doloremque deleniti perspiciatis ipsam voluptatum officia odio debitis laborum. Fuga voluptatem qui soluta exercitationem. Voluptates id quasi ut.','2000-06-18 19:33:37'),
                              ('6','6','6','Culpa totam vel temporibus officiis non sapiente. Excepturi qui illo qui alias consequatur accusamus. Modi dolores et hic quia ipsam quaerat. Voluptate explicabo ut et minus doloremque.','1978-02-18 22:34:39'),
                              ('7','7','7','Error velit nostrum laborum suscipit. A odio ratione tempora tenetur aliquam magni. Omnis eligendi placeat nobis similique ab. Ipsum vel voluptate blanditiis dolor qui.','2013-02-22 21:46:05'),
                              ('8','8','8','Perferendis debitis id ducimus. Adipisci excepturi voluptas sint sequi tenetur dolorum. Voluptas voluptates ipsum ullam rerum quae laudantium.','1988-10-01 06:32:53'),
                              ('9','9','9','Soluta eum tenetur voluptatem quaerat incidunt qui quibusdam placeat. Voluptatum delectus asperiores cumque deserunt voluptas. Rem repellat alias eligendi itaque ab eius. Quia eveniet debitis repudiandae ut dolores autem molestias.','1976-11-04 18:33:00'),
                              ('10','10','10','Ipsam dolorum rerum qui amet necessitatibus. Neque et illum quia magnam. Doloremque expedita maxime deleniti. Aliquam necessitatibus eius minus ut.','2020-04-13 10:45:59');
                              

DROP TABLE IF EXISTS `online_status`;
CREATE TABLE `online_status` (
                                 `active_user_id` bigint(20) unsigned NOT NULL,
                                 `status_online_user` enum('Online','MobileOnline','Ofline') COLLATE utf8_unicode_ci DEFAULT NULL,
                                 `update_time` datetime DEFAULT NULL ON UPDATE current_timestamp(),
                                 KEY `active_user_id` (`active_user_id`),
                                 KEY `status_online_user` (`status_online_user`),
                                 KEY `update_time` (`update_time`),
                                 CONSTRAINT `online_status_ibfk_1` FOREIGN KEY (`active_user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица активности пользователя';

INSERT INTO `online_status` VALUES ('1','Online','1983-03-13 03:51:49'),
                                   ('2','MobileOnline','1984-12-16 16:45:03'),
                                   ('3','Ofline','1978-08-21 16:08:09'),
                                   ('4','Online','2000-10-07 04:14:16'),
                                   ('5','MobileOnline','2006-11-26 17:28:35'),
                                   ('6','Ofline','1987-08-07 09:45:01'),
                                   ('7','Ofline','1990-12-08 21:17:01'),
                                   ('8','Ofline','1970-07-22 15:14:17'),
                                   ('9','MobileOnline','1974-06-12 10:53:34'),
                                   ('10','MobileOnline','2016-10-13 12:57:12');


DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
                           `user_id` bigint(20) unsigned NOT NULL,
                           `gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
                           `hometown` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
                           `created_at` datetime DEFAULT current_timestamp(),
                           `birthday` DATE,
                           PRIMARY KEY (`user_id`),
                           CONSTRAINT `fk_profile_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `profile` (user_id, gender, hometown, birthday) VALUES ('1','m','Pariatur amet sunt excepturi tempore.','1976-04-23'),
                                                                   ('2','f','Voluptatem quaerat placeat nemo nostrum.','1996-03-14'),
                                                                   ('3','f','Ut cupiditate ab in eius quo.','1982-08-10'),
                                                                   ('4','f','Quis molestiae et et laudantium ipsum vel corrupti.','1983-06-05'),
                                                                   ('5','f','Quos dolor quod voluptas voluptas voluptatem pariatur eos.','1994-08-15'),
                                                                   ('6','m','In fuga corporis aperiam tempore.','2017-12-05'),
                                                                   ('7','f','Non totam harum illum nisi necessitatibus incidunt.','1976-03-16'),
                                                                   ('8','m','Ipsa porro est consequatur consequatur saepe.','2006-11-13'),
                                                                   ('9','m','Quidem quam dignissimos amet suscipit et.','1971-06-09'),
                                                                   ('10','m','Voluptatem omnis nostrum nihil itaque modi.','2020-03-28');


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
                         `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                         `firstname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
                         `lastname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
                         `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
                         `phone` bigint(20) unsigned DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `email` (`email`),
                         UNIQUE KEY `phone` (`phone`),
                         KEY `idx_user_name` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='юзеры';

INSERT INTO `users` VALUES ('1','Elenora','Altenwerth','kirlin.dayton@example.net','82236250345'),
                           ('2','Hallie','Fisher','chelsie91@example.org','83779249410'),
                           ('3','Loyce','Huel','mconnelly@example.net','84898176463'),
                           ('4','Floy','Heaney','giovanna.hettinger@example.com','82641857550'),
                           ('5','Joseph','Wisozk','bednar.nya@example.com','83051154455'),
                           ('6','Cassandre','Larkin','jakayla.nienow@example.net','83977361065'),
                           ('7','Magnus','Parisian','jbashirian@example.net','88207509149'),
                           ('8','Reggie','Haag','nlindgren@example.com','89827258344'),
                           ('9','Mavis','DuBuque','myrna.ryan@example.com','86292616366'),
                           ('10','Reanna','McKenzie','antonina95@example.org','87719167745');


DROP TABLE IF EXISTS `users_apps`;
CREATE TABLE `users_apps` (
                              `user_id` bigint(20) unsigned NOT NULL,
                              `apps_id` bigint(20) unsigned NOT NULL,
                              PRIMARY KEY (`user_id`,`apps_id`),
                              KEY `apps_id` (`apps_id`),
                              CONSTRAINT `users_apps_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
                              CONSTRAINT `users_apps_ibfk_2` FOREIGN KEY (`apps_id`) REFERENCES `apps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users_apps` VALUES ('1','1'),
                                ('2','2'),
                                ('3','3'),
                                ('4','4'),
                                ('5','5'),
                                ('6','6'),
                                ('7','7'),
                                ('8','8'),
                                ('9','9'),
                                ('10','10');


DROP TABLE IF EXISTS `users_communities`;
CREATE TABLE `users_communities` (
                                     `user_id` bigint(20) unsigned NOT NULL,
                                     `community_id` bigint(20) unsigned NOT NULL,
                                     PRIMARY KEY (`user_id`,`community_id`),
                                     KEY `community_id` (`community_id`),
                                     CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
                                     CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users_communities` VALUES ('1','1'),
                                       ('2','2'),
                                       ('3','3'),
                                       ('4','4'),
                                       ('5','5'),
                                       ('6','6'),
                                       ('7','7'),
                                       ('8','8'),
                                       ('9','9'),
                                       ('10','10');


INSERT INTO `goods_description` (`goods_name`, `goods_photo`, `goods_description`, `goods_price`, `goods_category`, `user_posted_id`)
VALUES
('phone','phone.jpg','Lorem10', 200.99, 1, 11),
('laptop','laptop.jpg','Lorem10', 200.99, 12, 28),
('pc','pc.jpg','Lorem10', 200.99, 13, 22),
('book','book.jpg','Lorem10', 200.99, 21, 19),
('table','table.jpg','Lorem10', 200.99, 11, 15),
('apple','apple.jpg','Lorem10', 200.99, 6, 13),
('watch','watch.jpg','Lorem10', 200.99, 8, 16),
('iphone','iphone.jpg','Lorem10', 200.99, 9, 5),
('ipad','ipad.jpg','Lorem10', 200.99, 19, 9),
('macbook','macbook.jpg','Lorem10', 200.99, 25, 6),
('macbookPro','macbookPro.jpg','Lorem10', 2200.99, 5, 7);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
