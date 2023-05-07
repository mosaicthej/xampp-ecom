-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2023-05-07 15:11:08
-- 服务器版本： 10.4.28-MariaDB
-- PHP 版本： 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `ecomdb`
--
CREATE DATABASE IF NOT EXISTS `ecomdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ecomdb`;

-- --------------------------------------------------------

--
-- 表的结构 `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `streetno` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city_id` int(11) UNSIGNED NOT NULL,
  `region_id` int(11) UNSIGNED NOT NULL,
  `country_id` smallint(5) UNSIGNED NOT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  `apartment_no` varchar(45) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_addr_city` (`city_id`),
  KEY `fk_addr_region` (`region_id`),
  KEY `fk_addr_country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `address`
--

INSERT INTO `address` (`id`, `streetno`, `street`, `city_id`, `region_id`, `country_id`, `postal_code`, `apartment_no`, `created_time`, `modified_time`, `deleted_time`) VALUES
(1, 'testt', 'test', 567378, 786, 51, '123223', 'testtt', '2023-05-05 12:11:21', NULL, NULL),
(2, 'testt', 'test', 567378, 786, 51, '123223', 'testtt', '2023-05-05 12:11:32', NULL, NULL),
(4, 'testt', 'test', 576910, 786, 51, '123223', 'testtt', '2023-05-05 12:13:24', NULL, NULL),
(5, 'testt', 'test', 567378, 786, 51, '123223', 'testtt', '2023-05-05 12:23:38', NULL, NULL),
(6, 'testt', 'test', 567378, 786, 51, '123223', 'testtt', '2023-05-05 12:27:23', NULL, NULL),
(7, 'testt', 'test', 567378, 786, 51, '123223', 'testtt', '2023-05-05 12:29:46', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_uid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `cart_product`
--

DROP TABLE IF EXISTS `cart_product`;
CREATE TABLE IF NOT EXISTS `cart_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `cartid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cartprod_prodid` (`product_id`),
  KEY `fk_cartprod_cartid` (`cartid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  `category_desc` varchar(45) DEFAULT NULL,
  `parent_category` int(11) DEFAULT -1,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `category_name`, `category_desc`, `parent_category`, `deleted`) VALUES
(-1, 'top', NULL, -1, 0),
(1, '映像ソフト                            \n           ', 'avsoft', -1, 0),
(3, 'アニメ\n            ', 'anime\n            ', 1, 0),
(4, 'アニメ全般\n            ', 'anime tv\n            ', 3, 0),
(5, '劇場作\n            ', 'movies\n            ', 3, 0),
(6, 'OVA\n            ', 'ova\n            ', 3, 0),
(7, 'その他\n            ', 'other\n            ', 3, 0),
(8, 'ワンピース\n            ', 'One Piece\n            ', 4, 0),
(9, 'ガンダム\n            ', 'Gundam\n            ', 4, 0),
(10, '銀魂\n            ', 'Gintama\n            ', 4, 0);

-- --------------------------------------------------------

--
-- 表的结构 `category_subcategories`
--

