-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2015 at 11:34 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `store`
--
CREATE DATABASE IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `store`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `image`) VALUES
(1, 'Văn phòng phẩm', 'Các sản phẩm là dụng cụ học tập và văn phòng phảm', NULL),
(2, 'Sách - truyện', 'Sách giáo khoa, sách tham khảo, truyện...', NULL),
(3, 'Sản phầm khác', 'Đồ chơi, quà tặng...', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `price` double NOT NULL,
  `amount` int(11) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `create_date` date DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `amount`, `image`, `category_id`, `create_date`, `state`) VALUES
(1, 'Bút bi Bến Nghé', 5000, 190, 'butbiBN.jpg', 1, '2015-04-15', 1),
(2, 'Bút chì HB', 3500, 100, 'butchiHB.jpg', 1, '2015-04-16', 1),
(3, 'Tập 100 trang Vĩnh Tiến', 5200, 100, 'tap100trangVT.jpg', 1, '2015-04-17', 1),
(4, 'Thước kẻ', 3500, 50, 'thuocke.jpg', 1, '2015-04-18', 1),
(5, 'Bút mực Hồng Hà', 15000, 40, 'butmucHH.jpg', 1, '2015-04-19', 1),
(6, 'Gôm Pentel', 6000, 50, 'gomPentel.jpg', 1, '2015-04-20', 1),
(7, 'Hộp bút Kitty', 35000, 20, 'hopbutKitty.jpg', 1, '2015-04-21', 1),
(8, 'Cặp Miti Mickey', 285000, 10, 'capMitiMickey.jpg', 1, '2015-04-22', 1),
(9, 'Bút chì màu Horse', 28000, 30, 'butchimauHorse.jpg', 1, '2015-04-23', 1),
(10, 'Bút dạ quang Toyo', 7500, 40, 'butdaquangToyo.jpg', 1, '2015-04-24', 1),
(11, 'Lá Nằm Trong Lá', 85000, 50, 'lanamtrongla.jpg', 2, '2015-04-23', 1),
(12, 'Cocktail thị thành', 37000, 50, 'cocktailthithanh.jpg', 2, '2015-04-22', 1),
(13, 'Tâm thành và Lộc đời', 150000, 50, 'tamthanhlocdoi.jpg', 2, '2015-04-21', 1),
(14, 'Dế mèn phưu lưu ký', 52500, 100, 'dememphuuluuky.jpg', 2, '2015-04-20', 1),
(15, 'Bảy bước tới mùa hè', 99000, 90, 'baybuoctoimuahe.jpg', 2, '2015-04-20', 1),
(16, 'Xe đồ chơi ĐK', 180000, 20, '350_xe_do_choi_dk_vbc_6678.jpg', 3, '2015-04-18', 1),
(17, 'Xe đồ chơi ABC', 105000, 20, 'xe_do_choi_abc.jpg', 3, '2015-04-19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE IF NOT EXISTS `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `type` varchar(5) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `product_id`, `type`, `amount`) VALUES
(16, 1, 'N', 200),
(17, 2, 'N', 100),
(18, 3, 'N', 100),
(19, 4, 'N', 50),
(20, 5, 'N', 50),
(21, 6, 'N', 50),
(22, 7, 'N', 20),
(23, 8, 'N', 10),
(24, 9, 'N', 30),
(25, 10, 'N', 50),
(26, 11, 'N', 50),
(27, 12, 'N', 50),
(28, 13, 'N', 50),
(29, 14, 'N', 100),
(30, 15, 'N', 100),
(31, 16, 'N', 20),
(32, 17, 'N', 20),
(47, 1, 'X', 10),
(48, 2, 'X', 0),
(49, 3, 'X', 0),
(50, 4, 'X', 0),
(51, 5, 'X', 10),
(52, 6, 'X', 0),
(53, 7, 'X', 0),
(54, 8, 'X', 0),
(55, 9, 'X', 0),
(56, 10, 'X', 10),
(57, 11, 'X', 0),
(58, 12, 'X', 0),
(59, 13, 'X', 0),
(60, 14, 'X', 0),
(61, 15, 'X', 10),
(62, 16, 'X', 0),
(63, 17, 'X', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `phone`, `address`, `role`) VALUES
(1, 'phuong', '123456', 'phuong13021982@gmail.com', '0838753951', '357 - Lê Hồng Phong - P.2 - Quận 10', 'admin'),
(2, 'bibi', '123456', 'bibi@yahoo.com', '0989741258', '227 Nguyễn Văn Cừ', 'user'),
(3, 'thanh', '123456', 'thanh@gmail.com', '0989741258', '123 Phan Văn Trị p17 Gò Vấp', 'user');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
