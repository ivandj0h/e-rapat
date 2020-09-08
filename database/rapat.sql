-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2020 at 09:29 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rapat`
--

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE `meeting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `other_online_id` varchar(150) NOT NULL,
  `zoomid` varchar(100) NOT NULL,
  `sub_type_id` int(11) NOT NULL,
  `speakers_name` varchar(225) NOT NULL,
  `members_name` varchar(225) NOT NULL,
  `files_upload` varchar(225) NOT NULL,
  `files_upload1` varchar(225) NOT NULL,
  `files_upload2` varchar(225) NOT NULL,
  `unique_code` varchar(100) NOT NULL,
  `agenda` text NOT NULL,
  `date_requested` date NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `request_status` int(11) NOT NULL,
  `remark_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'Super Admin'),
(2, 'Sekretariat Badan Litbang Perhubungan'),
(3, 'Pusat Penelitian dan Pengembangan Transportasi Udara'),
(4, 'Pusat Penelitian dan Pengembangan Transportasi LSDP'),
(5, 'Pusat Penelitian dan Pengembangan Transportasi Jalan dan Perkertaapian'),
(6, 'Pusat Penelitian dan Pengembangan Transportasi Antarmoda'),
(7, 'Kaban'),
(8, 'Sesban');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_place`
--

