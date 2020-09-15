-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2020 at 09:10 PM
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
-- Table structure for table `addon`
--

CREATE TABLE `addon` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `installed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `addon`
--

INSERT INTO `addon` (`id`, `class`, `name`, `description`, `version`, `status`, `installed`) VALUES
('google_analytics', 'app\\modules\\addons\\modules\\google_analytics\\Module', 'Google Analytics', NULL, '1.0', 1, 1),
('webhooks', 'app\\modules\\addons\\modules\\webhooks\\Module', 'Webhooks', NULL, '1.2', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_google_analytics`
--

CREATE TABLE `addon_google_analytics` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `tracking_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tracking_domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `anonymize_ip` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addon_webhooks`
--

CREATE TABLE `addon_webhooks` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `url` varchar(2083) COLLATE utf8_unicode_ci NOT NULL,
  `handshake_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `json` tinyint(1) NOT NULL DEFAULT 0,
  `alias` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `app_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `etl_tstamp` int(11) DEFAULT NULL,
  `collector_tstamp` int(11) NOT NULL,
  `dvce_tstamp` bigint(20) DEFAULT NULL,
  `event` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_id` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_id` int(11) DEFAULT NULL,
  `name_tracker` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v_tracker` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v_collector` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `v_etl` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_ipaddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_fingerprint` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain_userid` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain_sessionidx` smallint(6) DEFAULT NULL,
  `network_userid` varchar(38) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_region` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_city` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_zipcode` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_latitude` double DEFAULT NULL,
  `geo_longitude` double DEFAULT NULL,
  `geo_region_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_title` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_referrer` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_urlscheme` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_urlhost` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_urlport` int(11) DEFAULT NULL,
  `page_urlpath` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_urlquery` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_urlfragment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_urlscheme` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_urlhost` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_urlport` int(11) DEFAULT NULL,
  `refr_urlpath` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_urlquery` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_urlfragment` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_medium` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_source` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_term` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mkt_medium` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mkt_source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mkt_term` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mkt_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mkt_campaign` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contexts` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `se_category` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `se_action` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `se_label` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `se_property` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `se_value` double DEFAULT NULL,
  `unstruct_event` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tr_orderid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tr_affiliation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tr_total` decimal(18,2) DEFAULT NULL,
  `tr_tax` decimal(18,2) DEFAULT NULL,
  `tr_shipping` decimal(18,2) DEFAULT NULL,
  `tr_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tr_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tr_country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ti_orderid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ti_sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ti_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ti_category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ti_price` decimal(18,2) DEFAULT NULL,
  `ti_quantity` int(11) DEFAULT NULL,
  `pp_xoffset_min` int(11) DEFAULT NULL,
  `pp_xoffset_max` int(11) DEFAULT NULL,
  `pp_yoffset_min` int(11) DEFAULT NULL,
  `pp_yoffset_max` int(11) DEFAULT NULL,
  `useragent` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_family` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_version` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_renderengine` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_features_pdf` tinyint(1) DEFAULT NULL,
  `br_features_flash` tinyint(1) DEFAULT NULL,
  `br_features_java` tinyint(1) DEFAULT NULL,
  `br_features_director` tinyint(1) DEFAULT NULL,
  `br_features_quicktime` tinyint(1) DEFAULT NULL,
  `br_features_realplayer` tinyint(1) DEFAULT NULL,
  `br_features_windowsmedia` tinyint(1) DEFAULT NULL,
  `br_features_gears` tinyint(1) DEFAULT NULL,
  `br_features_silverlight` tinyint(1) DEFAULT NULL,
  `br_cookies` tinyint(1) DEFAULT NULL,
  `br_colordepth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_viewwidth` int(11) DEFAULT NULL,
  `br_viewheight` int(11) DEFAULT NULL,
  `os_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os_family` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os_manufacturer` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os_timezone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dvce_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dvce_ismobile` tinyint(1) DEFAULT NULL,
  `dvce_screenwidth` int(11) DEFAULT NULL,
  `dvce_screenheight` int(11) DEFAULT NULL,
  `doc_charset` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc_width` int(11) DEFAULT NULL,
  `doc_height` int(11) DEFAULT NULL,
  `geo_timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mkt_clickid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mkt_network` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `etl_tags` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dvce_sent_tstamp` bigint(20) DEFAULT NULL,
  `domain_sessionid` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`app_id`, `platform`, `etl_tstamp`, `collector_tstamp`, `dvce_tstamp`, `event`, `event_id`, `txn_id`, `name_tracker`, `v_tracker`, `v_collector`, `v_etl`, `user_id`, `user_ipaddress`, `user_fingerprint`, `domain_userid`, `domain_sessionidx`, `network_userid`, `geo_country`, `geo_region`, `geo_city`, `geo_zipcode`, `geo_latitude`, `geo_longitude`, `geo_region_name`, `page_url`, `page_title`, `page_referrer`, `page_urlscheme`, `page_urlhost`, `page_urlport`, `page_urlpath`, `page_urlquery`, `page_urlfragment`, `refr_urlscheme`, `refr_urlhost`, `refr_urlport`, `refr_urlpath`, `refr_urlquery`, `refr_urlfragment`, `refr_medium`, `refr_source`, `refr_term`, `mkt_medium`, `mkt_source`, `mkt_term`, `mkt_content`, `mkt_campaign`, `contexts`, `se_category`, `se_action`, `se_label`, `se_property`, `se_value`, `unstruct_event`, `tr_orderid`, `tr_affiliation`, `tr_total`, `tr_tax`, `tr_shipping`, `tr_city`, `tr_state`, `tr_country`, `ti_orderid`, `ti_sku`, `ti_name`, `ti_category`, `ti_price`, `ti_quantity`, `pp_xoffset_min`, `pp_xoffset_max`, `pp_yoffset_min`, `pp_yoffset_max`, `useragent`, `br_name`, `br_family`, `br_version`, `br_type`, `br_renderengine`, `br_lang`, `br_features_pdf`, `br_features_flash`, `br_features_java`, `br_features_director`, `br_features_quicktime`, `br_features_realplayer`, `br_features_windowsmedia`, `br_features_gears`, `br_features_silverlight`, `br_cookies`, `br_colordepth`, `br_viewwidth`, `br_viewheight`, `os_name`, `os_family`, `os_manufacturer`, `os_timezone`, `dvce_type`, `dvce_ismobile`, `dvce_screenwidth`, `dvce_screenheight`, `doc_charset`, `doc_width`, `doc_height`, `geo_timezone`, `mkt_clickid`, `mkt_network`, `etl_tags`, `dvce_sent_tstamp`, `domain_sessionid`) VALUES
('18', 'web', NULL, 1600082607, 1600082607083, 'pv', '060b5290-34ff-44d2-89e9-e139ab5db98c', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 530, 204, NULL, NULL, NULL, NULL, 1600082607086, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600082651, 1600082651746, 'pv', '5e159e1b-442f-4b3b-bdf7-dfe1e69d694f', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 530, 214, NULL, NULL, NULL, NULL, 1600082651749, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600082689, 1600082689018, 'pv', '6b38061c-2c06-4a57-a6bb-348898dae797', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 530, 220, NULL, NULL, NULL, NULL, 1600082689022, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600082809, 1600082809023, 'pv', 'be3bec6a-8910-461b-8c14-6fc3ed562ecd', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 530, 483, NULL, NULL, NULL, NULL, 1600082809027, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600082823, 1600082823004, 'pv', '613c70b4-92e3-4d64-b168-58b509704fc1', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 530, 483, NULL, NULL, NULL, NULL, 1600082823010, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083016, 1600083016624, 'pv', 'c09438c7-38c6-42ed-8f49-0f58a7e438c9', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 530, 1051, NULL, NULL, NULL, NULL, 1600083016628, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083107, 1600083107378, 'pv', '6ebebec3-481b-47a8-a78e-9c353207b52b', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 188, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 530, 1051, NULL, NULL, NULL, NULL, 1600083107382, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083227, 1600083227014, 'pv', 'cb66c686-863e-428c-a5f8-a6c00009270e', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 515, 1348, NULL, NULL, NULL, NULL, 1600083227018, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083249, 1600083248889, 'pv', '23bbc968-e4b5-4301-9728-e0137d043085', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18&t=0', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18&t=0', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 530, 1051, NULL, NULL, NULL, NULL, 1600083248891, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083256, 1600083256720, 'pv', '695b3a60-ffc1-4610-956c-8963dfbb1872', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18&b=0', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18&b=0', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 1170, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 1170, 1468, NULL, NULL, NULL, NULL, 1600083256723, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083272, 1600083272322, 'pv', 'fbe42ab5-c845-48ea-8474-74957540818e', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18&b=0&js=0', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18&b=0&js=0', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 1170, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 1170, 1468, NULL, NULL, NULL, NULL, 1600083272326, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083275, 1600083275851, 'se', '38b2a27e-6e0e-45c2-8f66-d336d8b17220', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18&b=0&js=0', NULL, 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18&b=0&js=0', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'form', 'fill', 'start', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 1170, 1467, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 1170, 1468, NULL, NULL, NULL, NULL, 1600083275855, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083403, 1600083403612, 'pv', 'e8b1990a-ee0e-419b-b0e1-d38e2d2bd5bd', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18&b=0', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18&b=0', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 1170, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 1170, 1176, NULL, NULL, NULL, NULL, 1600083403616, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083411, 1600083411320, 'pv', '3b7080e9-99a5-4f67-aac8-16f600b14515', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 1231, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 515, 1231, NULL, NULL, NULL, NULL, 1600083411326, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083469, 1600083468950, 'pv', '6c7c1c50-c10a-4a1b-9282-31c11b65b8de', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 515, 1506, NULL, NULL, NULL, NULL, 1600083468955, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083477, 1600083477561, 'pv', '3ef834b4-d3c1-4dc2-ade1-65e31c6dbff6', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18&b=0', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18&b=0', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 1170, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 1170, 1531, NULL, NULL, NULL, NULL, 1600083477565, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083560, 1600083560611, 'pv', '52f85561-2996-4dee-a413-65a90f46330d', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 515, 1356, NULL, NULL, NULL, NULL, 1600083560615, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083564, 1600083564302, 'se', 'aa9937e0-8667-40f5-af82-3eaac90d627d', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18', NULL, 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'form', 'fill', 'start', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 1356, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 515, 1356, NULL, NULL, NULL, NULL, 1600083564306, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083572, 1600083572598, 'pv', '521e8293-3172-4218-a84e-27ce2a59a223', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18&b=0', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18&b=0', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 1170, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 1170, 1368, NULL, NULL, NULL, NULL, 1600083572602, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083609, 1600083609063, 'pv', 'e70dbdce-4137-472b-b92e-21c2f7bd6f23', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 515, 1225, NULL, NULL, NULL, NULL, 1600083609067, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083619, 1600083619275, 'pv', 'a3242655-810e-4f81-98f1-3c3d187b6161', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18&b=0&js=0', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18&b=0&js=0', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 1170, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 1170, 1276, NULL, NULL, NULL, NULL, 1600083619279, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083623, 1600083623007, 'se', '8ce382d1-3c0f-4ea7-8fff-7fc209d6d7d0', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18&b=0&js=0', NULL, 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18&b=0&js=0', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'form', 'fill', 'start', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 1170, 1276, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 1170, 1276, NULL, NULL, NULL, NULL, 1600083623010, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600083646, 1600083645913, 'pv', '6896ac2f-76e1-45a3-880a-fad9da6f9c27', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/app/form?id=18&b=0', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/app/form', 'id=18&b=0', NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 1170, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 1170, 1276, NULL, NULL, NULL, NULL, 1600083645920, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600084134, 1600084134371, 'pv', '0a1fc744-af7e-4f41-a315-b233f9bef9f2', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/forms/presensi-rapat-penyusunan-data-statistik-semestar-1-badan-litbang-perhubungan-senin-14-september-2020', 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/forms/presensi-rapat-penyusunan-data-statistik-semestar-1-badan-litbang-perhubungan-senin-14-september-2020', NULL, NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 150, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 515, 1225, NULL, NULL, NULL, NULL, 1600084134375, 'dbaf1293-94fd-4302-aae5-72eb36cf13f6'),
('18', 'web', NULL, 1600087093, 1600087092970, 'se', '4c2b7e86-815d-4298-a501-77aa63c4ea32', NULL, 't18', 'js-2.6.1', '1.0', NULL, NULL, '81.2.69.160', '2727505273', 'bf73b968-80a4-4056-a697-cba60142ce43', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/app/forms/presensi-rapat-penyusunan-data-statistik-semestar-1-badan-litbang-perhubungan-senin-14-september-2020', NULL, 'http://localhost/app/form/share?id=18', 'http', 'localhost', NULL, '/app/forms/presensi-rapat-penyusunan-data-statistik-semestar-1-badan-litbang-perhubungan-senin-14-september-2020', NULL, NULL, 'http', 'localhost', NULL, '/app/form/share', 'id=18', NULL, 'internal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'form', 'fill', 'start', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'Chrome', 'Chrome', '85.0', 'browser', 'Blink', 'en-US', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '24', 515, 1225, 'Windows', 'Windows', '', 'Asia/Jakarta', 'desktop', 0, 1366, 768, 'UTF-8', 515, 1225, NULL, NULL, NULL, NULL, 1600087092974, 'bd84efc4-50bf-4a33-b22b-cd18efbcde26');

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `use_password` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorized_urls` tinyint(1) NOT NULL DEFAULT 0,
  `urls` varchar(2555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `schedule` tinyint(1) NOT NULL DEFAULT 0,
  `schedule_start_date` int(11) DEFAULT NULL,
  `schedule_end_date` int(11) DEFAULT NULL,
  `total_limit` tinyint(1) NOT NULL DEFAULT 0,
  `total_limit_number` int(11) DEFAULT NULL,
  `total_limit_period` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_limit` tinyint(1) NOT NULL DEFAULT 0,
  `ip_limit_number` int(11) DEFAULT NULL,
  `ip_limit_period` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submission_number` int(11) DEFAULT 1,
  `submission_number_prefix` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submission_number_suffix` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submission_number_width` int(11) DEFAULT NULL,
  `save` tinyint(1) NOT NULL DEFAULT 1,
  `resume` tinyint(1) NOT NULL DEFAULT 0,
  `autocomplete` tinyint(1) NOT NULL DEFAULT 1,
  `novalidate` tinyint(1) NOT NULL DEFAULT 0,
  `analytics` tinyint(1) NOT NULL DEFAULT 1,
  `honeypot` tinyint(1) NOT NULL DEFAULT 1,
  `recaptcha` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en-US',
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `form`
--

INSERT INTO `form` (`id`, `name`, `slug`, `status`, `use_password`, `password`, `authorized_urls`, `urls`, `schedule`, `schedule_start_date`, `schedule_end_date`, `total_limit`, `total_limit_number`, `total_limit_period`, `ip_limit`, `ip_limit_number`, `ip_limit_period`, `submission_number`, `submission_number_prefix`, `submission_number_suffix`, `submission_number_width`, `save`, `resume`, `autocomplete`, `novalidate`, `analytics`, `honeypot`, `recaptcha`, `language`, `message`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(18, 'Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020', 'presensi-rapat-penyusunan-data-statistik-semestar-1-badan-litbang-perhubungan-senin-14-september-2020', 1, 0, '12345', 0, '', 0, NULL, NULL, 0, NULL, '', 0, NULL, '', 1, '', '', NULL, 1, 1, 1, 0, 1, 1, 0, 'id-ID', 'Terima kasih telah melakukan Absen', 1, 1, 1600082597, 1600083600);

-- --------------------------------------------------------

--
-- Table structure for table `form_chart`
--

CREATE TABLE `form_chart` (
  `form_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `gsX` int(11) DEFAULT NULL,
  `gsY` int(11) DEFAULT NULL,
  `gsW` int(11) DEFAULT NULL,
  `gsH` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `form_confirmation`
--

CREATE TABLE `form_confirmation` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `type` int(1) NOT NULL DEFAULT 0,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_email` tinyint(1) NOT NULL DEFAULT 0,
  `mail_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_from_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_receipt_copy` tinyint(1) DEFAULT 0,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `form_confirmation`
--

INSERT INTO `form_confirmation` (`id`, `form_id`, `type`, `message`, `url`, `send_email`, `mail_to`, `mail_from`, `mail_subject`, `mail_message`, `mail_from_name`, `mail_receipt_copy`, `created_at`, `updated_at`) VALUES
(18, 18, 0, '', '', 0, '', '', '', '', '', 0, 1600082598, 1600083600);

-- --------------------------------------------------------

--
-- Table structure for table `form_data`
--

CREATE TABLE `form_data` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `builder` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `fields` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `html` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `height` int(5) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `form_data`
--

INSERT INTO `form_data` (`id`, `form_id`, `builder`, `fields`, `html`, `height`, `created_at`, `updated_at`) VALUES
(18, 18, '{\"settings\":{\"name\":\"Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020\",\"canvas\":\"#canvas\",\"disabledFieldset\":false,\"layoutSelected\":\"form-horizontal\",\"layouts\":[{\"id\":\"\",\"name\":\"Vertical\"},{\"id\":\"form-horizontal\",\"name\":\"Horizontal\"},{\"id\":\"form-inline\",\"name\":\"Inline\"}],\"formSteps\":{\"title\":\"formSteps.title\",\"fields\":{\"id\":{\"label\":\"formSteps.id\",\"type\":\"input\",\"value\":\"formSteps\",\"name\":\"id\"},\"steps\":{\"label\":\"formSteps.steps\",\"type\":\"textarea-split\",\"value\":[],\"name\":\"steps\"},\"progressBar\":{\"label\":\"formSteps.progressBar\",\"type\":\"checkbox\",\"value\":false,\"name\":\"progressBar\"},\"noTitles\":{\"label\":\"formSteps.noTitles\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noTitles\"},\"noStages\":{\"label\":\"formSteps.noStages\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noStages\"},\"noSteps\":{\"label\":\"formSteps.noSteps\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noSteps\"}}}},\"initForm\":[{\"name\":\"heading\",\"title\":\"heading.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"heading_0\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"input\",\"value\":\"Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020\",\"name\":\"text\"},\"type\":{\"label\":\"component.type\",\"type\":\"select\",\"value\":[{\"value\":\"h1\",\"selected\":false,\"label\":\"H1\"},{\"value\":\"h2\",\"selected\":false,\"label\":\"H2\"},{\"value\":\"h3\",\"selected\":true,\"label\":\"H3\"},{\"value\":\"h4\",\"selected\":false,\"label\":\"H4\"},{\"value\":\"h5\",\"selected\":false,\"label\":\"H5\"},{\"value\":\"h6\",\"selected\":false,\"label\":\"H6\"}],\"name\":\"type\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"legend\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"spacer\",\"title\":\"spacer.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"spacer_715442\",\"name\":\"id\"},\"height\":{\"label\":\"component.height\",\"type\":\"number\",\"value\":\"10\",\"name\":\"height\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-xs-12\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"paragraph\",\"title\":\"paragraph.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"paragraph_0\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"textarea\",\"value\":\"Hari\\/Tanggal : Senin, 14 September 2020\",\"name\":\"text\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"paragraph\",\"title\":\"paragraph.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"paragraph_904377\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"textarea\",\"value\":\"Waktu : Pukul 16:00 WIB\",\"name\":\"text\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-xs-12\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"paragraph\",\"title\":\"paragraph.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"paragraph_693456\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"textarea\",\"value\":\"Media : Video Confrence Zoom\",\"name\":\"text\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-xs-12\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"paragraph\",\"title\":\"paragraph.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"paragraph_367672\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"textarea\",\"value\":\"Agenda : Penyusunan Data Statistik Semestar 1\",\"name\":\"text\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-xs-12\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"spacer\",\"title\":\"spacer.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"spacer_742220\",\"name\":\"id\"},\"height\":{\"label\":\"component.height\",\"type\":\"number\",\"value\":\"50\",\"name\":\"height\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-xs-12\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_442458\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":true,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Nama Lengkap\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":true,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-xs-12\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_51160\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":true,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"NIP\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":true,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-xs-12\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_671020\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":true,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Unit Kerja\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":true,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-xs-12\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_932833\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":true,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Jabatan\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":true,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-xs-12\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_814491\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":true,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"No. HP\\/Telp\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":true,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-xs-12\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"email\",\"title\":\"email.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"email_754924\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Alamat Email\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":true,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-xs-12\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"checkdns\":{\"label\":\"component.checkDNS\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"checkdns\"},\"multiple\":{\"label\":\"component.multiple\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"multiple\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"signature\",\"title\":\"signature.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"signature_163216\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Signature\",\"name\":\"label\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":true,\"name\":\"required\"},\"clear\":{\"label\":\"component.clear\",\"type\":\"checkbox\",\"value\":true,\"name\":\"clear\"},\"undo\":{\"label\":\"component.undo\",\"type\":\"checkbox\",\"value\":false,\"name\":\"undo\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"width\":{\"label\":\"component.width\",\"type\":\"input\",\"value\":\"400\",\"advanced\":true,\"name\":\"width\"},\"height\":{\"label\":\"component.height\",\"type\":\"input\",\"value\":\"200\",\"advanced\":true,\"name\":\"height\"},\"color\":{\"label\":\"component.color\",\"type\":\"input\",\"value\":\"black\",\"advanced\":true,\"name\":\"color\"},\"clearText\":{\"label\":\"component.clearText\",\"type\":\"input\",\"value\":\"Clear\",\"advanced\":true,\"name\":\"clearText\"},\"undoText\":{\"label\":\"component.undoText\",\"type\":\"input\",\"value\":\"Undo\",\"advanced\":true,\"name\":\"undoText\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-xs-12\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"button\",\"title\":\"button.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"button_876357\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.type\",\"type\":\"select\",\"value\":[{\"value\":\"submit\",\"selected\":true,\"label\":\"Submit\"},{\"value\":\"reset\",\"selected\":false,\"label\":\"Reset\"},{\"value\":\"image\",\"selected\":false,\"label\":\"Image\"},{\"value\":\"button\",\"selected\":false,\"label\":\"Button\"}],\"name\":\"inputType\"},\"buttonText\":{\"label\":\"component.buttonText\",\"type\":\"input\",\"value\":\"Submit\",\"name\":\"buttonText\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"label\"},\"src\":{\"label\":\"component.src\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"src\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"btn btn-success\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-xs-12\",\"advanced\":true,\"name\":\"containerClass\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"paragraph\",\"title\":\"paragraph.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"paragraph_286208\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"textarea\",\"value\":\"Mohon untuk diisi dengan benar\",\"name\":\"text\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-xs-12\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false}],\"height\":959}', '[{\"tagName\":\"input\",\"type\":\"text\",\"name\":\"text_442458\",\"id\":\"text_442458\",\"label\":\"Nama Lengkap\",\"value\":\"\",\"class\":\"form-control\",\"lineNumber\":40,\"required\":true,\"alias\":\"\"},{\"tagName\":\"input\",\"type\":\"text\",\"name\":\"text_51160\",\"id\":\"text_51160\",\"label\":\"NIP\",\"value\":\"\",\"class\":\"form-control\",\"lineNumber\":46,\"required\":true,\"alias\":\"\"},{\"tagName\":\"input\",\"type\":\"text\",\"name\":\"text_671020\",\"id\":\"text_671020\",\"label\":\"Unit Kerja\",\"value\":\"\",\"class\":\"form-control\",\"lineNumber\":52,\"required\":true,\"alias\":\"\"},{\"tagName\":\"input\",\"type\":\"text\",\"name\":\"text_932833\",\"id\":\"text_932833\",\"label\":\"Jabatan\",\"value\":\"\",\"class\":\"form-control\",\"lineNumber\":58,\"required\":true,\"alias\":\"\"},{\"tagName\":\"input\",\"type\":\"text\",\"name\":\"text_814491\",\"id\":\"text_814491\",\"label\":\"No. HP/Telp\",\"value\":\"\",\"class\":\"form-control\",\"lineNumber\":64,\"required\":true,\"alias\":\"\"},{\"tagName\":\"input\",\"type\":\"email\",\"name\":\"email_754924\",\"id\":\"email_754924\",\"label\":\"Alamat Email\",\"value\":\"\",\"class\":\"form-control\",\"lineNumber\":70,\"required\":true,\"alias\":\"\"},{\"tagName\":\"input\",\"type\":\"hidden\",\"name\":\"hidden_signature_163216\",\"id\":\"hidden_signature_163216\",\"value\":\"\",\"lineNumber\":84,\"required\":true,\"data-label\":\"Signature\"},{\"tagName\":\"button\",\"type\":\"submit\",\"name\":\"button_876357\",\"id\":\"button_876357\",\"class\":\"btn btn-success\",\"lineNumber\":88,\"value\":\"Submit\"}]', '&lt;form id=&quot;form-app&quot; class=&quot;form-horizontal&quot;&gt;\r\n&lt;fieldset class=&quot;row&quot;&gt;\r\n\r\n&lt;!-- Heading --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;h3 class=&quot;legend&quot;&gt;Presensi Rapat Penyusunan Data Statistik Semestar 1 Badan Litbang Perhubungan Senin 14 September 2020&lt;/h3&gt;\n&lt;/div&gt;\n\n&lt;!-- Spacer --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;div style=&quot;height: 10px&quot;&gt;&lt;/div&gt;\n&lt;/div&gt;\n&lt;!-- Paragraph Text --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;p&gt;Hari/Tanggal : Senin, 14 September 2020&lt;/p&gt;\n&lt;/div&gt;\n\n&lt;!-- Paragraph Text --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;p&gt;Waktu : Pukul 16:00 WIB&lt;/p&gt;\n&lt;/div&gt;\n\n&lt;!-- Paragraph Text --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;p&gt;Media : Video Confrence Zoom&lt;/p&gt;\n&lt;/div&gt;\n\n&lt;!-- Paragraph Text --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;p&gt;Agenda : Penyusunan Data Statistik Semestar 1&lt;/p&gt;\n&lt;/div&gt;\n\n&lt;!-- Spacer --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;div style=&quot;height: 50px&quot;&gt;&lt;/div&gt;\n&lt;/div&gt;\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group required-control col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_442458&quot;&gt;Nama Lengkap&lt;/label&gt;\n    &lt;input type=&quot;text&quot; id=&quot;text_442458&quot; name=&quot;text_442458&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot; required=&quot;&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group required-control col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_51160&quot;&gt;NIP&lt;/label&gt;\n    &lt;input type=&quot;text&quot; id=&quot;text_51160&quot; name=&quot;text_51160&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot; required=&quot;&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group required-control col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_671020&quot;&gt;Unit Kerja&lt;/label&gt;\n    &lt;input type=&quot;text&quot; id=&quot;text_671020&quot; name=&quot;text_671020&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot; required=&quot;&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group required-control col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_932833&quot;&gt;Jabatan&lt;/label&gt;\n    &lt;input type=&quot;text&quot; id=&quot;text_932833&quot; name=&quot;text_932833&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot; required=&quot;&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group required-control col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_814491&quot;&gt;No. HP/Telp&lt;/label&gt;\n    &lt;input type=&quot;text&quot; id=&quot;text_814491&quot; name=&quot;text_814491&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot; required=&quot;&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Email --&gt;\n&lt;div class=&quot;form-group required-control col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;email_754924&quot;&gt;Alamat Email&lt;/label&gt;\n    &lt;input type=&quot;email&quot; id=&quot;email_754924&quot; name=&quot;email_754924&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot; required=&quot;&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Signature --&gt;\n&lt;div class=&quot;form-group required-control col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;signature_163216&quot;&gt;Signature&lt;/label&gt;\n    &lt;div class=&quot;signature-pad&quot;&gt;\n        &lt;canvas id=&quot;signature_163216&quot; width=&quot;400&quot; height=&quot;200&quot; data-color=&quot;black&quot;&gt;&lt;/canvas&gt;\n    &lt;/div&gt;\n    \n    &lt;div class=&quot;signature-pad-actions&quot;&gt;\n        &lt;button type=&quot;button&quot; id=&quot;clear_signature_163216&quot; name=&quot;clear_signature_163216&quot; class=&quot;btn btn-sm btn-default btn-clear&quot; data-exclude=&quot;true&quot;&gt;Clear&lt;/button&gt;\n        \n    &lt;/div&gt;\n    &lt;input type=&quot;hidden&quot; name=&quot;hidden_signature_163216&quot; id=&quot;hidden_signature_163216&quot; value=&quot;&quot; data-label=&quot;Signature&quot; required=&quot;&quot;&gt;\n&lt;/div&gt;\n &lt;!-- Button --&gt;\n&lt;div class=&quot;form-action col-xs-12&quot;&gt;\n    &lt;button type=&quot;submit&quot; id=&quot;button_876357&quot; name=&quot;button_876357&quot; class=&quot;btn btn-success&quot;&gt;Submit&lt;/button&gt;\n&lt;/div&gt;\n\n&lt;!-- Paragraph Text --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;p&gt;Mohon untuk diisi dengan benar&lt;/p&gt;\n&lt;/div&gt;\n\r\n&lt;/fieldset&gt;\r\n&lt;/form&gt;', 959, 1600082597, 1600083552);

-- --------------------------------------------------------

--
-- Table structure for table `form_email`
--

CREATE TABLE `form_email` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(1) NOT NULL DEFAULT 0,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `plain_text` tinyint(1) NOT NULL DEFAULT 0,
  `attach` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `form_email`
--

INSERT INTO `form_email` (`id`, `form_id`, `to`, `from`, `cc`, `bcc`, `subject`, `type`, `message`, `plain_text`, `attach`, `created_at`, `updated_at`) VALUES
(18, 18, '', 'admin@erapat.com', '', '', '', 0, '', 0, 1, 1600082598, 1600083600);

-- --------------------------------------------------------

--
-- Table structure for table `form_rule`
--

CREATE TABLE `form_rule` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `opposite` tinyint(1) NOT NULL DEFAULT 1,
  `ordinal` int(11) NOT NULL DEFAULT 0,
  `conditions` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `actions` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `form_submission`
--

CREATE TABLE `form_submission` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `new` tinyint(1) NOT NULL DEFAULT 1,
  `important` tinyint(1) NOT NULL DEFAULT 0,
  `sender` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `form_submission_comment`
--

CREATE TABLE `form_submission_comment` (
  `id` int(11) NOT NULL,
  `submission_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `form_submission_file`
--

CREATE TABLE `form_submission_file` (
  `id` int(11) NOT NULL,
  `submission_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `form_ui`
--

CREATE TABLE `form_ui` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `theme_id` int(11) DEFAULT NULL,
  `js_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `form_ui`
--

INSERT INTO `form_ui` (`id`, `form_id`, `theme_id`, `js_file`, `created_at`, `updated_at`) VALUES
(18, 18, 3, '', 1600082597, 1600083600);

-- --------------------------------------------------------

--
-- Table structure for table `form_user`
--

CREATE TABLE `form_user` (
  `form_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `log_event`
--

CREATE TABLE `log_event` (
  `app_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `etl_tstamp` int(11) DEFAULT NULL,
  `collector_tstamp` int(11) NOT NULL,
  `dvce_tstamp` bigint(20) DEFAULT NULL,
  `event` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_id` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_id` int(11) DEFAULT NULL,
  `name_tracker` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v_tracker` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v_collector` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `v_etl` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_ipaddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_fingerprint` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain_userid` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain_sessionidx` smallint(6) DEFAULT NULL,
  `network_userid` varchar(38) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_region` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_city` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_zipcode` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_latitude` double DEFAULT NULL,
  `geo_longitude` double DEFAULT NULL,
  `geo_region_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_title` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_referrer` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_urlscheme` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_urlhost` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_urlport` int(11) DEFAULT NULL,
  `page_urlpath` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_urlquery` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_urlfragment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_urlscheme` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_urlhost` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_urlport` int(11) DEFAULT NULL,
  `refr_urlpath` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_urlquery` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_urlfragment` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_medium` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_source` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_term` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mkt_medium` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mkt_source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mkt_term` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mkt_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mkt_campaign` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contexts` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `se_category` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `se_action` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `se_label` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `se_property` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `se_value` double DEFAULT NULL,
  `unstruct_event` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tr_orderid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tr_affiliation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tr_total` decimal(18,2) DEFAULT NULL,
  `tr_tax` decimal(18,2) DEFAULT NULL,
  `tr_shipping` decimal(18,2) DEFAULT NULL,
  `tr_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tr_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tr_country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ti_orderid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ti_sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ti_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ti_category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ti_price` decimal(18,2) DEFAULT NULL,
  `ti_quantity` int(11) DEFAULT NULL,
  `pp_xoffset_min` int(11) DEFAULT NULL,
  `pp_xoffset_max` int(11) DEFAULT NULL,
  `pp_yoffset_min` int(11) DEFAULT NULL,
  `pp_yoffset_max` int(11) DEFAULT NULL,
  `useragent` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_family` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_version` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_renderengine` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_features_pdf` tinyint(1) DEFAULT NULL,
  `br_features_flash` tinyint(1) DEFAULT NULL,
  `br_features_java` tinyint(1) DEFAULT NULL,
  `br_features_director` tinyint(1) DEFAULT NULL,
  `br_features_quicktime` tinyint(1) DEFAULT NULL,
  `br_features_realplayer` tinyint(1) DEFAULT NULL,
  `br_features_windowsmedia` tinyint(1) DEFAULT NULL,
  `br_features_gears` tinyint(1) DEFAULT NULL,
  `br_features_silverlight` tinyint(1) DEFAULT NULL,
  `br_cookies` tinyint(1) DEFAULT NULL,
  `br_colordepth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_viewwidth` int(11) DEFAULT NULL,
  `br_viewheight` int(11) DEFAULT NULL,
  `os_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os_family` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os_manufacturer` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os_timezone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dvce_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dvce_ismobile` tinyint(1) DEFAULT NULL,
  `dvce_screenwidth` int(11) DEFAULT NULL,
  `dvce_screenheight` int(11) DEFAULT NULL,
  `doc_charset` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc_width` int(11) DEFAULT NULL,
  `doc_height` int(11) DEFAULT NULL,
  `geo_timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mkt_clickid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mkt_network` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `etl_tags` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dvce_sent_tstamp` bigint(20) DEFAULT NULL,
  `domain_sessionid` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mail_queue`
--

CREATE TABLE `mail_queue` (
  `id` int(11) NOT NULL,
  `from` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcc` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `html_body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `reply_to` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `charset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachments` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `attempts` int(11) DEFAULT NULL,
  `last_attempt_time` datetime DEFAULT NULL,
  `sent_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE `meeting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `other_online_id` varchar(150) NOT NULL,
  `zoom_id` int(11) NOT NULL,
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
  `remark_status` text NOT NULL,
  `meeting_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting`
--

INSERT INTO `meeting` (`id`, `user_id`, `other_online_id`, `zoom_id`, `sub_type_id`, `speakers_name`, `members_name`, `files_upload`, `files_upload1`, `files_upload2`, `unique_code`, `agenda`, `date_requested`, `start_date`, `end_date`, `start_time`, `end_time`, `request_status`, `remark_status`, `meeting_status`) VALUES
(1, 18, '', 2, 1, '', 'asdasdsad', 'UNDANGAN_RAPAT.pdf', 'NOTULENSI_RAPAT.pdf', 'UNDANGAN_RAPAT.pdf', '5f610a80191e2', 'asdasdasd', '2020-09-16', '2020-09-16', '2020-09-16', '02:00:00', '03:00:00', 0, '', 0),
(2, 14, '', 5, 1, '', 'sadada', 'UNDANGAN_RAPAT.pdf', 'NOTULENSI_RAPAT.pdf', 'ABSENSI_RAPAT.pdf', '5f61106e8ef94', 'asdadsad', '2020-09-16', '2020-09-16', '2020-09-16', '02:00:00', '03:00:00', 0, '', 0);

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
  `place_name` varchar(225) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sub_type_id` int(11) NOT NULL,
  `date_activated` date DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting_place`
--

INSERT INTO `meeting_place` (`id`, `place_name`, `user_id`, `sub_type_id`, `date_activated`, `status`) VALUES
(1, 'Ruangan Rapat Garuda', NULL, 5, NULL, 0),
(2, 'Ruangan Rapat LRT', NULL, 6, NULL, 0),
(3, 'Ruangan Rapat Rajawali', NULL, 7, NULL, 0),
(4, 'Ruangan Rapat Perpustakaan', NULL, 8, NULL, 0);

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
(14, '000 000 000 000', 'administrator', 'admin@erapat.com', '32.png', '$2y$10$pcXovYvhzZDvmXoOXEskcuHtdSvZOUBy6o9FXGRSrFsOAUfbhwdTS', 1, 1, 1, 1595188759, 1600115535),
(15, '666 666 666 666', 'Admin Keuangan', 'keuangan@erapat.com', '31.png', '$2y$10$icYu3J.bfvdocnSNdxPUheArwlUhq80r1N3T7p.ZzgJO48lB1ne6O', 2, 1, 2, 1595195583, 1597380790),
(18, '555 555 555 555', 'Admin Humas', 'humas@erapat.com', '3.png', '$2y$10$5Kud5rfLqdf.7vApjirzNuWjVLKqFqpZt6hGDH/d/5vtjoCcssqRy', 2, 1, 5, 1597213397, 1599549994),
(19, '444 444 444 444', 'Admin Perencanaan', 'perencanaan@erapat.com', '33.png', '$2y$10$X/U5/ZLzBP60TO6aDsqp3eWpXLevpxVvTSKy0nLGrzCa31osP4xoK', 2, 1, 3, 1598467083, 0),
(20, '111 111 111 111', 'Kaban Litbang Perhubungan', 'kaban@erapat.com', 'default-avatar.jpg', '$2y$10$w5k9sGFC7SMC8whAPIp/dOknnlHLA.nOP1IypYw6JNVu2aDz0oEse', 4, 1, 14, 1599060092, 1599061311),
(21, '222 222 222 222', 'Sesban Litbang Perhubungan', 'sesban@erapat.com', 'default-avatar.jpg', '$2y$10$7iKaePzZkNyVg37xciRbUOzFSQ58N92P8L95KwtgXGkzV8u8yBTge', 5, 1, 15, 1599060131, 1599061333),
(22, '333 333 333 333', 'Admin LSDP', 'lsdp@erapat.com', '34.png', '$2y$10$hNKFHzPaAMTJXuwscLTBEutZtQHxD1CHqJDgOY1Z7u2EJ/ARXPjpy', 2, 1, 9, 1599471171, 0);

-- --------------------------------------------------------

--
-- Table structure for table `meeting_zoom`
--

CREATE TABLE `meeting_zoom` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pemakai_id` int(11) DEFAULT NULL,
  `idzoom` varchar(150) NOT NULL,
  `date_activated` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting_zoom`
--

INSERT INTO `meeting_zoom` (`id`, `user_id`, `pemakai_id`, `idzoom`, `date_activated`, `start_time`, `end_time`, `is_active`, `status`) VALUES
(1, 19, 19, '444 444 444 444', '2020-09-16', '00:00:00', '02:00:00', 1, 0),
(2, 18, 18, '555 555 555 555', '2020-09-16', '02:00:00', '03:00:00', 1, 0),
(3, 15, 19, '666 666 666 666', '2020-09-16', '00:00:00', '01:00:00', 1, 0),
(4, 22, 19, '333 333 333 333', '2020-09-16', '03:00:00', '04:00:00', 1, 0),
(5, 14, 14, '000 000 000 000', '2020-09-16', '02:00:00', '03:00:00', 1, 0),
(6, 20, NULL, '111 111 111 111', NULL, NULL, NULL, 1, 0),
(7, 21, NULL, '222 222 222 222', NULL, NULL, NULL, 1, 0);

--
-- Triggers `meeting_zoom`
--
DELIMITER $$
CREATE TRIGGER `upd_check` BEFORE UPDATE ON `meeting_zoom` FOR EACH ROW BEGIN
IF NEW.start_time = NOW() THEN
SET NEW.status = 1;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1567273204),
('m150214_044830_init_user', 1567273209),
('m150410_183765_init_setting', 1567273209),
('m150412_184646_init_theme', 1567273210),
('m150415_183345_init_form', 1567273211),
('m150420_183546_init_stats', 1567273211),
('m150420_183547_init_template', 1567273212),
('m150420_183548_init_mailqueue', 1567273212),
('m150420_183550_init_addon', 1567273212),
('m160104_150526_add_slug_to_form', 1567273212),
('m160110_151514_add_password_novalidate_to_form', 1567273212),
('m160118_171459_upgrade_user_module', 1567273213),
('m160630_181205_upgrade_to_136', 1567273214),
('m160813_213103_upgrade_to_137', 1567273214),
('m160813_213105_upgrade_to_139', 1567273214),
('m190624_153537_upgrade_to_170', 1567273214),
('m190811_215815_upgrade_to_172', 1567273215);

-- --------------------------------------------------------

--
-- Table structure for table `migration_google_analytics`
--

CREATE TABLE `migration_google_analytics` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migration_google_analytics`
--

INSERT INTO `migration_google_analytics` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1600082298),
('m150420_183551_init_addon_google_analytics', 1600082299);

-- --------------------------------------------------------

--
-- Table structure for table `migration_webhooks`
--

CREATE TABLE `migration_webhooks` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migration_webhooks`
--

INSERT INTO `migration_webhooks` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1600082290),
('m151231_221235_init_addon_webhooks', 1600082291),
('m180727_170149_upgrade_1', 1600082291);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `user_id`, `created_at`, `updated_at`, `full_name`, `company`, `avatar`, `timezone`, `language`) VALUES
(1, 1, '2020-09-10 10:05:48', '2020-09-10 14:17:23', 'Administrator', 'puslitbang perhubungan', 'KdVCUjb2Zo-tOkTgRfORvxIiGGpV6KBp.jpg', 'Asia/Jakarta', 'id-ID'),
(2, 2, '2020-09-10 11:09:47', '2020-09-14 04:47:32', 'User', 'puslitbang perhubungan', NULL, 'Asia/Jakarta', 'en-US'),
(3, 3, '2020-09-10 11:16:29', '2020-09-14 04:43:24', 'dave', 'puslitbang perhubungan', '40VTZGo1BGdZFGOiulWrlYYAkMGlpbYt.jpg', 'Asia/Jakarta', 'en-US');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `can_admin` smallint(6) NOT NULL DEFAULT 0,
  `can_edit_own_content` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `created_at`, `updated_at`, `can_admin`, `can_edit_own_content`) VALUES
(1, 'Admin', '2019-08-31 10:40:09', NULL, 1, 1),
(2, 'Basic User', '2019-08-31 10:40:09', NULL, 0, 0),
(3, 'Advanced User', '2019-08-31 10:40:13', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `type`, `category`, `key`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'string', 'app', 'name', 'E-RAPAT', 1, 1567273209, 1567273209),
(2, 'string', 'app', 'description', 'The easiest way to build and manage your online forms', 1, 1567273209, 1567273209),
(3, 'string', 'app', 'adminEmail', 'admin@erapat.com', 1, 1567273209, 1599759536),
(4, 'string', 'app', 'supportEmail', 'support@erapat.com', 1, 1567273209, 1599759536),
(5, 'string', 'app', 'noreplyEmail', 'no-reply@erapat.com', 1, 1567273209, 1599759536),
(6, 'string', 'app', 'reCaptchaSecret', 'your_secret', 1, 1567273209, 1567273209),
(7, 'string', 'app', 'reCaptchaSiteKey', 'your_site_key', 1, 1567273209, 1567273209),
(8, 'string', 'smtp', 'host', 'localhost', 1, 1567273209, 1567273209),
(9, 'string', 'smtp', 'port', '25', 1, 1567273209, 1567273209),
(10, 'string', 'smtp', 'encryption', 'none', 1, 1567273209, 1567273209),
(11, 'string', 'smtp', 'username', 'Username', 1, 1567273209, 1567273209),
(12, 'string', 'smtp', 'password', 'Password', 1, 1567273209, 1567273209),
(13, 'integer', 'app', 'anyoneCanRegister', '0', 1, 1567273213, 1567273213),
(14, 'integer', 'app', 'loginWithoutPassword', '1', 1, 1567273213, 1599772479),
(15, 'integer', 'app', 'useCaptcha', '0', 1, 1567273213, 1567273213),
(16, 'string', 'app', 'defaultUserRole', '2', 1, 1567273213, 1599759444),
(17, 'string', 'app', 'purchaseCode', 'prowebber', 1, 1599757549, 1599757549),
(18, 'string', 'app', 'logo', 'static_files/uploads/logos/transport.svg', 1, 1599759444, 1599759444);

-- --------------------------------------------------------

--
-- Table structure for table `stats_performance`
--

CREATE TABLE `stats_performance` (
  `day` date NOT NULL,
  `app_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `users` int(11) DEFAULT NULL,
  `fills` int(11) DEFAULT NULL,
  `conversions` int(11) DEFAULT NULL,
  `conversionTime` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `stats_submissions`
--

CREATE TABLE `stats_submissions` (
  `app_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `collector_tstamp` int(11) NOT NULL,
  `domain_sessionidx` smallint(6) DEFAULT NULL,
  `geo_country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_city` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_urlhost` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refr_medium` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `br_family` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os_family` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dvce_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dvce_ismobile` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE `template` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `builder` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `html` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `promoted` tinyint(1) DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `category_id`, `name`, `description`, `builder`, `html`, `promoted`, `slug`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Form Kontak', 'Contact information is important for business owners, professionals, and other organizations. This form allows you to collect name, email addresses and other information so that you can reach personal or business contacts in the future.', '{\"settings\":{\"name\":\"Form Kontak\",\"canvas\":\"#canvas\",\"disabledFieldset\":false,\"layoutSelected\":\"\",\"layouts\":[{\"id\":\"\",\"name\":\"Vertical\"},{\"id\":\"form-horizontal\",\"name\":\"Horizontal\"},{\"id\":\"form-inline\",\"name\":\"Inline\"}],\"formSteps\":{\"title\":\"formSteps.title\",\"fields\":{\"id\":{\"label\":\"formSteps.id\",\"type\":\"input\",\"value\":\"formSteps\",\"name\":\"id\"},\"steps\":{\"label\":\"formSteps.steps\",\"type\":\"textarea-split\",\"value\":[],\"name\":\"steps\"},\"progressBar\":{\"label\":\"formSteps.progressBar\",\"type\":\"checkbox\",\"value\":false,\"name\":\"progressBar\"},\"noTitles\":{\"label\":\"formSteps.noTitles\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noTitles\"},\"noStages\":{\"label\":\"formSteps.noStages\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noStages\"},\"noSteps\":{\"label\":\"formSteps.noSteps\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noSteps\"}}}},\"initForm\":[{\"name\":\"heading\",\"title\":\"heading.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"heading_0\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"input\",\"value\":\"Contact Us\",\"name\":\"text\"},\"type\":{\"label\":\"component.type\",\"type\":\"select\",\"value\":[{\"value\":\"h1\",\"selected\":false,\"label\":\"H1\"},{\"value\":\"h2\",\"selected\":false,\"label\":\"H2\"},{\"value\":\"h3\",\"selected\":true,\"label\":\"H3\"},{\"value\":\"h4\",\"selected\":false,\"label\":\"H4\"},{\"value\":\"h5\",\"selected\":false,\"label\":\"H5\"},{\"value\":\"h6\",\"selected\":false,\"label\":\"H6\"}],\"name\":\"type\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"legend\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"paragraph\",\"title\":\"paragraph.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"paragraph_0\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"textarea\",\"value\":\"Let us know your questions, suggestions and concerns by filling out the contact form below.\",\"name\":\"text\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_0\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":true,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Name\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"email\",\"title\":\"email.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"email_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Email\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":true,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"checkdns\":{\"label\":\"component.checkDNS\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"checkdns\"},\"multiple\":{\"label\":\"component.multiple\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"multiple\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"textarea\",\"title\":\"textarea.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"textarea_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Message\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":true,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"fieldSize\":{\"label\":\"component.fieldSize\",\"type\":\"input\",\"value\":\"3\",\"advanced\":true,\"name\":\"fieldSize\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"button\",\"title\":\"button.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"button_0\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.type\",\"type\":\"select\",\"value\":[{\"value\":\"submit\",\"label\":\"Submit\",\"selected\":true},{\"value\":\"reset\",\"label\":\"Reset\",\"selected\":false},{\"value\":\"image\",\"label\":\"Image\",\"selected\":false}],\"name\":\"inputType\"},\"buttonText\":{\"label\":\"component.buttonText\",\"type\":\"input\",\"value\":\"Submit\",\"name\":\"buttonText\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"label\"},\"src\":{\"label\":\"component.src\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"src\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"btn btn-primary\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false}],\"height\":398}', '&lt;form id=&quot;form-app&quot;&gt;\r\n&lt;fieldset class=&quot;row&quot;&gt;\r\n\r\n&lt;!-- Heading --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;h3 class=&quot;legend&quot;&gt;Contact Us&lt;/h3&gt;\n&lt;/div&gt;\n\n&lt;!-- Paragraph Text --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;p&gt;Let us know your questions, suggestions and concerns by filling out the contact form below.&lt;/p&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_0&quot;&gt;Name&lt;/label&gt;\n    &lt;input type=&quot;text&quot; id=&quot;text_0&quot; name=&quot;text_0&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Email --&gt;\n&lt;div class=&quot;form-group required-control col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;email_0&quot;&gt;Email&lt;/label&gt;\n    &lt;input type=&quot;email&quot; id=&quot;email_0&quot; name=&quot;email_0&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot; required=&quot;&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Text Area --&gt;\n&lt;div class=&quot;form-group required-control col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;textarea_0&quot;&gt;Message&lt;/label&gt;\n    &lt;textarea id=&quot;textarea_0&quot; name=&quot;textarea_0&quot; rows=&quot;3&quot; data-alias=&quot;&quot; class=&quot;form-control&quot; required=&quot;&quot;&gt;&lt;/textarea&gt;\n&lt;/div&gt;\n\n &lt;!-- Button --&gt;\n&lt;div class=&quot;form-action col-xs-12&quot;&gt;\n    &lt;button type=&quot;submit&quot; id=&quot;button_0&quot; name=&quot;button_0&quot; class=&quot;btn btn-primary&quot;&gt;Submit&lt;/button&gt;\n&lt;/div&gt;\n\r\n&lt;/fieldset&gt;\r\n&lt;/form&gt;', 1, 'form-kontak', 1, 1, 1567272311, 1599769891),
(2, 2, 'Survey Kepuasan Pelanggan', 'You don\'t need an expensive marketing research team to gather detailed information about your customers. Instead, use this survey for a quick and easy way to get invaluable feedback from customers on the quality of your product or service.', '{\"settings\":{\"name\":\"Survey Kepuasan Pelanggan\",\"canvas\":\"#canvas\",\"disabledFieldset\":false,\"layoutSelected\":\"\",\"layouts\":[{\"id\":\"\",\"name\":\"Vertical\"},{\"id\":\"form-horizontal\",\"name\":\"Horizontal\"},{\"id\":\"form-inline\",\"name\":\"Inline\"}],\"formSteps\":{\"title\":\"formSteps.title\",\"fields\":{\"id\":{\"label\":\"formSteps.id\",\"type\":\"input\",\"value\":\"formSteps\",\"name\":\"id\"},\"steps\":{\"label\":\"formSteps.steps\",\"type\":\"textarea-split\",\"value\":[],\"name\":\"steps\"},\"progressBar\":{\"label\":\"formSteps.progressBar\",\"type\":\"checkbox\",\"value\":false,\"name\":\"progressBar\"},\"noTitles\":{\"label\":\"formSteps.noTitles\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noTitles\"},\"noStages\":{\"label\":\"formSteps.noStages\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noStages\"},\"noSteps\":{\"label\":\"formSteps.noSteps\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noSteps\"}}}},\"initForm\":[{\"name\":\"heading\",\"title\":\"heading.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"heading_0\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"input\",\"value\":\"Customer Satisfaction Survey\",\"name\":\"text\"},\"type\":{\"label\":\"component.type\",\"type\":\"select\",\"value\":[{\"value\":\"h1\",\"selected\":false,\"label\":\"H1\"},{\"value\":\"h2\",\"selected\":false,\"label\":\"H2\"},{\"value\":\"h3\",\"selected\":true,\"label\":\"H3\"},{\"value\":\"h4\",\"selected\":false,\"label\":\"H4\"},{\"value\":\"h5\",\"selected\":false,\"label\":\"H5\"},{\"value\":\"h6\",\"selected\":false,\"label\":\"H6\"}],\"name\":\"type\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"legend\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"paragraph\",\"title\":\"paragraph.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"paragraph_0\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"textarea\",\"value\":\"Please take a few moments to complete this satisfaction survey.\",\"name\":\"text\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"radio\",\"title\":\"radio.title\",\"fields\":{\"id\":{\"label\":\"component.groupName\",\"type\":\"input\",\"value\":\"radio_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Overall, how satisfied were you with the product \\/ service?\",\"name\":\"label\"},\"radios\":{\"label\":\"component.radios\",\"type\":\"textarea-split\",\"value\":[\"Very Satisfied\",\"Satisfied\",\"Neutral\",\"Unsatisfied\",\"Very Unsatisfied\",\"N\\/A\"],\"name\":\"radios\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"radio-inline\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"inline\":{\"label\":\"component.inline\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"inline\"}},\"fresh\":false},{\"name\":\"radio\",\"title\":\"radio.title\",\"fields\":{\"id\":{\"label\":\"component.groupName\",\"type\":\"input\",\"value\":\"radio_1\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Would you recommend our product \\/ service to colleagues or contacts within your industry?\",\"name\":\"label\"},\"radios\":{\"label\":\"component.radios\",\"type\":\"textarea-split\",\"value\":[\"Definitely\",\"Probably\",\"Not Sure\",\"Probably Not\",\"Definitely Not\"],\"name\":\"radios\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"radio-inline\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"inline\":{\"label\":\"component.inline\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"inline\"}},\"fresh\":false},{\"name\":\"radio\",\"title\":\"radio.title\",\"fields\":{\"id\":{\"label\":\"component.groupName\",\"type\":\"input\",\"value\":\"radio_2\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Would you use our product \\/ service in the future?\",\"name\":\"label\"},\"radios\":{\"label\":\"component.radios\",\"type\":\"textarea-split\",\"value\":[\"Less than a month\",\"1-6 months\",\"1-3 years\",\"Over 3 Years\",\"Never used\"],\"name\":\"radios\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"radio-inline\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"inline\":{\"label\":\"component.inline\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"inline\"}},\"fresh\":false},{\"name\":\"radio\",\"title\":\"radio.title\",\"fields\":{\"id\":{\"label\":\"component.groupName\",\"type\":\"input\",\"value\":\"radio_3\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"How often do you use product \\/ service?\",\"name\":\"label\"},\"radios\":{\"label\":\"component.radios\",\"type\":\"textarea-split\",\"value\":[\"Once a week\",\"2 to 3 times a month\",\"Once a month\",\"Less than once a month\"],\"name\":\"radios\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"radio-inline\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"inline\":{\"label\":\"component.inline\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"inline\"}},\"fresh\":false},{\"name\":\"radio\",\"title\":\"radio.title\",\"fields\":{\"id\":{\"label\":\"component.groupName\",\"type\":\"input\",\"value\":\"radio_4\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"What aspect of the product \\/ service were you most satisfied by?\",\"name\":\"label\"},\"radios\":{\"label\":\"component.radios\",\"type\":\"textarea-split\",\"value\":[\"Quality\",\"Price\",\"Purchase Experience\",\"Installation or First Use Experience\",\"Usage Experience\",\"Customer Service\",\"Repeat Purchase Experience\"],\"name\":\"radios\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"radio-inline\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"inline\":{\"label\":\"component.inline\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"inline\"}},\"fresh\":false},{\"name\":\"textarea\",\"title\":\"textarea.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"textarea_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"What do you like about the product \\/ service?\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"fieldSize\":{\"label\":\"component.fieldSize\",\"type\":\"input\",\"value\":\"3\",\"advanced\":true,\"name\":\"fieldSize\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"textarea\",\"title\":\"textarea.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"textarea_1\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"What do you dislike about the product \\/ service?\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"fieldSize\":{\"label\":\"component.fieldSize\",\"type\":\"input\",\"value\":\"3\",\"advanced\":true,\"name\":\"fieldSize\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"radio\",\"title\":\"radio.title\",\"fields\":{\"id\":{\"label\":\"component.groupName\",\"type\":\"input\",\"value\":\"radio_5\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Thinking of similar products \\/ services offered by other companies, how would you compare the product \\/ service offered by our company?\",\"name\":\"label\"},\"radios\":{\"label\":\"component.radios\",\"type\":\"textarea-split\",\"value\":[\"Much Better\",\"Somewhat Better\",\"About the Same\",\"Somewhat Worse\",\"Much Worse\",\"Don\\u0027t Know\"],\"name\":\"radios\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"radio-inline\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"inline\":{\"label\":\"component.inline\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"inline\"}},\"fresh\":false},{\"name\":\"button\",\"title\":\"button.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"button_0\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.type\",\"type\":\"select\",\"value\":[{\"value\":\"submit\",\"label\":\"Submit\",\"selected\":true},{\"value\":\"reset\",\"label\":\"Reset\",\"selected\":false},{\"value\":\"image\",\"label\":\"Image\",\"selected\":false}],\"name\":\"inputType\"},\"buttonText\":{\"label\":\"component.buttonText\",\"type\":\"input\",\"value\":\"Submit\",\"name\":\"buttonText\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"label\"},\"src\":{\"label\":\"component.src\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"src\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"btn btn-primary\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false}],\"height\":1428}', '&lt;form id=&quot;form-app&quot;&gt;\r\n&lt;fieldset class=&quot;row&quot;&gt;\r\n\r\n&lt;!-- Heading --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;h3 class=&quot;legend&quot;&gt;Customer Satisfaction Survey&lt;/h3&gt;\n&lt;/div&gt;\n\n&lt;!-- Paragraph Text --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;p&gt;Please take a few moments to complete this satisfaction survey.&lt;/p&gt;\n&lt;/div&gt;\n\n&lt;!-- Radio --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt; \n    &lt;label class=&quot;control-label&quot; for=&quot;radio_0&quot;&gt;Overall, how satisfied were you with the product / service?&lt;/label&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_0&quot; id=&quot;radio_0_0&quot; value=&quot;Very Satisfied&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_0_0&quot; class=&quot;radio-inline&quot;&gt;\n        Very Satisfied &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_0&quot; id=&quot;radio_0_1&quot; value=&quot;Satisfied&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_0_1&quot; class=&quot;radio-inline&quot;&gt;\n        Satisfied &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_0&quot; id=&quot;radio_0_2&quot; value=&quot;Neutral&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_0_2&quot; class=&quot;radio-inline&quot;&gt;\n        Neutral &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_0&quot; id=&quot;radio_0_3&quot; value=&quot;Unsatisfied&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_0_3&quot; class=&quot;radio-inline&quot;&gt;\n        Unsatisfied &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_0&quot; id=&quot;radio_0_4&quot; value=&quot;Very Unsatisfied&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_0_4&quot; class=&quot;radio-inline&quot;&gt;\n        Very Unsatisfied &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_0&quot; id=&quot;radio_0_5&quot; value=&quot;N/A&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_0_5&quot; class=&quot;radio-inline&quot;&gt;\n        N/A &lt;/label&gt;\n    &lt;/div&gt;\n    \n    &lt;span id=&quot;radio_0&quot;&gt;&lt;/span&gt;\n&lt;/div&gt;\n\n&lt;!-- Radio --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt; \n    &lt;label class=&quot;control-label&quot; for=&quot;radio_1&quot;&gt;Would you recommend our product / service to colleagues or contacts within your industry?&lt;/label&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_1&quot; id=&quot;radio_1_0&quot; value=&quot;Definitely&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_1_0&quot; class=&quot;radio-inline&quot;&gt;\n        Definitely &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_1&quot; id=&quot;radio_1_1&quot; value=&quot;Probably&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_1_1&quot; class=&quot;radio-inline&quot;&gt;\n        Probably &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_1&quot; id=&quot;radio_1_2&quot; value=&quot;Not Sure&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_1_2&quot; class=&quot;radio-inline&quot;&gt;\n        Not Sure &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_1&quot; id=&quot;radio_1_3&quot; value=&quot;Probably Not&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_1_3&quot; class=&quot;radio-inline&quot;&gt;\n        Probably Not &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_1&quot; id=&quot;radio_1_4&quot; value=&quot;Definitely Not&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_1_4&quot; class=&quot;radio-inline&quot;&gt;\n        Definitely Not &lt;/label&gt;\n    &lt;/div&gt;\n    \n    &lt;span id=&quot;radio_1&quot;&gt;&lt;/span&gt;\n&lt;/div&gt;\n\n&lt;!-- Radio --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt; \n    &lt;label class=&quot;control-label&quot; for=&quot;radio_2&quot;&gt;Would you use our product / service in the future?&lt;/label&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_2&quot; id=&quot;radio_2_0&quot; value=&quot;Less than a month&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_2_0&quot; class=&quot;radio-inline&quot;&gt;\n        Less than a month &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_2&quot; id=&quot;radio_2_1&quot; value=&quot;1-6 months&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_2_1&quot; class=&quot;radio-inline&quot;&gt;\n        1-6 months &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_2&quot; id=&quot;radio_2_2&quot; value=&quot;1-3 years&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_2_2&quot; class=&quot;radio-inline&quot;&gt;\n        1-3 years &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_2&quot; id=&quot;radio_2_3&quot; value=&quot;Over 3 Years&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_2_3&quot; class=&quot;radio-inline&quot;&gt;\n        Over 3 Years &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_2&quot; id=&quot;radio_2_4&quot; value=&quot;Never used&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_2_4&quot; class=&quot;radio-inline&quot;&gt;\n        Never used &lt;/label&gt;\n    &lt;/div&gt;\n    \n    &lt;span id=&quot;radio_2&quot;&gt;&lt;/span&gt;\n&lt;/div&gt;\n\n&lt;!-- Radio --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt; \n    &lt;label class=&quot;control-label&quot; for=&quot;radio_3&quot;&gt;How often do you use product / service?&lt;/label&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_3&quot; id=&quot;radio_3_0&quot; value=&quot;Once a week&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_3_0&quot; class=&quot;radio-inline&quot;&gt;\n        Once a week &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_3&quot; id=&quot;radio_3_1&quot; value=&quot;2 to 3 times a month&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_3_1&quot; class=&quot;radio-inline&quot;&gt;\n        2 to 3 times a month &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_3&quot; id=&quot;radio_3_2&quot; value=&quot;Once a month&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_3_2&quot; class=&quot;radio-inline&quot;&gt;\n        Once a month &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_3&quot; id=&quot;radio_3_3&quot; value=&quot;Less than once a month&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_3_3&quot; class=&quot;radio-inline&quot;&gt;\n        Less than once a month &lt;/label&gt;\n    &lt;/div&gt;\n    \n    &lt;span id=&quot;radio_3&quot;&gt;&lt;/span&gt;\n&lt;/div&gt;\n\n&lt;!-- Radio --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt; \n    &lt;label class=&quot;control-label&quot; for=&quot;radio_4&quot;&gt;What aspect of the product / service were you most satisfied by?&lt;/label&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_4&quot; id=&quot;radio_4_0&quot; value=&quot;Quality&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_4_0&quot; class=&quot;radio-inline&quot;&gt;\n        Quality &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_4&quot; id=&quot;radio_4_1&quot; value=&quot;Price&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_4_1&quot; class=&quot;radio-inline&quot;&gt;\n        Price &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_4&quot; id=&quot;radio_4_2&quot; value=&quot;Purchase Experience&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_4_2&quot; class=&quot;radio-inline&quot;&gt;\n        Purchase Experience &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_4&quot; id=&quot;radio_4_3&quot; value=&quot;Installation or First Use Experience&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_4_3&quot; class=&quot;radio-inline&quot;&gt;\n        Installation or First Use Experience &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_4&quot; id=&quot;radio_4_4&quot; value=&quot;Usage Experience&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_4_4&quot; class=&quot;radio-inline&quot;&gt;\n        Usage Experience &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_4&quot; id=&quot;radio_4_5&quot; value=&quot;Customer Service&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_4_5&quot; class=&quot;radio-inline&quot;&gt;\n        Customer Service &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_4&quot; id=&quot;radio_4_6&quot; value=&quot;Repeat Purchase Experience&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_4_6&quot; class=&quot;radio-inline&quot;&gt;\n        Repeat Purchase Experience &lt;/label&gt;\n    &lt;/div&gt;\n    \n    &lt;span id=&quot;radio_4&quot;&gt;&lt;/span&gt;\n&lt;/div&gt;\n\n&lt;!-- Text Area --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;textarea_0&quot;&gt;What do you like about the product / service?&lt;/label&gt;\n    &lt;textarea id=&quot;textarea_0&quot; name=&quot;textarea_0&quot; rows=&quot;3&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;&lt;/textarea&gt;\n&lt;/div&gt;\n\n&lt;!-- Text Area --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;textarea_1&quot;&gt;What do you dislike about the product / service?&lt;/label&gt;\n    &lt;textarea id=&quot;textarea_1&quot; name=&quot;textarea_1&quot; rows=&quot;3&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;&lt;/textarea&gt;\n&lt;/div&gt;\n\n&lt;!-- Radio --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt; \n    &lt;label class=&quot;control-label&quot; for=&quot;radio_5&quot;&gt;Thinking of similar products / services offered by other companies, how would you compare the product / service offered by our company?&lt;/label&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_5&quot; id=&quot;radio_5_0&quot; value=&quot;Much Better&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_5_0&quot; class=&quot;radio-inline&quot;&gt;\n        Much Better &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_5&quot; id=&quot;radio_5_1&quot; value=&quot;Somewhat Better&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_5_1&quot; class=&quot;radio-inline&quot;&gt;\n        Somewhat Better &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_5&quot; id=&quot;radio_5_2&quot; value=&quot;About the Same&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_5_2&quot; class=&quot;radio-inline&quot;&gt;\n        About the Same &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_5&quot; id=&quot;radio_5_3&quot; value=&quot;Somewhat Worse&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_5_3&quot; class=&quot;radio-inline&quot;&gt;\n        Somewhat Worse &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_5&quot; id=&quot;radio_5_4&quot; value=&quot;Much Worse&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_5_4&quot; class=&quot;radio-inline&quot;&gt;\n        Much Worse &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_5&quot; id=&quot;radio_5_5&quot; value=&quot;Don&#039;t Know&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_5_5&quot; class=&quot;radio-inline&quot;&gt;\n        Don&#039;t Know &lt;/label&gt;\n    &lt;/div&gt;\n    \n    &lt;span id=&quot;radio_5&quot;&gt;&lt;/span&gt;\n&lt;/div&gt;\n\n &lt;!-- Button --&gt;\n&lt;div class=&quot;form-action col-xs-12&quot;&gt;\n    &lt;button type=&quot;submit&quot; id=&quot;button_0&quot; name=&quot;button_0&quot; class=&quot;btn btn-primary&quot;&gt;Submit&lt;/button&gt;\n&lt;/div&gt;\n\r\n&lt;/fieldset&gt;\r\n&lt;/form&gt;', 1, 'survey-kepuasan-pelanggan', 1, 1, 1567272311, 1599769916);
INSERT INTO `template` (`id`, `category_id`, `name`, `description`, `builder`, `html`, `promoted`, `slug`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(5, 6, 'Rencana Kegiatan', 'Be it work or play, it is best planned well in advance. Here is an online form to bookmark upcoming events and to verify the checklist of to-do\'s. With this, you can be sure not to have left behind anything that adds to the fun.', '{\"settings\":{\"name\":\"Rencana Kegiatan\",\"canvas\":\"#canvas\",\"disabledFieldset\":false,\"layoutSelected\":\"\",\"layouts\":[{\"id\":\"\",\"name\":\"Vertical\"},{\"id\":\"form-horizontal\",\"name\":\"Horizontal\"},{\"id\":\"form-inline\",\"name\":\"Inline\"}],\"formSteps\":{\"title\":\"formSteps.title\",\"fields\":{\"id\":{\"label\":\"formSteps.id\",\"type\":\"input\",\"value\":\"formSteps\",\"name\":\"id\"},\"steps\":{\"label\":\"formSteps.steps\",\"type\":\"textarea-split\",\"value\":[],\"name\":\"steps\"},\"progressBar\":{\"label\":\"formSteps.progressBar\",\"type\":\"checkbox\",\"value\":false,\"name\":\"progressBar\"},\"noTitles\":{\"label\":\"formSteps.noTitles\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noTitles\"},\"noStages\":{\"label\":\"formSteps.noStages\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noStages\"},\"noSteps\":{\"label\":\"formSteps.noSteps\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noSteps\"}}}},\"initForm\":[{\"name\":\"heading\",\"title\":\"heading.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"heading_0\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"input\",\"value\":\"Event Planner\",\"name\":\"text\"},\"type\":{\"label\":\"component.type\",\"type\":\"select\",\"value\":[{\"value\":\"h1\",\"selected\":false,\"label\":\"H1\"},{\"value\":\"h2\",\"selected\":false,\"label\":\"H2\"},{\"value\":\"h3\",\"selected\":true,\"label\":\"H3\"},{\"value\":\"h4\",\"selected\":false,\"label\":\"H4\"},{\"value\":\"h5\",\"selected\":false,\"label\":\"H5\"},{\"value\":\"h6\",\"selected\":false,\"label\":\"H6\"}],\"name\":\"type\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"legend\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_0\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":true,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Event Name\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_1\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":true,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Event Coordinator\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"email\",\"title\":\"email.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"email_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Email\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"checkdns\":{\"label\":\"component.checkDNS\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"checkdns\"},\"multiple\":{\"label\":\"component.multiple\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"multiple\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"selectlist\",\"title\":\"selectlist.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"selectlist_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Event Type\",\"name\":\"label\"},\"options\":{\"label\":\"component.options\",\"type\":\"textarea-split\",\"value\":[\"Banquet\",\"Dinner Party\",\"Wedding\"],\"name\":\"options\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"-Select-\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-sm-6 no-padding-left\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"},\"multiple\":{\"label\":\"component.multiple\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"multiple\"}},\"fresh\":false},{\"name\":\"selectlist\",\"title\":\"selectlist.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"selectlist_1\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Status\",\"name\":\"label\"},\"options\":{\"label\":\"component.options\",\"type\":\"textarea-split\",\"value\":[\"Planning\",\"In Progress\",\"Finished\"],\"name\":\"options\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"-Select-\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-sm-6 no-padding\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"},\"multiple\":{\"label\":\"component.multiple\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"multiple\"}},\"fresh\":false},{\"name\":\"textarea\",\"title\":\"textarea.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"textarea_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Event Description\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"fieldSize\":{\"label\":\"component.fieldSize\",\"type\":\"input\",\"value\":\"3\",\"advanced\":true,\"name\":\"fieldSize\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"radio\",\"title\":\"radio.title\",\"fields\":{\"id\":{\"label\":\"component.groupName\",\"type\":\"input\",\"value\":\"radio_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Does your program involve any type of outside activity?\",\"name\":\"label\"},\"radios\":{\"label\":\"component.radios\",\"type\":\"textarea-split\",\"value\":[\"Yes\",\"No\"],\"name\":\"radios\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"radio-inline\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"inline\":{\"label\":\"component.inline\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"inline\"}},\"fresh\":false},{\"name\":\"number\",\"title\":\"number.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"number_0\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"number\",\"selected\":true,\"label\":\"Number\"},{\"value\":\"range\",\"selected\":false,\"label\":\"Range\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Cost Per Person ($)\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"integerOnly\":{\"label\":\"component.integerOnly\",\"type\":\"checkbox\",\"value\":false,\"name\":\"integerOnly\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"min\":{\"label\":\"component.minNumber\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"min\"},\"max\":{\"label\":\"component.maxNumber\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"max\"},\"step\":{\"label\":\"component.stepNumber\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"step\"},\"integerPattern\":{\"label\":\"component.integerPattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"integerPattern\"},\"numberPattern\":{\"label\":\"component.numberPattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"numberPattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"checkbox\",\"title\":\"checkbox.title\",\"fields\":{\"id\":{\"label\":\"component.groupName\",\"type\":\"input\",\"value\":\"checkbox_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Requirements\",\"name\":\"label\"},\"checkboxes\":{\"label\":\"component.checkboxes\",\"type\":\"textarea-split\",\"value\":[\"Staffing\",\"Catering\",\"Security\"],\"name\":\"checkboxes\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"checkbox-inline\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"inline\":{\"label\":\"component.inline\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"inline\"}},\"fresh\":false},{\"name\":\"date\",\"title\":\"date.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"date_0\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"date\",\"selected\":false,\"label\":\"Date\"},{\"value\":\"datetime-local\",\"selected\":true,\"label\":\"DateTime-Local\"},{\"value\":\"time\",\"selected\":false,\"label\":\"Time\"},{\"value\":\"month\",\"selected\":false,\"label\":\"Month\"},{\"value\":\"week\",\"selected\":false,\"label\":\"Week\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Event Start Date\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"min\":{\"label\":\"component.minDate\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"min\"},\"max\":{\"label\":\"component.maxDate\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"max\"},\"step\":{\"label\":\"component.stepNumber\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"step\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-sm-6 no-padding-left\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"date\",\"title\":\"date.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"date_1\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"date\",\"selected\":false,\"label\":\"Date\"},{\"value\":\"datetime-local\",\"selected\":true,\"label\":\"DateTime-Local\"},{\"value\":\"time\",\"selected\":false,\"label\":\"Time\"},{\"value\":\"month\",\"selected\":false,\"label\":\"Month\"},{\"value\":\"week\",\"selected\":false,\"label\":\"Week\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Event End Date\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"min\":{\"label\":\"component.minDate\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"min\"},\"max\":{\"label\":\"component.maxDate\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"max\"},\"step\":{\"label\":\"component.stepNumber\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"step\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-sm-6 no-padding\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"textarea\",\"title\":\"textarea.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"textarea_1\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Location\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"fieldSize\":{\"label\":\"component.fieldSize\",\"type\":\"input\",\"value\":\"3\",\"advanced\":true,\"name\":\"fieldSize\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_2\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":true,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"City\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-sm-4 no-padding-left\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_3\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":true,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"State\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-sm-4 no-padding\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"selectlist\",\"title\":\"selectlist.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"selectlist_2\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Country\",\"name\":\"label\"},\"options\":{\"label\":\"component.options\",\"type\":\"textarea-split\",\"value\":[\"United States\",\"United Kingdom\",\"Australia\",\"Canada\",\"France\",\"----\",\"Afghanistan\",\"Albania\",\"Algeria\",\"Andorra\",\"Angola\",\"Antigua \\u0026 Deps\",\"Argentina\",\"Armenia\",\"Austria\",\"Azerbaijan\",\"Bahamas\",\"Bahrain\",\"Bangladesh\",\"Barbados\",\"Belarus\",\"Belgium\",\"Belize\",\"Benin\",\"Bhutan\",\"Bolivia\",\"Bosnia Herzegovina\",\"Botswana\",\"Brazil\",\"Brunei\",\"Bulgaria\",\"Burkina\",\"Burundi\",\"Cambodia\",\"Cameroon\",\"Cape Verde\",\"Central African Rep\",\"Chad\",\"Chile\",\"China\",\"Colombia\",\"Comoros\",\"Congo\",\"Congo {Democratic Rep}\",\"Costa Rica\",\"Croatia\",\"Cuba\",\"Cyprus\",\"Czech Republic\",\"Denmark\",\"Djibouti\",\"Dominica\",\"Dominican Republic\",\"East Timor\",\"Ecuador\",\"Egypt\",\"El Salvador\",\"Equatorial Guinea\",\"Eritrea\",\"Estonia\",\"Ethiopia\",\"Fiji\",\"Finland\",\"Gabon\",\"Gambia\",\"Georgia\",\"Germany\",\"Ghana\",\"Greece\",\"Grenada\",\"Guatemala\",\"Guinea\",\"Guinea-Bissau\",\"Guyana\",\"Haiti\",\"Honduras\",\"Hungary\",\"Iceland\",\"India\",\"Indonesia\",\"Iran\",\"Iraq\",\"Ireland {Republic}\",\"Israel\",\"Italy\",\"Ivory Coast\",\"Jamaica\",\"Japan\",\"Jordan\",\"Kazakhstan\",\"Kenya\",\"Kiribati\",\"Korea North\",\"Korea South\",\"Kosovo\",\"Kuwait\",\"Kyrgyzstan\",\"Laos\",\"Latvia\",\"Lebanon\",\"Lesotho\",\"Liberia\",\"Libya\",\"Liechtenstein\",\"Lithuania\",\"Luxembourg\",\"Macedonia\",\"Madagascar\",\"Malawi\",\"Malaysia\",\"Maldives\",\"Mali\",\"Malta\",\"Marshall Islands\",\"Mauritania\",\"Mauritius\",\"Mexico\",\"Micronesia\",\"Moldova\",\"Monaco\",\"Mongolia\",\"Montenegro\",\"Morocco\",\"Mozambique\",\"Myanmar, {Burma}\",\"Namibia\",\"Nauru\",\"Nepal\",\"Netherlands\",\"New Zealand\",\"Nicaragua\",\"Niger\",\"Nigeria\",\"Norway\",\"Oman\",\"Pakistan\",\"Palau\",\"Panama\",\"Papua New Guinea\",\"Paraguay\",\"Peru\",\"Philippines\",\"Poland\",\"Portugal\",\"Qatar\",\"Romania\",\"Russian Federation\",\"Rwanda\",\"St Kitts \\u0026 Nevis\",\"St Lucia\",\"Saint Vincent \\u0026 the Grenadines\",\"Samoa\",\"San Marino\",\"Sao Tome \\u0026 Principe\",\"Saudi Arabia\",\"Senegal\",\"Serbia\",\"Seychelles\",\"Sierra Leone\",\"Singapore\",\"Slovakia\",\"Slovenia\",\"Solomon Islands\",\"Somalia\",\"South Africa\",\"South Sudan\",\"Spain\",\"Sri Lanka\",\"Sudan\",\"Suriname\",\"Swaziland\",\"Sweden\",\"Switzerland\",\"Syria\",\"Taiwan\",\"Tajikistan\",\"Tanzania\",\"Thailand\",\"Togo\",\"Tonga\",\"Trinidad \\u0026 Tobago\",\"Tunisia\",\"Turkey\",\"Turkmenistan\",\"Tuvalu\",\"Uganda\",\"Ukraine\",\"United Arab Emirates\",\"Uruguay\",\"Uzbekistan\",\"Vanuatu\",\"Vatican City\",\"Venezuela\",\"Vietnam\",\"Yemen\",\"Zambia\",\"Zimbabwe\"],\"name\":\"options\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"-Select-\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-sm-4 no-padding-right\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"},\"multiple\":{\"label\":\"component.multiple\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"multiple\"}},\"fresh\":false},{\"name\":\"file\",\"title\":\"file.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"file_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Attach Detailed Itinerary\",\"name\":\"label\"},\"accept\":{\"label\":\"component.accept\",\"type\":\"input\",\"value\":\".txt, .pdf, .doc, .docx\",\"name\":\"accept\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"minSize\":{\"label\":\"component.minSize\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"minSize\"},\"maxSize\":{\"label\":\"component.maxSize\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"maxSize\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"button\",\"title\":\"button.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"button_0\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.type\",\"type\":\"select\",\"value\":[{\"value\":\"submit\",\"label\":\"Submit\",\"selected\":true},{\"value\":\"reset\",\"label\":\"Reset\",\"selected\":false},{\"value\":\"image\",\"label\":\"Image\",\"selected\":false}],\"name\":\"inputType\"},\"buttonText\":{\"label\":\"component.buttonText\",\"type\":\"input\",\"value\":\"Submit\",\"name\":\"buttonText\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"label\"},\"src\":{\"label\":\"component.src\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"src\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"btn btn-primary\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false}],\"height\":1078}', '&lt;form id=&quot;form-app&quot; enctype=&quot;multipart/form-data&quot;&gt;\r\n&lt;fieldset class=&quot;row&quot;&gt;\r\n\r\n&lt;!-- Heading --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;h3 class=&quot;legend&quot;&gt;Event Planner&lt;/h3&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_0&quot;&gt;Event Name&lt;/label&gt;\n    &lt;input type=&quot;text&quot; id=&quot;text_0&quot; name=&quot;text_0&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_1&quot;&gt;Event Coordinator&lt;/label&gt;\n    &lt;input type=&quot;text&quot; id=&quot;text_1&quot; name=&quot;text_1&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Email --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;email_0&quot;&gt;Email&lt;/label&gt;\n    &lt;input type=&quot;email&quot; id=&quot;email_0&quot; name=&quot;email_0&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Select List --&gt;\n&lt;div class=&quot;form-group col-sm-6 no-padding-left&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;selectlist_0&quot;&gt;Event Type&lt;/label&gt;\n    &lt;select id=&quot;selectlist_0&quot; name=&quot;selectlist_0[]&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n        &lt;option value=&quot;&quot; disabled=&quot;&quot; selected=&quot;&quot;&gt;-Select-&lt;/option&gt;\n        &lt;option value=&quot;Banquet&quot;&gt;Banquet&lt;/option&gt;\n        &lt;option value=&quot;Dinner Party&quot;&gt;Dinner Party&lt;/option&gt;\n        &lt;option value=&quot;Wedding&quot;&gt;Wedding&lt;/option&gt;\n    &lt;/select&gt;\n&lt;/div&gt;\n\n&lt;!-- Select List --&gt;\n&lt;div class=&quot;form-group col-sm-6 no-padding&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;selectlist_1&quot;&gt;Status&lt;/label&gt;\n    &lt;select id=&quot;selectlist_1&quot; name=&quot;selectlist_1[]&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n        &lt;option value=&quot;&quot; disabled=&quot;&quot; selected=&quot;&quot;&gt;-Select-&lt;/option&gt;\n        &lt;option value=&quot;Planning&quot;&gt;Planning&lt;/option&gt;\n        &lt;option value=&quot;In Progress&quot;&gt;In Progress&lt;/option&gt;\n        &lt;option value=&quot;Finished&quot;&gt;Finished&lt;/option&gt;\n    &lt;/select&gt;\n&lt;/div&gt;\n\n&lt;!-- Text Area --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;textarea_0&quot;&gt;Event Description&lt;/label&gt;\n    &lt;textarea id=&quot;textarea_0&quot; name=&quot;textarea_0&quot; rows=&quot;3&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;&lt;/textarea&gt;\n&lt;/div&gt;\n\n&lt;!-- Radio --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt; \n    &lt;label class=&quot;control-label&quot; for=&quot;radio_0&quot;&gt;Does your program involve any type of outside activity?&lt;/label&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_0&quot; id=&quot;radio_0_0&quot; value=&quot;Yes&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_0_0&quot; class=&quot;radio-inline&quot;&gt;\n        Yes &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_0&quot; id=&quot;radio_0_1&quot; value=&quot;No&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_0_1&quot; class=&quot;radio-inline&quot;&gt;\n        No &lt;/label&gt;\n    &lt;/div&gt;\n    \n    &lt;span id=&quot;radio_0&quot;&gt;&lt;/span&gt;\n&lt;/div&gt;\n\n&lt;!-- Number --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;number_0&quot;&gt;Cost Per Person ($)&lt;/label&gt;\n    &lt;input type=&quot;number&quot; id=&quot;number_0&quot; name=&quot;number_0&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Checkbox --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt; \n    &lt;label class=&quot;control-label&quot; for=&quot;checkbox_0&quot;&gt;Requirements&lt;/label&gt;\n    &lt;div class=&quot;checkbox &quot;&gt;\n        &lt;input type=&quot;checkbox&quot; name=&quot;checkbox_0[]&quot; id=&quot;checkbox_0_0&quot; value=&quot;Staffing&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;checkbox_0_0&quot; class=&quot;checkbox-inline&quot;&gt;\n        Staffing &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;checkbox &quot;&gt;\n        &lt;input type=&quot;checkbox&quot; name=&quot;checkbox_0[]&quot; id=&quot;checkbox_0_1&quot; value=&quot;Catering&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;checkbox_0_1&quot; class=&quot;checkbox-inline&quot;&gt;\n        Catering &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;checkbox &quot;&gt;\n        &lt;input type=&quot;checkbox&quot; name=&quot;checkbox_0[]&quot; id=&quot;checkbox_0_2&quot; value=&quot;Security&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;checkbox_0_2&quot; class=&quot;checkbox-inline&quot;&gt;\n        Security &lt;/label&gt;\n    &lt;/div&gt;\n    \n    &lt;span id=&quot;checkbox_0&quot;&gt;&lt;/span&gt;\n&lt;/div&gt;\n\n&lt;!-- Date --&gt;\n&lt;div class=&quot;form-group col-sm-6 no-padding-left&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;date_0&quot;&gt;Event Start Date&lt;/label&gt;\n    &lt;input type=&quot;datetime-local&quot; id=&quot;date_0&quot; name=&quot;date_0&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Date --&gt;\n&lt;div class=&quot;form-group col-sm-6 no-padding&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;date_1&quot;&gt;Event End Date&lt;/label&gt;\n    &lt;input type=&quot;datetime-local&quot; id=&quot;date_1&quot; name=&quot;date_1&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Text Area --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;textarea_1&quot;&gt;Location&lt;/label&gt;\n    &lt;textarea id=&quot;textarea_1&quot; name=&quot;textarea_1&quot; rows=&quot;3&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;&lt;/textarea&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group col-sm-4 no-padding-left&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_2&quot;&gt;City&lt;/label&gt;\n    &lt;input type=&quot;text&quot; id=&quot;text_2&quot; name=&quot;text_2&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group col-sm-4 no-padding&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_3&quot;&gt;State&lt;/label&gt;\n    &lt;input type=&quot;text&quot; id=&quot;text_3&quot; name=&quot;text_3&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Select List --&gt;\n&lt;div class=&quot;form-group col-sm-4 no-padding-right&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;selectlist_2&quot;&gt;Country&lt;/label&gt;\n    &lt;select id=&quot;selectlist_2&quot; name=&quot;selectlist_2[]&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n        &lt;option value=&quot;&quot; disabled=&quot;&quot; selected=&quot;&quot;&gt;-Select-&lt;/option&gt;\n        &lt;option value=&quot;United States&quot;&gt;United States&lt;/option&gt;\n        &lt;option value=&quot;United Kingdom&quot;&gt;United Kingdom&lt;/option&gt;\n        &lt;option value=&quot;Australia&quot;&gt;Australia&lt;/option&gt;\n        &lt;option value=&quot;Canada&quot;&gt;Canada&lt;/option&gt;\n        &lt;option value=&quot;France&quot;&gt;France&lt;/option&gt;\n        &lt;option value=&quot;----&quot;&gt;----&lt;/option&gt;\n        &lt;option value=&quot;Afghanistan&quot;&gt;Afghanistan&lt;/option&gt;\n        &lt;option value=&quot;Albania&quot;&gt;Albania&lt;/option&gt;\n        &lt;option value=&quot;Algeria&quot;&gt;Algeria&lt;/option&gt;\n        &lt;option value=&quot;Andorra&quot;&gt;Andorra&lt;/option&gt;\n        &lt;option value=&quot;Angola&quot;&gt;Angola&lt;/option&gt;\n        &lt;option value=&quot;Antigua &amp;amp; Deps&quot;&gt;Antigua &amp;amp; Deps&lt;/option&gt;\n        &lt;option value=&quot;Argentina&quot;&gt;Argentina&lt;/option&gt;\n        &lt;option value=&quot;Armenia&quot;&gt;Armenia&lt;/option&gt;\n        &lt;option value=&quot;Austria&quot;&gt;Austria&lt;/option&gt;\n        &lt;option value=&quot;Azerbaijan&quot;&gt;Azerbaijan&lt;/option&gt;\n        &lt;option value=&quot;Bahamas&quot;&gt;Bahamas&lt;/option&gt;\n        &lt;option value=&quot;Bahrain&quot;&gt;Bahrain&lt;/option&gt;\n        &lt;option value=&quot;Bangladesh&quot;&gt;Bangladesh&lt;/option&gt;\n        &lt;option value=&quot;Barbados&quot;&gt;Barbados&lt;/option&gt;\n        &lt;option value=&quot;Belarus&quot;&gt;Belarus&lt;/option&gt;\n        &lt;option value=&quot;Belgium&quot;&gt;Belgium&lt;/option&gt;\n        &lt;option value=&quot;Belize&quot;&gt;Belize&lt;/option&gt;\n        &lt;option value=&quot;Benin&quot;&gt;Benin&lt;/option&gt;\n        &lt;option value=&quot;Bhutan&quot;&gt;Bhutan&lt;/option&gt;\n        &lt;option value=&quot;Bolivia&quot;&gt;Bolivia&lt;/option&gt;\n        &lt;option value=&quot;Bosnia Herzegovina&quot;&gt;Bosnia Herzegovina&lt;/option&gt;\n        &lt;option value=&quot;Botswana&quot;&gt;Botswana&lt;/option&gt;\n        &lt;option value=&quot;Brazil&quot;&gt;Brazil&lt;/option&gt;\n        &lt;option value=&quot;Brunei&quot;&gt;Brunei&lt;/option&gt;\n        &lt;option value=&quot;Bulgaria&quot;&gt;Bulgaria&lt;/option&gt;\n        &lt;option value=&quot;Burkina&quot;&gt;Burkina&lt;/option&gt;\n        &lt;option value=&quot;Burundi&quot;&gt;Burundi&lt;/option&gt;\n        &lt;option value=&quot;Cambodia&quot;&gt;Cambodia&lt;/option&gt;\n        &lt;option value=&quot;Cameroon&quot;&gt;Cameroon&lt;/option&gt;\n        &lt;option value=&quot;Cape Verde&quot;&gt;Cape Verde&lt;/option&gt;\n        &lt;option value=&quot;Central African Rep&quot;&gt;Central African Rep&lt;/option&gt;\n        &lt;option value=&quot;Chad&quot;&gt;Chad&lt;/option&gt;\n        &lt;option value=&quot;Chile&quot;&gt;Chile&lt;/option&gt;\n        &lt;option value=&quot;China&quot;&gt;China&lt;/option&gt;\n        &lt;option value=&quot;Colombia&quot;&gt;Colombia&lt;/option&gt;\n        &lt;option value=&quot;Comoros&quot;&gt;Comoros&lt;/option&gt;\n        &lt;option value=&quot;Congo&quot;&gt;Congo&lt;/option&gt;\n        &lt;option value=&quot;Congo {Democratic Rep}&quot;&gt;Congo {Democratic Rep}&lt;/option&gt;\n        &lt;option value=&quot;Costa Rica&quot;&gt;Costa Rica&lt;/option&gt;\n        &lt;option value=&quot;Croatia&quot;&gt;Croatia&lt;/option&gt;\n        &lt;option value=&quot;Cuba&quot;&gt;Cuba&lt;/option&gt;\n        &lt;option value=&quot;Cyprus&quot;&gt;Cyprus&lt;/option&gt;\n        &lt;option value=&quot;Czech Republic&quot;&gt;Czech Republic&lt;/option&gt;\n        &lt;option value=&quot;Denmark&quot;&gt;Denmark&lt;/option&gt;\n        &lt;option value=&quot;Djibouti&quot;&gt;Djibouti&lt;/option&gt;\n        &lt;option value=&quot;Dominica&quot;&gt;Dominica&lt;/option&gt;\n        &lt;option value=&quot;Dominican Republic&quot;&gt;Dominican Republic&lt;/option&gt;\n        &lt;option value=&quot;East Timor&quot;&gt;East Timor&lt;/option&gt;\n        &lt;option value=&quot;Ecuador&quot;&gt;Ecuador&lt;/option&gt;\n        &lt;option value=&quot;Egypt&quot;&gt;Egypt&lt;/option&gt;\n        &lt;option value=&quot;El Salvador&quot;&gt;El Salvador&lt;/option&gt;\n        &lt;option value=&quot;Equatorial Guinea&quot;&gt;Equatorial Guinea&lt;/option&gt;\n        &lt;option value=&quot;Eritrea&quot;&gt;Eritrea&lt;/option&gt;\n        &lt;option value=&quot;Estonia&quot;&gt;Estonia&lt;/option&gt;\n        &lt;option value=&quot;Ethiopia&quot;&gt;Ethiopia&lt;/option&gt;\n        &lt;option value=&quot;Fiji&quot;&gt;Fiji&lt;/option&gt;\n        &lt;option value=&quot;Finland&quot;&gt;Finland&lt;/option&gt;\n        &lt;option value=&quot;Gabon&quot;&gt;Gabon&lt;/option&gt;\n        &lt;option value=&quot;Gambia&quot;&gt;Gambia&lt;/option&gt;\n        &lt;option value=&quot;Georgia&quot;&gt;Georgia&lt;/option&gt;\n        &lt;option value=&quot;Germany&quot;&gt;Germany&lt;/option&gt;\n        &lt;option value=&quot;Ghana&quot;&gt;Ghana&lt;/option&gt;\n        &lt;option value=&quot;Greece&quot;&gt;Greece&lt;/option&gt;\n        &lt;option value=&quot;Grenada&quot;&gt;Grenada&lt;/option&gt;\n        &lt;option value=&quot;Guatemala&quot;&gt;Guatemala&lt;/option&gt;\n        &lt;option value=&quot;Guinea&quot;&gt;Guinea&lt;/option&gt;\n        &lt;option value=&quot;Guinea-Bissau&quot;&gt;Guinea-Bissau&lt;/option&gt;\n        &lt;option value=&quot;Guyana&quot;&gt;Guyana&lt;/option&gt;\n        &lt;option value=&quot;Haiti&quot;&gt;Haiti&lt;/option&gt;\n        &lt;option value=&quot;Honduras&quot;&gt;Honduras&lt;/option&gt;\n        &lt;option value=&quot;Hungary&quot;&gt;Hungary&lt;/option&gt;\n        &lt;option value=&quot;Iceland&quot;&gt;Iceland&lt;/option&gt;\n        &lt;option value=&quot;India&quot;&gt;India&lt;/option&gt;\n        &lt;option value=&quot;Indonesia&quot;&gt;Indonesia&lt;/option&gt;\n        &lt;option value=&quot;Iran&quot;&gt;Iran&lt;/option&gt;\n        &lt;option value=&quot;Iraq&quot;&gt;Iraq&lt;/option&gt;\n        &lt;option value=&quot;Ireland {Republic}&quot;&gt;Ireland {Republic}&lt;/option&gt;\n        &lt;option value=&quot;Israel&quot;&gt;Israel&lt;/option&gt;\n        &lt;option value=&quot;Italy&quot;&gt;Italy&lt;/option&gt;\n        &lt;option value=&quot;Ivory Coast&quot;&gt;Ivory Coast&lt;/option&gt;\n        &lt;option value=&quot;Jamaica&quot;&gt;Jamaica&lt;/option&gt;\n        &lt;option value=&quot;Japan&quot;&gt;Japan&lt;/option&gt;\n        &lt;option value=&quot;Jordan&quot;&gt;Jordan&lt;/option&gt;\n        &lt;option value=&quot;Kazakhstan&quot;&gt;Kazakhstan&lt;/option&gt;\n        &lt;option value=&quot;Kenya&quot;&gt;Kenya&lt;/option&gt;\n        &lt;option value=&quot;Kiribati&quot;&gt;Kiribati&lt;/option&gt;\n        &lt;option value=&quot;Korea North&quot;&gt;Korea North&lt;/option&gt;\n        &lt;option value=&quot;Korea South&quot;&gt;Korea South&lt;/option&gt;\n        &lt;option value=&quot;Kosovo&quot;&gt;Kosovo&lt;/option&gt;\n        &lt;option value=&quot;Kuwait&quot;&gt;Kuwait&lt;/option&gt;\n        &lt;option value=&quot;Kyrgyzstan&quot;&gt;Kyrgyzstan&lt;/option&gt;\n        &lt;option value=&quot;Laos&quot;&gt;Laos&lt;/option&gt;\n        &lt;option value=&quot;Latvia&quot;&gt;Latvia&lt;/option&gt;\n        &lt;option value=&quot;Lebanon&quot;&gt;Lebanon&lt;/option&gt;\n        &lt;option value=&quot;Lesotho&quot;&gt;Lesotho&lt;/option&gt;\n        &lt;option value=&quot;Liberia&quot;&gt;Liberia&lt;/option&gt;\n        &lt;option value=&quot;Libya&quot;&gt;Libya&lt;/option&gt;\n        &lt;option value=&quot;Liechtenstein&quot;&gt;Liechtenstein&lt;/option&gt;\n        &lt;option value=&quot;Lithuania&quot;&gt;Lithuania&lt;/option&gt;\n        &lt;option value=&quot;Luxembourg&quot;&gt;Luxembourg&lt;/option&gt;\n        &lt;option value=&quot;Macedonia&quot;&gt;Macedonia&lt;/option&gt;\n        &lt;option value=&quot;Madagascar&quot;&gt;Madagascar&lt;/option&gt;\n        &lt;option value=&quot;Malawi&quot;&gt;Malawi&lt;/option&gt;\n        &lt;option value=&quot;Malaysia&quot;&gt;Malaysia&lt;/option&gt;\n        &lt;option value=&quot;Maldives&quot;&gt;Maldives&lt;/option&gt;\n        &lt;option value=&quot;Mali&quot;&gt;Mali&lt;/option&gt;\n        &lt;option value=&quot;Malta&quot;&gt;Malta&lt;/option&gt;\n        &lt;option value=&quot;Marshall Islands&quot;&gt;Marshall Islands&lt;/option&gt;\n        &lt;option value=&quot;Mauritania&quot;&gt;Mauritania&lt;/option&gt;\n        &lt;option value=&quot;Mauritius&quot;&gt;Mauritius&lt;/option&gt;\n        &lt;option value=&quot;Mexico&quot;&gt;Mexico&lt;/option&gt;\n        &lt;option value=&quot;Micronesia&quot;&gt;Micronesia&lt;/option&gt;\n        &lt;option value=&quot;Moldova&quot;&gt;Moldova&lt;/option&gt;\n        &lt;option value=&quot;Monaco&quot;&gt;Monaco&lt;/option&gt;\n        &lt;option value=&quot;Mongolia&quot;&gt;Mongolia&lt;/option&gt;\n        &lt;option value=&quot;Montenegro&quot;&gt;Montenegro&lt;/option&gt;\n        &lt;option value=&quot;Morocco&quot;&gt;Morocco&lt;/option&gt;\n        &lt;option value=&quot;Mozambique&quot;&gt;Mozambique&lt;/option&gt;\n        &lt;option value=&quot;Myanmar, {Burma}&quot;&gt;Myanmar, {Burma}&lt;/option&gt;\n        &lt;option value=&quot;Namibia&quot;&gt;Namibia&lt;/option&gt;\n        &lt;option value=&quot;Nauru&quot;&gt;Nauru&lt;/option&gt;\n        &lt;option value=&quot;Nepal&quot;&gt;Nepal&lt;/option&gt;\n        &lt;option value=&quot;Netherlands&quot;&gt;Netherlands&lt;/option&gt;\n        &lt;option value=&quot;New Zealand&quot;&gt;New Zealand&lt;/option&gt;\n        &lt;option value=&quot;Nicaragua&quot;&gt;Nicaragua&lt;/option&gt;\n        &lt;option value=&quot;Niger&quot;&gt;Niger&lt;/option&gt;\n        &lt;option value=&quot;Nigeria&quot;&gt;Nigeria&lt;/option&gt;\n        &lt;option value=&quot;Norway&quot;&gt;Norway&lt;/option&gt;\n        &lt;option value=&quot;Oman&quot;&gt;Oman&lt;/option&gt;\n        &lt;option value=&quot;Pakistan&quot;&gt;Pakistan&lt;/option&gt;\n        &lt;option value=&quot;Palau&quot;&gt;Palau&lt;/option&gt;\n        &lt;option value=&quot;Panama&quot;&gt;Panama&lt;/option&gt;\n        &lt;option value=&quot;Papua New Guinea&quot;&gt;Papua New Guinea&lt;/option&gt;\n        &lt;option value=&quot;Paraguay&quot;&gt;Paraguay&lt;/option&gt;\n        &lt;option value=&quot;Peru&quot;&gt;Peru&lt;/option&gt;\n        &lt;option value=&quot;Philippines&quot;&gt;Philippines&lt;/option&gt;\n        &lt;option value=&quot;Poland&quot;&gt;Poland&lt;/option&gt;\n        &lt;option value=&quot;Portugal&quot;&gt;Portugal&lt;/option&gt;\n        &lt;option value=&quot;Qatar&quot;&gt;Qatar&lt;/option&gt;\n        &lt;option value=&quot;Romania&quot;&gt;Romania&lt;/option&gt;\n        &lt;option value=&quot;Russian Federation&quot;&gt;Russian Federation&lt;/option&gt;\n        &lt;option value=&quot;Rwanda&quot;&gt;Rwanda&lt;/option&gt;\n        &lt;option value=&quot;St Kitts &amp;amp; Nevis&quot;&gt;St Kitts &amp;amp; Nevis&lt;/option&gt;\n        &lt;option value=&quot;St Lucia&quot;&gt;St Lucia&lt;/option&gt;\n        &lt;option value=&quot;Saint Vincent &amp;amp; the Grenadines&quot;&gt;Saint Vincent &amp;amp; the Grenadines&lt;/option&gt;\n        &lt;option value=&quot;Samoa&quot;&gt;Samoa&lt;/option&gt;\n        &lt;option value=&quot;San Marino&quot;&gt;San Marino&lt;/option&gt;\n        &lt;option value=&quot;Sao Tome &amp;amp; Principe&quot;&gt;Sao Tome &amp;amp; Principe&lt;/option&gt;\n        &lt;option value=&quot;Saudi Arabia&quot;&gt;Saudi Arabia&lt;/option&gt;\n        &lt;option value=&quot;Senegal&quot;&gt;Senegal&lt;/option&gt;\n        &lt;option value=&quot;Serbia&quot;&gt;Serbia&lt;/option&gt;\n        &lt;option value=&quot;Seychelles&quot;&gt;Seychelles&lt;/option&gt;\n        &lt;option value=&quot;Sierra Leone&quot;&gt;Sierra Leone&lt;/option&gt;\n        &lt;option value=&quot;Singapore&quot;&gt;Singapore&lt;/option&gt;\n        &lt;option value=&quot;Slovakia&quot;&gt;Slovakia&lt;/option&gt;\n        &lt;option value=&quot;Slovenia&quot;&gt;Slovenia&lt;/option&gt;\n        &lt;option value=&quot;Solomon Islands&quot;&gt;Solomon Islands&lt;/option&gt;\n        &lt;option value=&quot;Somalia&quot;&gt;Somalia&lt;/option&gt;\n        &lt;option value=&quot;South Africa&quot;&gt;South Africa&lt;/option&gt;\n        &lt;option value=&quot;South Sudan&quot;&gt;South Sudan&lt;/option&gt;\n        &lt;option value=&quot;Spain&quot;&gt;Spain&lt;/option&gt;\n        &lt;option value=&quot;Sri Lanka&quot;&gt;Sri Lanka&lt;/option&gt;\n        &lt;option value=&quot;Sudan&quot;&gt;Sudan&lt;/option&gt;\n        &lt;option value=&quot;Suriname&quot;&gt;Suriname&lt;/option&gt;\n        &lt;option value=&quot;Swaziland&quot;&gt;Swaziland&lt;/option&gt;\n        &lt;option value=&quot;Sweden&quot;&gt;Sweden&lt;/option&gt;\n        &lt;option value=&quot;Switzerland&quot;&gt;Switzerland&lt;/option&gt;\n        &lt;option value=&quot;Syria&quot;&gt;Syria&lt;/option&gt;\n        &lt;option value=&quot;Taiwan&quot;&gt;Taiwan&lt;/option&gt;\n        &lt;option value=&quot;Tajikistan&quot;&gt;Tajikistan&lt;/option&gt;\n        &lt;option value=&quot;Tanzania&quot;&gt;Tanzania&lt;/option&gt;\n        &lt;option value=&quot;Thailand&quot;&gt;Thailand&lt;/option&gt;\n        &lt;option value=&quot;Togo&quot;&gt;Togo&lt;/option&gt;\n        &lt;option value=&quot;Tonga&quot;&gt;Tonga&lt;/option&gt;\n        &lt;option value=&quot;Trinidad &amp;amp; Tobago&quot;&gt;Trinidad &amp;amp; Tobago&lt;/option&gt;\n        &lt;option value=&quot;Tunisia&quot;&gt;Tunisia&lt;/option&gt;\n        &lt;option value=&quot;Turkey&quot;&gt;Turkey&lt;/option&gt;\n        &lt;option value=&quot;Turkmenistan&quot;&gt;Turkmenistan&lt;/option&gt;\n        &lt;option value=&quot;Tuvalu&quot;&gt;Tuvalu&lt;/option&gt;\n        &lt;option value=&quot;Uganda&quot;&gt;Uganda&lt;/option&gt;\n        &lt;option value=&quot;Ukraine&quot;&gt;Ukraine&lt;/option&gt;\n        &lt;option value=&quot;United Arab Emirates&quot;&gt;United Arab Emirates&lt;/option&gt;\n        &lt;option value=&quot;Uruguay&quot;&gt;Uruguay&lt;/option&gt;\n        &lt;option value=&quot;Uzbekistan&quot;&gt;Uzbekistan&lt;/option&gt;\n        &lt;option value=&quot;Vanuatu&quot;&gt;Vanuatu&lt;/option&gt;\n        &lt;option value=&quot;Vatican City&quot;&gt;Vatican City&lt;/option&gt;\n        &lt;option value=&quot;Venezuela&quot;&gt;Venezuela&lt;/option&gt;\n        &lt;option value=&quot;Vietnam&quot;&gt;Vietnam&lt;/option&gt;\n        &lt;option value=&quot;Yemen&quot;&gt;Yemen&lt;/option&gt;\n        &lt;option value=&quot;Zambia&quot;&gt;Zambia&lt;/option&gt;\n        &lt;option value=&quot;Zimbabwe&quot;&gt;Zimbabwe&lt;/option&gt;\n    &lt;/select&gt;\n&lt;/div&gt;\n\n&lt;!-- File --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;file_0&quot;&gt;Attach Detailed Itinerary&lt;/label&gt;\n    &lt;input type=&quot;file&quot; id=&quot;file_0&quot; name=&quot;file_0&quot; data-alias=&quot;&quot; accept=&quot;.txt, .pdf, .doc, .docx&quot;&gt;\n&lt;/div&gt;\n\n &lt;!-- Button --&gt;\n&lt;div class=&quot;form-action col-xs-12&quot;&gt;\n    &lt;button type=&quot;submit&quot; id=&quot;button_0&quot; name=&quot;button_0&quot; class=&quot;btn btn-primary&quot;&gt;Submit&lt;/button&gt;\n&lt;/div&gt;\n\r\n&lt;/fieldset&gt;\r\n&lt;/form&gt;', 0, 'rencana-kegiatan', 1, 1, 1567272311, 1599769934);
INSERT INTO `template` (`id`, `category_id`, `name`, `description`, `builder`, `html`, `promoted`, `slug`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(9, 7, 'Buku Tamu', 'Use our online address book to easily input, organize, and store your personal contacts.', '{\"settings\":{\"name\":\"Buku Tamu\",\"canvas\":\"#canvas\",\"disabledFieldset\":false,\"layoutSelected\":\"\",\"layouts\":[{\"id\":\"\",\"name\":\"Vertical\"},{\"id\":\"form-horizontal\",\"name\":\"Horizontal\"},{\"id\":\"form-inline\",\"name\":\"Inline\"}],\"formSteps\":{\"title\":\"formSteps.title\",\"fields\":{\"id\":{\"label\":\"formSteps.id\",\"type\":\"input\",\"value\":\"formSteps\",\"name\":\"id\"},\"steps\":{\"label\":\"formSteps.steps\",\"type\":\"textarea-split\",\"value\":[],\"name\":\"steps\"},\"progressBar\":{\"label\":\"formSteps.progressBar\",\"type\":\"checkbox\",\"value\":false,\"name\":\"progressBar\"},\"noTitles\":{\"label\":\"formSteps.noTitles\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noTitles\"},\"noStages\":{\"label\":\"formSteps.noStages\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noStages\"},\"noSteps\":{\"label\":\"formSteps.noSteps\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noSteps\"}}}},\"initForm\":[{\"name\":\"heading\",\"title\":\"heading.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"heading_0\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"input\",\"value\":\"Buku Tamu\",\"name\":\"text\"},\"type\":{\"label\":\"component.type\",\"type\":\"select\",\"value\":[{\"value\":\"h1\",\"selected\":false,\"label\":\"H1\"},{\"value\":\"h2\",\"selected\":false,\"label\":\"H2\"},{\"value\":\"h3\",\"selected\":true,\"label\":\"H3\"},{\"value\":\"h4\",\"selected\":false,\"label\":\"H4\"},{\"value\":\"h5\",\"selected\":false,\"label\":\"H5\"},{\"value\":\"h6\",\"selected\":false,\"label\":\"H6\"}],\"name\":\"type\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"legend\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_0\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":true,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Name\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"file\",\"title\":\"file.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"file_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Photo\",\"name\":\"label\"},\"accept\":{\"label\":\"component.accept\",\"type\":\"input\",\"value\":\".gif, .jpg, .png\",\"name\":\"accept\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"minSize\":{\"label\":\"component.minSize\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"minSize\"},\"maxSize\":{\"label\":\"component.maxSize\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"maxSize\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_1\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":true,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Address\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_2\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":true,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"City\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-sm-4 no-padding-left\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_3\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":true,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"State\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-sm-4 no-padding\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"selectlist\",\"title\":\"selectlist.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"selectlist_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Country\",\"name\":\"label\"},\"options\":{\"label\":\"component.options\",\"type\":\"textarea-split\",\"value\":[\"United States\",\"United Kingdom\",\"Australia\",\"Canada\",\"France\",\"----\",\"Afghanistan\",\"Albania\",\"Algeria\",\"Andorra\",\"Angola\",\"Antigua \\u0026 Deps\",\"Argentina\",\"Armenia\",\"Austria\",\"Azerbaijan\",\"Bahamas\",\"Bahrain\",\"Bangladesh\",\"Barbados\",\"Belarus\",\"Belgium\",\"Belize\",\"Benin\",\"Bhutan\",\"Bolivia\",\"Bosnia Herzegovina\",\"Botswana\",\"Brazil\",\"Brunei\",\"Bulgaria\",\"Burkina\",\"Burundi\",\"Cambodia\",\"Cameroon\",\"Cape Verde\",\"Central African Rep\",\"Chad\",\"Chile\",\"China\",\"Colombia\",\"Comoros\",\"Congo\",\"Congo {Democratic Rep}\",\"Costa Rica\",\"Croatia\",\"Cuba\",\"Cyprus\",\"Czech Republic\",\"Denmark\",\"Djibouti\",\"Dominica\",\"Dominican Republic\",\"East Timor\",\"Ecuador\",\"Egypt\",\"El Salvador\",\"Equatorial Guinea\",\"Eritrea\",\"Estonia\",\"Ethiopia\",\"Fiji\",\"Finland\",\"Gabon\",\"Gambia\",\"Georgia\",\"Germany\",\"Ghana\",\"Greece\",\"Grenada\",\"Guatemala\",\"Guinea\",\"Guinea-Bissau\",\"Guyana\",\"Haiti\",\"Honduras\",\"Hungary\",\"Iceland\",\"India\",\"Indonesia\",\"Iran\",\"Iraq\",\"Ireland {Republic}\",\"Israel\",\"Italy\",\"Ivory Coast\",\"Jamaica\",\"Japan\",\"Jordan\",\"Kazakhstan\",\"Kenya\",\"Kiribati\",\"Korea North\",\"Korea South\",\"Kosovo\",\"Kuwait\",\"Kyrgyzstan\",\"Laos\",\"Latvia\",\"Lebanon\",\"Lesotho\",\"Liberia\",\"Libya\",\"Liechtenstein\",\"Lithuania\",\"Luxembourg\",\"Macedonia\",\"Madagascar\",\"Malawi\",\"Malaysia\",\"Maldives\",\"Mali\",\"Malta\",\"Marshall Islands\",\"Mauritania\",\"Mauritius\",\"Mexico\",\"Micronesia\",\"Moldova\",\"Monaco\",\"Mongolia\",\"Montenegro\",\"Morocco\",\"Mozambique\",\"Myanmar, {Burma}\",\"Namibia\",\"Nauru\",\"Nepal\",\"Netherlands\",\"New Zealand\",\"Nicaragua\",\"Niger\",\"Nigeria\",\"Norway\",\"Oman\",\"Pakistan\",\"Palau\",\"Panama\",\"Papua New Guinea\",\"Paraguay\",\"Peru\",\"Philippines\",\"Poland\",\"Portugal\",\"Qatar\",\"Romania\",\"Russian Federation\",\"Rwanda\",\"St Kitts \\u0026 Nevis\",\"St Lucia\",\"Saint Vincent \\u0026 the Grenadines\",\"Samoa\",\"San Marino\",\"Sao Tome \\u0026 Principe\",\"Saudi Arabia\",\"Senegal\",\"Serbia\",\"Seychelles\",\"Sierra Leone\",\"Singapore\",\"Slovakia\",\"Slovenia\",\"Solomon Islands\",\"Somalia\",\"South Africa\",\"South Sudan\",\"Spain\",\"Sri Lanka\",\"Sudan\",\"Suriname\",\"Swaziland\",\"Sweden\",\"Switzerland\",\"Syria\",\"Taiwan\",\"Tajikistan\",\"Tanzania\",\"Thailand\",\"Togo\",\"Tonga\",\"Trinidad \\u0026 Tobago\",\"Tunisia\",\"Turkey\",\"Turkmenistan\",\"Tuvalu\",\"Uganda\",\"Ukraine\",\"United Arab Emirates\",\"Uruguay\",\"Uzbekistan\",\"Vanuatu\",\"Vatican City\",\"Venezuela\",\"Vietnam\",\"Yemen\",\"Zambia\",\"Zimbabwe\"],\"name\":\"options\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"-Select-\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-sm-4 no-padding-right\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"},\"multiple\":{\"label\":\"component.multiple\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"multiple\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_4\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":false,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":false,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":true,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Web Site\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"email\",\"title\":\"email.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"email_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Email Address\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"checkdns\":{\"label\":\"component.checkDNS\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"checkdns\"},\"multiple\":{\"label\":\"component.multiple\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"multiple\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_5\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":false,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":true,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Home Phone\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-sm-6 no-padding-left\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"text\",\"title\":\"text.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"text_6\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"text\",\"selected\":false,\"label\":\"Text\"},{\"value\":\"tel\",\"selected\":true,\"label\":\"Tel\"},{\"value\":\"url\",\"selected\":false,\"label\":\"URL\"},{\"value\":\"color\",\"selected\":false,\"label\":\"Color\"},{\"value\":\"password\",\"selected\":false,\"label\":\"Password\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Cell Phone\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"pattern\":{\"label\":\"component.pattern\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"pattern\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"col-sm-6 no-padding\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"date\",\"title\":\"date.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"date_0\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.inputType\",\"type\":\"select\",\"value\":[{\"value\":\"date\",\"selected\":true,\"label\":\"Date\"},{\"value\":\"datetime-local\",\"selected\":false,\"label\":\"DateTime-Local\"},{\"value\":\"time\",\"selected\":false,\"label\":\"Time\"},{\"value\":\"month\",\"selected\":false,\"label\":\"Month\"},{\"value\":\"week\",\"selected\":false,\"label\":\"Week\"}],\"name\":\"inputType\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Birthday\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"min\":{\"label\":\"component.minDate\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"min\"},\"max\":{\"label\":\"component.maxDate\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"max\"},\"step\":{\"label\":\"component.stepNumber\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"step\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"textarea\",\"title\":\"textarea.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"textarea_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Notes\",\"name\":\"label\"},\"placeholder\":{\"label\":\"component.placeholder\",\"type\":\"input\",\"value\":\"\",\"name\":\"placeholder\"},\"predefinedValue\":{\"label\":\"component.predefinedValue\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"predefinedValue\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"fieldSize\":{\"label\":\"component.fieldSize\",\"type\":\"input\",\"value\":\"3\",\"advanced\":true,\"name\":\"fieldSize\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"form-control\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"unique\":{\"label\":\"component.unique\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"unique\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false},{\"name\":\"button\",\"title\":\"button.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"button_0\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.type\",\"type\":\"select\",\"value\":[{\"value\":\"submit\",\"label\":\"Submit\",\"selected\":true},{\"value\":\"reset\",\"label\":\"Reset\",\"selected\":false},{\"value\":\"image\",\"label\":\"Image\",\"selected\":false}],\"name\":\"inputType\"},\"buttonText\":{\"label\":\"component.buttonText\",\"type\":\"input\",\"value\":\"Submit\",\"name\":\"buttonText\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"label\"},\"src\":{\"label\":\"component.src\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"src\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"btn btn-primary\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false}],\"height\":776}', '&lt;form id=&quot;form-app&quot; enctype=&quot;multipart/form-data&quot;&gt;\r\n&lt;fieldset class=&quot;row&quot;&gt;\r\n\r\n&lt;!-- Heading --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;h3 class=&quot;legend&quot;&gt;Buku Tamu&lt;/h3&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_0&quot;&gt;Name&lt;/label&gt;\n    &lt;input type=&quot;text&quot; id=&quot;text_0&quot; name=&quot;text_0&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- File --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;file_0&quot;&gt;Photo&lt;/label&gt;\n    &lt;input type=&quot;file&quot; id=&quot;file_0&quot; name=&quot;file_0&quot; data-alias=&quot;&quot; accept=&quot;.gif, .jpg, .png&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_1&quot;&gt;Address&lt;/label&gt;\n    &lt;input type=&quot;text&quot; id=&quot;text_1&quot; name=&quot;text_1&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group col-sm-4 no-padding-left&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_2&quot;&gt;City&lt;/label&gt;\n    &lt;input type=&quot;text&quot; id=&quot;text_2&quot; name=&quot;text_2&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group col-sm-4 no-padding&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_3&quot;&gt;State&lt;/label&gt;\n    &lt;input type=&quot;text&quot; id=&quot;text_3&quot; name=&quot;text_3&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Select List --&gt;\n&lt;div class=&quot;form-group col-sm-4 no-padding-right&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;selectlist_0&quot;&gt;Country&lt;/label&gt;\n    &lt;select id=&quot;selectlist_0&quot; name=&quot;selectlist_0[]&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n        &lt;option value=&quot;&quot; disabled=&quot;&quot; selected=&quot;&quot;&gt;-Select-&lt;/option&gt;\n        &lt;option value=&quot;United States&quot;&gt;United States&lt;/option&gt;\n        &lt;option value=&quot;United Kingdom&quot;&gt;United Kingdom&lt;/option&gt;\n        &lt;option value=&quot;Australia&quot;&gt;Australia&lt;/option&gt;\n        &lt;option value=&quot;Canada&quot;&gt;Canada&lt;/option&gt;\n        &lt;option value=&quot;France&quot;&gt;France&lt;/option&gt;\n        &lt;option value=&quot;----&quot;&gt;----&lt;/option&gt;\n        &lt;option value=&quot;Afghanistan&quot;&gt;Afghanistan&lt;/option&gt;\n        &lt;option value=&quot;Albania&quot;&gt;Albania&lt;/option&gt;\n        &lt;option value=&quot;Algeria&quot;&gt;Algeria&lt;/option&gt;\n        &lt;option value=&quot;Andorra&quot;&gt;Andorra&lt;/option&gt;\n        &lt;option value=&quot;Angola&quot;&gt;Angola&lt;/option&gt;\n        &lt;option value=&quot;Antigua &amp;amp; Deps&quot;&gt;Antigua &amp;amp; Deps&lt;/option&gt;\n        &lt;option value=&quot;Argentina&quot;&gt;Argentina&lt;/option&gt;\n        &lt;option value=&quot;Armenia&quot;&gt;Armenia&lt;/option&gt;\n        &lt;option value=&quot;Austria&quot;&gt;Austria&lt;/option&gt;\n        &lt;option value=&quot;Azerbaijan&quot;&gt;Azerbaijan&lt;/option&gt;\n        &lt;option value=&quot;Bahamas&quot;&gt;Bahamas&lt;/option&gt;\n        &lt;option value=&quot;Bahrain&quot;&gt;Bahrain&lt;/option&gt;\n        &lt;option value=&quot;Bangladesh&quot;&gt;Bangladesh&lt;/option&gt;\n        &lt;option value=&quot;Barbados&quot;&gt;Barbados&lt;/option&gt;\n        &lt;option value=&quot;Belarus&quot;&gt;Belarus&lt;/option&gt;\n        &lt;option value=&quot;Belgium&quot;&gt;Belgium&lt;/option&gt;\n        &lt;option value=&quot;Belize&quot;&gt;Belize&lt;/option&gt;\n        &lt;option value=&quot;Benin&quot;&gt;Benin&lt;/option&gt;\n        &lt;option value=&quot;Bhutan&quot;&gt;Bhutan&lt;/option&gt;\n        &lt;option value=&quot;Bolivia&quot;&gt;Bolivia&lt;/option&gt;\n        &lt;option value=&quot;Bosnia Herzegovina&quot;&gt;Bosnia Herzegovina&lt;/option&gt;\n        &lt;option value=&quot;Botswana&quot;&gt;Botswana&lt;/option&gt;\n        &lt;option value=&quot;Brazil&quot;&gt;Brazil&lt;/option&gt;\n        &lt;option value=&quot;Brunei&quot;&gt;Brunei&lt;/option&gt;\n        &lt;option value=&quot;Bulgaria&quot;&gt;Bulgaria&lt;/option&gt;\n        &lt;option value=&quot;Burkina&quot;&gt;Burkina&lt;/option&gt;\n        &lt;option value=&quot;Burundi&quot;&gt;Burundi&lt;/option&gt;\n        &lt;option value=&quot;Cambodia&quot;&gt;Cambodia&lt;/option&gt;\n        &lt;option value=&quot;Cameroon&quot;&gt;Cameroon&lt;/option&gt;\n        &lt;option value=&quot;Cape Verde&quot;&gt;Cape Verde&lt;/option&gt;\n        &lt;option value=&quot;Central African Rep&quot;&gt;Central African Rep&lt;/option&gt;\n        &lt;option value=&quot;Chad&quot;&gt;Chad&lt;/option&gt;\n        &lt;option value=&quot;Chile&quot;&gt;Chile&lt;/option&gt;\n        &lt;option value=&quot;China&quot;&gt;China&lt;/option&gt;\n        &lt;option value=&quot;Colombia&quot;&gt;Colombia&lt;/option&gt;\n        &lt;option value=&quot;Comoros&quot;&gt;Comoros&lt;/option&gt;\n        &lt;option value=&quot;Congo&quot;&gt;Congo&lt;/option&gt;\n        &lt;option value=&quot;Congo {Democratic Rep}&quot;&gt;Congo {Democratic Rep}&lt;/option&gt;\n        &lt;option value=&quot;Costa Rica&quot;&gt;Costa Rica&lt;/option&gt;\n        &lt;option value=&quot;Croatia&quot;&gt;Croatia&lt;/option&gt;\n        &lt;option value=&quot;Cuba&quot;&gt;Cuba&lt;/option&gt;\n        &lt;option value=&quot;Cyprus&quot;&gt;Cyprus&lt;/option&gt;\n        &lt;option value=&quot;Czech Republic&quot;&gt;Czech Republic&lt;/option&gt;\n        &lt;option value=&quot;Denmark&quot;&gt;Denmark&lt;/option&gt;\n        &lt;option value=&quot;Djibouti&quot;&gt;Djibouti&lt;/option&gt;\n        &lt;option value=&quot;Dominica&quot;&gt;Dominica&lt;/option&gt;\n        &lt;option value=&quot;Dominican Republic&quot;&gt;Dominican Republic&lt;/option&gt;\n        &lt;option value=&quot;East Timor&quot;&gt;East Timor&lt;/option&gt;\n        &lt;option value=&quot;Ecuador&quot;&gt;Ecuador&lt;/option&gt;\n        &lt;option value=&quot;Egypt&quot;&gt;Egypt&lt;/option&gt;\n        &lt;option value=&quot;El Salvador&quot;&gt;El Salvador&lt;/option&gt;\n        &lt;option value=&quot;Equatorial Guinea&quot;&gt;Equatorial Guinea&lt;/option&gt;\n        &lt;option value=&quot;Eritrea&quot;&gt;Eritrea&lt;/option&gt;\n        &lt;option value=&quot;Estonia&quot;&gt;Estonia&lt;/option&gt;\n        &lt;option value=&quot;Ethiopia&quot;&gt;Ethiopia&lt;/option&gt;\n        &lt;option value=&quot;Fiji&quot;&gt;Fiji&lt;/option&gt;\n        &lt;option value=&quot;Finland&quot;&gt;Finland&lt;/option&gt;\n        &lt;option value=&quot;Gabon&quot;&gt;Gabon&lt;/option&gt;\n        &lt;option value=&quot;Gambia&quot;&gt;Gambia&lt;/option&gt;\n        &lt;option value=&quot;Georgia&quot;&gt;Georgia&lt;/option&gt;\n        &lt;option value=&quot;Germany&quot;&gt;Germany&lt;/option&gt;\n        &lt;option value=&quot;Ghana&quot;&gt;Ghana&lt;/option&gt;\n        &lt;option value=&quot;Greece&quot;&gt;Greece&lt;/option&gt;\n        &lt;option value=&quot;Grenada&quot;&gt;Grenada&lt;/option&gt;\n        &lt;option value=&quot;Guatemala&quot;&gt;Guatemala&lt;/option&gt;\n        &lt;option value=&quot;Guinea&quot;&gt;Guinea&lt;/option&gt;\n        &lt;option value=&quot;Guinea-Bissau&quot;&gt;Guinea-Bissau&lt;/option&gt;\n        &lt;option value=&quot;Guyana&quot;&gt;Guyana&lt;/option&gt;\n        &lt;option value=&quot;Haiti&quot;&gt;Haiti&lt;/option&gt;\n        &lt;option value=&quot;Honduras&quot;&gt;Honduras&lt;/option&gt;\n        &lt;option value=&quot;Hungary&quot;&gt;Hungary&lt;/option&gt;\n        &lt;option value=&quot;Iceland&quot;&gt;Iceland&lt;/option&gt;\n        &lt;option value=&quot;India&quot;&gt;India&lt;/option&gt;\n        &lt;option value=&quot;Indonesia&quot;&gt;Indonesia&lt;/option&gt;\n        &lt;option value=&quot;Iran&quot;&gt;Iran&lt;/option&gt;\n        &lt;option value=&quot;Iraq&quot;&gt;Iraq&lt;/option&gt;\n        &lt;option value=&quot;Ireland {Republic}&quot;&gt;Ireland {Republic}&lt;/option&gt;\n        &lt;option value=&quot;Israel&quot;&gt;Israel&lt;/option&gt;\n        &lt;option value=&quot;Italy&quot;&gt;Italy&lt;/option&gt;\n        &lt;option value=&quot;Ivory Coast&quot;&gt;Ivory Coast&lt;/option&gt;\n        &lt;option value=&quot;Jamaica&quot;&gt;Jamaica&lt;/option&gt;\n        &lt;option value=&quot;Japan&quot;&gt;Japan&lt;/option&gt;\n        &lt;option value=&quot;Jordan&quot;&gt;Jordan&lt;/option&gt;\n        &lt;option value=&quot;Kazakhstan&quot;&gt;Kazakhstan&lt;/option&gt;\n        &lt;option value=&quot;Kenya&quot;&gt;Kenya&lt;/option&gt;\n        &lt;option value=&quot;Kiribati&quot;&gt;Kiribati&lt;/option&gt;\n        &lt;option value=&quot;Korea North&quot;&gt;Korea North&lt;/option&gt;\n        &lt;option value=&quot;Korea South&quot;&gt;Korea South&lt;/option&gt;\n        &lt;option value=&quot;Kosovo&quot;&gt;Kosovo&lt;/option&gt;\n        &lt;option value=&quot;Kuwait&quot;&gt;Kuwait&lt;/option&gt;\n        &lt;option value=&quot;Kyrgyzstan&quot;&gt;Kyrgyzstan&lt;/option&gt;\n        &lt;option value=&quot;Laos&quot;&gt;Laos&lt;/option&gt;\n        &lt;option value=&quot;Latvia&quot;&gt;Latvia&lt;/option&gt;\n        &lt;option value=&quot;Lebanon&quot;&gt;Lebanon&lt;/option&gt;\n        &lt;option value=&quot;Lesotho&quot;&gt;Lesotho&lt;/option&gt;\n        &lt;option value=&quot;Liberia&quot;&gt;Liberia&lt;/option&gt;\n        &lt;option value=&quot;Libya&quot;&gt;Libya&lt;/option&gt;\n        &lt;option value=&quot;Liechtenstein&quot;&gt;Liechtenstein&lt;/option&gt;\n        &lt;option value=&quot;Lithuania&quot;&gt;Lithuania&lt;/option&gt;\n        &lt;option value=&quot;Luxembourg&quot;&gt;Luxembourg&lt;/option&gt;\n        &lt;option value=&quot;Macedonia&quot;&gt;Macedonia&lt;/option&gt;\n        &lt;option value=&quot;Madagascar&quot;&gt;Madagascar&lt;/option&gt;\n        &lt;option value=&quot;Malawi&quot;&gt;Malawi&lt;/option&gt;\n        &lt;option value=&quot;Malaysia&quot;&gt;Malaysia&lt;/option&gt;\n        &lt;option value=&quot;Maldives&quot;&gt;Maldives&lt;/option&gt;\n        &lt;option value=&quot;Mali&quot;&gt;Mali&lt;/option&gt;\n        &lt;option value=&quot;Malta&quot;&gt;Malta&lt;/option&gt;\n        &lt;option value=&quot;Marshall Islands&quot;&gt;Marshall Islands&lt;/option&gt;\n        &lt;option value=&quot;Mauritania&quot;&gt;Mauritania&lt;/option&gt;\n        &lt;option value=&quot;Mauritius&quot;&gt;Mauritius&lt;/option&gt;\n        &lt;option value=&quot;Mexico&quot;&gt;Mexico&lt;/option&gt;\n        &lt;option value=&quot;Micronesia&quot;&gt;Micronesia&lt;/option&gt;\n        &lt;option value=&quot;Moldova&quot;&gt;Moldova&lt;/option&gt;\n        &lt;option value=&quot;Monaco&quot;&gt;Monaco&lt;/option&gt;\n        &lt;option value=&quot;Mongolia&quot;&gt;Mongolia&lt;/option&gt;\n        &lt;option value=&quot;Montenegro&quot;&gt;Montenegro&lt;/option&gt;\n        &lt;option value=&quot;Morocco&quot;&gt;Morocco&lt;/option&gt;\n        &lt;option value=&quot;Mozambique&quot;&gt;Mozambique&lt;/option&gt;\n        &lt;option value=&quot;Myanmar, {Burma}&quot;&gt;Myanmar, {Burma}&lt;/option&gt;\n        &lt;option value=&quot;Namibia&quot;&gt;Namibia&lt;/option&gt;\n        &lt;option value=&quot;Nauru&quot;&gt;Nauru&lt;/option&gt;\n        &lt;option value=&quot;Nepal&quot;&gt;Nepal&lt;/option&gt;\n        &lt;option value=&quot;Netherlands&quot;&gt;Netherlands&lt;/option&gt;\n        &lt;option value=&quot;New Zealand&quot;&gt;New Zealand&lt;/option&gt;\n        &lt;option value=&quot;Nicaragua&quot;&gt;Nicaragua&lt;/option&gt;\n        &lt;option value=&quot;Niger&quot;&gt;Niger&lt;/option&gt;\n        &lt;option value=&quot;Nigeria&quot;&gt;Nigeria&lt;/option&gt;\n        &lt;option value=&quot;Norway&quot;&gt;Norway&lt;/option&gt;\n        &lt;option value=&quot;Oman&quot;&gt;Oman&lt;/option&gt;\n        &lt;option value=&quot;Pakistan&quot;&gt;Pakistan&lt;/option&gt;\n        &lt;option value=&quot;Palau&quot;&gt;Palau&lt;/option&gt;\n        &lt;option value=&quot;Panama&quot;&gt;Panama&lt;/option&gt;\n        &lt;option value=&quot;Papua New Guinea&quot;&gt;Papua New Guinea&lt;/option&gt;\n        &lt;option value=&quot;Paraguay&quot;&gt;Paraguay&lt;/option&gt;\n        &lt;option value=&quot;Peru&quot;&gt;Peru&lt;/option&gt;\n        &lt;option value=&quot;Philippines&quot;&gt;Philippines&lt;/option&gt;\n        &lt;option value=&quot;Poland&quot;&gt;Poland&lt;/option&gt;\n        &lt;option value=&quot;Portugal&quot;&gt;Portugal&lt;/option&gt;\n        &lt;option value=&quot;Qatar&quot;&gt;Qatar&lt;/option&gt;\n        &lt;option value=&quot;Romania&quot;&gt;Romania&lt;/option&gt;\n        &lt;option value=&quot;Russian Federation&quot;&gt;Russian Federation&lt;/option&gt;\n        &lt;option value=&quot;Rwanda&quot;&gt;Rwanda&lt;/option&gt;\n        &lt;option value=&quot;St Kitts &amp;amp; Nevis&quot;&gt;St Kitts &amp;amp; Nevis&lt;/option&gt;\n        &lt;option value=&quot;St Lucia&quot;&gt;St Lucia&lt;/option&gt;\n        &lt;option value=&quot;Saint Vincent &amp;amp; the Grenadines&quot;&gt;Saint Vincent &amp;amp; the Grenadines&lt;/option&gt;\n        &lt;option value=&quot;Samoa&quot;&gt;Samoa&lt;/option&gt;\n        &lt;option value=&quot;San Marino&quot;&gt;San Marino&lt;/option&gt;\n        &lt;option value=&quot;Sao Tome &amp;amp; Principe&quot;&gt;Sao Tome &amp;amp; Principe&lt;/option&gt;\n        &lt;option value=&quot;Saudi Arabia&quot;&gt;Saudi Arabia&lt;/option&gt;\n        &lt;option value=&quot;Senegal&quot;&gt;Senegal&lt;/option&gt;\n        &lt;option value=&quot;Serbia&quot;&gt;Serbia&lt;/option&gt;\n        &lt;option value=&quot;Seychelles&quot;&gt;Seychelles&lt;/option&gt;\n        &lt;option value=&quot;Sierra Leone&quot;&gt;Sierra Leone&lt;/option&gt;\n        &lt;option value=&quot;Singapore&quot;&gt;Singapore&lt;/option&gt;\n        &lt;option value=&quot;Slovakia&quot;&gt;Slovakia&lt;/option&gt;\n        &lt;option value=&quot;Slovenia&quot;&gt;Slovenia&lt;/option&gt;\n        &lt;option value=&quot;Solomon Islands&quot;&gt;Solomon Islands&lt;/option&gt;\n        &lt;option value=&quot;Somalia&quot;&gt;Somalia&lt;/option&gt;\n        &lt;option value=&quot;South Africa&quot;&gt;South Africa&lt;/option&gt;\n        &lt;option value=&quot;South Sudan&quot;&gt;South Sudan&lt;/option&gt;\n        &lt;option value=&quot;Spain&quot;&gt;Spain&lt;/option&gt;\n        &lt;option value=&quot;Sri Lanka&quot;&gt;Sri Lanka&lt;/option&gt;\n        &lt;option value=&quot;Sudan&quot;&gt;Sudan&lt;/option&gt;\n        &lt;option value=&quot;Suriname&quot;&gt;Suriname&lt;/option&gt;\n        &lt;option value=&quot;Swaziland&quot;&gt;Swaziland&lt;/option&gt;\n        &lt;option value=&quot;Sweden&quot;&gt;Sweden&lt;/option&gt;\n        &lt;option value=&quot;Switzerland&quot;&gt;Switzerland&lt;/option&gt;\n        &lt;option value=&quot;Syria&quot;&gt;Syria&lt;/option&gt;\n        &lt;option value=&quot;Taiwan&quot;&gt;Taiwan&lt;/option&gt;\n        &lt;option value=&quot;Tajikistan&quot;&gt;Tajikistan&lt;/option&gt;\n        &lt;option value=&quot;Tanzania&quot;&gt;Tanzania&lt;/option&gt;\n        &lt;option value=&quot;Thailand&quot;&gt;Thailand&lt;/option&gt;\n        &lt;option value=&quot;Togo&quot;&gt;Togo&lt;/option&gt;\n        &lt;option value=&quot;Tonga&quot;&gt;Tonga&lt;/option&gt;\n        &lt;option value=&quot;Trinidad &amp;amp; Tobago&quot;&gt;Trinidad &amp;amp; Tobago&lt;/option&gt;\n        &lt;option value=&quot;Tunisia&quot;&gt;Tunisia&lt;/option&gt;\n        &lt;option value=&quot;Turkey&quot;&gt;Turkey&lt;/option&gt;\n        &lt;option value=&quot;Turkmenistan&quot;&gt;Turkmenistan&lt;/option&gt;\n        &lt;option value=&quot;Tuvalu&quot;&gt;Tuvalu&lt;/option&gt;\n        &lt;option value=&quot;Uganda&quot;&gt;Uganda&lt;/option&gt;\n        &lt;option value=&quot;Ukraine&quot;&gt;Ukraine&lt;/option&gt;\n        &lt;option value=&quot;United Arab Emirates&quot;&gt;United Arab Emirates&lt;/option&gt;\n        &lt;option value=&quot;Uruguay&quot;&gt;Uruguay&lt;/option&gt;\n        &lt;option value=&quot;Uzbekistan&quot;&gt;Uzbekistan&lt;/option&gt;\n        &lt;option value=&quot;Vanuatu&quot;&gt;Vanuatu&lt;/option&gt;\n        &lt;option value=&quot;Vatican City&quot;&gt;Vatican City&lt;/option&gt;\n        &lt;option value=&quot;Venezuela&quot;&gt;Venezuela&lt;/option&gt;\n        &lt;option value=&quot;Vietnam&quot;&gt;Vietnam&lt;/option&gt;\n        &lt;option value=&quot;Yemen&quot;&gt;Yemen&lt;/option&gt;\n        &lt;option value=&quot;Zambia&quot;&gt;Zambia&lt;/option&gt;\n        &lt;option value=&quot;Zimbabwe&quot;&gt;Zimbabwe&lt;/option&gt;\n    &lt;/select&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_4&quot;&gt;Web Site&lt;/label&gt;\n    &lt;input type=&quot;url&quot; id=&quot;text_4&quot; name=&quot;text_4&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Email --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;email_0&quot;&gt;Email Address&lt;/label&gt;\n    &lt;input type=&quot;email&quot; id=&quot;email_0&quot; name=&quot;email_0&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group col-sm-6 no-padding-left&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_5&quot;&gt;Home Phone&lt;/label&gt;\n    &lt;input type=&quot;tel&quot; id=&quot;text_5&quot; name=&quot;text_5&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Text --&gt;\n&lt;div class=&quot;form-group col-sm-6 no-padding&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;text_6&quot;&gt;Cell Phone&lt;/label&gt;\n    &lt;input type=&quot;tel&quot; id=&quot;text_6&quot; name=&quot;text_6&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Date --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;date_0&quot;&gt;Birthday&lt;/label&gt;\n    &lt;input type=&quot;date&quot; id=&quot;date_0&quot; name=&quot;date_0&quot; value=&quot;&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;\n&lt;/div&gt;\n\n&lt;!-- Text Area --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt;\n    &lt;label class=&quot;control-label&quot; for=&quot;textarea_0&quot;&gt;Notes&lt;/label&gt;\n    &lt;textarea id=&quot;textarea_0&quot; name=&quot;textarea_0&quot; rows=&quot;3&quot; data-alias=&quot;&quot; class=&quot;form-control&quot;&gt;&lt;/textarea&gt;\n&lt;/div&gt;\n\n &lt;!-- Button --&gt;\n&lt;div class=&quot;form-action col-xs-12&quot;&gt;\n    &lt;button type=&quot;submit&quot; id=&quot;button_0&quot; name=&quot;button_0&quot; class=&quot;btn btn-primary&quot;&gt;Submit&lt;/button&gt;\n&lt;/div&gt;\n\r\n&lt;/fieldset&gt;\r\n&lt;/form&gt;', 0, 'buku-tamu', 1, 1, 1567272311, 1599769975);
INSERT INTO `template` (`id`, `category_id`, `name`, `description`, `builder`, `html`, `promoted`, `slug`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(13, 2, 'Quiz', '', '{\"settings\":{\"name\":\"Quiz\",\"canvas\":\"#canvas\",\"disabledFieldset\":false,\"layoutSelected\":\"\",\"layouts\":[{\"id\":\"\",\"name\":\"Vertical\"},{\"id\":\"form-horizontal\",\"name\":\"Horizontal\"},{\"id\":\"form-inline\",\"name\":\"Inline\"}],\"formSteps\":{\"title\":\"formSteps.title\",\"fields\":{\"id\":{\"label\":\"formSteps.id\",\"type\":\"input\",\"value\":\"formSteps\",\"name\":\"id\"},\"steps\":{\"label\":\"formSteps.steps\",\"type\":\"textarea-split\",\"value\":[\"Untitled Step\",\"Untitled Step\"],\"name\":\"steps\"},\"progressBar\":{\"label\":\"formSteps.progressBar\",\"type\":\"checkbox\",\"value\":true,\"name\":\"progressBar\"},\"noTitles\":{\"label\":\"formSteps.noTitles\",\"type\":\"checkbox\",\"value\":true,\"name\":\"noTitles\"},\"noStages\":{\"label\":\"formSteps.noStages\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noStages\"},\"noSteps\":{\"label\":\"formSteps.noSteps\",\"type\":\"checkbox\",\"value\":false,\"name\":\"noSteps\"}}}},\"initForm\":[{\"name\":\"heading\",\"title\":\"heading.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"heading_0\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"input\",\"value\":\"Quiz\",\"name\":\"text\"},\"type\":{\"label\":\"component.type\",\"type\":\"select\",\"value\":[{\"value\":\"h1\",\"selected\":false,\"label\":\"H1\"},{\"value\":\"h2\",\"selected\":false,\"label\":\"H2\"},{\"value\":\"h3\",\"selected\":true,\"label\":\"H3\"},{\"value\":\"h4\",\"selected\":false,\"label\":\"H4\"},{\"value\":\"h5\",\"selected\":false,\"label\":\"H5\"},{\"value\":\"h6\",\"selected\":false,\"label\":\"H6\"}],\"name\":\"type\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"legend\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"paragraph\",\"title\":\"paragraph.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"paragraph_0\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"textarea\",\"value\":\"\\u003Cstrong\\u003EIkuti Quiz Berhadiah ini!\\u003C\\/strong\\u003E\",\"name\":\"text\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"paragraph\",\"title\":\"paragraph.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"paragraph_1\",\"name\":\"id\"},\"text\":{\"label\":\"component.text\",\"type\":\"textarea\",\"value\":\"\\u003Csmall\\u003EAnda akan mendapatkan 5 poin untuk setiap jawaban yang benar.\\u003C\\/small\\u003E\",\"name\":\"text\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"cssClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"radio\",\"title\":\"radio.title\",\"fields\":{\"id\":{\"label\":\"component.groupName\",\"type\":\"input\",\"value\":\"radio_0\",\"name\":\"id\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"Makanan apa yang anda sukai?\",\"name\":\"label\"},\"radios\":{\"label\":\"component.radios\",\"type\":\"textarea-split\",\"value\":[\"Bakso|5\",\"Nasi Goreng|0\",\"Lalapan Lele|0\"],\"name\":\"radios\"},\"required\":{\"label\":\"component.required\",\"type\":\"checkbox\",\"value\":false,\"name\":\"required\"},\"helpText\":{\"label\":\"component.helpText\",\"type\":\"textarea\",\"value\":\"\",\"advanced\":true,\"name\":\"helpText\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"radio-inline\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"alias\":{\"label\":\"component.alias\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"alias\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"inline\":{\"label\":\"component.inline\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"inline\"}},\"fresh\":false},{\"name\":\"pagebreak\",\"title\":\"pagebreak.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"pagebreak_0\",\"name\":\"id\"},\"prev\":{\"label\":\"component.prev\",\"type\":\"input\",\"value\":\"\",\"name\":\"prev\"},\"next\":{\"label\":\"component.next\",\"type\":\"input\",\"value\":\"\",\"name\":\"next\"}},\"fresh\":false},{\"name\":\"snippet\",\"title\":\"snippet.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"snippet_0\",\"name\":\"id\"},\"snippet\":{\"label\":\"component.htmlCode\",\"type\":\"textarea\",\"value\":\"\\u003Cdiv id=\\u0022result\\u0022 class=\\u0022well\\u0022\\u003EYour score is \\u003Cspan id=\\u0022score\\u0022 class=\\u0022label label-default\\u0022\\u003E0\\u003C\\/span\\u003E. Thanks for your time!\\u003C\\/div\\u003E\",\"name\":\"snippet\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"}},\"fresh\":false},{\"name\":\"button\",\"title\":\"button.title\",\"fields\":{\"id\":{\"label\":\"component.id\",\"type\":\"input\",\"value\":\"button_0\",\"name\":\"id\"},\"inputType\":{\"label\":\"component.type\",\"type\":\"select\",\"value\":[{\"value\":\"submit\",\"label\":\"Submit\",\"selected\":true},{\"value\":\"reset\",\"label\":\"Reset\",\"selected\":false},{\"value\":\"image\",\"label\":\"Image\",\"selected\":false}],\"name\":\"inputType\"},\"buttonText\":{\"label\":\"component.buttonText\",\"type\":\"input\",\"value\":\"Submit\",\"name\":\"buttonText\"},\"label\":{\"label\":\"component.label\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"label\"},\"src\":{\"label\":\"component.src\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"src\"},\"cssClass\":{\"label\":\"component.cssClass\",\"type\":\"input\",\"value\":\"btn btn-primary\",\"advanced\":true,\"name\":\"cssClass\"},\"labelClass\":{\"label\":\"component.labelClass\",\"type\":\"input\",\"value\":\"control-label\",\"advanced\":true,\"name\":\"labelClass\"},\"containerClass\":{\"label\":\"component.containerClass\",\"type\":\"input\",\"value\":\"\",\"advanced\":true,\"name\":\"containerClass\"},\"readOnly\":{\"label\":\"component.readOnly\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"readOnly\"},\"disabled\":{\"label\":\"component.disabled\",\"type\":\"checkbox\",\"value\":false,\"advanced\":true,\"name\":\"disabled\"}},\"fresh\":false}],\"height\":409}', '&lt;form id=&quot;form-app&quot;&gt;\n&lt;!-- Progress Bar --&gt;\n&lt;div class=&quot;progress&quot;&gt;\n    &lt;div class=&quot;progress-bar&quot;&gt;&lt;span class=&quot;percent&quot;&gt;0%&lt;/span&gt;&lt;/div&gt;\n&lt;/div&gt;\n\r\n&lt;fieldset class=&quot;row&quot;&gt;\r\n\r\n&lt;!-- Heading --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;h3 class=&quot;legend&quot;&gt;Quiz&lt;/h3&gt;\n&lt;/div&gt;\n\n&lt;!-- Paragraph Text --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;p&gt;&lt;strong&gt;Ikuti Quiz Berhadiah ini!&lt;/strong&gt;&lt;/p&gt;\n&lt;/div&gt;\n\n&lt;!-- Paragraph Text --&gt;\n&lt;div class=&quot;col-xs-12&quot;&gt;\n    &lt;p&gt;&lt;small&gt;Anda akan mendapatkan 5 poin untuk setiap jawaban yang benar.&lt;/small&gt;&lt;/p&gt;\n&lt;/div&gt;\n\n&lt;!-- Radio --&gt;\n&lt;div class=&quot;form-group col-xs-12&quot;&gt; \n    &lt;label class=&quot;control-label&quot; for=&quot;radio_0&quot;&gt;Makanan apa yang anda sukai?&lt;/label&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_0&quot; id=&quot;radio_0_0&quot; value=&quot;5&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_0_0&quot; class=&quot;radio-inline&quot;&gt;\n        Bakso &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_0&quot; id=&quot;radio_0_1&quot; value=&quot;0&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_0_1&quot; class=&quot;radio-inline&quot;&gt;\n        Nasi Goreng &lt;/label&gt;\n    &lt;/div&gt;\n    &lt;div class=&quot;radio &quot;&gt;\n        &lt;input type=&quot;radio&quot; name=&quot;radio_0&quot; id=&quot;radio_0_2&quot; value=&quot;0&quot; data-alias=&quot;&quot;&gt;&lt;label for=&quot;radio_0_2&quot; class=&quot;radio-inline&quot;&gt;\n        Lalapan Lele &lt;/label&gt;\n    &lt;/div&gt;\n    \n    &lt;span id=&quot;radio_0&quot;&gt;&lt;/span&gt;\n&lt;/div&gt;\n\n&lt;!-- Page Break --&gt;\n&lt;div class=&quot;page-break&quot; data-button-previous=&quot;&quot; data-button-next=&quot;&quot;&gt;&lt;/div&gt;\n\n&lt;!-- Snippet --&gt;\n&lt;div class=&quot;snippet col-xs-12&quot;&gt;&lt;div id=&quot;result&quot; class=&quot;well&quot;&gt;Your score is &lt;span id=&quot;score&quot; class=&quot;label label-default&quot;&gt;0&lt;/span&gt;. Thanks for your time!&lt;/div&gt;&lt;/div&gt;\n\n &lt;!-- Button --&gt;\n&lt;div class=&quot;form-action col-xs-12&quot;&gt;\n    &lt;button type=&quot;submit&quot; id=&quot;button_0&quot; name=&quot;button_0&quot; class=&quot;btn btn-primary&quot;&gt;Submit&lt;/button&gt;\n&lt;/div&gt;\n\r\n&lt;/fieldset&gt;\r\n&lt;/form&gt;', 0, 'quiz-2', 1, 1, 1599776785, 1599776814);

-- --------------------------------------------------------

--
-- Table structure for table `template_category`
--

CREATE TABLE `template_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `template_category`
--

INSERT INTO `template_category` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Online Forms', 'If you need a ready-to-go form for your website, you\'ve come to the right place.', 1567273211, 1567273211),
(2, 'Surveys', 'Curious what people think? Need to do some polling? Then this online surveys are made for you.', 1567273211, 1567273211),
(3, 'Lead Generation', 'A lead generation template is a critical piece of the puzzle on any website designed to attract customer inquiries for follow up.', 1567272311, 1567272311),
(4, 'Invitation', 'Party? Did someone say party? Add a online invitation to your website, or send it out through email, to make collecting responses a snap.', 1567272311, 1567272311),
(5, 'Online Order', 'Are you looking for a way to take orders online instead of over the phone? Well then, what you need is an online order form template.', 1567272311, 1567272311),
(6, 'Registrations', 'Are you an event planner, or has someone \"volunteered\" you to organize that ski lodge reservation for all of your friends? This templates will help you to make organizing events a painless process.', 1567272311, 1567272311),
(7, 'Tracking', 'Spreadsheets are so yesterday for inventory and tracking purposes. Instead of a spreadsheet, you need a tracking form to keep tabs on inventory, host evaluations, file addresses, or even to record your exercise habits.', 1567272311, 1567272311);

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE `theme` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`id`, `name`, `description`, `color`, `css`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Blue Denim', 'Dark blue body with white big fields.', '#212a3e', '\r\nbody {\r\n    background-color: #212a3e;\r\n    padding: 20px;\r\n    color: #7b8291;\r\n}\r\n\r\n/* Small devices (tablets, 768px and up) */\r\n@media (min-width: 768px) {\r\n    body {\r\n        padding: 50px;\r\n    }\r\n}\r\nstrong {\r\n    color: #FFFFFF;\r\n}\r\n.legend {\r\n    font-family: \"helvetica\", \"arial\", \"sans-serif\";\r\n    font-size: 28px;\r\n    font-weight: 400;\r\n    line-height: 1.4;\r\n    color: #fff;\r\n    margin: 0 0 5px;\r\n}\r\np.description {\r\n    color: #1ec185;\r\n    background: url(\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAsAAAAPCAYAAAAyPTUwAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4JpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpEQUIyQTJGOUZCNzZERTExQkFGNUUxNDNCMEI4NkZGMSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpFREYxQURBODk5N0YxMUU0OTU0N0EzNkVCREUxQzBFRCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpFREYxQURBNzk5N0YxMUU0OTU0N0EzNkVCREUxQzBFRCIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxNCAoTWFjaW50b3NoKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOmNlOWNlZGU1LTM1YTYtNDFiNi04NDA4LTM2YmIxMjY4NjdhNSIgc3RSZWY6ZG9jdW1lbnRJRD0iYWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOmI2Nzk5MjljLWRmZTMtMTE3Ny1iOGNhLTlmM2YyOWFkM2Y1YiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoBOvTYAAACrSURBVHjaYpE72MqABKSA2B+IZYH4ERBvAOIXMEkWJIUhQLwIiDmRxHqBOBqqiYEJKiiJpvA/lOaCiosgK/ZFUhgIxKxAHAHl8wKxF7IzZJGs3gCl16L5BW4ystth4A+6AEgRIxBzIIkJYtHICVN8HIjNkSTeYVFcB8QOTGgK8QE7JgYSwCBS/JNItV9BQecJxD5ArAPEikDMB8RsUEM+A/E9IL4EilGAAAMAaCsYB5gwb+gAAAAASUVORK5CYII=\") 0 40% no-repeat;\r\n    font-size: 14px;\r\n    padding-left: 20px;\r\n    display: inline-block;\r\n    margin: 5px auto 0;\r\n}\r\n.form-group, .form-action {\r\n    font-size: 14px;\r\n    color: #7b8291;\r\n    margin: 27px 0 9px;\r\n}\r\n.control-label {\r\n    font-size: 16px;\r\n    color: #fff;\r\n    margin: 0 5px 9px 0;\r\n}\r\n.required-control .control-label:after {\r\n    color: #e55;\r\n    margin-left: 5px;\r\n}\r\n.form-control {\r\n    background: #363e51;\r\n    border-color: transparent;\r\n    border-radius: 3px;\r\n    color: #fff;\r\n    margin: 0;\r\n    height: 36px;\r\n    width: 100%;\r\n    -webkit-transition: background .08s linear;\r\n    -moz-transition: background .08s linear;\r\n    -o-transition: background .08s linear;\r\n    transition: background .08s linear;\r\n}\r\n.form-control:hover {\r\n    background: #424a5b\r\n}\r\n.form-control:focus {\r\n    background: #fff;\r\n    color: #212a3e\r\n}\r\n.form-control::-webkit-input-placeholder {\r\n    color: #7b8291\r\n}\r\n.form-control::-moz-placeholder {\r\n    color: #7b8291\r\n}\r\n.form-control:-ms-input-placeholder {\r\n    color: #7b8291\r\n}\r\n.form-control::placeholder {\r\n    color: #7b8291\r\n}\r\n.btn {\r\n    border-radius: 4px;\r\n    border: 0 !important;\r\n    font-size: 18px;\r\n    font-weight: 500;\r\n    width: auto;\r\n    height: 55px;\r\n    line-height: 55px;\r\n    margin: 0;\r\n    padding: 0 30px;\r\n    -webkit-transition: background-color .1s ease;\r\n    -moz-transition: background-color .1s ease;\r\n    -o-transition: background-color .1s ease;\r\n    transition: background-color .1s ease;\r\n}\r\n.btn-primary {\r\n    background-color: #1ec185;\r\n}\r\n.btn-primary:focus, .btn-primary:active, .btn-primary:hover {\r\n    background-color: #1baf79 !important;\r\n    color: #fff;\r\n    border: 0 !important;\r\n    outline: 0 none !important;\r\n    box-shadow: none !important;\r\n}\r\n', 1, 1, 1567273209, 1567273209),
(2, 'Sky Blue', 'Blue sky background with clouds around. White form with a thin typography.', '#95D6FE', '\r\n@import url(https://fonts.googleapis.com/css?family=Roboto:400,300);\r\nbody {\r\n    background-color: #95D6FE;\r\n    overflow-x: hidden;\r\n    padding: 20px;\r\n    color: #A9A9A9;\r\n    color: rgba(255, 255, 255, 0.6);\r\n    font-family: Roboto, sans-serif;\r\n}\r\n/* Small devices (tablets, 768px and up) */\r\n@media (min-width: 768px) {\r\n    body {\r\n        padding: 50px 25%;\r\n    }\r\n}\r\n/**\r\n * Form\r\n */\r\nh3 {\r\n    color: #FFFFFF;\r\n    font-size: 32px;\r\n    font-weight: 300;\r\n    text-align: center;\r\n    margin: .3em 0;\r\n    -webkit-animation: titleFadein .8s ease;\r\n    -moz-animation: titleFadein .8s ease;\r\n    animation: titleFadein .8s ease;\r\n}\r\np:first-of-type {\r\n    color: #FFFFFF;\r\n    color: rgba(255, 255, 255, 0.92);\r\n    font-weight: 300;\r\n    font-size: 20px;\r\n    text-shadow: none;\r\n    text-align: center;\r\n}\r\n.form-group {\r\n    background-color: #ffffff;\r\n    font-size: 14px;\r\n    padding: 20px 40px 10px;\r\n    margin: 0;\r\n}\r\n.form-group:first-of-type {\r\n    padding-top: 40px;\r\n    margin-top: 40px;\r\n    border-radius: 12px 12px 0 0;\r\n}\r\n.form-action {\r\n    margin: 0;\r\n    padding: 20px 40px 40px 40px;\r\n    border-radius: 0 0 12px 12px;\r\n    background-color: #ffffff;\r\n    font-size: 14px;\r\n}\r\n.control-label {\r\n    font-weight: 300;\r\n    font-size: 16px;\r\n    color: #777777;\r\n}\r\n.form-control {\r\n    width: 100%;\r\n    height: 48px;\r\n    -webkit-box-sizing: padding-box;\r\n    -moz-box-sizing: padding-box;\r\n    box-sizing: padding-box;\r\n    -webkit-appearance: none;\r\n    -moz-appearance: none;\r\n    appearance: none;\r\n    background-color: #EFEFEF;\r\n    background-color: rgba(0, 0, 0, 0.03);\r\n    border-color: transparent;\r\n    border-radius: 6px;\r\n    font-size: 20px;\r\n    font-family: Roboto, sans-serif;\r\n    font-weight: 300;\r\n    box-shadow: inset 0px 2px 1px rgba(0, 0, 0, .03);\r\n    outline: none;\r\n    text-overflow: ellipsis;\r\n    -webkit-font-smoothing: antialiased;\r\n}\r\n.form-control:focus {\r\n    border-color: rgb(138, 197, 65);\r\n    box-shadow: inset 0 0 0 0,inset 0 1px 2px rgba(138, 197, 65, 0.15),0 0 10px rgba(138, 197, 65, 0.8),0 2px 0 rgba(138, 197, 65,0.1);\r\n    transition: none;\r\n}\r\n.form-control::-webkit-input-placeholder {\r\n    color: #A9A9A9;\r\n}\r\n.form-control::-moz-placeholder {\r\n    color: #A9A9A9;\r\n}\r\n.form-control:-ms-input-placeholder {\r\n    color: #A9A9A9;\r\n}\r\n.form-control::placeholder {\r\n    color: #A9A9A9;\r\n}\r\n.radio label, .checkbox label {\r\n    color: #7C7C7C;\r\n    font-weight: 300;\r\n}\r\n.btn {\r\n    display: block;\r\n    padding: 0 28px;\r\n    border-radius: 28px;\r\n    width: auto;\r\n    height: 56px;\r\n    margin: 0 auto;\r\n    overflow: hidden;\r\n    -webkit-font-smoothing: antialiased;\r\n    font-size: 24px;\r\n}\r\n.btn-primary {\r\n    background-color: rgb(138, 197, 65);\r\n    background-color: rgba(138, 197, 65, 0.90);\r\n    border-color: transparent;\r\n}\r\n.btn-primary:focus, .btn-primary:hover {\r\n    background: rgb(138, 197, 65) !important;\r\n    border-color: transparent !important;\r\n    color: rgb(255, 255, 255) !important;\r\n}\r\n.info {\r\n    font-size: 16px;\r\n    color: rgb(102, 102, 102);\r\n    color: rgba(102, 102, 102, 0.3);\r\n    padding: 10px 40px;\r\n    background-color: #ffffff;\r\n    margin: 0;\r\n}\r\n/**\r\n * Clouds\r\n *\r\n * You must add this snippet to your form:\r\n *\r\n * <div id=\"clouds\">\r\n *   <div class=\"cloud x1\"></div>\r\n *   <div class=\"cloud x2\"></div>\r\n *   <div class=\"cloud x3\"></div>\r\n *   <div class=\"cloud x4\"></div>\r\n *   <div class=\"cloud x5\"></div>\r\n * </div>\r\n *\r\n * Based on http://thecodeplayer.com/walkthrough/pure-css3-animated-clouds-background\r\n */\r\n#clouds{\r\n    top: 220px;\r\n    padding: 100px 0;\r\n    position: absolute;\r\n    z-index: -1;\r\n}\r\n/*Time to finalise the cloud shape*/\r\n.cloud {\r\n    width: 200px; height: 60px;\r\n    background: #fff;\r\n\r\n    border-radius: 200px;\r\n    -moz-border-radius: 200px;\r\n    -webkit-border-radius: 200px;\r\n\r\n    position: relative;\r\n}\r\n.cloud:before, .cloud:after {\r\n    content: \"\";\r\n    position: absolute;\r\n    background: #fff;\r\n    width: 100px; height: 80px;\r\n    top: -15px; left: 10px;\r\n\r\n    border-radius: 100px;\r\n    -moz-border-radius: 100px;\r\n    -webkit-border-radius: 100px;\r\n\r\n    -webkit-transform: rotate(30deg);\r\n    transform: rotate(30deg);\r\n    -moz-transform: rotate(30deg);\r\n}\r\n.cloud:after {\r\n    width: 120px; height: 120px;\r\n    top: -55px; left: auto; right: 15px;\r\n}\r\n/*Time to animate*/\r\n.x1 {\r\n    -webkit-animation: moveclouds 15s linear infinite;\r\n    -moz-animation: moveclouds 15s linear infinite;\r\n    -o-animation: moveclouds 15s linear infinite;\r\n}\r\n/*variable speed, opacity, and position of clouds for realistic effect*/\r\n.x2 {\r\n    left: 200px;\r\n\r\n    -webkit-transform: scale(0.6);\r\n    -moz-transform: scale(0.6);\r\n    transform: scale(0.6);\r\n    opacity: 0.6; /*opacity proportional to the size*/\r\n\r\n    /*Speed will also be proportional to the size and opacity*/\r\n    /*More the speed. Less the time in \"s\" = seconds*/\r\n    -webkit-animation: moveclouds 25s linear infinite;\r\n    -moz-animation: moveclouds 25s linear infinite;\r\n    -o-animation: moveclouds 25s linear infinite;\r\n}\r\n.x3 {\r\n    left: -250px; top: -200px;\r\n\r\n    -webkit-transform: scale(0.8);\r\n    -moz-transform: scale(0.8);\r\n    transform: scale(0.8);\r\n    opacity: 0.8; /*opacity proportional to size*/\r\n\r\n    -webkit-animation: moveclouds 20s linear infinite;\r\n    -moz-animation: moveclouds 20s linear infinite;\r\n    -o-animation: moveclouds 20s linear infinite;\r\n}\r\n.x4 {\r\n    left: 470px; top: -250px;\r\n\r\n    -webkit-transform: scale(0.75);\r\n    -moz-transform: scale(0.75);\r\n    transform: scale(0.75);\r\n    opacity: 0.75; /*opacity proportional to size*/\r\n\r\n    -webkit-animation: moveclouds 18s linear infinite;\r\n    -moz-animation: moveclouds 18s linear infinite;\r\n    -o-animation: moveclouds 18s linear infinite;\r\n}\r\n.x5 {\r\n    left: -150px; top: -150px;\r\n\r\n    -webkit-transform: scale(0.8);\r\n    -moz-transform: scale(0.8);\r\n    transform: scale(0.8);\r\n    opacity: 0.8; /*opacity proportional to size*/\r\n\r\n    -webkit-animation: moveclouds 20s linear infinite;\r\n    -moz-animation: moveclouds 20s linear infinite;\r\n    -o-animation: moveclouds 20s linear infinite;\r\n}\r\n@-webkit-keyframes moveclouds {\r\n    0% {margin-left: 1600px;}\r\n    100% {margin-left: -1600px;}\r\n}\r\n@-moz-keyframes moveclouds {\r\n    0% {margin-left: 1600px;}\r\n    100% {margin-left: -1600px;}\r\n}\r\n@-o-keyframes moveclouds {\r\n    0% {margin-left: 1600px;}\r\n    100% {margin-left: -1600px;}\r\n}\r\n', 1, 1, 1567273210, 1599767932),
(3, 'Gray Shadow', 'A gray background with a gray form and a bluish green button.', '#eeeeee', '\r\nbody {\r\n    background-color: transparent;\r\n    padding: 0;\r\n    font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    font-size: 14px;\r\n    color: #000;\r\n}\r\n/* Small devices (tablets, 768px and up) */\r\n@media (min-width: 768px) {\r\n    body {\r\n        padding: 50px 25%;\r\n        background-color: #eeeeee;\r\n    }\r\n}\r\nform {\r\n    border-style: solid;\r\n    background-image: -moz-linear-gradient(top, rgba(255, 255, 255, 1), rgba(242, 242, 242, 1));\r\n    background-image: linear-gradient(top, rgba(255, 255, 255, 1), rgba(242, 242, 242, 1));\r\n    background-image: -webkit-linear-gradient(top, rgba(255, 255, 255, 1), rgba(242, 242, 242, 1));\r\n    background-repeat: no-repeat;\r\n    background-position: center center;\r\n    background-size: 100% 100%;\r\n    padding: 15px 25px;\r\n    border-radius: 1px;\r\n    box-shadow: 0px 0px 0px 0px rgba(50, 50, 50, 0.75);\r\n    border-width: 4px;\r\n    border-color: rgb(232,232,232);\r\n}\r\nh3 {\r\n    text-align: center;\r\n    color: rgb(89,89,89);\r\n    font-size: 40px;\r\n}\r\np.description {\r\n    text-align: center;\r\n    color: rgb(51, 51, 51);\r\n    font-size: 17px;\r\n}\r\np.info {\r\n    color: rgba(107,107,107,1);\r\n    font-size: 12px;\r\n    margin-top: 15px;\r\n}\r\n.form-control {\r\n    width: 100%;\r\n    height: 100%;\r\n    -webkit-box-sizing: padding-box;\r\n    -moz-box-sizing: padding-box;\r\n    box-sizing: padding-box;\r\n    -webkit-appearance: none;\r\n    -moz-appearance: none;\r\n    appearance: none;\r\n    padding: 15px;\r\n    font-size: 15px;\r\n    line-height: 15px;\r\n    color: #000;\r\n}\r\n.form-control:focus {\r\n    border-color: rgba(117,194,204,1);\r\n    box-shadow: 0 1px 1px rgba(117,194,204,0.75) inset, 0 0 8px rgba(134,215,225,1);\r\n    outline: 0 none;\r\n}\r\n.form-control::-webkit-input-placeholder { color: #a1a1a1; }\r\n.form-control:-moz-placeholder { color: #a1a1a1; }\r\n.form-control::-moz-placeholder { color: #a1a1a1; }\r\n.form-control:-ms-input-placeholder { color: #a1a1a1; }\r\n.btn {\r\n    width: 100%;\r\n    color: rgba(255,255,255,1);\r\n    font-size: 19px;\r\n    background-image: -webkit-linear-gradient(top, rgba(134,215,225,1), rgba(117,194,204,1));\r\n    padding: 11px;\r\n    border-radius: 0px;\r\n    border: transparent;\r\n    box-shadow: none;\r\n}\r\n.btn:focus, .btn:hover, input.btn:active {\r\n    background-image: -webkit-linear-gradient(bottom, rgba(134,215,225,1), rgba(117,194,204,1));\r\n    color: rgba(255, 255, 255, 1);\r\n    box-shadow: none !important;\r\n    outline: 0 none !important;\r\n    border-color: transparent;\r\n}\r\n', 1, 1, 1567273210, 1567273210),
(4, 'Light Gray', 'Light gray form over dark gray body, big fields with a green button.', '#a9a9a9', '\r\n@import url(https://fonts.googleapis.com/css?family=PT+Sans:400);\r\n@import url(https://fonts.googleapis.com/css?family=Oswald:400);\r\nbody {\r\n    font-family: \"PT Sans\", sans-serif;\r\n    padding: 0;\r\n}\r\n/* Small devices (tablets, 768px and up) */\r\n@media (min-width: 768px) {\r\n    body {\r\n        padding: 60px 25%;\r\n        background-color: #a9a9a9;\r\n    }\r\n}\r\nform {\r\n    padding: 35px;\r\n    background-color: #f3f3f3;\r\n    border: 1px solid rgba(0, 0, 0, 0.34);\r\n    -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.1);\r\n    -moz-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.1);\r\n    box-shadow: 0 3px 9px rgba(0, 0, 0, 0.1);\r\n    border-radius: 10px;\r\n    color: #555 !important;\r\n}\r\nh3, p {\r\n    text-align: center;\r\n    font-size: 16px;\r\n}\r\nh3 {\r\n    margin: 5px;\r\n    padding: 10px 0 0 0;\r\n    font-size: 28px;\r\n    font-family: \"Oswald\", sans-serif;\r\n    text-shadow: 2px 2px 3px rgba(255,255,255,0.1);\r\n}\r\np.description {\r\n    padding: 5px 0 24px 0;\r\n}\r\n.note {\r\n    padding: 24px;\r\n    margin: 10px 0;\r\n}\r\n.form-group {\r\n    margin-bottom: 1px;\r\n    position: relative;\r\n}\r\n.form-action {\r\n    margin-top: 25px;\r\n}\r\n.control-label {\r\n    font-size: 16px;\r\n    margin: 15px 0 0 0;\r\n}\r\n.btn {\r\n    padding: 12px 18px;\r\n    width: 100%;\r\n    border: transparent;\r\n    -webkit-border-radius: 5px;\r\n    -moz-border-radius: 5px;\r\n    border-radius: 5px;\r\n    height: 60px;\r\n    font-size: 20px;\r\n    text-shadow: 0 0 #000;\r\n    -webkit-transition: background-color .1s ease;\r\n    transition: background-color .1s ease;\r\n}\r\n.btn-primary {\r\n    background-color: #1ec185;\r\n}\r\n.btn-primary:focus, .btn-primary:active, .btn-primary:hover {\r\n    background-color: #1baf79 !important;\r\n    border-color: transparent;\r\n    color: #fff;\r\n}\r\n.form-control {\r\n    font-size: 16px;\r\n    color: #6f6f6f;\r\n    border: 2px solid #FFFFFF;\r\n    height: 52px;\r\n}\r\n.form-control:focus {\r\n    border: 2px solid rgb(30, 193, 133);\r\n    border: 2px solid rgba(30, 193, 133, 0.8);\r\n    box-shadow: none;\r\n    outline: 0 none;\r\n}\r\n.form-group-icon:before {\r\n    position: absolute;\r\n    font-family: \"Glyphicons Regular\";\r\n    font-size: 36px;\r\n    color: darkgray;\r\n    top: 38px;\r\n    left: 10px;\r\n}\r\n.form-group-icon .form-control {\r\n    padding: 15px 12px 12px 52px;\r\n}\r\n.user-icon:before {\r\n    content: \"\\e004\";\r\n}\r\n.email-icon:before {\r\n    content: \"\\2709\";\r\n}\r\n.phone-icon:before {\r\n    content: \"\\e164\";\r\n}\r\n', 1, 1, 1567273210, 1567273210),
(5, 'Flower Shop', 'Yellow form over Green texture. Orange header and button.', '#FBEFBF', '\r\n@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700);\r\n\r\nbody {\r\n    font-family: \"Source Sans Pro\", sans-serif;\r\n    font-size: 16px;\r\n    padding: 0;\r\n}\r\n/* Small devices (tablets, 768px and up) */\r\n@media (min-width: 768px) {\r\n    body {\r\n        padding: 50px 25%;\r\n        background: url(\"../static_files/images/themes/flower-shop.jpg\") repeat #AFC86A;\r\n    }\r\n}\r\nform {\r\n    background-color: rgb(251, 239, 191);\r\n    padding-bottom: 50px;\r\n}\r\n/* Small devices (tablets, 768px and up) */\r\n@media (min-width: 768px) {\r\n    form {\r\n        -webkit-box-shadow: 1px 0 11px rgba(50,50,50,0.74);\r\n        -moz-box-shadow: 1px 0 11px rgba(50,50,50,0.74);\r\n        box-shadow: 1px 0 11px rgba(50,50,50,0.74);\r\n    }\r\n}\r\n.legend {\r\n    font-size: 33px;\r\n    margin: 0 0 25px 0;\r\n    padding: 15px 0;\r\n    text-align: center;\r\n    background-color: rgba(251, 89, 39, 0.9);\r\n    color: white;\r\n    font-weight: 700;\r\n    text-shadow: -1px -1px 0 rgba(184, 60, 42, 0.5),\r\n    -2px -2px 1px rgba(184, 60, 42, 0.5);\r\n}\r\np {\r\n    margin: 0 15%;\r\n}\r\n.form-group, .form-action {\r\n    margin: 0 15%;\r\n}\r\n.form-control {\r\n    height: 42px;\r\n    border: 3px solid rgb(236, 217, 142);\r\n}\r\n.form-control:focus {\r\n    border-color: rgb(253, 186, 144);\r\n    box-shadow: 0 1px 1px rgba(253, 186, 144, 0.75) inset, 0 0 8px rgba(253, 186, 144, 1);\r\n    outline: 0 none;\r\n}\r\n.form-control::-webkit-input-placeholder { color: #313941; color: rgba(49, 57, 65, 0.72); }\r\n.form-control:-moz-placeholder { color: #313941; color: rgba(49, 57, 65, 0.72); }\r\n.form-control::-moz-placeholder { color: #313941; color: rgba(49, 57, 65, 0.72); }\r\n.form-control:-ms-input-placeholder { color: #313941; color: rgba(49, 57, 65, 0.72); }\r\n.control-label {\r\n    font-weight: bold;\r\n    margin-top: 15px;\r\n}\r\n.btn {\r\n    background-color: rgb(251, 89, 39);\r\n    border: transparent;\r\n    width: 100%;\r\n    margin-top: 15px;\r\n    font-size: 22px;\r\n    padding: 8px 0 8px 0;\r\n    -webkit-border-radius: 3px;\r\n    -moz-border-radius: 3px;\r\n    border-radius: 3px;\r\n    text-shadow: -1px -1px 0 rgba(184, 60, 42, 0.5),\r\n    -2px -2px 1px rgba(184, 60, 42, 0.5);\r\n}\r\n.btn:focus, .btn:active, .btn:focus:active {\r\n    outline: none;\r\n    background-color:#f14c26 !important;\r\n    box-shadow: 0 1px 1px rgba(253, 186, 144, 0.75) inset, 0 0 8px rgba(253, 186, 144, 1);\r\n}\r\n.btn:hover{\r\n    background-color:#fe6a48 !important;\r\n}\r\n', 1, 1, 1567273210, 1567273210),
(6, 'White Smoke', 'Clean design for multiple purposes. Wide fields with a blue button and without shadows.', '#2B8DD6', '\r\n@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,600);\r\n@import url(https://fonts.googleapis.com/css?family=Raleway:400,600);\r\nbody {\r\n    background-color: #fbfcfd;\r\n    padding: 20px;\r\n    font-family: \"Open Sans\", Helvetica, Arial, sans-serif;\r\n}\r\n.legend {\r\n    font-family: \"Raleway\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    font-size: 20px;\r\n    font-weight: 600;\r\n    color: #515151;\r\n}\r\n.form-control {\r\n    font-family: \"Open Sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    font-weight: 400;\r\n    height:55px;\r\n	border-radius:3px;\r\n	border-color:#d3d3d3;\r\n}\r\n.form-control:focus {\r\n    border:1px solid #2b8dd6;\r\n    box-shadow: none;\r\n    outline: 0 none;\r\n}\r\n.form-control::-webkit-input-placeholder { color: #797979; }\r\n.form-control:-moz-placeholder { color: #797979; }\r\n.form-control::-moz-placeholder { color: #797979; }\r\n.form-control:-ms-input-placeholder { color: #797979; }\r\n.control-label {\r\n	font-weight: 600;\r\n}\r\n.btn {\r\n    background-color: #2b8dd6;\r\n    box-sizing: border-box !important;\r\n    border: 0 !important;\r\n    border-bottom: 3px solid rgba(0, 0, 0, 0.1) !important;\r\n    font-family: \"Open Sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    font-weight: 600;\r\n    box-shadow: 0 0 0 !important;\r\n    padding: 16px 32px;\r\n}\r\n.btn:hover, .btn:active, .btn:focus {\r\n    background-color: #2b8dd6;\r\n    opacity:0.85;\r\n	border:0 !important;\r\n	border-bottom:3px solid rgba(0, 0, 0, 0.1) !important;\r\n}\r\n', 1, 1, 1567273210, 1567273210),
(7, 'Habitat', 'Beauty gradient with a semi-transparent text.', '#1274a3', '\r\n@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700);\r\n@import url(https://fonts.googleapis.com/css?family=Raleway:400,700);\r\n/**\r\n * Design inspired in https://habitat.inkling.com/signup\r\n */\r\nbody {\r\n    background: linear-gradient(135deg, #1274a3 0%,#68ad74 100%);\r\n    padding: 20px;\r\n    font-family: \"Open Sans\", Helvetica, Arial, sans-serif;\r\n    color: rgb(255, 255, 255);\r\n    color: rgba(255, 255, 255, 0.75098);\r\n}\r\n.legend {\r\n    font-family: \"Raleway\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    font-size: 26px;\r\n    font-weight: 400;\r\n    color: #FFFFFF;\r\n    color: rgb(255, 255, 255);\r\n}\r\np, .checkbox-inline, .radio-inline {\r\n    font-weight: 300;\r\n}\r\n.form-control {\r\n    font-family: \"Open Sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    font-weight: 400;\r\n    transition: box-shadow 150ms ease-in-out;\r\n    background-color: rgb(10,13,25);\r\n    background-color: rgba(10,13,25,0.1);\r\n    border-radius: 3px;\r\n    outline: solid 2px rgba(255,255,255,0);\r\n    border-color: transparent;\r\n    box-shadow: inset 0 1px 1px rgba(10,13,25,0.15),0 1px 0 rgba(255,255,255,0.1);\r\n    box-sizing: border-box;\r\n    font-family: inherit;\r\n    font-size: 16px;\r\n    height: 45px;\r\n    width: 100%;\r\n    color: #FFFFFF;\r\n    color: rgba(255, 255, 255, 0.92098);\r\n}\r\n.form-control:focus {\r\n    box-shadow: inset 0 0 0 1px #fff,inset 0 1px 2px rgba(10,13,25,0.15),0 0 8px rgba(255,255,255,0.5),0 1px 0 rgba(255,255,255,0.1);\r\n    transition: none;\r\n}\r\n.form-control option {\r\n    background-color: #1274a3;\r\n}\r\n.form-control::-webkit-input-placeholder {\r\n    color: #FFFFFF;\r\n    color: rgba(255,255,255,0.35);\r\n}\r\n.form-control:-moz-placeholder {\r\n    color: #FFFFFF;\r\n    color: rgba(255,255,255,0.35);\r\n}\r\n.form-control::-moz-placeholder {\r\n    color: #FFFFFF;\r\n    color: rgba(255,255,255,0.35);\r\n}\r\n.form-control:-ms-input-placeholder {\r\n    color: #FFFFFF;\r\n    color: rgba(255,255,255,0.35);\r\n}\r\n.control-label {\r\n	font-weight: 600;\r\n}\r\n.required-control .control-label:after {\r\n    color: rgb(255, 255, 255) !important;\r\n    color: rgba(255, 255, 255, 0.75098) !important;\r\n}\r\n.btn {\r\n    box-sizing: border-box !important;\r\n    border: 0 !important;\r\n    border-bottom: 3px solid rgba(0, 0, 0, 0.1) !important;\r\n    font-family: \"Open Sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    font-weight: 600;\r\n    text-shadow: 0 -1px 0 rgba(255,255,255,0.1);\r\n    padding: 16px 32px;\r\n}\r\n.btn-primary {\r\n    background-color: rgb(110,238,215);\r\n    background-color: rgba(110,238,215,0.65);\r\n    box-shadow: inset 0 -2px 0 rgba(0,0,0,0.3),inset 0 1px 0 rgba(255,255,255,0.07),0 1px 1px rgba(10,13,25,0.5);\r\n}\r\n.btn-primary:hover, .btn-primary:active, .btn-primary:focus {\r\n    background-color: rgb(110,238,215) !important;\r\n    background-color: rgba(110,238,215,0.45) !important;\r\n    box-shadow: inset 0 -2px 0 rgba(0,0,0,0.3),inset 0 1px 0 rgba(255,255,255,0.07),0 1px 1px rgba(10,13,25,0.5) !important;\r\n    outline: 0 none !important;\r\n}\r\n/**\r\n * Alerts\r\n */\r\n.alert-success {\r\n    background-color: #68ad74;\r\n    border-color: #1274a3;\r\n}\r\n.alert-danger {\r\n    background-color: #ff7332;\r\n    border-color: #1274a3;\r\n}\r\n.has-error .help-block, .has-error .control-label, .has-error .radio, .has-error .checkbox,\r\n.has-error .radio-inline, .has-error .checkbox-inline, .has-error.radio label,\r\n.has-error.checkbox label, .has-error.radio-inline label, .has-error.checkbox-inline label {\r\n    color: #FFFFFF;\r\n}\r\n.has-error .help-block {\r\n    margin: 0;\r\n    padding: 5px 10px;\r\n    color: #FFF;\r\n}\r\n.has-error .form-control {\r\n    border-color: #ff7332;\r\n}\r\n', 1, 1, 1567273210, 1567273210),
(8, 'Blue Dress', 'A beauty dark theme with subtle shadow, green button and and active fields.', '#374151', '\r\n@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,600);\r\n@import url(https://fonts.googleapis.com/css?family=Raleway:400,600);\r\nbody {\r\n    background-color: #374151;\r\n    padding: 20px;\r\n    font-family: \"Open Sans\", Helvetica, Arial, sans-serif;\r\n    color: #FBFEFB;\r\n    color: rgba(255, 255, 255, 0.82098);\r\n}\r\n.legend {\r\n    font-family: \"Raleway\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    font-size: 28px;\r\n    font-weight: 400;\r\n    margin-bottom: 25px;\r\n    color: #FBFEFB;\r\n}\r\n.form-control {\r\n    font-family: \"Open Sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    font-weight: 400;\r\n    transition: box-shadow 150ms ease-in-out;\r\n    background-color: rgba(10,13,25,0.1);\r\n    border-radius: 5px;\r\n    outline: solid 2px rgba(255,255,255,0);\r\n    border: 2px solid transparent;\r\n    box-shadow: inset 0 1px 1px rgba(10,13,25,0.15),0 1px 0 rgba(255,255,255,0.1);\r\n    box-sizing: border-box;\r\n    font-family: inherit;\r\n    font-size: 16px;\r\n    height: 43px;\r\n    width: 100%;\r\n    color: #FFFFFF;\r\n    color: rgba(255, 255, 255, 0.82098);\r\n}\r\n.form-control:focus {\r\n    border:2px solid #95B366;\r\n    box-shadow: none;\r\n    outline: 0 none;\r\n}\r\n.form-control option {\r\n    background-color: #374151;\r\n}\r\n.form-control::-webkit-input-placeholder { color: #4A566A; }\r\n.form-control:-moz-placeholder { color: #4A566A; }\r\n.form-control::-moz-placeholder { color: #4A566A; }\r\n.form-control:-ms-input-placeholder { color: #4A566A; }\r\n.control-label {\r\n    color: #FBFEFB;\r\n	font-weight: 600;\r\n}\r\n.btn {\r\n    box-sizing: border-box !important;\r\n    border: 0 !important;\r\n    border-bottom: 3px solid rgba(0, 0, 0, 0.1) !important;\r\n    font-weight: 600;\r\n    padding: 9px 32px;\r\n    font-family: \"Open Sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n}\r\n.btn-primary {\r\n    background-color: #95B366;\r\n}\r\n.btn-primary:hover, .btn-primary:active, .btn-primary:focus {\r\n    background-color: #95B366 !important;\r\n    opacity:0.85;\r\n	box-shadow: none;\r\n    outline: 0 none;\r\n}\r\n', 1, 1, 1567273210, 1567273210),
(9, 'Tea Time', 'Beautiful theme inspired by a cup of tea. With strong contrasts, a transparent black background and white letters, you can see a picture.', '#000000', '\r\n@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700);\r\n@import url(https://fonts.googleapis.com/css?family=Raleway:400,600);\r\nbody {\r\n    background-color: transparent;\r\n    background: url(\"http://demo.easyforms.baluart.com/static_files/images/themes/tea-time.jpg\") no-repeat center center fixed;\r\n    -webkit-background-size: cover;\r\n    -moz-background-size: cover;\r\n    -o-background-size: cover;\r\n    background-size: cover;\r\n    font-family: \"Open Sans\", Helvetica, Arial, sans-serif;\r\n    color: #FFFFFF;\r\n}\r\nform {\r\n    background-color: rgb(0, 0, 0);\r\n    background-color: rgba(0, 0, 0, 0.75);\r\n    padding: 20px;\r\n}\r\n/* Small devices (tablets, 768px and up) */\r\n@media (min-width: 768px) {\r\n    /* Hide background image of the body in embed view */\r\n    .app-embed {\r\n        background: transparent;\r\n    }\r\n    form {\r\n        padding: 40px;\r\n        border-radius: 10px;\r\n    }\r\n}\r\n.legend {\r\n    font-family: \"Raleway\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    font-size: 28px;\r\n    font-weight: 600;\r\n    margin: 0 0 20px 0;\r\n}\r\np, .checkbox-inline, .radio-inline {\r\n    font-weight: 300;\r\n}\r\n.form-group, .form-action {\r\n    margin-bottom: 25px;\r\n}\r\n.form-control {\r\n    font-family: \"Open Sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    color: #FFFFFF;\r\n    border: 1px solid #FFFFFF;\r\n    background-color: #000000;\r\n    background-color: rgba(0, 0, 0, 0);\r\n    height: 42px;\r\n}\r\n.form-control:focus {\r\n    border-color: #F9690E;\r\n    box-shadow: none;\r\n    outline: 0 none;\r\n    transition: none;\r\n}\r\n.form-control option {\r\n    background-color: #000000;\r\n}\r\n.form-control::-webkit-input-placeholder {\r\n    color: #D2D7D3;\r\n    color: rgba(255,255,255,0.85);\r\n}\r\n.form-control:-moz-placeholder {\r\n    color: #D2D7D3;\r\n    color: rgba(255,255,255,0.65);\r\n}\r\n.form-control::-moz-placeholder {\r\n    color: #D2D7D3;\r\n    color: rgba(255,255,255,0.65);\r\n}\r\n.form-control:-ms-input-placeholder {\r\n    color: #D2D7D3;\r\n    color: rgba(255,255,255,0.65);\r\n}\r\n.control-label {\r\n	font-weight: 600;\r\n}\r\n.btn {\r\n    border-radius: 26px;\r\n    font-family: \"Open Sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    font-weight: 600;\r\n    padding: 12px 42px;\r\n}\r\n.btn-primary {\r\n    border-color: transparent;\r\n    background-color: #F9690E;\r\n}\r\n.btn-primary:hover, .btn-primary:active, .btn-primary:focus {\r\n    border-color: transparent !important;\r\n    background-color: #fa7d2e !important;\r\n    box-shadow: none !important;\r\n    outline: 0 none !important;\r\n}\r\n/**\r\n * Alerts\r\n */\r\n.alert-success {\r\n    background-color: #018930;\r\n    background-color: rgba(1,137,48,0.75);\r\n    border-color: #018930;\r\n}\r\n.alert-danger {\r\n    background-color: #FF0000;\r\n    background-color: rgba(255, 0, 0, 0.75);\r\n    border-color: #FF0000;\r\n}\r\n', 1, 1, 1567273210, 1567273210),
(10, 'Purple Bay', 'A purple translucent theme with white fields and blue button.', '#2b2c4e', '\r\n@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700);\r\n@import url(https://fonts.googleapis.com/css?family=Raleway:300,400);\r\nbody {\r\n    padding: 20px;\r\n    background-color: transparent;\r\n    background: url(\"http://demo.easyforms.baluart.com/static_files/images/themes/purple-bay.jpg\") no-repeat center center fixed;\r\n    -webkit-background-size: cover;\r\n    -moz-background-size: cover;\r\n    -o-background-size: cover;\r\n    background-size: cover;\r\n    font-family: \"Open Sans\", Helvetica, Arial, sans-serif;\r\n    color: #cdcdcd;\r\n    color: rgba(255,255,255,0.80);\r\n}\r\n/* Small devices (tablets, 768px and up) */\r\n@media (min-width: 768px) {\r\n    /* Hide background image of the body in embed view */\r\n    .app-embed {\r\n        background: transparent;\r\n        padding: 50px 25%;\r\n    }\r\n}\r\n.legend {\r\n    display: inline-block;\r\n    font-family: \"Raleway\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    font-size: 24px;\r\n    font-weight: 300;\r\n    text-transform: uppercase;\r\n    padding-bottom: 3px;\r\n    border-bottom: 2px solid #1762ee;\r\n    margin: 0 0 20px 0;\r\n    color: #ffffff;\r\n}\r\n/* Small devices (tablets, 768px and up) */\r\n@media (min-width: 768px) {\r\n    .legend {\r\n        font-size: 28px;\r\n    }\r\n}\r\np {\r\n    font-weight: 300;\r\n}\r\n.form-group, .form-action {\r\n    margin-bottom: 25px;\r\n}\r\n.form-control {\r\n    font-family: \"Open Sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    color: #FFFFFF;\r\n    border-color: transparent;\r\n    background-color: #000000;\r\n    background-color: rgba(255, 255, 255, 0.15);\r\n    height: 42px;\r\n}\r\n.form-control:focus {\r\n    border-color: #ffffff;\r\n    border-color: rgba(255, 255, 255, 0.30);\r\n    box-shadow: none;\r\n    outline: 0 none;\r\n    transition: none;\r\n}\r\n.form-control option {\r\n    background-color: #000000;\r\n}\r\n.form-control::-webkit-input-placeholder {\r\n    color: #D2D7D3;\r\n    color: rgba(255,255,255,0.85);\r\n}\r\n.form-control:-moz-placeholder {\r\n    color: #D2D7D3;\r\n    color: rgba(255,255,255,0.65);\r\n}\r\n.form-control::-moz-placeholder {\r\n    color: #D2D7D3;\r\n    color: rgba(255,255,255,0.65);\r\n}\r\n.form-control:-ms-input-placeholder {\r\n    color: #D2D7D3;\r\n    color: rgba(255,255,255,0.65);\r\n}\r\n.control-label, .checkbox-inline, .radio-inline {\r\n    color: #cdcdcd;\r\n    color: rgba(255,255,255,0.80);\r\n	font-weight: 400;\r\n}\r\n.control-label {\r\n	text-transform: uppercase;\r\n}\r\n.btn {\r\n    font-family: \"Open Sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\r\n    font-weight: 600;\r\n    padding: 12px 42px;\r\n}\r\n.btn-primary {\r\n    border-color: transparent;\r\n    background-color: #1762ee;\r\n}\r\n.btn-primary:hover, .btn-primary:active, .btn-primary:focus {\r\n    border-color: transparent !important;\r\n    background-color: #3375f0 !important;\r\n    box-shadow: none !important;\r\n    outline: 0 none !important;\r\n}\r\n/**\r\n * Alerts\r\n */\r\n.alert-success {\r\n    background-color: #018930;\r\n    background-color: rgba(1,137,48,0.75);\r\n    border-color: #018930;\r\n}\r\n.alert-danger {\r\n    background-color: #FF0000;\r\n    background-color: rgba(255, 0, 0, 0.75);\r\n    border-color: #FF0000;\r\n}\r\n', 1, 1, 1567273210, 1567273210);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logged_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logged_in_at` timestamp NULL DEFAULT NULL,
  `created_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  `banned_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferences` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role_id`, `status`, `email`, `username`, `password`, `auth_key`, `access_token`, `logged_in_ip`, `logged_in_at`, `created_ip`, `created_at`, `updated_at`, `banned_at`, `banned_reason`, `preferences`) VALUES
(1, 1, 1, 'admin@erapat.com', 'admin', '$2y$13$hMNGKD7ImJLtU9O1oTewRu5qStpYEKGsMBI/dgmK6.UsP2uwjYDkW', 'pUSNgmzBP4YLg9eIjoDJ_MuOcMIlV8qx', 'taNrGcvfGQeCWfVrxhxepNyzQiPN_kKL', '::1', '2020-09-14 04:45:20', '::1', '2020-09-10 10:05:48', '2020-09-10 13:56:16', NULL, NULL, '{\"GridView\":{\"submissions\":{\"settings\":{\"2\":\"\",\"9\":\"{\\\"sort_attribute\\\":\\\"-created_at\\\",\\\"resizeColumns\\\":false,\\\"showColumns\\\":true,\\\"minimumCountColumns\\\":2,\\\"columns\\\":{\\\"text_680998\\\":false,\\\"number_63801\\\":false,\\\"date_748302\\\":true,\\\"hidden_signature_803792\\\":true}}\"}},\"pagination\":{\"pageSize\":\"500\"}},\"App\":{\"User\":{\"SessionTimeout\":{\"value\":\"86400000\"}}}}'),
(2, 2, 1, 'user@erapat.com', 'user', '$2y$13$ON/2lLk5YAq5DM2f2mww3.q2QdOM3rJpzL32COoUc7JoEhxP.IydC', NULL, NULL, '::1', '2020-09-14 04:44:59', NULL, '2020-09-10 11:09:47', '2020-09-14 04:47:32', NULL, NULL, NULL),
(3, 3, 1, 'dave@erapat.com', 'dave', '$2y$13$vJZvD1UCh4yehfVCt4ANB.CpHnoQ0/tIcRXU1m3J0Zk3YozuiTqvu', NULL, NULL, '::1', '2020-09-14 04:42:42', NULL, '2020-09-10 11:16:29', '2020-09-10 13:54:17', NULL, NULL, NULL);

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
(73, 1, 36),
(74, 2, 36),
(75, 1, 37),
(77, 4, 29);

-- --------------------------------------------------------

--
-- Table structure for table `user_auth`
--

CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_attributes` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

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
(36, 'Feed'),
(37, 'Form');

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
(33, 36, 'Pembaharuan', 'feed/pembaharuan', 'fas fa-fw fa-sync-alt', 1),
(34, 37, 'Master Data Form', 'form', 'fas fa-fw fa-file-powerpoint', 1),
(35, 37, 'Kelolah User Form', 'form/user', 'far fa-fw fa-user-circle', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

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
,`zoom_id` int(11)
,`zoomid` varchar(150)
,`meeting_status` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_zoom_meeting`
-- (See below for the actual view)
--
CREATE TABLE `view_zoom_meeting` (
`user_id` int(11)
,`zoomid` varchar(150)
,`pemilik_zoom` varchar(128)
,`pemakai_zoom` varchar(128)
,`date_activated` date
,`status` int(11)
,`start_time` time
,`end_time` time
,`meeting_status` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_zoom_users`
-- (See below for the actual view)
--
CREATE TABLE `view_zoom_users` (
`id` int(11)
,`user_id` int(11)
,`idzoom` varchar(150)
,`pemilik_zoom` varchar(128)
,`date_activated` date
,`start_time` time
,`end_time` time
,`is_active` int(11)
,`status` int(11)
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_meeting`  AS  select `meeting`.`id` AS `id`,`meeting`.`user_id` AS `user_id`,`view_user_department`.`name` AS `name`,`view_user_department`.`email` AS `email`,`view_user_department`.`role_id` AS `role_id`,`view_user_department`.`sub_department_id` AS `sub_department_id`,`view_user_department`.`sub_department_name` AS `sub_department_name`,`view_user_department`.`department_id` AS `department_id`,`view_user_department`.`department_name` AS `department_name`,`meeting`.`speakers_name` AS `speakers_name`,`meeting`.`members_name` AS `members_name`,`meeting`.`files_upload` AS `files_upload`,`meeting`.`files_upload1` AS `files_upload1`,`meeting`.`files_upload2` AS `files_upload2`,`meeting`.`unique_code` AS `unique_code`,`meeting`.`agenda` AS `agenda`,`meeting`.`start_time` AS `start_time`,`meeting`.`end_time` AS `end_time`,`meeting`.`request_status` AS `request_status`,`meeting`.`sub_type_id` AS `sub_type_id`,`meeting_sub_type`.`type_id` AS `type_id`,`meeting`.`other_online_id` AS `other_online_id`,`meeting_sub_type`.`meeting_subtype` AS `meeting_subtype`,`meeting_type`.`meeting_type` AS `meeting_type`,`meeting`.`start_date` AS `start_date`,`meeting`.`end_date` AS `end_date`,`meeting`.`date_requested` AS `date_requested`,`meeting`.`remark_status` AS `remark_status`,`meeting`.`zoom_id` AS `zoom_id`,`meeting_zoom`.`idzoom` AS `zoomid`,`meeting`.`meeting_status` AS `meeting_status` from ((((`meeting` join `view_user_department` on(`meeting`.`user_id` = `view_user_department`.`id`)) join `meeting_sub_type` on(`meeting`.`sub_type_id` = `meeting_sub_type`.`id`)) join `meeting_type` on(`meeting_sub_type`.`type_id` = `meeting_type`.`id`)) join `meeting_zoom` on(`meeting`.`zoom_id` = `meeting_zoom`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_zoom_meeting`
--
DROP TABLE IF EXISTS `view_zoom_meeting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_zoom_meeting`  AS  select `meeting_zoom`.`user_id` AS `user_id`,`view_user_meeting`.`zoomid` AS `zoomid`,`meeting_users`.`name` AS `pemilik_zoom`,`view_user_meeting`.`name` AS `pemakai_zoom`,`meeting_zoom`.`date_activated` AS `date_activated`,`meeting_zoom`.`status` AS `status`,`view_user_meeting`.`start_time` AS `start_time`,`view_user_meeting`.`end_time` AS `end_time`,`view_user_meeting`.`meeting_status` AS `meeting_status` from ((`meeting_zoom` join `meeting_users` on(`meeting_zoom`.`user_id` = `meeting_users`.`id`)) join `view_user_meeting` on(`meeting_zoom`.`id` = `view_user_meeting`.`zoom_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_zoom_users`
--
DROP TABLE IF EXISTS `view_zoom_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_zoom_users`  AS  select `meeting_zoom`.`id` AS `id`,`meeting_zoom`.`user_id` AS `user_id`,`meeting_zoom`.`idzoom` AS `idzoom`,`meeting_users`.`name` AS `pemilik_zoom`,`meeting_zoom`.`date_activated` AS `date_activated`,`meeting_zoom`.`start_time` AS `start_time`,`meeting_zoom`.`end_time` AS `end_time`,`meeting_zoom`.`is_active` AS `is_active`,`meeting_zoom`.`status` AS `status` from (`meeting_zoom` join `meeting_users` on(`meeting_zoom`.`user_id` = `meeting_users`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon`
--
ALTER TABLE `addon`
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `addon_google_analytics`
--
ALTER TABLE `addon_google_analytics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addon_webhooks`
--
ALTER TABLE `addon_webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `form_chart`
--
ALTER TABLE `form_chart`
  ADD UNIQUE KEY `form_chart_form_id_name` (`form_id`,`name`) USING BTREE,
  ADD KEY `form_chart_form_id` (`form_id`) USING BTREE;

--
-- Indexes for table `form_confirmation`
--
ALTER TABLE `form_confirmation`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `form_confirmation_form_id` (`form_id`) USING BTREE;

--
-- Indexes for table `form_data`
--
ALTER TABLE `form_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `form_data_form_id` (`form_id`) USING BTREE;

--
-- Indexes for table `form_email`
--
ALTER TABLE `form_email`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `form_email_form_id` (`form_id`) USING BTREE;

--
-- Indexes for table `form_rule`
--
ALTER TABLE `form_rule`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `form_rule_form_id` (`form_id`) USING BTREE;

--
-- Indexes for table `form_submission`
--
ALTER TABLE `form_submission`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `form_submission_form_id` (`form_id`) USING BTREE;

--
-- Indexes for table `form_submission_comment`
--
ALTER TABLE `form_submission_comment`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `form_submission_comment_submission_id` (`submission_id`) USING BTREE,
  ADD KEY `form_submission_comment_form_id` (`form_id`) USING BTREE;

--
-- Indexes for table `form_submission_file`
--
ALTER TABLE `form_submission_file`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `form_submission_file_submission_id` (`submission_id`) USING BTREE,
  ADD KEY `form_submission_file_form_id` (`form_id`) USING BTREE;

--
-- Indexes for table `form_ui`
--
ALTER TABLE `form_ui`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `form_ui_form_id` (`form_id`) USING BTREE;

--
-- Indexes for table `form_user`
--
ALTER TABLE `form_user`
  ADD UNIQUE KEY `form_user_form_id_user_id` (`form_id`,`user_id`) USING BTREE,
  ADD KEY `form_user_form_id` (`form_id`) USING BTREE,
  ADD KEY `form_user_user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `mail_queue`
--
ALTER TABLE `mail_queue`
  ADD PRIMARY KEY (`id`) USING BTREE;

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
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`) USING BTREE;

--
-- Indexes for table `migration_google_analytics`
--
ALTER TABLE `migration_google_analytics`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `migration_webhooks`
--
ALTER TABLE `migration_webhooks`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `profile_user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `setting_category_key` (`category`,`key`) USING BTREE;

--
-- Indexes for table `stats_performance`
--
ALTER TABLE `stats_performance`
  ADD UNIQUE KEY `stats_performance_day_app_id` (`day`,`app_id`) USING BTREE;

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `template_category`
--
ALTER TABLE `template_category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `user_email` (`email`) USING BTREE,
  ADD UNIQUE KEY `user_username` (`username`) USING BTREE,
  ADD KEY `user_role_id` (`role_id`) USING BTREE;

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_auth`
--
ALTER TABLE `user_auth`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_auth_provider_id` (`provider_id`) USING BTREE,
  ADD KEY `user_auth_user_id` (`user_id`) USING BTREE;

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
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `user_key_key` (`token`) USING BTREE,
  ADD KEY `user_key_user_id` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon_google_analytics`
--
ALTER TABLE `addon_google_analytics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addon_webhooks`
--
ALTER TABLE `addon_webhooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `form_confirmation`
--
ALTER TABLE `form_confirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `form_data`
--
ALTER TABLE `form_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `form_email`
--
ALTER TABLE `form_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `form_rule`
--
ALTER TABLE `form_rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `form_submission`
--
ALTER TABLE `form_submission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `form_submission_comment`
--
ALTER TABLE `form_submission_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `form_submission_file`
--
ALTER TABLE `form_submission_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_ui`
--
ALTER TABLE `form_ui`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `mail_queue`
--
ALTER TABLE `mail_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meeting`
--
ALTER TABLE `meeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meeting_department`
--
ALTER TABLE `meeting_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `meeting_place`
--
ALTER TABLE `meeting_place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `template_category`
--
ALTER TABLE `template_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `theme`
--
ALTER TABLE `theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `user_auth`
--
ALTER TABLE `user_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `user_auth`
--
ALTER TABLE `user_auth`
  ADD CONSTRAINT `user_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_token`
--
ALTER TABLE `user_token`
  ADD CONSTRAINT `user_key_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
