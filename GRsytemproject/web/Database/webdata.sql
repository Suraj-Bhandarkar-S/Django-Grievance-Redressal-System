-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 02, 2019 at 01:54 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webdata`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
CREATE TABLE IF NOT EXISTS `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
CREATE TABLE IF NOT EXISTS `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirmation_email_address_id_5b7f8c58` (`email_address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Greivance');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 64),
(2, 1, 26),
(3, 1, 6),
(4, 1, 8),
(5, 1, 10),
(6, 1, 12),
(7, 1, 20),
(8, 1, 58),
(9, 1, 28);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add profile', 1, 'add_profile'),
(2, 'Can change profile', 1, 'change_profile'),
(3, 'Can delete profile', 1, 'delete_profile'),
(4, 'Can view profile', 1, 'view_profile'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add user', 5, 'add_user'),
(18, 'Can change user', 5, 'change_user'),
(19, 'Can delete user', 5, 'delete_user'),
(20, 'Can view user', 5, 'view_user'),
(21, 'Can add content type', 6, 'add_contenttype'),
(22, 'Can change content type', 6, 'change_contenttype'),
(23, 'Can delete content type', 6, 'delete_contenttype'),
(24, 'Can view content type', 6, 'view_contenttype'),
(25, 'Can add session', 7, 'add_session'),
(26, 'Can change session', 7, 'change_session'),
(27, 'Can delete session', 7, 'delete_session'),
(28, 'Can view session', 7, 'view_session'),
(29, 'Can add site', 8, 'add_site'),
(30, 'Can change site', 8, 'change_site'),
(31, 'Can delete site', 8, 'delete_site'),
(32, 'Can view site', 8, 'view_site'),
(33, 'Can add email address', 9, 'add_emailaddress'),
(34, 'Can change email address', 9, 'change_emailaddress'),
(35, 'Can delete email address', 9, 'delete_emailaddress'),
(36, 'Can view email address', 9, 'view_emailaddress'),
(37, 'Can add email confirmation', 10, 'add_emailconfirmation'),
(38, 'Can change email confirmation', 10, 'change_emailconfirmation'),
(39, 'Can delete email confirmation', 10, 'delete_emailconfirmation'),
(40, 'Can view email confirmation', 10, 'view_emailconfirmation'),
(41, 'Can add social account', 11, 'add_socialaccount'),
(42, 'Can change social account', 11, 'change_socialaccount'),
(43, 'Can delete social account', 11, 'delete_socialaccount'),
(44, 'Can view social account', 11, 'view_socialaccount'),
(45, 'Can add social application', 12, 'add_socialapp'),
(46, 'Can change social application', 12, 'change_socialapp'),
(47, 'Can delete social application', 12, 'delete_socialapp'),
(48, 'Can view social application', 12, 'view_socialapp'),
(49, 'Can add social application token', 13, 'add_socialtoken'),
(50, 'Can change social application token', 13, 'change_socialtoken'),
(51, 'Can delete social application token', 13, 'delete_socialtoken'),
(52, 'Can view social application token', 13, 'view_socialtoken'),
(53, 'Can add user profile', 14, 'add_userprofile'),
(54, 'Can change user profile', 14, 'change_userprofile'),
(55, 'Can delete user profile', 14, 'delete_userprofile'),
(56, 'Can view user profile', 14, 'view_userprofile'),
(57, 'Can add complaints', 15, 'add_complaints'),
(58, 'Can change complaints', 15, 'change_complaints'),
(59, 'Can delete complaints', 15, 'delete_complaints'),
(60, 'Can view complaints', 15, 'view_complaints'),
(61, 'Can add complaint', 15, 'add_complaint'),
(62, 'Can change complaint', 15, 'change_complaint'),
(63, 'Can delete complaint', 15, 'delete_complaint'),
(64, 'Can view complaint', 15, 'view_complaint'),
(65, 'Can add grievance', 16, 'add_grievance'),
(66, 'Can change grievance', 16, 'change_grievance'),
(67, 'Can delete grievance', 16, 'delete_grievance'),
(68, 'Can view grievance', 16, 'view_grievance');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(71, 'pbkdf2_sha256$150000$JoKAGOYT2iQY$0mbS/cg0OdkPcPvl1ST/OaGXkBEFdvSWEzOxvh4HGxc=', NULL, 1, 'user', '', '', 'user@user.com', 1, 1, '2019-11-02 13:50:23.292597');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'GRsystem', 'profile'),
(2, 'admin', 'logentry'),
(3, 'auth', 'permission'),
(4, 'auth', 'group'),
(5, 'auth', 'user'),
(6, 'contenttypes', 'contenttype'),
(7, 'sessions', 'session'),
(8, 'sites', 'site'),
(9, 'account', 'emailaddress'),
(10, 'account', 'emailconfirmation'),
(11, 'socialaccount', 'socialaccount'),
(12, 'socialaccount', 'socialapp'),
(13, 'socialaccount', 'socialtoken'),
(14, 'GRsystem', 'userprofile'),
(15, 'GRsystem', 'complaint'),
(16, 'GRsystem', 'grievance');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-02-08 16:19:30.053303'),
(2, 'auth', '0001_initial', '2019-02-08 16:19:33.355470'),
(3, 'account', '0001_initial', '2019-02-08 16:19:34.131395'),
(4, 'account', '0002_email_max_length', '2019-02-08 16:19:34.292962'),
(5, 'admin', '0001_initial', '2019-02-08 16:19:34.754727'),
(6, 'admin', '0002_logentry_remove_auto_add', '2019-02-08 16:19:34.769691'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2019-02-08 16:19:34.784657'),
(8, 'contenttypes', '0002_remove_content_type_name', '2019-02-08 16:19:35.150667'),
(9, 'auth', '0002_alter_permission_name_max_length', '2019-02-08 16:19:35.385041'),
(10, 'auth', '0003_alter_user_email_max_length', '2019-02-08 16:19:35.531649'),
(11, 'auth', '0004_alter_user_username_opts', '2019-02-08 16:19:35.543620'),
(12, 'auth', '0005_alter_user_last_login_null', '2019-02-08 16:19:35.729121'),
(13, 'auth', '0006_require_contenttypes_0002', '2019-02-08 16:19:35.732115'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2019-02-08 16:19:35.743084'),
(15, 'auth', '0008_alter_user_username_max_length', '2019-02-08 16:19:35.904651'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2019-02-08 16:19:36.096138'),
(17, 'sessions', '0001_initial', '2019-02-08 16:19:36.328518'),
(18, 'sites', '0001_initial', '2019-02-08 16:19:36.472135'),
(19, 'sites', '0002_alter_domain_unique', '2019-02-08 16:19:36.548930'),
(20, 'socialaccount', '0001_initial', '2019-02-08 16:19:38.866729'),
(21, 'socialaccount', '0002_token_max_lengths', '2019-02-08 16:19:39.193854'),
(22, 'socialaccount', '0003_extra_data_default_dict', '2019-02-08 16:19:39.212804'),
(23, 'GRsystem', '0001_initial', '2019-02-08 16:39:09.960625'),
(24, 'GRsystem', '0002_auto_20190208_2248', '2019-02-08 17:18:10.779207'),
(25, 'GRsystem', '0003_auto_20190210_0827', '2019-02-10 02:57:08.504398'),
(26, 'GRsystem', '0004_userprofile', '2019-02-10 03:33:15.448201'),
(27, 'GRsystem', '0005_auto_20190210_1036', '2019-02-10 05:06:58.262856'),
(28, 'GRsystem', '0006_complaints', '2019-02-11 04:01:05.177337'),
(29, 'GRsystem', '0007_auto_20190211_0933', '2019-02-11 04:03:18.286877'),
(30, 'GRsystem', '0008_auto_20190211_1028', '2019-02-11 04:58:22.951666'),
(31, 'GRsystem', '0009_auto_20190211_1821', '2019-02-11 12:52:01.435271'),
(32, 'GRsystem', '0010_auto_20190211_1832', '2019-02-11 13:02:43.515342'),
(33, 'GRsystem', '0011_auto_20190211_1900', '2019-02-11 13:30:56.804641'),
(34, 'GRsystem', '0012_complaint_time', '2019-02-12 04:51:20.446757'),
(35, 'GRsystem', '0013_complaint_status', '2019-02-12 06:54:12.560749'),
(36, 'GRsystem', '0014_auto_20190212_1225', '2019-02-12 06:55:48.025732'),
(37, 'GRsystem', '0015_complaint_subject', '2019-02-12 07:50:56.361045'),
(38, 'GRsystem', '0016_auto_20190213_0012', '2019-02-12 18:42:22.556356'),
(39, 'GRsystem', '0017_auto_20190214_1020', '2019-02-14 04:50:59.763087'),
(40, 'GRsystem', '0018_auto_20190214_1031', '2019-02-14 05:01:18.483988'),
(41, 'GRsystem', '0019_auto_20190216_2020', '2019-02-16 14:50:45.553590'),
(42, 'GRsystem', '0020_profile_type_user', '2019-02-23 04:30:59.791492'),
(43, 'GRsystem', '0021_auto_20190223_1004', '2019-02-23 04:34:49.048815'),
(44, 'GRsystem', '0022_auto_20190223_1045', '2019-02-23 05:15:51.414332'),
(45, 'GRsystem', '0023_auto_20190223_1046', '2019-02-23 05:16:58.372314'),
(46, 'GRsystem', '0024_auto_20190305_1158', '2019-03-05 06:28:30.708920'),
(47, 'GRsystem', '0025_auto_20190305_1201', '2019-03-05 06:31:18.494129'),
(48, 'GRsystem', '0026_profile_email_confirmed', '2019-03-24 06:24:32.054950'),
(49, 'GRsystem', '0027_remove_profile_email_confirmed', '2019-03-24 06:28:35.839117'),
(50, 'GRsystem', '0028_auto_20190325_2105', '2019-03-25 15:35:30.735047'),
(51, 'auth', '0010_alter_group_name_max_length', '2019-04-30 10:52:25.012590'),
(52, 'auth', '0011_update_proxy_permissions', '2019-04-30 10:52:25.032535'),
(53, 'GRsystem', '0029_auto_20190430_1809', '2019-04-30 12:39:39.280788'),
(54, 'GRsystem', '0029_auto_20190505_1652', '2019-05-05 11:22:51.298956'),
(55, 'GRsystem', '0030_auto_20190508_0857', '2019-05-08 03:27:13.109496'),
(56, 'GRsystem', '0031_auto_20190508_0910', '2019-05-08 03:41:02.916794'),
(57, 'GRsystem', '0032_auto_20190508_2141', '2019-05-08 16:11:52.736555'),
(58, 'GRsystem', '0033_auto_20190508_2142', '2019-05-08 16:12:23.773572'),
(59, 'GRsystem', '0034_auto_20191102_1918', '2019-11-02 13:48:25.160976');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('s1mrx0ptk7iz7gsf4uiw0bxii6jqa8oo', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-22 16:22:35.659933'),
('sl8hp5m8ooaxqvklsg2y9t46x063kajo', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-22 16:34:27.029953'),
('7mlrrl3177ifez77ierwsp1b7650ini6', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-22 16:39:29.180250'),
('n8mq3kysl3b4ibvd3swl9eouzbg8rva7', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-22 16:41:33.609055'),
('b8dbsw2dwblsp47inofbfjomrnh4yf7y', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-22 16:42:55.833135'),
('lgvw5ogeiqv9ti3p1ng4j9e1zdvj7568', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-22 16:56:47.187306'),
('e12w7yl4p2ahtkumspje5swvn7vodp36', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-22 16:58:01.318297'),
('vy2w34khmge9p3uzg8nfm5hswtc007lz', 'OGVhODQ0ZTc3ODcwNjE0ZWQzMjY0YmYwYjE4ODNmZTRiODZkYmJhMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwOTIyOGU5NDg0MTczY2IzOGU2YWQxZTE3N2ExMWZlMzRlMTVmMmExIn0=', '2019-02-22 17:42:13.989116'),
('q6lnuqcn837hujn7lpau0696rq3xqnd3', 'YTUwMDk2YjQ5MDUyNWNlYjJiMDI2ZTYxMWMxODc4NjdjOGZmOGQ4Yjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjc0ODBjM2M4NzBmNWMzOTg4NDNiM2JhMTE4MWMxZjI4YWVkYTdlNCJ9', '2019-02-24 04:14:30.992064'),
('ip1fhze7g9qrygpprlrd1y09qyntg0zh', 'OGVhODQ0ZTc3ODcwNjE0ZWQzMjY0YmYwYjE4ODNmZTRiODZkYmJhMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwOTIyOGU5NDg0MTczY2IzOGU2YWQxZTE3N2ExMWZlMzRlMTVmMmExIn0=', '2019-02-24 04:58:03.669441'),
('j2v0pyfutg75nonm67c3nyj8b5hkx8tw', 'NjAzZGMyMjZlMzdhZTE2M2I5NzM0ZmRkMzNjMjhhM2I4YzhiZmVkNDp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWRmNzI5Y2U3MDM0ZDVlODg4OTQwYmQ2MTU1MDM5OTlmOTM1NzhmMSJ9', '2019-02-24 05:14:48.899224'),
('ev5i04ececvymk57qx9q3yadk4ptaqpd', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-24 11:41:21.282235'),
('7f1ruuayklvdivbqvei67rnkqb1xxegl', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-24 11:42:46.450440'),
('lmm1ehlnumm4b7xdyd4gwafjhlba1f24', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-24 11:43:34.761225'),
('y2za5n04x69pw152nww4c9g5cd7ns2mv', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-24 11:45:11.987321'),
('gvun72k5sv01q1az56yljjiytmtelmgq', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-24 11:48:06.428800'),
('qcl66hbf9fxpxv4dom8eqdeefmff1h2j', 'NjAzZGMyMjZlMzdhZTE2M2I5NzM0ZmRkMzNjMjhhM2I4YzhiZmVkNDp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWRmNzI5Y2U3MDM0ZDVlODg4OTQwYmQ2MTU1MDM5OTlmOTM1NzhmMSJ9', '2019-02-25 04:06:25.358043'),
('7gfbtxgz9c1t7comfwe1ur1szdyvf973', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-25 13:29:03.013991'),
('lfkt8fgklevezg3u3emdmhnkz5jzo4i0', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-25 13:31:32.922743'),
('kngxlbvk0noixurmx6nf3qwx7rufxiae', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-02-25 13:35:04.183144'),
('lqp6ct9udxjn9jc9f96doukek86prtvs', 'NjAzZGMyMjZlMzdhZTE2M2I5NzM0ZmRkMzNjMjhhM2I4YzhiZmVkNDp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWRmNzI5Y2U3MDM0ZDVlODg4OTQwYmQ2MTU1MDM5OTlmOTM1NzhmMSJ9', '2019-02-25 13:50:17.840369'),
('wdn6ocxr8545l63dsuedrkd73wfwzv8t', 'NmI1OGQ5NTIwYTk0NDQ3NGIxMDMwZGNjZmRhNDM1NmRiMjY2N2ZjYzp7Il9hdXRoX3VzZXJfaWQiOiIyNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTAxOTI2M2EzMzQ3Y2ViNjJjMjc4NTg5M2JhNTM4ZGRhMDVlNzYzZCJ9', '2019-02-25 17:58:24.653309'),
('mko57kv1cwt83g4bfspbf5y8gi0noqno', 'NjAzZGMyMjZlMzdhZTE2M2I5NzM0ZmRkMzNjMjhhM2I4YzhiZmVkNDp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWRmNzI5Y2U3MDM0ZDVlODg4OTQwYmQ2MTU1MDM5OTlmOTM1NzhmMSJ9', '2019-02-26 08:43:41.046789'),
('lg2p0og4xoj4ursptvyujb8cjfimu9m1', 'NmI1OGQ5NTIwYTk0NDQ3NGIxMDMwZGNjZmRhNDM1NmRiMjY2N2ZjYzp7Il9hdXRoX3VzZXJfaWQiOiIyNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTAxOTI2M2EzMzQ3Y2ViNjJjMjc4NTg5M2JhNTM4ZGRhMDVlNzYzZCJ9', '2019-02-26 18:52:17.488226'),
('re2f8xp6znolbdbz9nehv1ie46z8ijt8', 'Mjg4YjNhMTZiZjM2NTJmZmRmZWQxOTUwNDViNTk0MTM4YmI1YmM1Mjp7Il9hdXRoX3VzZXJfaWQiOiIzMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmI4MTYwODNmYTViNmU2NjFhNWJmMzI5OWRiNWRiNjZkNTgwMmRiNyJ9', '2019-02-27 06:43:51.292548'),
('8t1l6edsyg8j4qs66dzywftq8j5tf2tx', 'Mjg4YjNhMTZiZjM2NTJmZmRmZWQxOTUwNDViNTk0MTM4YmI1YmM1Mjp7Il9hdXRoX3VzZXJfaWQiOiIzMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmI4MTYwODNmYTViNmU2NjFhNWJmMzI5OWRiNWRiNjZkNTgwMmRiNyJ9', '2019-02-27 11:53:36.449961'),
('xcp6lhez9qa62vmcjokw7db1m530hzsr', 'Mjg4YjNhMTZiZjM2NTJmZmRmZWQxOTUwNDViNTk0MTM4YmI1YmM1Mjp7Il9hdXRoX3VzZXJfaWQiOiIzMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmI4MTYwODNmYTViNmU2NjFhNWJmMzI5OWRiNWRiNjZkNTgwMmRiNyJ9', '2019-02-27 12:33:22.757754'),
('brhw5xgv1gyo7kryjxphy7e3jh8zlm77', 'YmJiNzFmMDE0MDE1ZmVhNzZkOWU0Mjc4ODczNzA2MTY2ODZmNmMwYjp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2RjM2Q3ZWY3YTg3MDkxYWU3ZWNhYjIzYjRiMWQ3NjI1YzdlNGViZiJ9', '2019-02-28 05:06:08.684039'),
('37seikv1s6y5qewy9vwfuiwbapmn81x7', 'YmJiNzFmMDE0MDE1ZmVhNzZkOWU0Mjc4ODczNzA2MTY2ODZmNmMwYjp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2RjM2Q3ZWY3YTg3MDkxYWU3ZWNhYjIzYjRiMWQ3NjI1YzdlNGViZiJ9', '2019-02-28 09:31:38.732111'),
('0dsnnueejyh98834c26qslzpyr5efcet', 'YmJiNzFmMDE0MDE1ZmVhNzZkOWU0Mjc4ODczNzA2MTY2ODZmNmMwYjp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2RjM2Q3ZWY3YTg3MDkxYWU3ZWNhYjIzYjRiMWQ3NjI1YzdlNGViZiJ9', '2019-02-28 15:18:13.406148'),
('4zchnkduq8641r2wt06q0n6i5lolu6px', 'YmJiNzFmMDE0MDE1ZmVhNzZkOWU0Mjc4ODczNzA2MTY2ODZmNmMwYjp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2RjM2Q3ZWY3YTg3MDkxYWU3ZWNhYjIzYjRiMWQ3NjI1YzdlNGViZiJ9', '2019-03-01 08:34:43.836555'),
('1eksbj126tba7hkr0tkbcd96pbe77evj', 'YmJiNzFmMDE0MDE1ZmVhNzZkOWU0Mjc4ODczNzA2MTY2ODZmNmMwYjp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2RjM2Q3ZWY3YTg3MDkxYWU3ZWNhYjIzYjRiMWQ3NjI1YzdlNGViZiJ9', '2019-03-02 07:03:02.390638'),
('a0yv155d2y1e1j2b4msmuhptf6hu60vo', 'MDUwYzE1ZmNiMjc2MjZiNDI4ZGY1ZDg0NDg2NjkxZDQwMWJkZWI4YTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDYyNjFjYjU5ZjU1MmM4YzcxMmQ3ZDkyZmMwMDE5NjllMWQ5YThjMiJ9', '2019-03-02 14:51:06.172563'),
('r8t8ifh0ygox27go5mvzah0k91whb73e', 'YmJiNzFmMDE0MDE1ZmVhNzZkOWU0Mjc4ODczNzA2MTY2ODZmNmMwYjp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2RjM2Q3ZWY3YTg3MDkxYWU3ZWNhYjIzYjRiMWQ3NjI1YzdlNGViZiJ9', '2019-03-04 06:15:58.435045'),
('u2fkog0nbk0bvi0hqkbalykdsdkxpuzl', 'MDUwYzE1ZmNiMjc2MjZiNDI4ZGY1ZDg0NDg2NjkxZDQwMWJkZWI4YTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDYyNjFjYjU5ZjU1MmM4YzcxMmQ3ZDkyZmMwMDE5NjllMWQ5YThjMiJ9', '2019-03-09 04:15:47.513383'),
('bia3yd2hd0hino27466a3iwmqz33jpc6', 'Y2JiNTZkY2ZlYWI5MGJkOGJkZWQ3OGQ4OTAyN2IyYjgyZmViZmExNjp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzM1YmFlN2Y3NjUwYjllOTYzNTRhZDExZmYzN2Y2NDFlZjMwOGRlZiJ9', '2019-03-17 05:53:33.191121'),
('d98lqnzxo1ppcr934o838kfljn9flfpl', 'Y2JiNTZkY2ZlYWI5MGJkOGJkZWQ3OGQ4OTAyN2IyYjgyZmViZmExNjp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzM1YmFlN2Y3NjUwYjllOTYzNTRhZDExZmYzN2Y2NDFlZjMwOGRlZiJ9', '2019-03-18 09:48:50.057795'),
('x84bbqkfwauj8pn5tty9ldjc6btaxcsv', 'Y2JiNTZkY2ZlYWI5MGJkOGJkZWQ3OGQ4OTAyN2IyYjgyZmViZmExNjp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzM1YmFlN2Y3NjUwYjllOTYzNTRhZDExZmYzN2Y2NDFlZjMwOGRlZiJ9', '2019-03-18 11:16:39.503748'),
('xvb47y4ivxajwhqro51qv0qh5ql278r0', 'YTA1MzZjZjFhOWQxYTY2ODRlMjVlM2E4MGMyODBkYTFlMTVlY2QzZDp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDQ2YmQ3MGQ1MmUzNDJjYmI4ZGJhNjU4ZjYxZDVjMGFkYzczMTJjMSJ9', '2019-03-18 14:09:04.745299'),
('bsxprxif3tfikx7r18clymoaxtavom03', 'Y2JiNTZkY2ZlYWI5MGJkOGJkZWQ3OGQ4OTAyN2IyYjgyZmViZmExNjp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzM1YmFlN2Y3NjUwYjllOTYzNTRhZDExZmYzN2Y2NDFlZjMwOGRlZiJ9', '2019-03-19 02:55:25.849368'),
('huplnf6jj11ev69c55l2lygyluox5j3t', 'Y2JiNTZkY2ZlYWI5MGJkOGJkZWQ3OGQ4OTAyN2IyYjgyZmViZmExNjp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzM1YmFlN2Y3NjUwYjllOTYzNTRhZDExZmYzN2Y2NDFlZjMwOGRlZiJ9', '2019-03-20 09:33:38.439262'),
('qahm02jaimfkrdccpn2ejrsehi1yl9fa', 'Y2JiNTZkY2ZlYWI5MGJkOGJkZWQ3OGQ4OTAyN2IyYjgyZmViZmExNjp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzM1YmFlN2Y3NjUwYjllOTYzNTRhZDExZmYzN2Y2NDFlZjMwOGRlZiJ9', '2019-03-21 10:07:31.476414'),
('eyj4m3vk2wktwd04zym1z3lng9tzhj7e', 'Y2JiNTZkY2ZlYWI5MGJkOGJkZWQ3OGQ4OTAyN2IyYjgyZmViZmExNjp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzM1YmFlN2Y3NjUwYjllOTYzNTRhZDExZmYzN2Y2NDFlZjMwOGRlZiJ9', '2019-03-21 10:18:09.859702'),
('9pombxffa95auxxjeggb1b6iz940jgpw', 'Y2QxZDNkNGJkMmM3N2Q1NTZlYTU4YjcxODE0OTI2ZmE4NmZjZGU1Yzp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTE0OTljZWEwY2I3ZWQyOGFhMThiYzE1NjI2MTYyMjEzZGMyODUzZCJ9', '2019-03-22 09:04:17.358675'),
('h52hx5mfo93gzutvgrodtfk2vtcd7jho', 'Y2QxZDNkNGJkMmM3N2Q1NTZlYTU4YjcxODE0OTI2ZmE4NmZjZGU1Yzp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTE0OTljZWEwY2I3ZWQyOGFhMThiYzE1NjI2MTYyMjEzZGMyODUzZCJ9', '2019-03-25 09:36:26.384618'),
('rjnoxdb9pb2ju037zaovgoov1p6y6qw8', 'Y2JiNTZkY2ZlYWI5MGJkOGJkZWQ3OGQ4OTAyN2IyYjgyZmViZmExNjp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzM1YmFlN2Y3NjUwYjllOTYzNTRhZDExZmYzN2Y2NDFlZjMwOGRlZiJ9', '2019-03-29 10:48:22.564149'),
('d7ycufjdt90db6gba376duxk6p22rg6t', 'Y2QxZDNkNGJkMmM3N2Q1NTZlYTU4YjcxODE0OTI2ZmE4NmZjZGU1Yzp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTE0OTljZWEwY2I3ZWQyOGFhMThiYzE1NjI2MTYyMjEzZGMyODUzZCJ9', '2019-04-05 06:31:08.273877'),
('51dkn60iqr0qeeddwmzn3juwo622rp2y', 'Y2QxZDNkNGJkMmM3N2Q1NTZlYTU4YjcxODE0OTI2ZmE4NmZjZGU1Yzp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTE0OTljZWEwY2I3ZWQyOGFhMThiYzE1NjI2MTYyMjEzZGMyODUzZCJ9', '2019-04-05 13:03:08.983155'),
('z6ja5raz3ne4ci205ottrnn59sjcu4dr', 'Y2QxZDNkNGJkMmM3N2Q1NTZlYTU4YjcxODE0OTI2ZmE4NmZjZGU1Yzp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTE0OTljZWEwY2I3ZWQyOGFhMThiYzE1NjI2MTYyMjEzZGMyODUzZCJ9', '2019-04-06 05:33:45.390753'),
('0y5tg7s3qnwfkisj49er0ek27ln6govn', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-04-08 15:22:22.921133'),
('831avh1mgl9l7t07g8tsdz9v3iy2wcib', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-04-08 15:22:55.777260'),
('lchjklxyujceufpi8ynrkjoks8rw3c5t', 'Y2JiNTZkY2ZlYWI5MGJkOGJkZWQ3OGQ4OTAyN2IyYjgyZmViZmExNjp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzM1YmFlN2Y3NjUwYjllOTYzNTRhZDExZmYzN2Y2NDFlZjMwOGRlZiJ9', '2019-04-08 16:55:15.249789'),
('c4imes2qd76rx2cdas0cqqc0c6glcktx', 'Y2JiNTZkY2ZlYWI5MGJkOGJkZWQ3OGQ4OTAyN2IyYjgyZmViZmExNjp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzM1YmFlN2Y3NjUwYjllOTYzNTRhZDExZmYzN2Y2NDFlZjMwOGRlZiJ9', '2019-04-08 19:51:55.036054'),
('ti56u8k9qlzgs4wjzrw07m1wdkvexh2e', 'Y2JiNTZkY2ZlYWI5MGJkOGJkZWQ3OGQ4OTAyN2IyYjgyZmViZmExNjp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzM1YmFlN2Y3NjUwYjllOTYzNTRhZDExZmYzN2Y2NDFlZjMwOGRlZiJ9', '2019-04-10 09:39:13.430653'),
('daz6f0ehgi3422x76f1vn5tuyzp8623d', 'YmI1ZGQxYjg3YWUzMmI4NmE0M2U5NWJkZDMyZTRiNzY3YzI2MjU2NDp7Il9hdXRoX3VzZXJfaWQiOiI0NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmQ4NmJiYmEwYzljNjlmNmMyN2MyMmE1ODExYjFhZjg0Mzc3MDdhNyJ9', '2019-04-15 08:07:42.059584'),
('pjnsw8sbgtunykzcv4vwts4sb4zaqbip', 'OWRmYzYzMmM2YWVlYzU1NWNiNDM5ZDI3MGVjZDJkNzAwMTdmZDU4ZDp7Il9hdXRoX3VzZXJfaWQiOiI0NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTg3NWJjMTc2NWEyNGJhNDVlNTA5N2VlYTEyMTVkMWI2YTY2ZWNkNiJ9', '2019-04-24 12:02:19.950072'),
('fgul1qzndluja41ouhwtkr1swu4gwyjw', 'MzJhODFiZDQ3N2FkMzQzYjI2YmFjMjBkMjE3YWQxNjI3ZDU2ZTE5Mzp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGY4MTBlNWQ2Y2VkNzk2ZWZlZGI0NmI0MTZhZjJjYTRhMWY1M2IzYyJ9', '2019-05-14 11:16:08.414849'),
('nxotpfoelwh4v04u7suy5nly56gmr5qg', 'MzJhODFiZDQ3N2FkMzQzYjI2YmFjMjBkMjE3YWQxNjI3ZDU2ZTE5Mzp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGY4MTBlNWQ2Y2VkNzk2ZWZlZGI0NmI0MTZhZjJjYTRhMWY1M2IzYyJ9', '2019-05-14 12:07:31.470180'),
('qpu5tyezwsd27tjubcyw0rs87w5vgy63', 'NTU2NjdlODNiYTA4ZmY5YjBmNTA2ZWRhMWNhOGI5NjEyMGRmNzFiZjp7fQ==', '2019-05-19 03:14:27.839753'),
('fvepceahvq40mcqm8j1f2m822ksjvxpj', 'MzJhODFiZDQ3N2FkMzQzYjI2YmFjMjBkMjE3YWQxNjI3ZDU2ZTE5Mzp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGY4MTBlNWQ2Y2VkNzk2ZWZlZGI0NmI0MTZhZjJjYTRhMWY1M2IzYyJ9', '2019-05-20 03:27:28.376521'),
('x1cfxj0h4tqhwa4lzr793q2gi38a4dat', 'ZGNkNWE1NTA4OTIxOGJhMmViZjU3OTcwMWUwZTQ0ODc0NGYwNTZhMjp7Il9wYXNzd29yZF9yZXNldF90b2tlbiI6IjU2NS1hMzZmYzkwYzM2MDA3ZTg3YmRiZiJ9', '2019-05-21 20:12:04.020297'),
('ugan4tr7gvzcyzalklkak7m8ufe7gbq7', 'YmUxOTgxNDMzZWQxMzUxM2NiMGE3YjVkN2I4ZGJkM2YzZDE0ZmFlYTp7Il9hdXRoX3VzZXJfaWQiOiI0NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWQyMzcwOTU0MWI0NTU2ZGVhMTBlMWY0NmU1ZDBkOGQ4ZDcxNDkzYSJ9', '2019-05-22 06:56:28.113687'),
('be07ge9dt4xt7dmre9g6is1y8s2264ms', 'YmUxOTgxNDMzZWQxMzUxM2NiMGE3YjVkN2I4ZGJkM2YzZDE0ZmFlYTp7Il9hdXRoX3VzZXJfaWQiOiI0NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWQyMzcwOTU0MWI0NTU2ZGVhMTBlMWY0NmU1ZDBkOGQ4ZDcxNDkzYSJ9', '2019-05-22 10:05:02.732791'),
('e8nekivyhjs8jaed8j868djvqj35d4f0', 'MzJhODFiZDQ3N2FkMzQzYjI2YmFjMjBkMjE3YWQxNjI3ZDU2ZTE5Mzp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGY4MTBlNWQ2Y2VkNzk2ZWZlZGI0NmI0MTZhZjJjYTRhMWY1M2IzYyJ9', '2019-05-22 16:18:28.104424'),
('3xz25s7d5cm1x1kurjr6ohrezomaxvgc', 'OWRmYzYzMmM2YWVlYzU1NWNiNDM5ZDI3MGVjZDJkNzAwMTdmZDU4ZDp7Il9hdXRoX3VzZXJfaWQiOiI0NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTg3NWJjMTc2NWEyNGJhNDVlNTA5N2VlYTEyMTVkMWI2YTY2ZWNkNiJ9', '2019-05-23 06:24:13.115098'),
('ixmcyopjhjxrujv4tc51jovfcs2z19xn', 'OWRmYzYzMmM2YWVlYzU1NWNiNDM5ZDI3MGVjZDJkNzAwMTdmZDU4ZDp7Il9hdXRoX3VzZXJfaWQiOiI0NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTg3NWJjMTc2NWEyNGJhNDVlNTA5N2VlYTEyMTVkMWI2YTY2ZWNkNiJ9', '2019-05-23 06:25:10.547153'),
('56rkvh3dhh2eh76up07v7vit8gx1yio2', 'NzBjNWY4ZjkyNTYyMTI1M2Y1MjExY2I5OTdhZjhkMmEyNzI5ODI4MDp7Il9hdXRoX3VzZXJfaWQiOiI2NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmE5YmEyM2Y0NTUzZDE0ZWQ1YmQwNDU5ZjE3OWVhZDk2ZDIyM2UwYiJ9', '2019-05-23 06:59:11.808703'),
('qeh2qykil4uosmrc4f1u6g5c39zt20zx', 'YmUxOTgxNDMzZWQxMzUxM2NiMGE3YjVkN2I4ZGJkM2YzZDE0ZmFlYTp7Il9hdXRoX3VzZXJfaWQiOiI0NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWQyMzcwOTU0MWI0NTU2ZGVhMTBlMWY0NmU1ZDBkOGQ4ZDcxNDkzYSJ9', '2019-05-26 10:28:31.284060'),
('i4gs4w16tdzik2e72rcwmcu0wfn8rwng', 'MzJhODFiZDQ3N2FkMzQzYjI2YmFjMjBkMjE3YWQxNjI3ZDU2ZTE5Mzp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGY4MTBlNWQ2Y2VkNzk2ZWZlZGI0NmI0MTZhZjJjYTRhMWY1M2IzYyJ9', '2019-06-25 08:00:34.437350'),
('a0aznty7p017j5enxf6i1ozui313oeq9', 'MzJhODFiZDQ3N2FkMzQzYjI2YmFjMjBkMjE3YWQxNjI3ZDU2ZTE5Mzp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGY4MTBlNWQ2Y2VkNzk2ZWZlZGI0NmI0MTZhZjJjYTRhMWY1M2IzYyJ9', '2019-06-25 09:05:55.224317'),
('jcfzdplid4i4uederfumnz5t67hzyj45', 'MzJhODFiZDQ3N2FkMzQzYjI2YmFjMjBkMjE3YWQxNjI3ZDU2ZTE5Mzp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGY4MTBlNWQ2Y2VkNzk2ZWZlZGI0NmI0MTZhZjJjYTRhMWY1M2IzYyJ9', '2019-06-25 09:46:29.069799'),
('ai0udk7n7l6kv2j4ws8zlkv8zemftzj6', 'MDE5M2IwYjg3YTRiNjcwMWEzZTkzNDg0ZWQ3ZmIzMTNiMzFmMGU5OTp7Il9hdXRoX3VzZXJfaWQiOiI3MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWU1MzA2NWI0MTZhMjFhODQxZDdkYzJiMzdjYmQ2M2E0YTU4NGM4YSJ9', '2019-06-26 03:55:33.991233'),
('vcodp8btr9yyrro793kevyc7efj1pvxu', 'MDE5M2IwYjg3YTRiNjcwMWEzZTkzNDg0ZWQ3ZmIzMTNiMzFmMGU5OTp7Il9hdXRoX3VzZXJfaWQiOiI3MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWU1MzA2NWI0MTZhMjFhODQxZDdkYzJiMzdjYmQ2M2E0YTU4NGM4YSJ9', '2019-08-13 14:29:25.811826'),
('2flra0vo54kgpx5pt6zqjq0qb6lqfxrj', 'OWRmYzYzMmM2YWVlYzU1NWNiNDM5ZDI3MGVjZDJkNzAwMTdmZDU4ZDp7Il9hdXRoX3VzZXJfaWQiOiI0NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTg3NWJjMTc2NWEyNGJhNDVlNTA5N2VlYTEyMTVkMWI2YTY2ZWNkNiJ9', '2019-11-16 13:49:21.873118');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(2, '127.0.0.1:8000', '127.0.0.1:8000'),
(3, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `grsystem_complaint`
--

DROP TABLE IF EXISTS `grsystem_complaint`;
CREATE TABLE IF NOT EXISTS `grsystem_complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type_of_complaint` varchar(200) DEFAULT NULL,
  `Description` longtext,
  `user_id` int(11) NOT NULL,
  `Time` date NOT NULL,
  `status` int(11) NOT NULL,
  `Subject` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `GRsystem_complaint_user_id_d633865d` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grsystem_grievance`
--

DROP TABLE IF EXISTS `grsystem_grievance`;
CREATE TABLE IF NOT EXISTS `grsystem_grievance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guser_id` (`guser_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grsystem_profile`
--

DROP TABLE IF EXISTS `grsystem_profile`;
CREATE TABLE IF NOT EXISTS `grsystem_profile` (
  `collegename` varchar(7) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contactnumber` varchar(10) NOT NULL,
  `type_user` varchar(20) NOT NULL,
  `Branch` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grsystem_profile`
--

INSERT INTO `grsystem_profile` (`collegename`, `user_id`, `contactnumber`, `type_user`, `Branch`) VALUES
('', 71, '', 'student', 'ComputerScience');

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
CREATE TABLE IF NOT EXISTS `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
CREATE TABLE IF NOT EXISTS `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
CREATE TABLE IF NOT EXISTS `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_socialapp_id_97fb6e7d` (`socialapp_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
CREATE TABLE IF NOT EXISTS `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_socialtoken_account_id_951f210e` (`account_id`),
  KEY `socialaccount_socialtoken_app_id_636a42d7` (`app_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
