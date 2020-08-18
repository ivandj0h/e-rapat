-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Agu 2020 pada 06.40
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.8

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
-- Struktur dari tabel `meeting`
--

CREATE TABLE `meeting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sub_type_id` int(11) NOT NULL,
  `speakers_name` varchar(225) NOT NULL,
  `members_name` varchar(225) NOT NULL,
  `files_upload` varchar(225) NOT NULL,
  `unique_code` varchar(100) NOT NULL,
  `agenda` text NOT NULL,
  `date_requested` date NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `request_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `meeting`
--

INSERT INTO `meeting` (`id`, `user_id`, `sub_type_id`, `speakers_name`, `members_name`, `files_upload`, `unique_code`, `agenda`, `date_requested`, `start_date`, `end_date`, `start_time`, `end_time`, `request_status`) VALUES
(1, 14, 2, 'narasumber', 'peserta', '', '5f326fb9aca6d', 'testing', '2020-08-11', '2020-08-11', '2020-08-11', '17:00:00', '18:00:00', 0),
(2, 14, 6, 'speaker', 'participant,participant2', '', '5f335cc7f101a', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', '2020-08-12', '2020-08-11', '2020-08-11', '10:00:00', '11:00:00', 0),
(3, 15, 1, 'testing', 'test,test-test', '', '5f3384701dea5', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', '2020-08-12', '2020-08-12', '2020-08-12', '13:00:00', '14:00:00', 0),
(4, 15, 1, 'adi', 'anto', '', '5f338a6bbbbf7', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', '2020-08-12', '2020-08-12', '2020-08-12', '15:00:00', '16:00:00', 0),
(5, 18, 3, 'humas', 'humas1,humas2', '', '5f338be9e8c46', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', '2020-08-12', '2020-08-12', '2020-08-12', '13:00:00', '14:00:00', 0),
(6, 18, 1, 'xein', '', '', '5f33905333ad1', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', '2020-08-12', '2020-08-13', '2020-08-13', '16:00:00', '17:00:00', 0),
(7, 14, 6, 'ddd', 'hahaha', '', '5f3397c78057b', 'asdsdasd', '2020-08-12', '2020-08-13', '2020-08-14', '14:00:00', '15:00:00', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `meeting_department`
--

CREATE TABLE `meeting_department` (
  `id` int(11) NOT NULL,
  `department_name` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `meeting_department`
--

INSERT INTO `meeting_department` (`id`, `department_name`) VALUES
(1, 'Super Admin'),
(2, 'Sekretariat Badan Litbang Perhubungan'),
(3, 'Pusat Penelitian dan Pengembangan Transportasi Udara'),
(4, 'Pusat Penelitian dan Pengembangan Transportasi LSDP'),
(5, 'Pusat Penelitian dan Pengembangan Transportasi Jalan dan Perkertaapian'),
(6, 'Pusat Penelitian dan Pengembangan Transportasi Antarmoda');

-- --------------------------------------------------------

--
-- Struktur dari tabel `meeting_place`
--

CREATE TABLE `meeting_place` (
  `id` int(11) NOT NULL,
  `place_name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `meeting_sub_department`
--

CREATE TABLE `meeting_sub_department` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `sub_department_name` varchar(225) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `meeting_sub_department`
--

