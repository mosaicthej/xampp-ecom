-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2023-05-08 15:10:17
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
CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `streetno` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city_id` int(11) UNSIGNED NOT NULL,
  `region_id` int(11) UNSIGNED NOT NULL,
  `country_id` smallint(5) UNSIGNED NOT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  `apartment_no` varchar(45) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `cart_product`
--

DROP TABLE IF EXISTS `cart_product`;
CREATE TABLE `cart_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cartid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(45) NOT NULL,
  `category_desc` varchar(45) DEFAULT NULL,
  `parent_category` int(11) DEFAULT -1,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
CREATE TABLE `category_subcategories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
CREATE TABLE `cities` (
  `id` int(11) UNSIGNED NOT NULL,
  `region_id` int(11) UNSIGNED NOT NULL,
  `country_id` smallint(5) UNSIGNED NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- 表的结构 `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- 表的结构 `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `discount_method` varchar(45) NOT NULL,
  `discount_amount` decimal(10,0) DEFAULT NULL,
  `discount_percentage` decimal(10,0) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `id_address` int(11) DEFAULT NULL,
  `id_management` int(11) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `inventory_management`
--

DROP TABLE IF EXISTS `inventory_management`;
CREATE TABLE `inventory_management` (
  `id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `management_id` int(11) NOT NULL,
  `associated_cost` decimal(10,0) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `keyword`
--

