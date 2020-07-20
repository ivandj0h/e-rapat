-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2020 at 07:43 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-meeting`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_meeting_department` ()  NO SQL
SELECT department_name, COUNT(id) AS total FROM view_meeting GROUP BY department_name$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE `meeting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `unique_code` varchar(100) NOT NULL,
  `agenda` varchar(225) NOT NULL,
  `files` varchar(128) NOT NULL,
  `date_issues` date NOT NULL,
  `date_requested` date DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `request_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting`
--

INSERT INTO `meeting` (`id`, `user_id`, `place_id`, `unique_code`, `agenda`, `files`, `date_issues`, `date_requested`, `start_time`, `end_time`, `request_status`) VALUES
(8, 14, 1, '5f151615d7bb2', 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '', '2020-07-20', '2020-07-20', '11:57:00', '12:57:00', 2),
(9, 14, 1, '5f1516bce6e89', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '2020-07-20', '2020-07-20', '11:59:00', '12:59:00', 1),
(10, 14, 2, '5f152e4aa1bb1', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium', '', '2020-07-19', '2020-07-20', '13:40:00', '14:40:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `meeting_department`
--

CREATE TABLE `meeting_department` (
  `id` int(11) NOT NULL,
  `department_name` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting_department`
--

INSERT INTO `meeting_department` (`id`, `department_name`) VALUES
(1, 'Department One'),
(2, 'Department Two'),
(3, 'Department Three'),
(4, 'Department Four');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_place`
--

CREATE TABLE `meeting_place` (
  `id` int(11) NOT NULL,
  `place_name` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting_place`
--

INSERT INTO `meeting_place` (`id`, `place_name`) VALUES
(1, 'Meeting Room One'),
(2, 'Meeting Room Two');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_users`
--

CREATE TABLE `meeting_users` (
  `id` int(11) NOT NULL,
  `uniqueid` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `department_id` int(11) NOT NULL,
  `date_created` int(11) NOT NULL,
  `date_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting_users`
--

INSERT INTO `meeting_users` (`id`, `uniqueid`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `department_id`, `date_created`, `date_updated`) VALUES
(14, '5f14a617b785a', 'Ivandjoh', 'ivandi.gah@gmail.com', '7b.jpg', '$2y$10$0rrXCLrtJVMPYTXqELd.GO7DG8KoMLjqbafsC6bzYulXWqWusGc7G', 1, 1, 1, 1595188759, 1595223295),
(15, '5f14c0bfa4259', 'Arjuna Djoh', 'juna@gmail.com', '3.jpeg', '$2y$10$exVU.fONQ3CPhM87ZUv0buimW/hUb01.vCXk4FI.vT5Z21cIPMbz.', 2, 1, 2, 1595195583, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(4, 1, 3),
(10, 1, 18),
(11, 1, 5),
(14, 2, 2),
(32, 1, 25),
(35, 1, 26),
(38, 2, 26),
(40, 1, 27),
(41, 2, 27),
(42, 1, 28),
(45, 1, 29),
(46, 2, 29);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu'),
(29, 'Meeting');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'Profile', 'user', 'fas fa-fw fa-user', 1),
(3, 2, 'Edit Profile', 'user/edit', 'fas fa-fw fa-user-edit', 1),
(4, 3, 'Menu Management', 'menu', 'fas fa-fw fa-bars', 1),
(5, 3, 'SubMenu Management', 'menu/submenu', 'fas fa-fw fa-stream', 1),
(17, 1, 'Role', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(18, 1, 'Account', 'admin/account', 'fas fa-user-friends', 1),
(22, 29, 'Meeting', 'meeting', 'fas fa-fw fa-calendar-alt', 1),
(23, 29, 'Explores', 'meeting/explores', 'fas fa-fw fa-globe-americas', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_user_department`
-- (See below for the actual view)
--
CREATE TABLE `view_user_department` (
`id` int(11)
,`name` varchar(128)
,`email` varchar(128)
,`image` varchar(128)
,`password` varchar(256)
,`role_id` int(11)
,`is_active` int(1)
,`department_name` varchar(225)
,`date_created` int(11)
,`role` varchar(128)
,`department_id` int(11)
,`uniqueid` varchar(64)
,`date_updated` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_user_meeting`
-- (See below for the actual view)
--
CREATE TABLE `view_user_meeting` (
`id` int(11)
,`user_id` int(11)
,`place_id` int(11)
,`name` varchar(128)
,`email` varchar(128)
,`image` varchar(128)
,`place_name` varchar(225)
,`agenda` varchar(225)
,`files_upload` varchar(128)
,`date_issues` date
,`date_requested` date
,`start_time` time
,`end_time` time
,`request_status` int(11)
,`department_id` int(11)
,`department_name` varchar(225)
,`unique_code` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `view_user_department`
--
DROP TABLE IF EXISTS `view_user_department`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_department`  AS  select `meeting_users`.`id` AS `id`,`meeting_users`.`name` AS `name`,`meeting_users`.`email` AS `email`,`meeting_users`.`image` AS `image`,`meeting_users`.`password` AS `password`,`meeting_users`.`role_id` AS `role_id`,`meeting_users`.`is_active` AS `is_active`,`meeting_department`.`department_name` AS `department_name`,`meeting_users`.`date_created` AS `date_created`,`user_role`.`role` AS `role`,`meeting_users`.`department_id` AS `department_id`,`meeting_users`.`uniqueid` AS `uniqueid`,`meeting_users`.`date_updated` AS `date_updated` from ((`meeting_users` join `meeting_department` on(`meeting_users`.`department_id` = `meeting_department`.`id`)) join `user_role` on(`meeting_users`.`role_id` = `user_role`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_user_meeting`
--
DROP TABLE IF EXISTS `view_user_meeting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_meeting`  AS  select `meeting`.`id` AS `id`,`meeting`.`user_id` AS `user_id`,`meeting`.`place_id` AS `place_id`,`meeting_users`.`name` AS `name`,`meeting_users`.`email` AS `email`,`meeting_users`.`image` AS `image`,`meeting_place`.`place_name` AS `place_name`,`meeting`.`agenda` AS `agenda`,`meeting`.`files` AS `files_upload`,`meeting`.`date_issues` AS `date_issues`,`meeting`.`date_requested` AS `date_requested`,`meeting`.`start_time` AS `start_time`,`meeting`.`end_time` AS `end_time`,`meeting`.`request_status` AS `request_status`,`meeting_users`.`department_id` AS `department_id`,`meeting_department`.`department_name` AS `department_name`,`meeting`.`unique_code` AS `unique_code` from (((`meeting` join `meeting_users` on(`meeting`.`user_id` = `meeting_users`.`id`)) join `meeting_place` on(`meeting`.`place_id` = `meeting_place`.`id`)) join `meeting_department` on(`meeting_users`.`department_id` = `meeting_department`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `meeting_department`
--
ALTER TABLE `meeting_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting_place`
--
ALTER TABLE `meeting_place`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting_users`
--
ALTER TABLE `meeting_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `meeting`
--
ALTER TABLE `meeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `meeting_department`
--
ALTER TABLE `meeting_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `meeting_place`
--
ALTER TABLE `meeting_place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meeting_users`
--
ALTER TABLE `meeting_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