INSERT INTO `meeting_sub_department` (`id`, `department_id`, `sub_department_name`, `is_active`) VALUES
(1, 1, 'Administrator', 1),
(2, 2, 'Bidang Keuangan dan Perlengkapan', 1),
(3, 2, 'Bidang Perencanaan dan Kerja Sama', 1),
(4, 2, 'Bidang Kepegawaian', 1),
(5, 2, 'Bidang Data Humas dan Publikasi', 1),
(6, 3, 'Bidang Pelaporan dan Evaluasi Puslitbang Transportasi Udara', 1),
(7, 3, 'Bidang Pengembangan Teknologi dan Penunjang Penelitian Transportasi Puslitbang Udara', 1),
(8, 4, 'Bidang Pelaporan dan Evaluasi Puslitbang Transportasi LSDP', 1),
(9, 4, 'Bidang Pengembangan Teknologi dan Penunjang Penelitian Puslitbang Transportasi LSDP', 1),
(10, 5, 'Bidang Pelaporan dan Evaluasi Puslitbang Transportasi Jalan dan Perkertaapian', 1),
(11, 5, 'Bidang Pengembangan Teknologi dan Penunjang Penelitian Puslitbang Transportasi Jalan dan Perkeretaapian', 1),
(12, 6, 'Bidang Pelaporan dan Evaluasi Puslitbang Transportasi Antarmoda', 1),
(13, 6, 'Bidang Pengembangan Teknologi dan Penunjang Transportasi Antar Moda', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `meeting_sub_type`
--

CREATE TABLE `meeting_sub_type` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `meeting_subtype` varchar(225) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `meeting_sub_type`
--

INSERT INTO `meeting_sub_type` (`id`, `type_id`, `meeting_subtype`, `is_active`) VALUES
(1, 1, 'Google Zoom', 1),
(2, 1, 'Google Duo', 1),
(3, 1, 'Microsoft Skype', 1),
(4, 1, 'Whatsapp', 1),
(5, 2, 'Ruangan Meeting Pertama', 1),
(6, 2, 'Ruangan Meeting Kedua', 1),
(7, 2, 'Ruangan Meeting Ketiga', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `meeting_type`
--

CREATE TABLE `meeting_type` (
  `id` int(11) NOT NULL,
  `meeting_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `meeting_type`
--

INSERT INTO `meeting_type` (`id`, `meeting_type`) VALUES
(1, 'Online'),
(2, 'Offline');

-- --------------------------------------------------------

--
-- Struktur dari tabel `meeting_users`
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
-- Dumping data untuk tabel `meeting_users`
--

INSERT INTO `meeting_users` (`id`, `zoomid`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `sub_department_id`, `date_created`, `date_updated`) VALUES
(14, '717 771 7448', 'administrator', 'admin@admin.com', '3.jpg', '$2y$10$pcXovYvhzZDvmXoOXEskcuHtdSvZOUBy6o9FXGRSrFsOAUfbhwdTS', 1, 1, 1, 1595188759, 1597380771),
(15, '5f14c0bfa4259', 'Admin Keuangan', 'user@user.com', 'baray.jpg', '$2y$10$icYu3J.bfvdocnSNdxPUheArwlUhq80r1N3T7p.ZzgJO48lB1ne6O', 2, 1, 2, 1595195583, 1597380790),
(18, '5f338ad554752', 'Admin Humas', 'humas@humas.com', 'default-avatar.jpg', '$2y$10$d6JBLsipnrSfEnzrU3btPubP8miTi6yJCYNZPFZS/j6hM9pzMTpvS', 3, 1, 5, 1597213397, 1597381280);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_access_menu`
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
(68, 3, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu'),
(29, 'Meeting'),
(30, 'Overview'),
(32, 'History'),
(33, 'Media'),
(34, 'Role');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Report');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_sub_menu`
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
-- Dumping data untuk tabel `user_sub_menu`
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
(28, 1, 'Master Data Bidang', 'admin/subdepartment', 'fas fa-fw fa-sitemap', 1),
(29, 33, 'Master Data Media', 'type', 'fas fa-fw fa-phone-volume', 1),
(30, 33, 'Master Data SubMedia', 'type/subtype', 'fas fa-fw fa-phone', 1),
(31, 34, 'Master Data Akses', 'role', 'fas fa-fw fa-user-circle', 1);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_sub_department`
-- (Lihat di bawah untuk tampilan aktual)
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
-- Stand-in struktur untuk tampilan `view_sub_type`
-- (Lihat di bawah untuk tampilan aktual)
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
-- Stand-in struktur untuk tampilan `view_user_department`
-- (Lihat di bawah untuk tampilan aktual)
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
-- Stand-in struktur untuk tampilan `view_user_meeting`
-- (Lihat di bawah untuk tampilan aktual)
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
,`unique_code` varchar(100)
,`agenda` text
,`start_time` time
,`end_time` time
,`request_status` int(11)
,`sub_type_id` int(11)
,`type_id` int(11)
,`meeting_subtype` varchar(225)
,`meeting_type` varchar(100)
,`start_date` date
,`end_date` date
,`date_requested` date
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_sub_department`
--
DROP TABLE IF EXISTS `view_sub_department`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_sub_department`  AS  select `meeting_sub_department`.`id` AS `id`,`meeting_sub_department`.`department_id` AS `department_id`,`meeting_sub_department`.`sub_department_name` AS `sub_department_name`,`meeting_department`.`department_name` AS `department_name`,`meeting_sub_department`.`is_active` AS `is_active` from (`meeting_sub_department` join `meeting_department` on(`meeting_sub_department`.`department_id` = `meeting_department`.`id`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_sub_type`
--
DROP TABLE IF EXISTS `view_sub_type`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_sub_type`  AS  select `meeting_sub_type`.`id` AS `id`,`meeting_sub_type`.`type_id` AS `type_id`,`meeting_sub_type`.`meeting_subtype` AS `meeting_subtype`,`meeting_type`.`meeting_type` AS `meeting_type`,`meeting_sub_type`.`is_active` AS `is_active` from (`meeting_sub_type` join `meeting_type` on(`meeting_sub_type`.`type_id` = `meeting_type`.`id`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_user_department`
--
DROP TABLE IF EXISTS `view_user_department`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_department`  AS  select `meeting_users`.`id` AS `id`,`meeting_users`.`name` AS `name`,`meeting_users`.`email` AS `email`,`meeting_users`.`image` AS `image`,`meeting_users`.`password` AS `password`,`meeting_users`.`role_id` AS `role_id`,`meeting_users`.`is_active` AS `is_active`,`meeting_users`.`date_created` AS `date_created`,`user_role`.`role` AS `role`,`meeting_users`.`date_updated` AS `date_updated`,`meeting_users`.`sub_department_id` AS `sub_department_id`,`meeting_sub_department`.`sub_department_name` AS `sub_department_name`,`meeting_sub_department`.`department_id` AS `department_id`,`meeting_department`.`department_name` AS `department_name`,`meeting_users`.`zoomid` AS `zoomid` from (((`meeting_users` join `user_role` on(`meeting_users`.`role_id` = `user_role`.`id`)) join `meeting_sub_department` on(`meeting_users`.`sub_department_id` = `meeting_sub_department`.`id`)) join `meeting_department` on(`meeting_sub_department`.`department_id` = `meeting_department`.`id`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_user_meeting`
--
DROP TABLE IF EXISTS `view_user_meeting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_meeting`  AS  select `meeting`.`id` AS `id`,`meeting`.`user_id` AS `user_id`,`view_user_department`.`name` AS `name`,`view_user_department`.`email` AS `email`,`view_user_department`.`role_id` AS `role_id`,`view_user_department`.`sub_department_id` AS `sub_department_id`,`view_user_department`.`sub_department_name` AS `sub_department_name`,`view_user_department`.`department_id` AS `department_id`,`view_user_department`.`department_name` AS `department_name`,`meeting`.`speakers_name` AS `speakers_name`,`meeting`.`members_name` AS `members_name`,`meeting`.`files_upload` AS `files_upload`,`meeting`.`unique_code` AS `unique_code`,`meeting`.`agenda` AS `agenda`,`meeting`.`start_time` AS `start_time`,`meeting`.`end_time` AS `end_time`,`meeting`.`request_status` AS `request_status`,`meeting`.`sub_type_id` AS `sub_type_id`,`meeting_sub_type`.`type_id` AS `type_id`,`meeting_sub_type`.`meeting_subtype` AS `meeting_subtype`,`meeting_type`.`meeting_type` AS `meeting_type`,`meeting`.`start_date` AS `start_date`,`meeting`.`end_date` AS `end_date`,`meeting`.`date_requested` AS `date_requested` from (((`meeting` join `view_user_department` on(`meeting`.`user_id` = `view_user_department`.`id`)) join `meeting_sub_type` on(`meeting`.`sub_type_id` = `meeting_sub_type`.`id`)) join `meeting_type` on(`meeting_sub_type`.`type_id` = `meeting_type`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `meeting_department`
--
ALTER TABLE `meeting_department`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `meeting_place`
--
ALTER TABLE `meeting_place`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `meeting_sub_department`
--
ALTER TABLE `meeting_sub_department`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `meeting_sub_type`
--
ALTER TABLE `meeting_sub_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `meeting_type`
--
ALTER TABLE `meeting_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `meeting_users`
--
ALTER TABLE `meeting_users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `meeting`
--
ALTER TABLE `meeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `meeting_department`
--
ALTER TABLE `meeting_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `meeting_place`
--
ALTER TABLE `meeting_place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `meeting_sub_department`
--
ALTER TABLE `meeting_sub_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `meeting_sub_type`
--
ALTER TABLE `meeting_sub_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `meeting_type`
--
ALTER TABLE `meeting_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `meeting_users`
--
ALTER TABLE `meeting_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
