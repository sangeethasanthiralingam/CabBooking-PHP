/*
SQLyog Community v12.2.6 (64 bit)
MySQL - 10.4.28-MariaDB : Database - cbsphp
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cbsphp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `cbsphp`;

/*Table structure for table `booking_list` */

DROP TABLE IF EXISTS `booking_list`;

CREATE TABLE `booking_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `ref_code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `cab_id` int(30) NOT NULL,
  `pickup_zone` text NOT NULL,
  `drop_zone` text NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = Pending,\r\n1 = Driver has Confirmed,\r\n2 = Pickup,\r\n3 = drop-off,\r\n4 = cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cab_id` (`cab_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `booking_list_ibfk_1` FOREIGN KEY (`cab_id`) REFERENCES `cab_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `booking_list_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `booking_list` */

insert  into `booking_list`(`id`,`ref_code`,`client_id`,`cab_id`,`pickup_zone`,`drop_zone`,`status`,`date_created`,`date_updated`,`amount`) values 

(2,'202202-00003',1,2,'74 Frosty Lane','15 Franklee Lane',4,'2022-02-16 13:53:27','2024-01-19 10:31:17',1120),

(3,'202202-00003',1,2,'79 Shobe Lane','48 Clinton Street',3,'2022-02-16 15:33:10','2024-01-19 10:30:58',200),

(4,'202203-00001',1,2,'908 Edington Drive','18 Victoria Street',3,'2022-03-23 19:22:40','2024-01-19 10:30:53',300),

(5,'202203-00013',3,14,'372 Saint Marys Avenue','244 Ersel Street',3,'2022-03-23 09:14:08','2024-01-19 10:31:01',500),

(6,'202203-00013',3,4,'372 Saint Marys Avenue','244 Ersel Street',0,'2022-03-16 09:21:29','2024-01-19 10:31:10',600),

(7,'202203-00013',4,14,'870 School House Road','99 Moore Avenue',3,'2022-03-17 11:43:32','2024-01-19 10:31:08',400),

(8,'202203-00013',5,14,'12 Ray Court','55 Peck Court',3,'2022-03-17 16:44:23','2024-01-19 10:31:03',400),

(9,'202203-00013',6,14,'75 Brannon Avenue','234 Hampton Meadows',3,'2022-03-21 07:22:27','2024-01-19 10:31:05',40),

(10,'202203-00013',7,14,'35 Simpson Street','90 Jadewood Farms',3,'2022-03-21 06:38:44','2024-01-19 10:31:39',65),

(11,'202203-00013',8,14,'90 Jadewood Farms','81 Rockford Mountain Lane',4,'2022-03-24 11:00:27','2024-01-19 10:31:19',200),

(12,'202203-00013',9,14,'77 Driftwood Road','43 Hickory Heights Drive',3,'2022-03-24 14:00:15','2024-01-19 10:31:36',12),

(13,'202203-00013',10,14,'90 Glory Road','38 Todds Lane',3,'2022-03-25 17:17:16','2024-01-19 10:32:01',6950),

(14,'202203-00013',11,14,'41 Coulter Lane','27 Bicetown Road',4,'2022-03-27 07:37:12','2024-01-19 10:32:03',595),

(15,'202203-00013',12,3,'70 Elk Avenue','32 Joyce Street',3,'2022-03-16 05:23:58','2024-01-19 10:32:05',5),

(16,'202203-00013',12,2,'85 Pearl Street','403 Sunny Glen Lane',4,'2022-03-17 06:39:50','2024-01-19 10:32:07',585),

(17,'202203-00013',12,7,'10 Yorkie Lane','94 Austin Secret Lane',3,'2022-03-24 17:00:44','2024-01-19 10:32:09',559),

(18,'202203-00013',12,8,'94 Braxton Street','94 Burning Memory Lane',3,'2022-03-24 05:57:25','2024-01-19 10:32:13',4),

(19,'202203-00013',12,11,'94 Burning Memory Lane','20 Rosewood Lane',4,'2022-03-26 19:07:56','2024-01-19 10:32:11',595),

(20,'202203-00013',12,9,'41 Public Works Drive','200 Charack Road',3,'2022-03-26 09:25:13','2024-01-19 10:31:30',43),

(21,'202203-00013',4,9,'31 Roosevelt Wilson Lane','26 Aviation Way',2,'2022-03-27 21:42:40','2024-01-19 10:31:29',12),

(22,'202203-00013',9,1,'98 Holt Street','83 Monroe Avenue',2,'2022-03-27 21:43:44','2024-01-19 10:31:27',34),

(23,'202203-00013',12,14,'487 Shadowmor Drive','767 Walkers Ridge Way',3,'2022-03-27 22:50:55','2024-01-19 10:31:24',212),

