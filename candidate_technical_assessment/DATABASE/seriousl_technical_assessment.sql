-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 04, 2022 at 08:23 PM
-- Server version: 10.3.35-MariaDB-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seriousl_technical_assessment`
--

-- --------------------------------------------------------

--
-- Table structure for table `Contact`
--

CREATE TABLE `Contact` (
  `user` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `check_in` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Contact`
--

INSERT INTO `Contact` (`user`, `phone`, `check_in`) VALUES
('Koh Kah Yan', '0111931233', '2020-07-11 12:00:00'),
('Low Jun Wei', '0112731912', '2020-08-15 13:00:05'),
('Chan Saw Lin', '0152131113', '2020-06-30 16:10:05'),
('Khaw Tong Lin', '015839109', '2020-08-19 11:10:18'),
('Lee Saw Loy', '0161231346', '2020-07-11 15:39:59'),
('Jasmine Lau', '0162879190', '2020-08-01 12:10:05'),
('Chan Saw Lin', '016783239', '2020-08-23 11:59:05'),
('Lim Kok Lin', '0168279101', '2020-08-19 11:11:35'),
('Yong Weng Kai', '0172332743', '2020-07-31 18:10:11'),
('Jayden Lee', '0191236439', '2020-08-22 08:10:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Contact`
--
ALTER TABLE `Contact`
  ADD PRIMARY KEY (`phone`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
