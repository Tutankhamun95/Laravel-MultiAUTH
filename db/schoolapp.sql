-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 21, 2019 at 04:09 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schoolapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE IF NOT EXISTS `members` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'membertest', NULL, NULL),
(4, 'Ali Elmahdi', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `member_project`
--

DROP TABLE IF EXISTS `member_project`;
CREATE TABLE IF NOT EXISTS `member_project` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_project`
--

INSERT INTO `member_project` (`id`, `project_id`, `member_id`, `created_at`, `updated_at`) VALUES
(4, 6, 4, '2019-12-21 05:15:44', '2019-12-21 05:15:44'),
(3, 5, 4, '2019-12-21 02:12:18', '2019-12-21 02:12:18'),
(5, 7, 4, '2019-12-21 05:18:22', '2019-12-21 05:18:22');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(94, '2014_10_12_000000_create_users_table', 7),
(95, '2014_10_12_100000_create_password_resets_table', 7),
(96, '2019_12_16_171022_create_roles_table', 7),
(97, '2019_12_18_075044_create_schools_table', 7),
(29, '2019_12_19_050544_add_rolename_to_roles', 2),
(83, '2019_12_19_051242_remove_rolename_from_roles', 5),
(65, '2019_12_19_203748_create_projects_table', 4),
(66, '2019_12_19_203907_create_readings_table', 4),
(67, '2019_12_19_204015_create_project_users_table', 4),
(68, '2019_12_19_204117_create_school_projects_table', 4),
(98, '2019_12_20_060326_create_projects_table', 7),
(85, '2019_12_20_061010_create_school_project_table', 5),
(99, '2019_12_20_061301_create_project_member_table', 7),
(100, '2019_12_20_061652_create_readings_table', 7),
(88, '2019_12_20_075111_create_school_projects_table', 6),
(101, '2019_12_20_151858_create_members_table', 7),
(102, '2019_12_20_173423_create_school_project_table', 7),
(103, '2019_12_21_024810_create_member_project_table', 8),
(104, '2019_12_21_025200_create_project_school_table', 9),
(105, '2019_12_21_114044_add_changes_to_schools_table', 10),
(106, '2019_12_21_114446_add_changes_to_users_table', 11),
(107, '2019_12_21_145059_add_approval_to_users', 12);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_slug_unique` (`slug`),
  KEY `projects_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `user_id`, `title`, `slug`, `start_date`, `end_date`, `status`, `is_approved`, `created_at`, `updated_at`) VALUES
(6, 3, 'Student Project', 'student-project', '2014-12-12', '2019-12-12', 1, 0, '2019-12-21 05:15:44', '2019-12-21 05:15:44'),
(2, 1, 'Laravel Project', 'laravel-project', '2019-12-12', '2019-12-12', 1, 1, '2019-12-20 21:13:42', '2019-12-20 21:13:42'),
(3, 1, 'Final Project', 'final-project', '2019-12-02', '2019-03-05', 1, 1, '2019-12-20 21:15:14', '2019-12-20 21:15:14'),
(4, 1, 'Thesisssss', 'thesisssss', '2010-10-10', '2019-12-12', 0, 1, '2019-12-20 21:17:05', '2019-12-21 00:27:09'),
(5, 1, 'FYP', 'fyp', '2009-12-12', '2010-12-12', 1, 1, '2019-12-21 02:12:18', '2019-12-21 02:12:18'),
(7, 2, 'School Admin Project', 'school-admin-project', '2012-12-12', '2019-12-01', 1, 1, '2019-12-21 05:18:22', '2019-12-21 05:18:22');

-- --------------------------------------------------------

--
-- Table structure for table `project_member`
--

DROP TABLE IF EXISTS `project_member`;
CREATE TABLE IF NOT EXISTS `project_member` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_school`
--

DROP TABLE IF EXISTS `project_school`;
CREATE TABLE IF NOT EXISTS `project_school` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_school`
--

INSERT INTO `project_school` (`id`, `project_id`, `school_id`, `created_at`, `updated_at`) VALUES
(5, 6, 4, '2019-12-21 05:15:44', '2019-12-21 05:15:44'),
(3, 4, 3, '2019-12-21 00:27:09', '2019-12-21 00:27:09'),
(4, 5, 2, '2019-12-21 02:12:18', '2019-12-21 02:12:18'),
(6, 7, 2, '2019-12-21 05:18:22', '2019-12-21 05:18:22');

-- --------------------------------------------------------

--
-- Table structure for table `readings`
--

DROP TABLE IF EXISTS `readings`;
CREATE TABLE IF NOT EXISTS `readings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DOI` date NOT NULL,
  `year` date NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `readings_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `readings`
--

INSERT INTO `readings` (`id`, `user_id`, `title`, `slug`, `DOI`, `year`, `type`, `created_at`, `updated_at`) VALUES
(2, 1, 'My First Reading', 'my-first-reading', '2020-12-12', '2021-12-12', 'article', '2019-12-21 00:42:36', '2019-12-21 00:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'SuperAdmin', 'superadmin', NULL, NULL),
(2, 'SchoolAdmin', 'schooladmin', NULL, NULL),
(3, 'Student', 'student', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
CREATE TABLE IF NOT EXISTS `schools` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `address`, `slug`, `created_at`, `updated_at`) VALUES
(2, 'Swinburne University of Technology', 'Kuching', 'swinburne-university-of-technology', '2019-12-20 20:12:30', '2019-12-20 20:12:30'),
(3, 'UNIMAS', 'Samarahan', 'unimas', '2019-12-20 20:12:40', '2019-12-20 20:12:40'),
(4, 'University of Nottingham', 'Selangor', 'university-of-nottingham', '2019-12-20 20:12:57', '2019-12-20 20:12:57');

-- --------------------------------------------------------

--
-- Table structure for table `school_project`
--

DROP TABLE IF EXISTS `school_project`;
CREATE TABLE IF NOT EXISTS `school_project` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_project`
--

INSERT INTO `school_project` (`id`, `project_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-12-20 16:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `about` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `approval` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `username`, `email`, `password`, `image`, `about`, `remember_token`, `created_at`, `updated_at`, `school_id`, `approval`) VALUES
(1, 1, 'AZ.SuperAdmin', 'superadmin', 'super@mail.com', '$2y$10$Ya7YcWKKDCxB28f00KSIS.Rh9G7lm1Sn42GpVCSv8EmfnYfMcxLZG', 'default.png', NULL, NULL, NULL, NULL, 0, 0),
(2, 2, 'AZ.SchoolAdmin', 'schooladmin', 'admin@mail.com', '$2y$10$IOttaweDQG4MiRaPBW6r7uiBnxausH9GzqAdwqekRgSSD0DMBM.l6', 'default.png', NULL, NULL, NULL, NULL, 2, 0),
(3, 3, 'AZ.Student', 'student', 'student@mail.com', '$2y$10$vVh.Y0EZ8NiAnfJzV68ogOyvFnUI7ydYuOQH24S8cIKgSME2lu47O', 'default.png', NULL, NULL, NULL, NULL, 3, 0),
(4, 3, 'OM.Student', 'student2', 'student2@mail.com', '$2y$10$w2gU.3R3rAniZNwr5VAGHeE918gXHxinzgWpfWDDY7ohmEscKLp8C', 'default.png', NULL, NULL, NULL, NULL, 4, 0),
(5, 3, 'Ali Elmahdi', 'alielmahdis', 'ali@mail.com', '$2y$10$9uDQB9fjPvimyfz1Bsy3Reoy2FyQmoYwQkdm2f77sdsxTSaebefTy', 'default.png', NULL, NULL, '2019-12-20 20:17:49', '2019-12-21 07:55:49', 2, 1),
(6, 3, 'test', 'usertest', 'test@mail.com', '$2y$10$/QMapwO5migHrcPESH9Kvey//APGPnQM3.Y1J/RMH4h4c.b1X5NCO', 'default.png', NULL, NULL, '2019-12-21 06:26:57', '2019-12-21 06:26:57', 0, 0),
(7, 3, 'testagain', 'test2', 'test2@mail.com', '$2y$10$6wbsW4SMp2eUdrE9BENiBuc9TyHR4RxILLDf87mAQNF4s9ALD.1e2', 'default.png', NULL, NULL, '2019-12-21 06:44:14', '2019-12-21 06:44:14', 0, 0),
(8, 3, 'Rahaf', 'haffy', 'haffy@mail.com', '$2y$10$/bBh7j9YNHxvULP6VpM23ugKf/gq0V/eDf5bxJoEsEgjkilmK0urO', 'default.png', NULL, NULL, '2019-12-21 06:47:09', '2019-12-21 06:47:09', 0, 0),
(9, 3, 'me', 'me', 'me@mail.com', '$2y$10$0SvyEaSPEnDSRSrP8YUfc.gUIvG/oNNnQt4kJPbVmyI0iENNWsurW', 'default.png', NULL, NULL, '2019-12-21 06:48:55', '2019-12-21 06:48:55', 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