(24,'202203-00013',12,6,'144 Test Location','522 Test Location',4,'2022-03-27 22:54:41','2024-01-19 10:31:22',211),

(25,'202401-00001',1,7,'mallavi','jaffna',0,'2024-01-19 15:18:10','2024-01-19 10:31:41',650),

(28,'202401-00001',18,2,'malaavi','Srilanka',3,'2024-01-19 16:24:01','2024-01-19 11:03:55',120),

(29,'202401-00001',18,2,'kalani','thakoor',3,'2024-01-19 19:45:21','2024-01-19 22:46:09',0),

(30,'202401-00001',18,2,'a','a',3,'2024-01-19 22:54:30','2024-01-23 19:41:55',1000);

/*Table structure for table `cab_list` */

DROP TABLE IF EXISTS `cab_list`;

CREATE TABLE `cab_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `reg_code` varchar(100) NOT NULL,
  `category_id` int(30) NOT NULL,
  `cab_reg_no` varchar(200) NOT NULL,
  `body_no` varchar(100) NOT NULL,
  `cab_model` text NOT NULL,
  `cab_driver` text NOT NULL,
  `driver_contact` text NOT NULL,
  `driver_address` text NOT NULL,
  `password` text NOT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `current_place` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `cab_list_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cab_list` */

insert  into `cab_list`(`id`,`reg_code`,`category_id`,`cab_reg_no`,`body_no`,`cab_model`,`cab_driver`,`driver_contact`,`driver_address`,`password`,`image_path`,`status`,`delete_flag`,`date_created`,`date_updated`,`current_place`) values 

(1,'202202-00002',1,'ASTR0306','Fusion-130','Ford Fusion','Mark Cooper','09123456789','94 Chestnut Street','5f4dcc3b5aa765d61d8327deb882cf99','uploads/dirvers/1.png?v=1644981064',1,0,'2022-03-02 10:59:12','2024-01-23 19:42:06','aaaaaaadd'),

(2,'202202-00001',2,'ASTR0715','Camry-440','Toyota Camry','George Williams','09456987123','69 Nixon Avenue','7ad1aea197a92805ac70f71bdec579d3','uploads/dirvers/2.png?v=1644981833',1,0,'2022-03-02 11:13:30','2022-03-27 22:04:51',NULL),

(3,'202203-00001',1,'ASTR0123','Prius-1010','Toyota Prius','Henry','7485658965','12 Fincham Road','5f4dcc3b5aa765d61d8327deb882cf99','uploads/dirvers/3.png?v=1648051050',1,0,'2022-03-02 21:42:30','2022-03-27 22:05:00',NULL),

(4,'202203-00002',1,'ASTR0770','Soul-009','Kia Soul','Lexie Luthor','7896478540','70 Star Trek Drive','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-02 21:59:17','2022-03-27 14:44:37',NULL),

(5,'202203-00003',1,'ASTR0741','Civic-7781','Honda Civic','Allen S. Nichols','7895410000','74 Frosty Lane','5f4dcc3b5aa765d61d8327deb882cf99','uploads/dirvers/5.png?v=1648311707',1,0,'2022-03-02 22:06:47','2022-03-27 14:44:40',NULL),

(6,'202203-00004',2,'ASTR0850','ESV-7700','Cadillac Escalade ESV','Jose R. Kerner','7850001010','15 Chatham Way','5f4dcc3b5aa765d61d8327deb882cf99','uploads/dirvers/6.png?v=1648311872',1,0,'2022-03-02 22:09:32','2022-03-27 14:44:43',NULL),

(7,'202203-00005',1,'ASTR0555','iTen-1010','Hyundai i10','Tony W. Bryan','4785478500','59 Patterson Fork Road','5f4dcc3b5aa765d61d8327deb882cf99','uploads/dirvers/7.png?v=1648312063',1,0,'2022-03-02 22:12:43','2022-03-02 22:12:43',NULL),

(8,'202203-00006',1,'ASTR0020','Skoda-162TSI','Skoda Superb 162TSI','John J. Ackles','2547854444','49 Andell Road','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-02 22:16:57','2022-03-27 14:44:48',NULL),

(9,'202203-00007',1,'ASTRO0022','Picanto-7785','Kia Picanto','Amy K. Walker','4558889850','54 Dovetail Estates','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-02 22:18:41','2022-03-27 14:44:51',NULL),

(10,'202203-00008',3,'ASTR0089','Galaxy-7777','Ford Galaxy','Stanley J. Marty','2589654570','77 Park Street','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-02 13:00:24','2022-03-27 14:44:53',NULL),

(11,'202203-00009',1,'ASTR0047','Passat-7890','Volkswagen Passat','Gabriel M. Allen','7896666666','13 Boring Lane','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-02 13:02:37','2022-03-27 14:44:57',NULL),

(12,'202203-00010',3,'ASTR0258','Touran-8989','Volkswagen Touran','Wayne J. Broussard','7412563250','74 Goldleaf Lane','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-02 13:04:26','2022-03-27 14:44:59',NULL),

(13,'202203-00011',1,'ASTR0885','Toledo-5555','SEAT Toledo','Linda L. Reid','7895555540','29 Lake Floyd Circle','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-02 13:05:37','2022-03-27 14:45:02',NULL),

(14,'202203-00012',1,'ASTR0135','i30T-0135','Hyundai i30 Tourer','Will Williams','7412580000','259 Ridge Road','5f4dcc3b5aa765d61d8327deb882cf99','uploads/dirvers/14.png?v=1648366006',1,0,'2022-03-02 13:11:46','2022-03-27 13:11:46',NULL);

/*Table structure for table `category_list` */

DROP TABLE IF EXISTS `category_list`;

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `category_list` */

insert  into `category_list`(`id`,`name`,`description`,`delete_flag`,`status`,`date_created`,`date_updated`) values 

(1,'5 Seater','A 4-door passenger car with a trunk that is separate from the passengers with a three-box body: the engine, the area for passengers, and the trunk.',0,1,'2022-03-01 10:03:54','2022-03-02 13:03:14'),

(2,'6 Seater','Quisque iaculis ipsum egestas nisi pharetra, ac laoreet felis tincidunt. Cras id gravida justo. Nulla non gravida risus, vel finibus leo. Phasellus vel eros ligula. Fusce a erat sed quam vehicula convallis.',0,1,'2022-03-01 10:08:10','2022-03-27 14:45:51'),

(3,'7 Seater','Flexible, allowing you to switch between lots of seats or lots of boot space. The biggest manage to do both - comfortably taking six passengers and their stuff.',0,1,'2022-03-03 12:59:29','2022-03-27 14:45:56');

/*Table structure for table `client_list` */

DROP TABLE IF EXISTS `client_list`;

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_added` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `user_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `client_list` */

insert  into `client_list`(`id`,`firstname`,`middlename`,`lastname`,`gender`,`contact`,`address`,`email`,`password`,`image_path`,`status`,`delete_flag`,`date_created`,`date_added`,`user_name`) values 

(1,'Elizabeth','J.','Watson','Female','1478555560','85 Sycamore Lake Road','elizabeth@mail.com','5f4dcc3b5aa765d61d8327deb882cf99','uploads/clients/1.png?v=1644995661',1,0,'2022-02-27 13:06:42','2022-03-27 21:10:54',''),

(2,'Christine','M.','Moore','Female','7412589666','12 Bleck Street, PA','christine@mail.com','5f4dcc3b5aa765d61d8327deb882cf99','uploads/clients/2.png?v=1648043485',1,0,'2022-03-01 19:36:24','2022-03-27 21:10:40',''),

(3,'Luciano','B.','Fridley','Male','7896585555','372 Saint Marys Avenue','lsmith@mail.com','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-01 13:13:38','2022-03-27 21:11:06',''),

(4,'Matt','P.','Melton','Male','4589658888','870 School House Road','mattb@mail.com','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-01 13:34:09','2022-03-27 21:11:16',''),

(5,'James','P.','Luis','Male','7850000010','49 Poco Mas Drive','jamesp@mail.com','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-01 13:39:25','2022-03-27 21:11:28',''),

(6,'Timothy','E.','Maurer','Male','1458965555','75 Brannon Avenue','timothye@mail.com','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-01 13:41:16','2022-03-27 21:11:37',''),

(7,'Ebony','S.','Coulter','Female','7850002145','35 Simpson Street','ebonys@mail.com','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-01 13:54:26','2022-03-27 21:11:52',''),

(8,'Jason','F.','Billingsley','Male','1458965555','90 Jadewood Farms','jasonk@mail.com','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-01 13:56:19','2022-03-27 21:12:06',''),

(9,'Daniel','J.','Amos','Male','4565550010','77 Driftwood Road','daniel@mail.com','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-01 13:59:54','2022-03-27 21:12:17',''),

(10,'Edith','D.','Collins','Male','1458965555','90 Glory Road','edith@mail.com','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-01 14:09:00','2022-03-27 21:12:31',''),

(11,'Gina','J.','Bernard','Female','1456854100','41 Coulter Lane','ginac@mail.com','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-01 14:14:37','2022-03-27 21:12:47',''),

(12,'Thomas','J.','Greenwood','Male','4569000010','70 Elk Avenue','thomas@mail.com','5f4dcc3b5aa765d61d8327deb882cf99','uploads/clients/12.png?v=1648370087',1,0,'2022-03-01 14:19:47','2022-03-27 21:12:59',''),

(13,'Peter','J.','Fidley','Male','1456985555','42 Ridge Road','peter@mail.com','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-27 21:10:14',NULL,''),

(14,'John','H.','Hampton','Male','4789652210','50 Pooh Bear Lane','johnhm@mail.com','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-27 22:20:32',NULL,''),

(15,'Maria','J.','Connors','Female','1478523655','76 Richland Avenue','mariaj@mail.com','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-27 22:21:08',NULL,''),

(16,'Karen','M.','Brewer','Female','1458888888','591 Leisure Lane','karenb@mail.com','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-27 22:21:53',NULL,''),

(17,'Norma','K.','Gravelle','Female','1458965555','66 Blane Street','normak@mail.com','5f4dcc3b5aa765d61d8327deb882cf99',NULL,1,0,'2022-03-27 22:24:54',NULL,''),

(18,'jathusan','www','jathusan','Female','0761846704','222','admin@admin.com','e10adc3949ba59abbe56e057f20f883e',NULL,1,0,'2024-01-19 16:21:08',NULL,''),

(19,'aaaa','aaa','aaa','Female','3545435345','ffdsfsds','thiraiips@gmail.com','202cb962ac59075b964b07152d234b70',NULL,1,0,'2024-01-20 11:59:01',NULL,''),

(20,'jathusan','aaa','jathusan','Female','3545435345','222','aadmin@admin.com','e10adc3949ba59abbe56e057f20f883e',NULL,1,0,'2024-01-20 12:02:07',NULL,'');

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_number` varchar(50) NOT NULL,
  `txn_id` varchar(50) NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `payments` */