DROP TABLE IF EXISTS `category_subcategories`;
CREATE TABLE IF NOT EXISTS `category_subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_categoryhier_cateid` (`category_id`),
  KEY `fk_categoryhier_childid` (`child_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `category_subcategories`
--

INSERT INTO `category_subcategories` (`id`, `category_id`, `child_id`, `deleted`) VALUES
(18, -1, 1, 1),
(29, -1, 1, 1),
(31, -1, 1, 1),
(32, -1, 1, 0),
(33, 1, 3, 0),
(34, 3, 4, 0),
(35, 3, 5, 0),
(36, 3, 6, 0),
(37, 3, 7, 0),
(38, 4, 8, 0),
(39, 4, 9, 0),
(40, 4, 10, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `region_id` int(11) UNSIGNED NOT NULL,
  `country_id` smallint(5) UNSIGNED NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_region_name` (`country_id`,`region_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2790952 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- 表的结构 `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- 表的结构 `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE IF NOT EXISTS `discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_method` varchar(45) NOT NULL,
  `discount_amount` decimal(10,0) DEFAULT NULL,
  `discount_percentage` decimal(10,0) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_address` int(11) DEFAULT NULL,
  `id_management` int(11) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inv_addr` (`id_address`),
  KEY `fk_inv_man` (`id_management`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `inventory_management`
--

DROP TABLE IF EXISTS `inventory_management`;
CREATE TABLE IF NOT EXISTS `inventory_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_id` int(11) NOT NULL,
  `management_id` int(11) NOT NULL,
  `associated_cost` decimal(10,0) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inventman_inv` (`inventory_id`),
  KEY `fk_inventman_man` (`management_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `keyword`
--

DROP TABLE IF EXISTS `keyword`;
CREATE TABLE IF NOT EXISTS `keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(45) NOT NULL,
  `desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `management`
--

DROP TABLE IF EXISTS `management`;
CREATE TABLE IF NOT EXISTS `management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_person` varchar(45) DEFAULT NULL,
  `company_name` varchar(45) NOT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `contact_email` varchar(45) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `amount_due` decimal(10,0) NOT NULL,
  `amount_paid` decimal(10,0) NOT NULL,
  `shipto_useraddressid` int(11) NOT NULL,
  `paymentid` int(11) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_userid` (`userid`),
  KEY `fk_order_useraddrid` (`shipto_useraddressid`),
  KEY `fk_order_paymentid` (`paymentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `order_discount`
--

DROP TABLE IF EXISTS `order_discount`;
CREATE TABLE IF NOT EXISTS `order_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `discountid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orddisc_ordid` (`orderid`),
  KEY `fk_orddisc_discid` (`discountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `discountid` int(11) DEFAULT -1,
  `orderid` int(11) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderitem_prodid` (`productid`),
  KEY `fk_orderitem_discountid` (`discountid`),
  KEY `fk_orderitem_orderid` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `order_shipment`
--

DROP TABLE IF EXISTS `order_shipment`;
CREATE TABLE IF NOT EXISTS `order_shipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `shipmentid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ordership_orderid` (`orderid`),
  KEY `fk_ordership_shipid` (`shipmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image` varchar(100) NOT NULL,
  `available` tinyint(4) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_cateid` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `product_discount`
--

DROP TABLE IF EXISTS `product_discount`;
CREATE TABLE IF NOT EXISTS `product_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `discountid` int(11) NOT NULL,
  `available_till` date DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productdisc_prodid` (`productid`),
  KEY `fk_productdisc_discid` (`discountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `product_inventory`
--

DROP TABLE IF EXISTS `product_inventory`;
CREATE TABLE IF NOT EXISTS `product_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `id_inventory` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prodinv_prodid` (`id_product`),
  KEY `fk_prodinv_invid` (`id_inventory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `product_tag`
--

DROP TABLE IF EXISTS `product_tag`;
CREATE TABLE IF NOT EXISTS `product_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `tagid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prodtag_prodid` (`productid`),
  KEY `fk_prodtag_tagid` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `regions`
--

DROP TABLE IF EXISTS `regions`;
CREATE TABLE IF NOT EXISTS `regions` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `country_id` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_name` (`country_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3889 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `shipment`
--

DROP TABLE IF EXISTS `shipment`;
CREATE TABLE IF NOT EXISTS `shipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `from_inventoryid` int(11) NOT NULL,
  `to_usraddressid` int(11) NOT NULL,
  `logistics_provider` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ship_orderid` (`orderid`),
  KEY `fk_ship_frominvid` (`from_inventoryid`),
  KEY `fk_ship_tousraddrid` (`to_usraddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tag_keyword`
--

DROP TABLE IF EXISTS `tag_keyword`;
CREATE TABLE IF NOT EXISTS `tag_keyword` (
  `idtag_keyword` int(11) NOT NULL AUTO_INCREMENT,
  `tagid` int(11) NOT NULL,
  `keywordid` int(11) NOT NULL,
  PRIMARY KEY (`idtag_keyword`),
  KEY `fk_tagkey_tagid` (`tagid`),
  KEY `fk_tagkey_keyid` (`keywordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `default_usr_address_id` int(11) DEFAULT -1,
  `pfp` varchar(100) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `phone_number`, `default_usr_address_id`, `pfp`, `created_time`, `modified_time`, `deleted_time`) VALUES
(7, 'asuka', '$2y$10$sW2mhJDcRFeMa1CexbVAYOekPQyB.HwyxdEztcVJ5caHPl.hrgkPy', 'Asuka', 'Langley', 'evangelion2nd@nerv.def', '432-432-4321', 2, 'C:\\xampp\\htdocs\\com302\\site\\uploads\\profile_pictures\\90224361_p0.jpg', '2023-05-04 17:17:33', NULL, NULL),
(8, 'homura', '$2y$10$18CC9H6hyo4VKVXI3OOs4.ZPqF//Oxcy6DGVecs1dj0qJkhX/U0R6', 'Akemi', 'Homura', 'homuhomu@maguka.yuri', '1031031003', -1, 'C:\\xampp\\htdocs\\com302\\site\\uploads\\profile_pictures\\homura.png', '2023-05-06 20:45:09', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user_address`
--

DROP TABLE IF EXISTS `user_address`;
CREATE TABLE IF NOT EXISTS `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) DEFAULT NULL,
  `idAddress` int(11) DEFAULT NULL,
  `contact_name` varchar(45) NOT NULL,
  `contact_phone` varchar(45) NOT NULL,
  `contact_email` varchar(45) DEFAULT NULL,
  `cretated_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_useraddr_userid` (`idUser`),
  KEY `fk_useraddr_addrid` (`idAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `user_address`
--

INSERT INTO `user_address` (`id`, `idUser`, `idAddress`, `contact_name`, `contact_phone`, `contact_email`, `cretated_time`, `modified_time`, `deleted_time`, `deleted`) VALUES
(1, 7, 5, 'Asuka', '4324324321', 'tensaiasuka@cutie.mail', '2023-05-05 12:23:38', NULL, NULL, 0),
(2, 7, 6, 'Asuka', '04324324321', 'tensaiasuka@cutie.mail', '2023-05-05 12:27:23', NULL, NULL, 0),
(3, 7, 7, 'Asuka', '04324324321', 'tensaiasuka@cutie.mail', '2023-05-05 12:29:46', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `user_payment`
--

DROP TABLE IF EXISTS `user_payment`;
CREATE TABLE IF NOT EXISTS `user_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `payment_type` varchar(45) NOT NULL,
  `service_provider` varchar(45) NOT NULL,
  `account_number` varchar(45) NOT NULL,
  `expiry` date NOT NULL,
  `service_reference_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`idUser`) USING BTREE,
  KEY `fk_payment_userid` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 限制导出的表
--

--
-- 限制表 `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_addr_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `fk_addr_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `fk_addr_region` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`);

--
-- 限制表 `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_uid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `fk_cartprod_cartid` FOREIGN KEY (`cartid`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cartprod_prodid` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `category_subcategories`
--
ALTER TABLE `category_subcategories`
  ADD CONSTRAINT `fk_categoryhier_cateid` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_categoryhier_childid` FOREIGN KEY (`child_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk_inv_addr` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inv_man` FOREIGN KEY (`id_management`) REFERENCES `management` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `inventory_management`
--
ALTER TABLE `inventory_management`
  ADD CONSTRAINT `fk_inventman_inv` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inventman_man` FOREIGN KEY (`management_id`) REFERENCES `management` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_paymentid` FOREIGN KEY (`paymentid`) REFERENCES `user_payment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_useraddrid` FOREIGN KEY (`shipto_useraddressid`) REFERENCES `user_address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `order_discount`
--
ALTER TABLE `order_discount`
  ADD CONSTRAINT `fk_orddisc_discid` FOREIGN KEY (`discountid`) REFERENCES `discount` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orddisc_ordid` FOREIGN KEY (`orderid`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_orderitem_discountid` FOREIGN KEY (`discountid`) REFERENCES `discount` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orderitem_orderid` FOREIGN KEY (`orderid`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orderitem_prodid` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `order_shipment`
--
ALTER TABLE `order_shipment`
  ADD CONSTRAINT `fk_ordership_orderid` FOREIGN KEY (`orderid`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ordership_shipid` FOREIGN KEY (`shipmentid`) REFERENCES `shipment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_cateid` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `product_discount`
--
ALTER TABLE `product_discount`
  ADD CONSTRAINT `fk_productdisc_discid` FOREIGN KEY (`discountid`) REFERENCES `discount` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productdisc_prodid` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `product_inventory`
--
ALTER TABLE `product_inventory`
  ADD CONSTRAINT `fk_prodinv_invid` FOREIGN KEY (`id_inventory`) REFERENCES `inventory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_prodinv_prodid` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `fk_prodtag_prodid` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_prodtag_tagid` FOREIGN KEY (`tagid`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `fk_ship_frominvid` FOREIGN KEY (`from_inventoryid`) REFERENCES `inventory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ship_orderid` FOREIGN KEY (`orderid`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ship_tousraddrid` FOREIGN KEY (`to_usraddressid`) REFERENCES `user_address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `tag_keyword`
--
ALTER TABLE `tag_keyword`
  ADD CONSTRAINT `fk_tagkey_keyid` FOREIGN KEY (`keywordid`) REFERENCES `keyword` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tagkey_tagid` FOREIGN KEY (`tagid`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `fk_useraddr_addrid` FOREIGN KEY (`idAddress`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_useraddr_userid` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE NO ACTION;

--
-- 限制表 `user_payment`
--
ALTER TABLE `user_payment`
  ADD CONSTRAINT `fk_payment_userid` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