DROP TABLE IF EXISTS `keyword`;
CREATE TABLE `keyword` (
  `id` int(11) NOT NULL,
  `keyword` varchar(45) NOT NULL,
  `desc` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `management`
--

DROP TABLE IF EXISTS `management`;
CREATE TABLE `management` (
  `id` int(11) NOT NULL,
  `contact_person` varchar(45) DEFAULT NULL,
  `company_name` varchar(45) NOT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `contact_email` varchar(45) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `amount_due` decimal(10,0) NOT NULL,
  `amount_paid` decimal(10,0) NOT NULL,
  `shipto_useraddressid` int(11) NOT NULL,
  `paymentid` int(11) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `order_discount`
--

DROP TABLE IF EXISTS `order_discount`;
CREATE TABLE `order_discount` (
  `id` int(11) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `discountid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `discountid` int(11) DEFAULT -1,
  `orderid` int(11) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `order_shipment`
--

DROP TABLE IF EXISTS `order_shipment`;
CREATE TABLE `order_shipment` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `shipmentid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image` varchar(100) NOT NULL,
  `available` tinyint(4) NOT NULL,
  `categoryid` int(11) DEFAULT -1,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `product_discount`
--

DROP TABLE IF EXISTS `product_discount`;
CREATE TABLE `product_discount` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `discountid` int(11) NOT NULL,
  `available_till` date DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `product_inventory`
--

DROP TABLE IF EXISTS `product_inventory`;
CREATE TABLE `product_inventory` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_inventory` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `product_tag`
--

DROP TABLE IF EXISTS `product_tag`;
CREATE TABLE `product_tag` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `tagid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `regions`
--

DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `country_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `shipment`
--

DROP TABLE IF EXISTS `shipment`;
CREATE TABLE `shipment` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `from_inventoryid` int(11) NOT NULL,
  `to_usraddressid` int(11) NOT NULL,
  `logistics_provider` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `desc` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tag_keyword`
--

DROP TABLE IF EXISTS `tag_keyword`;
CREATE TABLE `tag_keyword` (
  `idtag_keyword` int(11) NOT NULL,
  `tagid` int(11) NOT NULL,
  `keywordid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
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
  `deleted_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `idAddress` int(11) DEFAULT NULL,
  `contact_name` varchar(45) NOT NULL,
  `contact_phone` varchar(45) NOT NULL,
  `contact_email` varchar(45) DEFAULT NULL,
  `cretated_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
CREATE TABLE `user_payment` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `payment_type` varchar(45) NOT NULL,
  `service_provider` varchar(45) NOT NULL,
  `account_number` varchar(45) NOT NULL,
  `expiry` date NOT NULL,
  `service_reference_number` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_addr_city` (`city_id`),
  ADD KEY `fk_addr_region` (`region_id`),
  ADD KEY `fk_addr_country` (`country_id`);

--
-- 表的索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cart_uid` (`userid`);

--
-- 表的索引 `cart_product`
--
ALTER TABLE `cart_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cartprod_prodid` (`product_id`),
  ADD KEY `fk_cartprod_cartid` (`cartid`);

--
-- 表的索引 `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `category_subcategories`
--
ALTER TABLE `category_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categoryhier_cateid` (`category_id`),
  ADD KEY `fk_categoryhier_childid` (`child_id`);

--
-- 表的索引 `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_region_name` (`country_id`,`region_id`,`name`);

--
-- 表的索引 `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 表的索引 `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_inv_addr` (`id_address`),
  ADD KEY `fk_inv_man` (`id_management`);

--
-- 表的索引 `inventory_management`
--
ALTER TABLE `inventory_management`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_inventman_inv` (`inventory_id`),
  ADD KEY `fk_inventman_man` (`management_id`);

--
-- 表的索引 `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `management`
--
ALTER TABLE `management`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_userid` (`userid`),
  ADD KEY `fk_order_useraddrid` (`shipto_useraddressid`),
  ADD KEY `fk_order_paymentid` (`paymentid`);

--
-- 表的索引 `order_discount`
--
ALTER TABLE `order_discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orddisc_ordid` (`orderid`),
  ADD KEY `fk_orddisc_discid` (`discountid`);

--
-- 表的索引 `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orderitem_prodid` (`productid`),
  ADD KEY `fk_orderitem_discountid` (`discountid`),
  ADD KEY `fk_orderitem_orderid` (`orderid`);

--
-- 表的索引 `order_shipment`
--
ALTER TABLE `order_shipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ordership_orderid` (`orderid`),
  ADD KEY `fk_ordership_shipid` (`shipmentid`);

--
-- 表的索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_cateid` (`categoryid`);

--
-- 表的索引 `product_discount`
--
ALTER TABLE `product_discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_productdisc_prodid` (`productid`),
  ADD KEY `fk_productdisc_discid` (`discountid`);

--
-- 表的索引 `product_inventory`
--
ALTER TABLE `product_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prodinv_prodid` (`id_product`),
  ADD KEY `fk_prodinv_invid` (`id_inventory`);

--
-- 表的索引 `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prodtag_prodid` (`productid`),
  ADD KEY `fk_prodtag_tagid` (`tagid`);

--
-- 表的索引 `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_name` (`country_id`,`name`);

--
-- 表的索引 `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ship_orderid` (`orderid`),
  ADD KEY `fk_ship_frominvid` (`from_inventoryid`),
  ADD KEY `fk_ship_tousraddrid` (`to_usraddressid`);

--
-- 表的索引 `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tag_keyword`
--
ALTER TABLE `tag_keyword`
  ADD PRIMARY KEY (`idtag_keyword`),
  ADD KEY `fk_tagkey_tagid` (`tagid`),
  ADD KEY `fk_tagkey_keyid` (`keywordid`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`,`username`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- 表的索引 `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_useraddr_userid` (`idUser`),
  ADD KEY `fk_useraddr_addrid` (`idAddress`);

--
-- 表的索引 `user_payment`
--
ALTER TABLE `user_payment`
  ADD PRIMARY KEY (`id`,`idUser`) USING BTREE,
  ADD KEY `fk_payment_userid` (`idUser`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cart_product`
--
ALTER TABLE `cart_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `category_subcategories`
--
ALTER TABLE `category_subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- 使用表AUTO_INCREMENT `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `countries`
--
ALTER TABLE `countries`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `inventory_management`
--
ALTER TABLE `inventory_management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `keyword`
--
ALTER TABLE `keyword`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `management`
--
ALTER TABLE `management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `order_discount`
--
ALTER TABLE `order_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `order_shipment`
--
ALTER TABLE `order_shipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `product_discount`
--
ALTER TABLE `product_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `product_inventory`
--
ALTER TABLE `product_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `shipment`
--
ALTER TABLE `shipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tag_keyword`
--
ALTER TABLE `tag_keyword`
  MODIFY `idtag_keyword` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `user_payment`
--
ALTER TABLE `user_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