insert  into `payments`(`payment_id`,`item_number`,`txn_id`,`payment_gross`,`currency_code`,`payment_status`) values 

(1,'1','21774241KJ7191907',120.00,'USD','Completed'),

(2,'1','7SY9788824231292F',120.00,'USD','Completed');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active | 0=Inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`name`,`image`,`price`,`status`) values 

(1,'car','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoGBxQUExYUExUXFxYYGRwZGRkXGRkgIBkiIBwZIh8cHCAhICoiHRwpICEhIzQlJysuMTExHSQ2OzYwOiowMTABCwsLDw4PGBAQFjAfFh8uLjAwMDAwMC4wMDAwLjAwMDAwMDAuMDAwMDAwLjAwMDAwMDAwMDAwMC4uMDAwMDAwLv/AABEIALcBEwMBIgACEQEDEQH/',120.00,1),

(2,'bike','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.statebicycle.com%2Fproducts%2F6061-ebike-commuter-matte-black&psig=AOvVaw0ruf11bWKJM4GiSZ1vA0nD&ust=1705812191705000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCOCJ0-CT64MDFQAAAAAdAAAAABAD',240.00,1);

/*Table structure for table `ratings` */

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `cab_id` int(11) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ratings` */

insert  into `ratings`(`id`,`rating`,`booking_id`,`cab_id`,`description`) values 

(1,11,NULL,NULL,'33'),

(2,22,NULL,NULL,'ff'),

(3,11111,NULL,NULL,'dddd'),

(4,88,NULL,NULL,'jj'),

(5,0,NULL,NULL,''),

(6,0,NULL,NULL,'');

/*Table structure for table `system_info` */

DROP TABLE IF EXISTS `system_info`;

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `system_info` */

insert  into `system_info`(`id`,`meta_field`,`meta_value`) values 

(1,'name','Taxi Booking System'),

(6,'short_name','TBS'),

(11,'logo','uploads/1648050060_cbslg.png'),

(13,'user_avatar','uploads/user_avatar.jpg'),

(14,'cover','uploads/1648048980_cbss22.jpg');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`firstname`,`lastname`,`username`,`password`,`avatar`,`last_login`,`type`,`date_added`,`date_updated`) values 

(1,'Adminstrator','Liam','admin','d00f5d5217896fb7fd601412cb890830','uploads/1624000_adminicn.png',NULL,1,'2022-01-19 14:02:37','2022-03-27 21:51:35'),

(8,'Martha','Heath','martha','3003051F6D158F6687B8A820C46BFA80','uploads/avatar-8.png?v=1648396920',NULL,2,'2022-03-01 16:14:00','2022-03-27 21:47:00'),

(9,'Andrew','Stokes','andrew','5f4dcc3b5aa765d61d8327deb882cf99','uploads/avatar-9.png?v=1648396901',NULL,2,'2022-03-27 21:46:41','2022-03-27 21:46:41');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
