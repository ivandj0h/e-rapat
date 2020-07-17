-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2020 at 05:45 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE `meeting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `agenda` varchar(225) NOT NULL,
  `files_upload` varchar(128) NOT NULL,
  `date_issues` date NOT NULL,
  `date_requested` date DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `request_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting`
--

INSERT INTO `meeting` (`id`, `user_id`, `place_id`, `agenda`, `files_upload`, `date_issues`, `date_requested`, `start_time`, `end_time`, `request_status`) VALUES
(14, 1, 1, 'meeting pertama', '', '2020-07-15', '2020-07-15', '15:19:00', '16:02:00', 1),
(15, 1, 2, 'meeting kedua', '', '2020-07-16', '2020-07-15', '19:42:00', '19:46:00', 0);

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
(1, '5f0b44d082841', 'Devianti', 'admin@admin.com', '0.jpeg', '$2y$10$rlSQG0XGwZnCtqv61NLKkONCAL1SUJdVeJ/95FFWOxSEeGJ9rqLwW', 1, 1, 1, 1594594034, 1594574032),
(8, '5f0b5b181b087', 'kim jong un', 'user@user.com', '3.jpg', '$2y$10$9nqndnLnAUKMf.cU1pIcpe0I7c8x7hN/cFqOOBgNGE/vQWVY0uQE2', 2, 0, 2, 1594597197, 1594881772),
(9, '5f0d8274d6ad7', 'ivandi', 'ivandi.gah@gmail.com', '5.jpg', '$2y$10$B8fLk5mavIkICGfeT01FuOERt6pGJdDuHvTByslst6utSL.is1UFO', 2, 1, 3, 1594720884, 1594890351);

-- --------------------------------------------------------

--
-- Table structure for table `meeting_users_token`
--

CREATE TABLE `meeting_users_token` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting_users_token`
--

INSERT INTO `meeting_users_token` (`id`, `email`, `token`, `date_created`) VALUES
(1, 'ivandi.gah@gmail.com', 'GRUJ84ty9nRCTGkFD2PgSWlRLNxh0KpFXIHdDbQWaQg=', 1594890460),
(2, 'ivandi.gah@gmail.com', 'Q5xnGDwARSdrsL0KkJqcDlarNtK2kLGW2cuaP1NGqHo=', 1594890561),
(3, 'ivandi.gah@gmail.com', 'kJApt7Oy7NhLvmjVCLXR4qtLyRPnM8o+QELY40cQRDY=', 1594892937),
(4, 'ivandi.gah@gmail.com', 'r/SpSeF6h95LAxHTFI4uHaRh2oGNBO7IIF29gsNgeKY=', 1594893128),
(5, 'ivandi.gah@gmail.com', 'KGD2njVE+GBbtue7WXnsb2c1WmB/YWBL27hk5RHBtoY=', 1594893308),
(6, 'ivandi.gah@gmail.com', 'RTXKN0P4q4nWrL7mQZ2qZD8dhiE+W4vpFGlmc8RMhGo=', 1594893486),
(7, 'ivandi.gah@gmail.com', '8t01wcUc4qazZG+nfacHriNkEHyzK/IKNQG0SDphOWE=', 1594893846),
(8, 'ivandi.gah@gmail.com', 'izWuzwrS4TywLApGeFW8lXKdfvgKJgbd2bgMiggph6w=', 1594894029),
(9, 'ivandi.gah@gmail.com', 'RwBlN18PtQPbtHcbFgrqP/3q8Sngzz1TwzbhQfUmJQg=', 1594895259);

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
(12, 2, 6),
(14, 2, 2),
(30, 1, 6),
(32, 1, 7);

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
(5, 'Account'),
(6, 'Meeting'),
(7, 'Department');

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
(18, 1, 'Account', 'account', 'fas fa-user-friends', 1),
(19, 6, 'Meeting', 'meeting', 'fas fa-calendar-alt', 1),
(20, 7, 'Department', 'department', 'fas fa-fw fa-landmark', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_meeting`
-- (See below for the actual view)
--
CREATE TABLE `view_meeting` (
`id` int(11)
,`user_id` int(11)
,`place_id` int(11)
,`role_id` int(11)
,`department_id` int(11)
,`name` varchar(128)
,`email` varchar(128)
,`role` varchar(128)
,`department_name` varchar(225)
,`place_name` varchar(225)
,`agenda` varchar(225)
,`files_upload` varchar(128)
,`date_issues` date
,`start_time` time
,`end_time` time
,`request_status` int(11)
);

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
-- Structure for view `view_meeting`
--
DROP TABLE IF EXISTS `view_meeting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_meeting`  AS  select `meeting`.`id` AS `id`,`meeting`.`user_id` AS `user_id`,`meeting`.`place_id` AS `place_id`,`view_user_department`.`role_id` AS `role_id`,`view_user_department`.`department_id` AS `department_id`,`view_user_department`.`name` AS `name`,`view_user_department`.`email` AS `email`,`view_user_department`.`role` AS `role`,`view_user_department`.`department_name` AS `department_name`,`meeting_place`.`place_name` AS `place_name`,`meeting`.`agenda` AS `agenda`,`meeting`.`files_upload` AS `files_upload`,`meeting`.`date_issues` AS `date_issues`,`meeting`.`start_time` AS `start_time`,`meeting`.`end_time` AS `end_time`,`meeting`.`request_status` AS `request_status` from ((`meeting` join `meeting_place` on(`meeting`.`place_id` = `meeting_place`.`id`)) join `view_user_department` on(`meeting`.`user_id` = `view_user_department`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_user_department`
--
DROP TABLE IF EXISTS `view_user_department`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_department`  AS  select `meeting_users`.`id` AS `id`,`meeting_users`.`name` AS `name`,`meeting_users`.`email` AS `email`,`meeting_users`.`image` AS `image`,`meeting_users`.`password` AS `password`,`meeting_users`.`role_id` AS `role_id`,`meeting_users`.`is_active` AS `is_active`,`meeting_department`.`department_name` AS `department_name`,`meeting_users`.`date_created` AS `date_created`,`user_role`.`role` AS `role`,`meeting_users`.`department_id` AS `department_id`,`meeting_users`.`uniqueid` AS `uniqueid`,`meeting_users`.`date_updated` AS `date_updated` from ((`meeting_users` join `meeting_department` on(`meeting_users`.`department_id` = `meeting_department`.`id`)) join `user_role` on(`meeting_users`.`role_id` = `user_role`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `meeting_users_token`
--
ALTER TABLE `meeting_users_token`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `meeting_users_token`
--
ALTER TABLE `meeting_users_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