CREATE TABLE `meeting_place` (
  `id` int(11) NOT NULL,
  `place_name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_sub_department`
--

CREATE TABLE `meeting_sub_department` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `sub_department_name` varchar(225) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting_sub_department`
--

INSERT INTO `meeting_sub_department` (`id`, `department_id`, `sub_department_name`, `is_active`) VALUES
(1, 1, 'Administrator', 1),
(2, 2, 'Bagian Keuangan dan Perlengkapan', 1),
(3, 2, 'Bagian Perencanaan dan Kerja Sama', 1),
(4, 2, 'Bagian Kepegawaian', 1),
(5, 2, 'Bagian Data Humas dan Publikasi', 1),
(6, 3, 'Bagian Pelaporan dan Evaluasi Puslitbang Transportasi Udara', 1),
(7, 3, 'Bagian Pengembangan Teknologi dan Penunjang Penelitian Transportasi Puslitbang Udara', 1),
(8, 4, 'Bagian Pelaporan dan Evaluasi Puslitbang Transportasi LSDP', 1),
(9, 4, 'Bagian Pengembangan Teknologi dan Penunjang Penelitian Puslitbang Transportasi LSDP', 1),
(10, 5, 'Bagian Pelaporan dan Evaluasi Puslitbang Transportasi Jalan dan Perkertaapian', 1),
(11, 5, 'Bagian Pengembangan Teknologi dan Penunjang Penelitian Puslitbang Transportasi Jalan dan Perkeretaapian', 1),
(12, 6, 'Bagian Pelaporan dan Evaluasi Puslitbang Transportasi Antarmoda', 1),
(13, 6, 'Bagian Pengembangan Teknologi dan Penunjang Transportasi Antar Moda', 1),
(14, 7, 'Kepala Badan Litbang Perhubungan', 1),
(15, 8, 'Sekretaris Badan Litbang Perhubungan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `meeting_sub_type`
--

CREATE TABLE `meeting_sub_type` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `meeting_subtype` varchar(225) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting_sub_type`
--

INSERT INTO `meeting_sub_type` (`id`, `type_id`, `meeting_subtype`, `is_active`) VALUES
(1, 1, 'Google Zoom', 1),
(2, 1, 'Google Duo', 1),
(3, 1, 'Microsoft Skype', 1),
(4, 1, 'Whatsapp', 1),
(5, 2, 'Ruangan Rapat Garuda', 1),
(6, 2, 'Ruangan Rapat LRT', 1),
(7, 2, 'Ruangan Rapat Rajawali', 1),
(8, 2, 'Ruangan Rapat Perpustakaan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `meeting_type`
--

CREATE TABLE `meeting_type` (
  `id` int(11) NOT NULL,
  `meeting_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting_type`
--

INSERT INTO `meeting_type` (`id`, `meeting_type`) VALUES
(1, 'Online'),
(2, 'Offline');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_users`
--

CREATE TABLE `meeting_users` (
  `id` int(11) NOT NULL,
  `zoomid` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `sub_department_id` int(11) NOT NULL,
  `date_created` int(11) NOT NULL,
  `date_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting_users`
--

INSERT INTO `meeting_users` (`id`, `zoomid`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `sub_department_id`, `date_created`, `date_updated`) VALUES
(14, '717 771 7448', 'administrator', 'admin@erapat.com', '3.jpg', '$2y$10$pcXovYvhzZDvmXoOXEskcuHtdSvZOUBy6o9FXGRSrFsOAUfbhwdTS', 1, 1, 1, 1595188759, 1597380771),
(15, '1234567890', 'Admin Keuangan', 'keuangan@erapat.com', 'baray.jpg', '$2y$10$icYu3J.bfvdocnSNdxPUheArwlUhq80r1N3T7p.ZzgJO48lB1ne6O', 2, 1, 2, 1595195583, 1597380790),
(18, '0987654321', 'Admin Humas', 'humas@erapat.com', 'default-avatar.jpg', '$2y$10$5Kud5rfLqdf.7vApjirzNuWjVLKqFqpZt6hGDH/d/5vtjoCcssqRy', 2, 1, 5, 1597213397, 1599549994),
(19, '1111111111', 'Admin Perencanaan', 'perencanaan@erapat.com', 'default-avatar.jpg', '$2y$10$X/U5/ZLzBP60TO6aDsqp3eWpXLevpxVvTSKy0nLGrzCa31osP4xoK', 2, 1, 3, 1598467083, 0),
(20, '123 123 123', 'Kaban Litbang Perhubungan', 'kaban@erapat.com', 'default-avatar.jpg', '$2y$10$w5k9sGFC7SMC8whAPIp/dOknnlHLA.nOP1IypYw6JNVu2aDz0oEse', 4, 1, 14, 1599060092, 1599061311),
(21, '321 321 321', 'Sesban Litbang Perhubungan', 'sesban@erapat.com', 'default-avatar.jpg', '$2y$10$7iKaePzZkNyVg37xciRbUOzFSQ58N92P8L95KwtgXGkzV8u8yBTge', 5, 1, 15, 1599060131, 1599061333),
(22, '2222222222', 'Admin LSDP', 'lsdp@erapat.com', 'default-avatar.jpg', '$2y$10$hNKFHzPaAMTJXuwscLTBEutZtQHxD1CHqJDgOY1Z7u2EJ/ARXPjpy', 2, 1, 9, 1599471171, 0);

-- --------------------------------------------------------

--
-- Table structure for table `meeting_zoom`
--

CREATE TABLE `meeting_zoom` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `zoom_id` varchar(150) NOT NULL,
  `status` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting_zoom`
--

INSERT INTO `meeting_zoom` (`id`, `user_id`, `zoom_id`, `status`, `is_active`) VALUES
(1, 15, '1234567890', 0, 1),
(2, 18, '0987654321', 0, 1),
(3, 19, '1111111111', 0, 1),
(4, 22, '2222222222', 0, 1),
(5, 14, '717 771 7448', 0, 1),
(6, 20, '123 123 123', 0, 1),
(7, 21, '321 321 321', 0, 1);

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
(48, 1, 2),
(56, 1, 31),
(58, 1, 3),
(59, 2, 32),
(62, 1, 32),
(64, 1, 33),
(65, 2, 29),
(66, 1, 34),
(67, 3, 32),
(68, 3, 2),
(69, 4, 2),
(70, 5, 2),
(71, 1, 35),
(72, 2, 35),
(73, 1, 36),
(74, 2, 36);

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
(29, 'Meeting'),
(30, 'Overview'),
(32, 'History'),
(33, 'Media'),
(34, 'Role'),
(35, 'Zoom'),
(36, 'Feed');

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
(2, 'User'),
(3, 'Report'),
(4, 'Kaban'),
(5, 'Sesban');

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
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 0),
(2, 2, 'Profil Pengguna', 'user', 'fas fa-fw fa-user', 1),
(3, 2, 'Edit Profile', 'user/edit', 'fas fa-fw fa-user-edit', 1),
(4, 3, 'Pengelolaan Menu', 'menu', 'fas fa-fw fa-bars', 1),
(5, 3, 'Pengelolaan SubMenu', 'menu/submenu', 'fas fa-fw fa-stream', 1),
(17, 1, 'Pengaturan Hak Akses', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(18, 1, 'Master Data Akun', 'admin/account', 'fas fa-user-friends', 1),
(22, 29, 'Master Data Rapat', 'meeting', 'fas fa-fw fa-calendar-alt', 1),
(24, 1, 'Master Data Sekretariat', 'admin/department', 'fas fa-fw fa-project-diagram', 1),
(25, 30, 'Overview', 'overview', 'fas fa-fw fa-compress-arrows-alt', 1),
(27, 32, 'Riwayat Rapat', 'history', 'fas fa-fw fa-file-signature', 1),
(28, 1, 'Master Data Bagian', 'admin/subdepartment', 'fas fa-fw fa-sitemap', 1),
(29, 33, 'Master Data Media', 'type', 'fas fa-fw fa-phone-volume', 1),
(30, 33, 'Master Data SubMedia', 'type/subtype', 'fas fa-fw fa-phone', 1),
(31, 34, 'Master Data Akses', 'role', 'fas fa-fw fa-user-circle', 1),
(32, 35, 'Master Data Zoom', 'zoom', 'fas fa-fw fa-video', 1),
(33, 36, 'Pembaharuan', 'feed/pembaharuan', 'fas fa-fw fa-sync-alt', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_sub_department`
-- (See below for the actual view)
--
CREATE TABLE `view_sub_department` (
`id` int(11)
,`department_id` int(11)
,`sub_department_name` varchar(225)
,`department_name` varchar(225)
,`is_active` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_sub_type`
-- (See below for the actual view)
--
CREATE TABLE `view_sub_type` (
`id` int(11)
,`type_id` int(11)
,`meeting_subtype` varchar(225)
,`meeting_type` varchar(100)
,`is_active` int(11)
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
,`date_created` int(11)
,`role` varchar(128)
,`date_updated` int(11)
,`sub_department_id` int(11)
,`sub_department_name` varchar(225)
,`department_id` int(11)
,`department_name` varchar(225)
,`zoomid` varchar(64)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_user_meeting`
-- (See below for the actual view)
--
CREATE TABLE `view_user_meeting` (
`id` int(11)
,`user_id` int(11)
,`name` varchar(128)
,`email` varchar(128)
,`role_id` int(11)
,`sub_department_id` int(11)
,`sub_department_name` varchar(225)
,`department_id` int(11)
,`department_name` varchar(225)
,`speakers_name` varchar(225)
,`members_name` varchar(225)
,`files_upload` varchar(225)
,`files_upload1` varchar(225)
,`files_upload2` varchar(225)
,`unique_code` varchar(100)
,`agenda` text
,`start_time` time
,`end_time` time
,`request_status` int(11)
,`sub_type_id` int(11)
,`type_id` int(11)
,`other_online_id` varchar(150)
,`meeting_subtype` varchar(225)
,`meeting_type` varchar(100)
,`start_date` date
,`end_date` date
,`date_requested` date
,`remark_status` text
,`zoomid` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_zoom_meeting`
-- (See below for the actual view)
--
CREATE TABLE `view_zoom_meeting` (
`id` int(11)
,`user_id` int(11)
,`name` varchar(128)
,`sub_department_name` varchar(225)
,`zoom_id` varchar(150)
,`status` int(11)
,`is_active` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `view_sub_department`
--
DROP TABLE IF EXISTS `view_sub_department`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_sub_department`  AS  select `meeting_sub_department`.`id` AS `id`,`meeting_sub_department`.`department_id` AS `department_id`,`meeting_sub_department`.`sub_department_name` AS `sub_department_name`,`meeting_department`.`department_name` AS `department_name`,`meeting_sub_department`.`is_active` AS `is_active` from (`meeting_sub_department` join `meeting_department` on(`meeting_sub_department`.`department_id` = `meeting_department`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_sub_type`
--
DROP TABLE IF EXISTS `view_sub_type`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_sub_type`  AS  select `meeting_sub_type`.`id` AS `id`,`meeting_sub_type`.`type_id` AS `type_id`,`meeting_sub_type`.`meeting_subtype` AS `meeting_subtype`,`meeting_type`.`meeting_type` AS `meeting_type`,`meeting_sub_type`.`is_active` AS `is_active` from (`meeting_sub_type` join `meeting_type` on(`meeting_sub_type`.`type_id` = `meeting_type`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_user_department`
--
DROP TABLE IF EXISTS `view_user_department`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_department`  AS  select `meeting_users`.`id` AS `id`,`meeting_users`.`name` AS `name`,`meeting_users`.`email` AS `email`,`meeting_users`.`image` AS `image`,`meeting_users`.`password` AS `password`,`meeting_users`.`role_id` AS `role_id`,`meeting_users`.`is_active` AS `is_active`,`meeting_users`.`date_created` AS `date_created`,`user_role`.`role` AS `role`,`meeting_users`.`date_updated` AS `date_updated`,`meeting_users`.`sub_department_id` AS `sub_department_id`,`meeting_sub_department`.`sub_department_name` AS `sub_department_name`,`meeting_sub_department`.`department_id` AS `department_id`,`meeting_department`.`department_name` AS `department_name`,`meeting_users`.`zoomid` AS `zoomid` from (((`meeting_users` join `user_role` on(`meeting_users`.`role_id` = `user_role`.`id`)) join `meeting_sub_department` on(`meeting_users`.`sub_department_id` = `meeting_sub_department`.`id`)) join `meeting_department` on(`meeting_sub_department`.`department_id` = `meeting_department`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_user_meeting`
--
DROP TABLE IF EXISTS `view_user_meeting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_meeting`  AS  select `meeting`.`id` AS `id`,`meeting`.`user_id` AS `user_id`,`view_user_department`.`name` AS `name`,`view_user_department`.`email` AS `email`,`view_user_department`.`role_id` AS `role_id`,`view_user_department`.`sub_department_id` AS `sub_department_id`,`view_user_department`.`sub_department_name` AS `sub_department_name`,`view_user_department`.`department_id` AS `department_id`,`view_user_department`.`department_name` AS `department_name`,`meeting`.`speakers_name` AS `speakers_name`,`meeting`.`members_name` AS `members_name`,`meeting`.`files_upload` AS `files_upload`,`meeting`.`files_upload1` AS `files_upload1`,`meeting`.`files_upload2` AS `files_upload2`,`meeting`.`unique_code` AS `unique_code`,`meeting`.`agenda` AS `agenda`,`meeting`.`start_time` AS `start_time`,`meeting`.`end_time` AS `end_time`,`meeting`.`request_status` AS `request_status`,`meeting`.`sub_type_id` AS `sub_type_id`,`meeting_sub_type`.`type_id` AS `type_id`,`meeting`.`other_online_id` AS `other_online_id`,`meeting_sub_type`.`meeting_subtype` AS `meeting_subtype`,`meeting_type`.`meeting_type` AS `meeting_type`,`meeting`.`start_date` AS `start_date`,`meeting`.`end_date` AS `end_date`,`meeting`.`date_requested` AS `date_requested`,`meeting`.`remark_status` AS `remark_status`,`meeting`.`zoomid` AS `zoomid` from (((`meeting` join `view_user_department` on(`meeting`.`user_id` = `view_user_department`.`id`)) join `meeting_sub_type` on(`meeting`.`sub_type_id` = `meeting_sub_type`.`id`)) join `meeting_type` on(`meeting_sub_type`.`type_id` = `meeting_type`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_zoom_meeting`
--
DROP TABLE IF EXISTS `view_zoom_meeting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_zoom_meeting`  AS  select `meeting_zoom`.`id` AS `id`,`meeting_zoom`.`user_id` AS `user_id`,`meeting_users`.`name` AS `name`,`meeting_sub_department`.`sub_department_name` AS `sub_department_name`,`meeting_zoom`.`zoom_id` AS `zoom_id`,`meeting_zoom`.`status` AS `status`,`meeting_zoom`.`is_active` AS `is_active` from ((`meeting_zoom` join `meeting_users` on(`meeting_zoom`.`user_id` = `meeting_users`.`id`)) join `meeting_sub_department` on(`meeting_users`.`sub_department_id` = `meeting_sub_department`.`id`)) ;

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
-- Indexes for table `meeting_sub_department`
--
ALTER TABLE `meeting_sub_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting_sub_type`
--
ALTER TABLE `meeting_sub_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting_type`
--
ALTER TABLE `meeting_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting_users`
--
ALTER TABLE `meeting_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting_zoom`
--
ALTER TABLE `meeting_zoom`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meeting_department`
--
ALTER TABLE `meeting_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `meeting_place`
--
ALTER TABLE `meeting_place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meeting_sub_department`
--
ALTER TABLE `meeting_sub_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `meeting_sub_type`
--
ALTER TABLE `meeting_sub_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `meeting_type`
--
ALTER TABLE `meeting_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meeting_users`
--
ALTER TABLE `meeting_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `meeting_zoom`
--
ALTER TABLE `meeting_zoom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
