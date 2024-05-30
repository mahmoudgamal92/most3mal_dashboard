-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 02:45 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `most3mal`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(10) UNSIGNED NOT NULL,
  `ad_number` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `depart_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `subcat_id` int(11) DEFAULT NULL,
  `model` int(11) DEFAULT NULL,
  `status` enum('active','inactive','done','pending') NOT NULL DEFAULT 'active',
  `age` int(11) DEFAULT NULL,
  `surface_area` int(11) DEFAULT NULL,
  `number_halls` int(11) DEFAULT NULL,
  `number_bathrooms` int(11) DEFAULT NULL,
  `bedrooms` varchar(50) DEFAULT NULL,
  `car_type` varchar(255) DEFAULT NULL,
  `car_gear` varchar(255) DEFAULT NULL,
  `engine_type` varchar(255) DEFAULT NULL,
  `drive_system` varchar(255) DEFAULT NULL,
  `seats_number` int(11) DEFAULT NULL,
  `address` varchar(199) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `zoom` varchar(255) DEFAULT NULL,
  `main_image` varchar(199) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `adress_url` varchar(225) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auctions`
--

CREATE TABLE `auctions` (
  `id` int(10) UNSIGNED NOT NULL,
  `auction_number` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `address` varchar(199) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `time` int(11) NOT NULL,
  `main_image` varchar(199) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `status` enum('active','done','canceled') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `auctions`
--

INSERT INTO `auctions` (`id`, `auction_number`, `user_id`, `state_id`, `city_id`, `title`, `details`, `duration`, `address`, `start_date`, `end_date`, `time`, `main_image`, `images`, `status`, `created_at`, `updated_at`) VALUES
(101, '', 0, 0, 0, 'تجريبي مزاد ', 'وصف المزاد\n', 7, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, '40b14029-0062-4dc6-88c0-f09bbd943f94.jpeg', 'active', NULL, NULL),
(102, '508581', 0, 0, 0, 'تجريبي', 'وصف المزاد', 7, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, 'bccaff70-5383-4c47-ba63-901095e3fd0c.jpeg', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `image` varchar(199) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `name`, `status`, `image`, `created_at`, `updated_at`) VALUES
(29, '{\"ar\":\"test\",\"en\":\"test 2\"}', 'active', 'depart/111.PNG', '2024-02-09 22:00:00', '2024-02-09 22:00:00'),
(30, '{\"ar\":\"test\",\"en\":\"test\"}', 'active', 'depart/111.PNG', '2024-02-09 22:00:00', '2024-02-09 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `depart_id` int(11) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `icon` varchar(99) DEFAULT NULL,
  `image` varchar(199) DEFAULT NULL,
  `type` varchar(99) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `depart_id`, `status`, `icon`, `image`, `type`, `created_at`, `updated_at`) VALUES
(13, '{\"ar\":\"امريكي\",\"en\":\"USA\"}', 56, 'active', NULL, '', 'cars', '2022-01-22 15:47:21', '2022-07-21 10:14:46'),
(14, '{\"ar\":\"شقق للبيع\",\"en\":\"flats for sale\"}', 55, 'active', NULL, NULL, 'realstate', NULL, NULL),
(15, '{\"ar\":\"شقق للإيجار\",\"en\":\"flats for rent\"}', 55, 'active', NULL, '', 'realstate', '2022-02-04 11:47:59', '2022-03-13 10:19:03'),
(17, '{\"ar\":\"ياباني\",\"en\":\"Japanese\"}', 56, 'active', NULL, '', 'cars', '2022-02-04 11:49:27', '2022-07-21 10:15:53'),
(18, '{\"ar\":\"كوري\",\"en\":\"Korean\"}', 56, 'active', NULL, '', 'cars', '2022-02-04 11:49:54', '2022-07-21 10:17:14'),
(19, '{\"ar\":\"جوالات\",\"en\":\"mobiles\"}', 57, 'active', NULL, '', NULL, '2022-02-26 12:37:18', '2022-03-13 09:38:09'),
(20, '{\"ar\":\"احذية\",\"en\":\"Shoe\"}', 58, 'active', NULL, '', NULL, '2022-02-26 14:39:49', '2022-02-26 14:40:02'),
(22, '{\"ar\":\"أراضي للبيع\",\"en\":\"land for sale\"}', 55, 'active', NULL, '', 'realstate', '2022-03-13 10:20:31', '2022-03-13 10:20:31'),
(23, '{\"ar\":\"أراضي للإستثمار طويل الأمد\",\"en\":\"Land for long term investment\"}', 55, 'active', NULL, '', 'realstate', '2022-03-13 10:21:37', '2022-03-13 10:21:37'),
(24, '{\"ar\":\"عمائر للبيع\",\"en\":\"Blinds for sale\"}', 55, 'active', NULL, '', 'realstate', '2022-07-21 10:02:31', '2022-07-21 10:02:31'),
(25, '{\"ar\":\"فلل للبيع\",\"en\":\"Villas for sale\"}', 55, 'active', NULL, '', 'realstate', '2022-07-21 10:03:54', '2022-07-21 10:03:54'),
(26, '{\"ar\":\"فلل للإيجار\",\"en\":\"Villas for rent\"}', 55, 'active', NULL, '', 'realstate', '2022-07-21 10:05:04', '2022-07-21 10:05:04'),
(27, '{\"ar\":\"استراحات للإيجار\",\"en\":\"Rental breaks\"}', 55, 'active', NULL, '', 'realstate', '2022-07-21 10:07:06', '2022-07-21 10:07:06'),
(28, '{\"ar\":\"استراحات للبيع\",\"en\":\"Breaks for sale\"}', 55, 'active', NULL, '', 'realstate', '2022-07-21 10:10:57', '2022-07-21 10:10:57'),
(29, '{\"ar\":\"فرنسا\",\"en\":\"France\"}', 56, 'active', NULL, '', 'cars', '2022-07-21 10:21:14', '2022-07-21 10:21:14'),
(30, '{\"ar\":\"الصين\",\"en\":\"China\"}', 56, 'active', NULL, '', 'cars', '2022-07-21 10:22:19', '2022-07-21 10:22:19'),
(31, '{\"ar\":\"كمبيوترات شخصية\",\"en\":\"Personal computers\"}', 57, 'active', NULL, '', NULL, '2022-07-21 10:32:37', '2022-07-21 10:32:37'),
(32, '{\"ar\":\"أجهزة لابتوب\",\"en\":\"Laptops\"}', 57, 'active', NULL, '', NULL, '2022-07-21 10:33:44', '2022-07-21 10:33:44'),
(33, '{\"ar\":\"أجهزة تابلت\",\"en\":\"Tablets\"}', 57, 'active', NULL, '', NULL, '2022-07-21 10:36:14', '2022-07-21 10:36:14'),
(34, '{\"ar\":\"تلفزيون وصوتيات\",\"en\":\"TV and audio\"}', 57, 'active', NULL, '', NULL, '2022-07-21 10:37:36', '2022-07-21 10:37:36'),
(35, '{\"ar\":\"كاميرات تصوير\",\"en\":\"Cameras\"}', 57, 'active', NULL, '', NULL, '2022-07-21 10:38:58', '2022-07-21 10:38:58'),
(36, '{\"ar\":\"حسابات واشتراكاتِ\",\"en\":\"Accounts and subscriptions\"}', 57, 'active', NULL, '', NULL, '2022-07-21 10:48:34', '2022-07-21 10:48:34'),
(37, '{\"ar\":\"أرقام مميزة\",\"en\":\"Distinctive numbers\"}', 57, 'active', NULL, '', NULL, '2022-07-21 10:49:48', '2022-07-21 10:49:48'),
(38, '{\"ar\":\"ثلاجات\",\"en\":\"Refrigerators\"}', 57, 'active', NULL, '', NULL, '2022-07-21 10:51:06', '2022-07-21 10:51:06'),
(39, '{\"ar\":\"غسالات\",\"en\":\"Washers\"}', 57, 'active', NULL, '', NULL, '2022-07-21 10:51:45', '2022-07-21 10:51:45'),
(40, '{\"ar\":\"أجهزة تنشيف\",\"en\":\"Drying devices\"}', 57, 'active', NULL, '', NULL, '2022-07-21 10:52:54', '2022-07-21 10:52:54'),
(41, '{\"ar\":\"عطورات\",\"en\":\"Perfumes\"}', 58, 'active', NULL, '', NULL, '2022-07-21 11:09:08', '2022-07-21 11:09:08'),
(42, '{\"ar\":\"ساعات\",\"en\":\"Hours\"}', 58, 'active', NULL, '', NULL, '2022-07-21 11:09:51', '2022-07-21 11:09:51'),
(43, '{\"ar\":\"مستلزمات رياضية\",\"en\":\"Sports supplies\"}', 58, 'active', NULL, '', NULL, '2022-07-21 11:10:48', '2022-07-21 11:10:48'),
(44, '{\"ar\":\"ملابس رجالية\",\"en\":\"Men\'s clothing\"}', 58, 'active', NULL, '', NULL, '2022-07-21 11:11:34', '2022-07-21 11:11:34'),
(45, '{\"ar\":\"ملابس نسائية\",\"en\":\"From \'S Klothing\"}', 58, 'active', NULL, '', NULL, '2022-07-21 11:12:10', '2022-07-21 11:12:10'),
(46, '{\"ar\":\"نظارات\",\"en\":\"Glasses\"}', 58, 'active', NULL, '', NULL, '2022-07-21 11:12:45', '2022-07-21 11:12:45'),
(48, '{\"ar\":\"ملابس أطفال\",\"en\":\"Children\'s clothing\"}', 58, 'active', NULL, '', NULL, '2022-07-21 11:13:41', '2022-07-21 11:13:41'),
(49, '{\"ar\":\"عمائر للإيجار\",\"en\":\"Rent building\"}', 55, 'active', NULL, '', 'realstate', '2022-07-21 11:16:04', '2022-07-22 01:36:42'),
(50, '{\"ar\":\"محلات للإيجار\",\"en\":\"Rental shops\"}', 55, 'active', NULL, '', 'realstate', '2022-07-21 11:16:48', '2022-07-21 11:16:48'),
(51, '{\"ar\":\"أدوار للإيجار\",\"en\":\"Rental roles\"}', 55, 'active', NULL, '', 'realstate', '2022-07-21 11:17:56', '2022-07-21 11:17:56'),
(52, '{\"ar\":\"ألماني\",\"en\":\"German\"}', 56, 'active', NULL, '', 'cars', '2022-07-21 11:20:04', '2022-07-21 11:20:04'),
(53, '{\"ar\":\"شاحنات ومعدات ثقيلة\",\"en\":\"Trucks and heavy equipment\"}', 56, 'active', NULL, '', 'cars', '2022-07-21 11:21:26', '2022-07-21 11:21:26'),
(55, '{\"ar\":\"قطع الغيار وملحقاتها\",\"en\":\"Spare parts and accessories\"}', 56, 'active', NULL, '', 'cars', '2022-07-21 11:22:45', '2022-07-22 02:02:02'),
(56, '{\"ar\":\"أثاث خارجي\",\"en\":\"Outdoor furniture\"}', 59, 'active', NULL, '', NULL, '2022-07-21 11:25:37', '2022-07-21 11:25:37'),
(57, '{\"ar\":\"مزرعة للبيع\",\"en\":\"Farm for sale\"}', 55, 'active', NULL, '', 'realstate', '2022-07-21 11:26:10', '2022-07-21 11:26:10'),
(58, '{\"ar\":\"مزرعة للإيجار\",\"en\":\"Farm for rent\"}', 55, 'active', NULL, '', 'realstate', '2022-07-21 11:26:52', '2022-07-21 11:26:52'),
(59, '{\"ar\":\"أثاث مكتبي\",\"en\":\"Office furniture\"}', 59, 'active', NULL, '', NULL, '2022-07-21 11:27:42', '2022-07-21 11:27:42'),
(60, '{\"ar\":\"أدوات منزلية\",\"en\":\"Household items\"}', 59, 'active', NULL, '', NULL, '2022-07-21 11:28:51', '2022-07-21 11:28:51'),
(61, '{\"ar\":\"مكاتب\",\"en\":\"offices\"}', 59, 'active', NULL, '', NULL, '2022-07-21 11:29:57', '2022-07-22 01:44:48'),
(62, '{\"ar\":\"تحف وديكور\",\"en\":\"Antiques and décor\"}', 59, 'active', NULL, '', NULL, '2022-07-21 11:30:47', '2022-07-21 11:30:47'),
(63, '{\"ar\":\"خزائن ودواليب\",\"en\":\"Cabinets and wheels\"}', 59, 'active', NULL, '', NULL, '2022-07-21 11:32:13', '2022-07-21 11:32:13'),
(64, '{\"ar\":\"طاولات وكراسي\",\"en\":\"Tables and chairs\"}', 59, 'active', NULL, '', NULL, '2022-07-21 11:32:53', '2022-07-21 11:32:53'),
(65, '{\"ar\":\"مجالس ومفروشات\",\"en\":\"Furniture councils\"}', 59, 'active', NULL, '', NULL, '2022-07-21 11:34:03', '2022-07-21 11:34:03'),
(66, '{\"ar\":\"خدمات مقاولات\",\"en\":\"Contracting services\"}', 62, 'active', NULL, '', NULL, '2022-07-21 11:36:41', '2022-07-21 11:36:41'),
(68, '{\"ar\":\"خدمات التعليم\",\"en\":\"Education Services\"}', 62, 'active', NULL, '', NULL, '2022-07-21 11:37:21', '2023-04-19 14:06:55'),
(69, '{\"ar\":\"خدمات تعقيب\",\"en\":\"Feedback services\"}', 62, 'active', NULL, '', NULL, '2022-07-21 11:37:21', '2022-07-21 11:37:21'),
(70, '{\"ar\":\"خدمات نقل العفش\",\"en\":\"Afash transport services\"}', 62, 'active', NULL, '', NULL, '2022-07-21 11:38:48', '2022-07-21 11:38:48'),
(71, '{\"ar\":\"خدمات التوصيل\",\"en\":\"Delivery services\"}', 62, 'active', NULL, '', NULL, '2022-07-21 11:40:00', '2022-07-21 11:40:00'),
(73, '{\"ar\":\"خدمات النظافة\",\"en\":\"Cleaning services\"}', 62, 'active', NULL, '', NULL, '2022-07-21 11:41:08', '2022-07-21 11:41:08'),
(75, '{\"ar\":\"خدمات الشراء من المواقع العالمية\",\"en\":\"Purchase services from international websites\"}', 62, 'active', NULL, '', NULL, '2022-07-21 11:42:52', '2022-07-21 11:42:52'),
(76, '{\"ar\":\"غنم\",\"en\":\"sheep\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:44:08', '2022-07-21 11:44:08'),
(77, '{\"ar\":\"ماعز\",\"en\":\"goat\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:44:53', '2022-07-21 11:44:53'),
(78, '{\"ar\":\"ببغاء\",\"en\":\"parrot\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:45:52', '2022-07-21 11:45:52'),
(79, '{\"ar\":\"حمام\",\"en\":\"bath\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:46:34', '2022-07-21 11:46:34'),
(80, '{\"ar\":\"قطط\",\"en\":\"cats\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:47:15', '2022-07-21 11:47:15'),
(81, '{\"ar\":\"دجاج\",\"en\":\"Chicken\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:48:21', '2022-07-21 11:48:21'),
(82, '{\"ar\":\"إبل\",\"en\":\"camels\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:49:13', '2022-07-21 11:49:13'),
(83, '{\"ar\":\"خيول\",\"en\":\"horses\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:50:05', '2022-07-21 11:50:05'),
(84, '{\"ar\":\"كلاب\",\"en\":\"Dogs\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:50:41', '2022-07-21 11:50:41'),
(85, '{\"ar\":\"بقر\",\"en\":\"cows\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:51:28', '2022-07-21 11:51:28'),
(86, '{\"ar\":\"أسماك وسلاحف\",\"en\":\"Fish and turtles\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:52:04', '2022-07-21 11:52:04'),
(87, '{\"ar\":\"أرانب\",\"en\":\"rabbits\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:53:12', '2022-07-21 11:53:12'),
(88, '{\"ar\":\"بط\",\"en\":\"ducks\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:53:51', '2022-07-21 11:53:51'),
(89, '{\"ar\":\"سناجب\",\"en\":\"squirrels\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:54:33', '2022-07-21 11:54:33'),
(90, '{\"ar\":\"هامستر\",\"en\":\"Hamsters\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:55:03', '2022-07-21 11:55:03'),
(91, '{\"ar\":\"وبر\",\"en\":\"hairy\"}', 64, 'active', NULL, '', NULL, '2022-07-21 11:56:10', '2022-07-21 11:56:10'),
(92, '{\"ar\":\"غرف نوم و مطابخ\",\"en\":\"Bedrooms and kitchens\"}', 59, 'active', NULL, '', NULL, '2022-07-22 01:42:36', '2022-07-22 01:42:36'),
(93, '{\"ar\":\"المكيفات و أجهزة التبريد\",\"en\":\"Air conditioners and cooling devices\"}', 57, 'active', NULL, '', NULL, '2022-07-22 02:00:12', '2022-07-22 02:00:12'),
(94, '{\"ar\":\"الألعاب الإلكترونية\",\"en\":\"Video Games\"}', 61, 'active', NULL, '', NULL, '2023-03-25 18:53:28', '2023-03-25 18:53:28'),
(95, '{\"ar\":\"الرياضات والألعاب الخارجية\",\"en\":\"Outdoor Sports & Games\"}', 61, 'active', NULL, '', NULL, '2023-03-25 18:54:29', '2023-03-25 18:54:29'),
(96, '{\"ar\":\"الألعاب الداخلية\",\"en\":\"Indoor Games\"}', 61, 'active', NULL, '', NULL, '2023-03-25 18:55:39', '2023-03-25 18:55:39'),
(97, '{\"ar\":\"العاب الأطفال والرضع\",\"en\":\"Toys for kids and babies\"}', 61, 'active', NULL, '', NULL, '2023-03-25 18:56:48', '2023-03-25 18:56:48'),
(98, '{\"ar\":\"معدات ومكائن\",\"en\":\"Equipment & Machinery\"}', 63, 'active', NULL, '', NULL, '2023-03-25 19:00:58', '2023-03-25 19:03:33'),
(99, '{\"ar\":\"أجهزة الكترونية\",\"en\":\"Electronic Devices\"}', 63, 'active', NULL, '', NULL, '2023-03-25 19:02:31', '2023-03-25 19:02:31'),
(100, '{\"ar\":\"تطبيقات وبرامج\",\"en\":\"Applications & Software\"}', 63, 'active', NULL, '', NULL, '2023-03-25 19:05:08', '2023-03-25 19:05:08'),
(101, '{\"ar\":\"مأكولات ومشروبات\",\"en\":\"Food & Drink\"}', 65, 'active', NULL, '', NULL, '2023-03-25 19:08:30', '2023-03-25 19:12:00'),
(102, '{\"ar\":\"هدايا\",\"en\":\"Gifts\"}', 65, 'active', NULL, '', NULL, '2023-03-25 19:09:43', '2023-03-25 19:09:43'),
(103, '{\"ar\":\"كيكات وحلويات\",\"en\":\"Cakes & Sweets\"}', 65, 'active', NULL, '', NULL, '2023-03-25 19:10:48', '2023-03-25 19:10:48'),
(104, '{\"ar\":\"خياطة و مشغولات يدوية\",\"en\":\"Sewing & Handicrafts\"}', 65, 'active', NULL, '', NULL, '2023-03-25 19:13:30', '2023-03-25 19:13:30'),
(105, '{\"ar\":\"غير ذلك\",\"en\":\"Other\"}', 65, 'active', NULL, '', NULL, '2023-03-25 19:14:55', '2023-03-25 19:14:55'),
(106, '{\"ar\":\"أولاد\",\"en\":\"Boys\"}', 67, 'active', NULL, '', NULL, '2023-03-25 19:16:51', '2023-03-25 19:16:51'),
(107, '{\"ar\":\"بنات\",\"en\":\"Girls\"}', 67, 'active', NULL, '', NULL, '2023-03-25 19:18:17', '2023-03-25 19:18:17'),
(108, '{\"ar\":\"رحلات بحرية\",\"en\":\"Organizing cruises\"}', 76, 'active', NULL, '', NULL, '2023-03-25 20:46:25', '2023-03-25 20:46:25'),
(109, '{\"ar\":\"رحلات برية\",\"en\":\"Organizing road trips\"}', 76, 'active', NULL, '', NULL, '2023-03-25 20:47:07', '2023-03-25 20:47:07'),
(110, '{\"ar\":\"دراجات نارية\",\"en\":\"Motorcycles\"}', 68, 'active', NULL, '', NULL, '2023-03-25 20:49:24', '2023-03-25 20:49:24'),
(111, '{\"ar\":\"دراجات هوائية\",\"en\":\"Bicycles\"}', 68, 'active', NULL, '', NULL, '2023-03-25 20:50:12', '2023-03-25 20:50:12'),
(112, '{\"ar\":\"وظائف قطاع حكومي\",\"en\":\"Government Sector Jobs\"}', 73, 'active', NULL, '', NULL, '2023-03-25 20:52:08', '2023-03-25 20:52:08'),
(113, '{\"ar\":\"وظائف قطاع خاص\",\"en\":\"Private Sector Jobs\"}', 73, 'active', NULL, '', NULL, '2023-03-25 20:52:50', '2023-03-25 20:52:50'),
(114, '{\"ar\":\"أطعمة ومشروبات\",\"en\":\"Food & Drink\"}', 74, 'active', NULL, '', NULL, '2023-04-18 12:06:14', '2023-04-18 12:06:14'),
(115, '{\"ar\":\"برمجة\",\"en\":\"programming\"}', 75, 'active', NULL, '', NULL, '2023-04-18 12:07:27', '2023-04-18 12:07:27'),
(116, '{\"ar\":\"تصاميم\",\"en\":\"Design\"}', 75, 'active', NULL, '', NULL, '2023-04-18 12:08:07', '2023-04-18 12:08:07'),
(117, '{\"ar\":\"مكتبة وفنون\",\"en\":\"Library & Arts\"}', 77, 'active', NULL, '', NULL, '2023-04-18 12:09:35', '2023-04-18 12:09:35'),
(119, '{\"ar\":\"السفر والسياحة\",\"en\":\"Travel & Tourism\"}', 78, 'active', NULL, '', NULL, '2023-04-19 14:42:37', '2023-04-19 14:53:07');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `conv_num` text NOT NULL,
  `sender_id` text NOT NULL,
  `reciver_id` text NOT NULL,
  `sender_name` text NOT NULL,
  `reciver_name` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `conv_num`, `sender_id`, `reciver_id`, `sender_name`, `reciver_name`, `created_at`, `updated_at`) VALUES
(19, '609486597', '230', '0', 'Asd', 'مستخدم محذوف', '2023-12-14 02:14:23', '');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `icon` varchar(99) DEFAULT NULL,
  `image` varchar(199) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `status`, `icon`, `image`, `created_at`, `updated_at`) VALUES
(56, '{\"ar\":\"السيارات\",\"en\":\"Cars\"}', 'active', NULL, 'depart/70201642866407.png', '2022-01-22 15:46:47', '2022-03-13 09:29:42'),
(57, '{\"ar\":\"أجهزة إلكترونية\",\"en\":\"electronic\"}', 'active', NULL, 'depart/20641642878724.png', '2022-01-22 19:12:04', '2022-01-22 19:12:04'),
(58, '{\"ar\":\"مستلزمات شخصية\",\"en\":\"Personal supplies\"}', 'active', NULL, 'depart/31431642878769.png', '2022-01-22 19:12:49', '2022-07-21 11:04:39'),
(59, '{\"ar\":\"الاثاث والحديقة\",\"en\":\"garden and furniture\"}', 'active', NULL, 'depart/17831642878877.png', '2022-01-22 19:14:37', '2022-01-22 19:14:37'),
(61, '{\"ar\":\"الألعاب وأجهزة الفيديو\",\"en\":\"games and video\"}', 'active', NULL, 'depart/63151642878988.png', '2022-01-22 19:16:28', '2022-03-13 09:28:20'),
(62, '{\"ar\":\"خدمات\",\"en\":\"services\"}', 'active', NULL, 'depart/66071642879048.png', '2022-01-22 19:17:28', '2022-01-22 19:17:28'),
(63, '{\"ar\":\"تجارة و صناعة\",\"en\":\"trade and industry\"}', 'active', NULL, 'depart/83621642879086.png', '2022-01-22 19:18:06', '2022-01-22 19:18:06'),
(64, '{\"ar\":\"حيوانات ومواشي وطيور\",\"en\":\"pets\"}', 'active', NULL, 'depart/28561642879118.png', '2022-01-22 19:18:38', '2022-07-21 11:57:20'),
(65, '{\"ar\":\"الأسر المنتجة\",\"en\":\"productive families\"}', 'active', NULL, 'depart/61701642879191.png', '2022-01-22 19:19:51', '2022-03-13 09:28:48'),
(67, '{\"ar\":\"مستلزمات اطفال\",\"en\":\"babies\"}', 'active', NULL, 'depart/54551642879285.png', '2022-01-22 19:21:25', '2022-03-13 09:21:43'),
(68, '{\"ar\":\"دراجات\",\"en\":\"Bikes\"}', 'active', NULL, 'depart/47461679744360.png', '2022-03-13 09:34:00', '2023-03-25 19:39:20'),
(73, '{\"ar\":\"وظائف\",\"en\":\"Functions\"}', 'active', NULL, 'depart/56721679747960.png', '2022-07-21 11:58:36', '2023-03-25 20:39:20'),
(74, '{\"ar\":\"أطعمه و مشروبات\",\"en\":\"Feed him and drinks.\"}', 'active', NULL, 'depart/95201679747632.png', '2022-07-22 01:48:04', '2023-03-25 20:33:52'),
(75, '{\"ar\":\"برمجة و تصاميم\",\"en\":\"Programming and designs\"}', 'active', NULL, 'depart/86811679746342.png', '2022-07-22 01:52:54', '2023-03-25 20:12:22'),
(76, '{\"ar\":\"صيد و رحلات\",\"en\":\"Fishing and trips\"}', 'active', NULL, 'depart/11681679748233.png', '2022-07-22 01:53:51', '2023-03-25 20:43:53'),
(77, '{\"ar\":\"مكتبة و فنون\",\"en\":\"Library and art\"}', 'active', NULL, 'depart/13671679745577.png', '2022-07-22 01:54:42', '2023-03-25 19:59:37'),
(78, '{\"ar\":\"السفر والسياحة\",\"en\":\"Travel & Tourism\"}', 'active', NULL, 'depart/59061681887089.png', '2023-04-19 13:56:40', '2023-04-19 14:51:29');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `role` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `phone`, `email`, `password`, `role`, `date_created`) VALUES
(3, 'Mahmoud Gamal', '01063634580', 'asd@asd.com', '123456', ' super_admin', '2024-02-17 22:02:37'),
(4, 'محمد', '01063634580', 'admin@gmail.com', 'شسيشسي', ' admin', '2024-02-17 22:27:51');

-- --------------------------------------------------------

--
-- Table structure for table `item_offers`
--

CREATE TABLE `item_offers` (
  `id` int(11) NOT NULL,
  `user_id` text NOT NULL,
  `user_token` text NOT NULL,
  `amount` text NOT NULL,
  `item_id` text NOT NULL,
  `status` text NOT NULL,
  `created_at` text NOT NULL,
  `updated_at` text NOT NULL,
  `rating_val` text NOT NULL,
  `rating_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item_offers`
--

INSERT INTO `item_offers` (`id`, `user_id`, `user_token`, `amount`, `item_id`, `status`, `created_at`, `updated_at`, `rating_val`, `rating_text`) VALUES
(74943, '170', 'qnpJeyITI3duqkHp3lhupe3WLtCwn2b2uFUOete0YnySWHmeaht216gltXuD', '500', '170', 'delivered', 'Tue Dec 05 2023 09:44:25 GMT+0200', 'Tue Dec 05 2023 09:44:25 GMT+0200', '5', 'منتج ممتاز جدا'),
(74944, '201', 'ygepJtze76TvjQoN7c2JW8BsKhcnIj5bAccdg61eW26sTohTZpjQS8cENdea', '40000', '172', 'delivered', 'Tue Dec 05 2023 15:38:18 GMT+0300', 'Tue Dec 05 2023 15:38:18 GMT+0300', '', ''),
(74945, '166', 'rMzCSGnzRlM4BnG2KzjVF50uFIFsluZZni5uGK9wAakILwCaJkKciqD5KE6t', '500', '173', 'pending', 'Tue Dec 05 2023 15:47:20 GMT+0300', 'Tue Dec 05 2023 15:47:20 GMT+0300', '', ''),
(74946, '162', 'euPltNthzUF8XiVfXNk9y8VHpjRuerFUYVUVYUNtyhWtMnpiw8xMVhWuOMtj', '5000', '56', 'waiting', 'Tue Dec 05 2023 20:09:05 GMT+0200', 'Tue Dec 05 2023 20:09:05 GMT+0200', '', ''),
(74947, '166', 'rMzCSGnzRlM4BnG2KzjVF50uFIFsluZZni5uGK9wAakILwCaJkKciqD5KE6t', '500', '170', 'delivered', 'Tue Dec 05 2023 21:10:58 GMT+0300', 'Tue Dec 05 2023 21:10:58 GMT+0300', '', ''),
(74949, '214', 'pJ3FaHrErKaCH9EuW4CCo39Fh2WOMu2LRUwVJoaFDN7aDSFCPxaY0DbceOPV', '5685', '175', 'delivered', 'Mon Dec 11 2023 15:01:07 GMT+0200', 'Mon Dec 11 2023 15:01:07 GMT+0200', '4', 'tyuiop'),
(74950, '170', 'qnpJeyITI3duqkHp3lhupe3WLtCwn2b2uFUOete0YnySWHmeaht216gltXuD', '100', '174', 'delivered', 'Mon Dec 11 2023 23:13:08 GMT+0200', 'Mon Dec 11 2023 23:13:08 GMT+0200', '5', 'تحريبي'),
(74951, '170', 'qnpJeyITI3duqkHp3lhupe3WLtCwn2b2uFUOete0YnySWHmeaht216gltXuD', '200', '177', 'waiting', 'Tue Dec 12 2023 00:16:32 GMT+0200', 'Tue Dec 12 2023 00:16:32 GMT+0200', '', ''),
(74952, '201', 'ygepJtze76TvjQoN7c2JW8BsKhcnIj5bAccdg61eW26sTohTZpjQS8cENdea', '755566', '154', 'pending', 'Tue Dec 12 2023 01:26:00 GMT+0300', 'Tue Dec 12 2023 01:26:00 GMT+0300', '', ''),
(74953, '201', 'ygepJtze76TvjQoN7c2JW8BsKhcnIj5bAccdg61eW26sTohTZpjQS8cENdea', '100', '178', 'delivered', 'Tue Dec 12 2023 01:30:17 GMT+0300', 'Tue Dec 12 2023 01:30:17 GMT+0300', '5', 'شكرا لحسن الخدمه');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `action` text NOT NULL,
  `details` text NOT NULL,
  `user_id` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `action`, `details`, `user_id`, `date_created`) VALUES
(1, 'delete', 'Delete Add Id = >192', '0', '2024-02-10 15:50:59'),
(2, 'delete', 'Delete Add Id = >193', '0', '2024-02-11 00:07:42');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` text NOT NULL,
  `conv_id` text NOT NULL,
  `message` text NOT NULL,
  `attatchments` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `seen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `conv_id`, `message`, `attatchments`, `created_at`, `updated_at`, `seen`) VALUES
(18, '170', '1694204388', 'السلام عليكم', '', '2023-12-11 15:17:10', '2023-12-11 15:17:10', '1'),
(19, '170', '1694204388', 'رسالين', '', '2023-12-11 15:17:27', '2023-12-11 15:17:27', '1'),
(20, '166', '1694204388', 'اهلا…', '', '2023-12-11 15:18:34', '2023-12-11 15:18:34', '1'),
(21, '166', '1694204388', 'وعليكم', '', '2023-12-11 15:18:38', '2023-12-11 15:18:38', '1'),
(22, '201', '1369970616', 'مرحبا', '', '2023-12-11 15:22:52', '2023-12-11 15:22:52', '1'),
(23, '201', '1369970616', 'ياهلا', '', '2023-12-11 15:22:57', '2023-12-11 15:22:57', '1'),
(24, '170', '1369970616', 'اهلا', '', '2023-12-11 15:23:24', '2023-12-11 15:23:24', '0'),
(25, '230', '609486597', 'امقانع', '', '2023-12-14 02:20:06', '2023-12-14 02:20:06', '0');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('01433879-3295-4970-b729-557b8c4e3ccb', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 03:56:48', '2023-11-06 04:41:13'),
('0156c017-42f0-4abc-85bf-5d3e82f1eb43', 'App\\Notifications\\BidNotification', 112, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-01-16 06:29:10', '2023-01-16 06:29:10'),
('016b7cc1-2a62-4dd1-98fe-e9eab4813035', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-16 07:53:01', '2023-02-16 07:53:01'),
('02788c7a-7e83-4ac9-affb-18f6dc24a3e4', 'App\\Notifications\\BidNotification', 131, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Khaled  \",\"en\":\"You have a new message from Khaled\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-03-30 18:22:05', '2023-03-30 18:22:05'),
('041e4fc4-8d15-42d6-a09d-00b942f409c8', 'App\\Notifications\\BidNotification', 55, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-08-26 01:51:33', '2022-08-26 01:51:33'),
('05309ade-9c2c-4137-ab76-cd86355ce91c', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 04:41:42', '2023-11-06 04:41:13'),
('05600ed6-40d4-4f5c-b549-c7d19cc61ec6', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-19 13:57:49', '2023-04-19 13:57:49'),
('0572da86-fd99-4290-a913-2e9464f5b9ca', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', '2022-12-31 02:19:06', '2022-12-31 02:16:53', '2022-12-31 02:19:06'),
('06235129-ed4b-4ebd-986c-402ebe169a9d', 'App\\Notifications\\BidNotification', 112, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-01-16 06:29:49', '2023-01-16 06:29:49'),
('06c0d6ba-c0ff-4c91-971c-9bc734134e7e', 'App\\Notifications\\BidNotification', 167, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0645\\u0634\\u0631\\u0648\\u0628 \\u0641\\u0627\\u062e\\u0631 \\u0644\\u0644\\u0628\\u064a\\u0639  \",\"en\":\"new offer on auction \\u0645\\u0634\\u0631\\u0648\\u0628 \\u0641\\u0627\\u062e\\u0631 \\u0644\\u0644\\u0628\\u064a\\u0639\",\"url\":\"auction\\/73\\/\\u0645\\u0634\\u0631\\u0648\\u0628 \\u0641\\u0627\\u062e\\u0631 \\u0644\\u0644\\u0628\\u064a\\u0639\"}', NULL, '2023-09-28 05:09:16', '2023-09-28 05:09:16'),
('07630174-8910-4a37-9cee-92b51c24592f', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-04-18 11:37:42', '2023-04-06 04:09:20', '2023-04-18 11:37:42'),
('080512b6-1eb3-409c-a696-ad9a052374bc', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:53:17', '2023-04-18 11:53:17'),
('08299a40-c1c4-4b0c-99f4-8d592499dd92', 'App\\Notifications\\BidNotification', 113, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-12-31 02:18:48', '2022-12-31 02:13:29', '2022-12-31 02:18:48'),
('088cb827-89b8-46a5-8595-ee30b25aa922', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 asd504  \",\"en\":\"You have a new message from asd504\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-05-12 20:57:51', '2023-11-06 04:41:13'),
('0b4a06b1-bb25-4de4-98ec-d1c42f134ba5', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u062a\\u0647\\u0627\\u0646\\u064a\\u0646\\u0627 \\u0642\\u0627\\u0645 \\u0627\\u0644\\u0645\\u0634\\u062a\\u0631\\u064a \\u0628\\u0627\\u0627\\u0633\\u062a\\u0644\\u0627\\u0645 \\u0627\\u0644\\u0645\\u0646\\u062a\\u062c \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0631\\u0642\\u0645 8721  \",\"en\":\"Congratulations, the buyer has received the product of order No. 8721\",\"url\":\"user\\/orders\\/15\\/8721\"}', '2022-03-08 13:19:07', '2022-03-08 12:34:16', '2022-03-08 13:19:07'),
('0e1ff572-2352-41b2-a30a-c4e78d70a2fc', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u0645\\u062d\\u0645\\u062f \\u0632\\u0627\\u0647\\u0631 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0644\\u0647 \\u0639\\u0644\\u064a \\u062e\\u0627\\u0644\\u062f  \",\"en\":\"You have a new message from \\u0645\\u062d\\u0645\\u062f \\u0632\\u0627\\u0647\\u0631 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0644\\u0647 \\u0639\\u0644\\u064a \\u062e\\u0627\\u0644\\u062f\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-10-29 19:24:15', '2023-01-26 23:11:32'),
('0e3f8c07-a722-4df7-b21e-f79557319e5e', 'App\\Notifications\\BidNotification', 61, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-06-06 03:36:47', '2023-04-18 11:52:12', '2023-06-06 03:36:47'),
('11b0d033-9a61-4892-9fdf-53685e5e7d3f', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 03:54:36', '2023-11-06 04:41:13'),
('133dfcec-ad99-480b-8572-45972a3076df', 'App\\Notifications\\BidNotification', 69, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-12-31 01:33:06', '2022-12-31 01:33:06'),
('14700f48-6277-4c85-8446-0e3d957b3e46', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-05-11 15:19:27', '2023-11-06 04:41:13'),
('14ba804e-ec28-4eec-b011-3b562ecd1474', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u0627\\u0628\\u0648 \\u062c\\u0648\\u0627\\u062f  \",\"en\":\"You have a new message from \\u0627\\u0628\\u0648 \\u062c\\u0648\\u0627\\u062f\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-03 01:44:35', '2023-11-06 04:41:13'),
('152caecb-7cc9-4207-b9d1-ace92dd9aeea', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u0627\\u0633\\u0648\\u0627\\u0642 \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645  \",\"en\":\"You have a new message from \\u0627\\u0633\\u0648\\u0627\\u0642 \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-17 08:22:50', '2023-04-17 08:22:50'),
('1563caf6-bbb9-4096-8ff0-e3d64d71ed7c', 'App\\Notifications\\BidNotification', 119, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Nadir  \",\"en\":\"You have a new message from Nadir\",\"url\":\"user\\/chat\\/\"}', '2023-03-31 04:42:24', '2023-03-21 09:09:33', '2023-03-31 04:42:24'),
('15a7d34c-d678-4a25-ad89-bb2e1450086a', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 04:14:07', '2023-04-18 04:14:07'),
('164a3dbd-7636-43da-b394-4718c231dbf6', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-11-23 23:38:36', '2023-01-26 23:11:32'),
('176e9d16-74b9-4aec-a377-fd1adcabeafa', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2023-01-06 23:49:10', '2023-01-26 23:11:32'),
('182b1144-1ebb-4fb9-8ab9-5b1a215ce464', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-05-11 15:19:17', '2023-11-06 04:41:13'),
('1acd63ff-8462-4e2a-8169-fd8644ccca15', 'App\\Notifications\\BidNotification', 163, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f Cgff  \",\"en\":\"new offer on auction Cgff\",\"url\":\"auction\\/75\\/Cgff\"}', NULL, '2023-10-13 22:53:04', '2023-10-13 22:53:04'),
('1c4cc8fb-6892-4165-b41e-caf07a120295', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 03:47:14', '2023-11-06 04:41:13'),
('1c5b13e4-b264-48e8-926b-c530d819d0af', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-16 05:16:21', '2023-02-16 05:16:21'),
('1c5e505d-4bd0-4aad-a691-e73869c0468c', 'App\\Notifications\\BidNotification', 117, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:37:57', '2023-04-18 11:37:57'),
('1c8ced07-f5aa-4a8e-9ce4-06d4d22112c5', 'App\\Notifications\\BidNotification', 69, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-12-31 01:33:15', '2022-12-31 01:33:15'),
('1e81b269-6e76-4b46-b7a2-526b3a7069df', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 asd504  \",\"en\":\"You have a new message from asd504\",\"url\":\"user\\/chat\\/\"}', '2023-04-18 11:37:42', '2023-03-31 04:43:47', '2023-04-18 11:37:42'),
('1e905a5c-1a1c-4ce7-83a8-da50cf5c38ec', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-04-18 11:37:42', '2023-04-06 04:09:05', '2023-04-18 11:37:42'),
('20b307a0-aa2b-4c07-b860-122deec18406', 'App\\Notifications\\BidNotification', 110, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-12-26 01:58:29', '2022-12-26 01:58:13', '2022-12-26 01:58:29'),
('2158509c-3a57-4b78-a47b-3f56b927d2c4', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-19 14:00:49', '2023-04-19 14:00:49'),
('2212ad1d-17e9-421e-a4f5-fbe3801056e0', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-05-11 15:19:48', '2023-11-06 04:41:13'),
('222a0c33-aa49-4811-a3af-e546d720b077', 'App\\Notifications\\BidNotification', 135, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0633\\u0643\\u0631\\u064a \\u0641\\u0627\\u062e\\u0631 \\u0627\\u0644\\u0642\\u0635\\u064a\\u0645  \",\"en\":\"new offer on auction \\u0633\\u0643\\u0631\\u064a \\u0641\\u0627\\u062e\\u0631 \\u0627\\u0644\\u0642\\u0635\\u064a\\u0645\",\"url\":\"auction\\/35\\/\\u0633\\u0643\\u0631\\u064a \\u0641\\u0627\\u062e\\u0631 \\u0627\\u0644\\u0642\\u0635\\u064a\\u0645\"}', NULL, '2023-04-08 22:42:22', '2023-04-08 22:42:22'),
('222acf67-8fef-4a12-b8bf-47e397633ad3', 'App\\Notifications\\BidNotification', 116, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-02-07 04:26:07', '2023-02-07 04:25:25', '2023-02-07 04:26:07'),
('224caf5f-38c7-4f49-bf6d-1a103a324129', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639  \",\"en\":\"new offer on auction \\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639\",\"url\":\"auction\\/57\\/\\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639\"}', NULL, '2023-05-16 15:27:24', '2023-05-16 15:27:24'),
('22712cce-e4e5-4803-a125-718a54c04891', 'App\\Notifications\\BidNotification', 61, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-06-06 03:36:47', '2023-04-18 11:37:59', '2023-06-06 03:36:47'),
('23246851-4713-4318-81b3-974628e13c3b', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-16 07:53:31', '2023-02-16 07:53:31'),
('2747837d-34df-4319-b5a2-138a9ffec8ea', 'App\\Notifications\\BidNotification', 166, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0643\\u0648\\u0628 \\u0641\\u0627\\u062e\\u0631  \",\"en\":\"new offer on auction \\u0643\\u0648\\u0628 \\u0641\\u0627\\u062e\\u0631\",\"url\":\"auction\\/72\\/\\u0643\\u0648\\u0628 \\u0641\\u0627\\u062e\\u0631\"}', NULL, '2023-09-30 04:59:58', '2023-09-30 04:59:58'),
('27b071dc-63e3-45a9-adf9-c9d629154612', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u0645\\u062d\\u0645\\u062f \\u0632\\u0627\\u0647\\u0631 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0644\\u0647 \\u0639\\u0644\\u064a \\u062e\\u0627\\u0644\\u062f  \",\"en\":\"You have a new message from \\u0645\\u062d\\u0645\\u062f \\u0632\\u0627\\u0647\\u0631 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0644\\u0647 \\u0639\\u0644\\u064a \\u062e\\u0627\\u0644\\u062f\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-10-29 19:22:41', '2023-01-26 23:11:32'),
('27d7ccb3-c002-4e55-a820-2a613706387b', 'App\\Notifications\\BidNotification', 112, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-01-06 10:20:05', '2023-01-06 10:20:05'),
('2826b3d2-8296-45cd-83c7-9f0c959548d2', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 asd504  \",\"en\":\"You have a new message from asd504\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-05-12 20:57:54', '2023-05-12 20:57:54'),
('2ae9e174-c86f-4c33-8d8d-34285c97c75c', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-11-23 23:38:24', '2023-01-26 23:11:32'),
('2bf81734-bd77-4806-a5be-2b933866427f', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-02-06 15:40:52', '2023-02-06 15:39:25', '2023-02-06 15:40:52'),
('2e37e167-958a-443a-bd59-e3d7280bbef3', 'App\\Notifications\\BidNotification', 124, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 asd504  \",\"en\":\"You have a new message from asd504\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-03-31 04:43:37', '2023-03-31 04:43:37'),
('30a831bc-c508-469f-9ed3-6d5556961c5d', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-10-25 04:27:39', '2022-10-25 04:00:39', '2022-10-25 04:27:39'),
('31516b5a-6520-451b-af8a-ed4b255882a4', 'App\\Notifications\\BidNotification', 112, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-01-16 06:33:19', '2023-01-16 06:33:19'),
('325dd912-2b0c-4b7d-a26a-b6f31eced94f', 'App\\Notifications\\BidNotification', 119, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u0627\\u0628\\u0648 \\u062c\\u0648\\u0627\\u062f  \",\"en\":\"You have a new message from \\u0627\\u0628\\u0648 \\u062c\\u0648\\u0627\\u062f\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-06-03 01:44:49', '2023-06-03 01:44:49'),
('33a66731-b7e9-43c9-beb5-2ff0ab1d5a9a', 'App\\Notifications\\BidNotification', 119, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f Test  \",\"en\":\"new offer on auction Test\",\"url\":\"auction\\/48\\/Test\"}', '2023-05-12 20:57:30', '2023-04-18 15:32:07', '2023-05-12 20:57:30'),
('342119c7-c918-412b-9778-5380b1670852', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-10-25 04:36:57', '2022-10-25 04:36:57'),
('3482619d-50d3-4d09-8796-9eb68d2bf9a3', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-02-16 07:56:23', '2023-02-16 07:55:27', '2023-02-16 07:56:23'),
('34cc2d4c-ea00-4990-b08e-d090e89167f3', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-12-31 01:37:09', '2023-01-26 23:11:32'),
('3505600e-2c10-4251-846a-f8bdf366385a', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-07 04:24:58', '2023-02-07 04:24:58'),
('35c1ea3d-7062-41fc-b694-6f131a998aee', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-12-31 02:12:03', '2023-01-26 23:11:32'),
('368d9175-9632-4e71-a48f-292d15f7fcbe', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-12-31 02:19:46', '2023-01-26 23:11:32'),
('37342bbe-8d90-47df-87a0-f2d90afd49a9', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 03:47:25', '2023-11-06 04:41:13'),
('37b18ae0-72c1-4c51-96cd-040df971b9ce', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 asd504  \",\"en\":\"You have a new message from asd504\",\"url\":\"user\\/chat\\/\"}', '2023-04-19 13:57:45', '2023-04-18 12:57:38', '2023-04-19 13:57:45'),
('397f7dc2-7dd9-469a-b435-c818715a63e5', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0628\\u0646\\u062a\\u0644\\u064a 2023  \",\"en\":\"new offer on auction \\u0628\\u0646\\u062a\\u0644\\u064a 2023\",\"url\":\"auction\\/16\\/\\u0628\\u0646\\u062a\\u0644\\u064a 2023\"}', '2023-02-16 06:02:01', '2023-02-16 06:00:22', '2023-02-16 06:02:01'),
('3bb5db3f-b370-46fc-ad48-8bd7ef98d66a', 'App\\Notifications\\BidNotification', 58, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-06 04:27:42', '2023-04-06 04:27:42'),
('3c45eb66-bd73-4b03-be93-915503ff9563', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-02-06 15:40:52', '2023-02-06 15:39:40', '2023-02-06 15:40:52'),
('3d729bfd-0925-4bbb-a4f9-d0e41f1069b3', 'App\\Notifications\\BidNotification', 119, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f Test  \",\"en\":\"new offer on auction Test\",\"url\":\"auction\\/48\\/Test\"}', '2023-05-12 20:57:30', '2023-05-08 01:05:37', '2023-05-12 20:57:30'),
('3d942a44-cfe7-431b-91e0-a6e879cf65cd', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:49:18', '2023-04-18 11:49:18'),
('3dc25665-3a5b-4746-86f7-70893bd4d70b', 'App\\Notifications\\BidNotification', 62, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-11-24 05:49:33', '2022-11-23 23:39:03', '2022-11-24 05:49:33'),
('414b7b47-85fe-4503-9a53-dcc46117e6a9', 'App\\Notifications\\BidNotification', 69, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-12-31 01:33:28', '2022-12-31 01:33:28'),
('41ad0504-2706-4487-bb20-039dac10d221', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-05-08 02:39:26', '2023-05-08 02:39:26'),
('42202758-23a7-471b-b897-04cc973ecbf1', 'App\\Notifications\\BidNotification', 112, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-01-06 10:21:35', '2023-01-06 10:21:35'),
('4263e555-aed1-4699-9c4a-aeb4e42885e4', 'App\\Notifications\\BidNotification', 58, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-08-26 01:52:51', '2022-08-26 01:52:51'),
('42f1d718-ea6e-4023-8d1e-25e7039ff0c8', 'App\\Notifications\\BidNotification', 117, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 asd504  \",\"en\":\"You have a new message from asd504\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-05-12 20:58:02', '2023-05-12 20:58:02'),
('4425a9bf-090b-4d0e-aa1a-512e0e34819b', 'App\\Notifications\\BidNotification', 69, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-10-25 04:39:20', '2022-10-25 04:39:20'),
('44a95e0b-242f-4746-b1e9-836cb351cf17', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:53:27', '2023-04-18 11:53:27'),
('45803059-e2ce-41aa-b7e1-d3e942d2e0e8', 'App\\Notifications\\BidNotification', 166, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0643\\u0648\\u0628 \\u0641\\u0627\\u062e\\u0631  \",\"en\":\"new offer on auction \\u0643\\u0648\\u0628 \\u0641\\u0627\\u062e\\u0631\",\"url\":\"auction\\/72\\/\\u0643\\u0648\\u0628 \\u0641\\u0627\\u062e\\u0631\"}', NULL, '2023-09-30 04:59:58', '2023-09-30 04:59:58'),
('46326498-fb11-42b4-a0ec-b9c2b1bc13b2', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 moataz  \",\"en\":\"You have a new message from moataz\",\"url\":\"user\\/chat\\/\"}', '2022-10-25 04:00:21', '2022-08-26 13:05:35', '2022-10-25 04:00:21'),
('468ae0e3-e079-49df-8810-966a647fe47d', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2023-01-16 06:29:25', '2023-01-26 23:11:32'),
('47db9508-b8c6-4610-901e-920c6a1a01f9', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-19 15:13:52', '2023-04-19 15:13:52'),
('486cefee-331e-4c4f-bcef-1c4599f8c496', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0637\\u0644\\u0628 \\u0634\\u0631\\u0627\\u0621 \\u0642\\u064a\\u062f \\u0627\\u0644\\u062a\\u0646\\u0641\\u064a\\u0630 \\u0628\\u0631\\u0642\\u0645 8721  \",\"en\":\"You have a pending purchase order number 8721\",\"url\":\"user\\/orders\\/15\\/8721\"}', '2022-03-08 13:19:07', '2022-03-08 12:31:02', '2022-03-08 13:19:07'),
('498a89ae-547b-481d-93c0-486de323bb24', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-05-11 15:14:57', '2023-05-11 15:14:57'),
('4b1e1ba3-76fe-4bec-88df-f21a9af8c5b1', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-16 06:00:52', '2023-02-16 06:00:52'),
('4b465f23-004f-47f1-8ee3-2d8b6f651e3e', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-16 06:01:33', '2023-02-16 06:01:33'),
('4b6abfff-d0ac-4cbb-b66e-fb95f862aeb2', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 asd504  \",\"en\":\"You have a new message from asd504\",\"url\":\"user\\/chat\\/\"}', '2023-04-18 11:37:42', '2023-03-31 04:43:07', '2023-04-18 11:37:42'),
('4c016afa-b66d-46d3-b574-85ffa56cc4b6', 'App\\Notifications\\BidNotification', 58, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-06 04:28:16', '2023-04-06 04:28:16'),
('4c3419a8-a06b-4a24-8323-bc07dcbe6578', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-11-23 23:38:55', '2023-01-26 23:11:32'),
('4c51210b-1ef4-48a1-817e-9bf6362b9eb4', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:48:29', '2023-04-18 11:48:29'),
('4cc03336-6be5-41c8-9dac-da75b3c22344', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631  \",\"en\":\"new offer on auction \\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631\",\"url\":\"auction\\/4\\/\\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631\"}', '2023-04-06 04:27:11', '2023-04-06 04:01:26', '2023-04-06 04:27:11'),
('4cff4816-dca7-4101-9c43-1629db7562af', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u062c\\u0647\\u0627\\u0632 \\u0622\\u064a\\u0641\\u0648\\u0646 13 \\u0634\\u0628\\u0647 \\u062c\\u062f\\u064a\\u062f  \",\"en\":\"new offer on auction \\u062c\\u0647\\u0627\\u0632 \\u0622\\u064a\\u0641\\u0648\\u0646 13 \\u0634\\u0628\\u0647 \\u062c\\u062f\\u064a\\u062f\",\"url\":\"auction\\/12\\/\\u062c\\u0647\\u0627\\u0632 \\u0622\\u064a\\u0641\\u0648\\u0646 13 \\u0634\\u0628\\u0647 \\u062c\\u062f\\u064a\\u062f\"}', '2023-01-06 23:38:31', '2023-01-06 10:17:36', '2023-01-06 23:38:31'),
('4eab632a-2871-49c4-a164-3c6ef4cbff38', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-26 01:36:43', '2022-08-27 12:15:38'),
('4efc984e-95ed-49b7-85cb-7682a5e4618b', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 testApp  \",\"en\":\"You have a new message from testApp\",\"url\":\"user\\/chat\\/\"}', '2022-12-26 01:59:24', '2022-12-26 01:58:32', '2022-12-26 01:59:24'),
('502a6152-fe4d-4977-ad54-468f65268707', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 03:57:38', '2023-11-06 04:41:13'),
('5044875e-f2e7-496b-b05f-1c81725fe4af', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0645\\u0632\\u0627\\u062f \\u062c\\u0648\\u0627\\u0644\\u0627\\u062a  \",\"en\":\"new offer on auction \\u0645\\u0632\\u0627\\u062f \\u062c\\u0648\\u0627\\u0644\\u0627\\u062a\",\"url\":\"auction\\/56\\/\\u0645\\u0632\\u0627\\u062f \\u062c\\u0648\\u0627\\u0644\\u0627\\u062a\"}', '2023-11-06 04:41:13', '2023-05-13 01:55:01', '2023-11-06 04:41:13'),
('50d71c15-b1a2-4ae3-a668-3fe5dcb77508', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-05-01 04:38:14', '2023-05-01 04:38:14'),
('50e0183e-f23b-417e-8911-481cb7d3e9d1', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u0627\\u0628\\u0648 \\u062c\\u0648\\u0627\\u062f  \",\"en\":\"You have a new message from \\u0627\\u0628\\u0648 \\u062c\\u0648\\u0627\\u062f\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-03 02:18:03', '2023-11-06 04:41:13'),
('51014e44-4f0e-44d6-ba82-fc9be85979da', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2023-01-06 05:33:26', '2023-01-26 23:11:32'),
('520ac36b-7b9d-4f4d-a684-7f2c4918defa', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-16 07:56:37', '2023-02-16 07:56:37'),
('52498314-1f2c-46cb-959b-3bade9cd1b12', 'App\\Notifications\\BidNotification', 141, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0645\\u0627\\u0643\\u0646\\u0629 \\u0642\\u0647\\u0648\\u0647  \",\"en\":\"new offer on auction \\u0645\\u0627\\u0643\\u0646\\u0629 \\u0642\\u0647\\u0648\\u0647\",\"url\":\"auction\\/59\\/\\u0645\\u0627\\u0643\\u0646\\u0629 \\u0642\\u0647\\u0648\\u0647\"}', '2023-05-23 16:11:59', '2023-05-20 06:32:23', '2023-05-23 16:11:59'),
('52e36498-0830-42c0-89d8-765f14a2bd60', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 moataz  \",\"en\":\"You have a new message from moataz\",\"url\":\"user\\/chat\\/\"}', '2022-10-25 04:00:21', '2022-08-26 13:06:17', '2022-10-25 04:00:21'),
('5356522f-b92a-494f-8176-d82019f18b48', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-06 15:27:38', '2023-02-06 15:27:38'),
('541bf30e-e9ef-4658-8d20-520ec73706f1', 'App\\Notifications\\BidNotification', 119, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f Test product of computers  \",\"en\":\"new offer on auction Test product of computers\",\"url\":\"auction\\/34\\/Test product of computers\"}', '2023-04-18 12:57:31', '2023-04-06 06:00:41', '2023-04-18 12:57:31'),
('5448e1a7-e2bd-4770-8262-0e200cda8b89', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:59:27', '2023-04-18 11:59:27'),
('55ef77b0-4c84-468f-be48-3932c01696f7', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631  \",\"en\":\"new offer on auction \\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631\",\"url\":\"auction\\/4\\/\\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631\"}', '2023-05-12 23:02:20', '2023-05-12 16:25:21', '2023-05-12 23:02:20'),
('562e4601-cc87-4728-a9f8-9534c6a864dd', 'App\\Notifications\\BidNotification', 62, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-26 13:05:26', '2022-08-26 01:51:40', '2022-08-26 13:05:26'),
('5779c74e-ef28-4063-b1c6-9cbcde333012', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-08-27 12:15:51', '2022-08-27 12:15:51'),
('57abebe8-925f-4d82-9c3e-aa4b9c5c5f99', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 03:39:50', '2023-11-06 04:41:13'),
('57dbb665-f153-4e65-bb6e-250acf0e0191', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-04-03 19:14:12', '2023-02-16 07:56:28', '2023-04-03 19:14:12'),
('58317aad-7a80-4f68-b7ea-1ac60bc2fdba', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631  \",\"en\":\"new offer on auction \\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631\",\"url\":\"auction\\/4\\/\\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631\"}', '2023-05-12 23:02:20', '2023-05-12 22:37:05', '2023-05-12 23:02:20'),
('5852242e-734d-43c2-ac5c-6ed0b470a317', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-19 21:04:05', '2022-08-27 12:15:38'),
('59d0b9fb-e73c-493c-9393-0cf8d04045cb', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-16 07:56:25', '2023-02-16 07:56:25');
INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('5a2c8f06-6556-4999-8bc4-410c988fad5c', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631  \",\"en\":\"new offer on auction \\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631\",\"url\":\"auction\\/4\\/\\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631\"}', '2023-05-12 23:02:20', '2023-05-12 16:25:32', '2023-05-12 23:02:20'),
('5a523b05-7cfd-4e76-a90f-45a3200ea6a6', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2023-01-16 06:32:53', '2023-01-26 23:11:32'),
('5a80d4a8-e0eb-4522-9621-6cc4936934a2', 'App\\Notifications\\BidNotification', 113, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-01-06 05:33:48', '2023-01-06 05:33:48'),
('5b65fe27-8580-439e-9275-ddba7483a86c', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 03:51:53', '2023-11-06 04:41:13'),
('5c2a9ea6-7045-42c9-9e5a-e75a86061977', 'App\\Notifications\\BidNotification', 69, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-10-25 04:37:44', '2022-10-25 04:37:44'),
('5d5068dd-66ae-4175-a6fd-dfe06395a38b', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 03:54:28', '2023-11-06 04:41:13'),
('5d959ce9-1c2b-4b80-a342-2f2cfbc7c6ae', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-05-08 02:39:06', '2023-05-08 02:39:06'),
('5f4df13d-a59b-4307-be9f-1e89d019eacc', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-26 01:36:16', '2022-08-27 12:15:38'),
('6036fe2d-c213-4a2b-baf0-0218733e883e', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', '2022-12-31 02:19:06', '2022-12-31 02:17:48', '2022-12-31 02:19:06'),
('61695bc1-efb6-4327-8ac5-d7b1a2799898', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-12-26 01:57:25', '2023-01-26 23:11:32'),
('61819f5f-5d7f-4a0d-803a-7eb1e76865df', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-06 15:40:38', '2023-02-06 15:40:38'),
('61d545c2-ace5-42f0-8872-5f89977de67b', 'App\\Notifications\\BidNotification', 166, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0643\\u0648\\u0628 \\u0641\\u0627\\u062e\\u0631  \",\"en\":\"new offer on auction \\u0643\\u0648\\u0628 \\u0641\\u0627\\u062e\\u0631\",\"url\":\"auction\\/72\\/\\u0643\\u0648\\u0628 \\u0641\\u0627\\u062e\\u0631\"}', NULL, '2023-09-28 05:06:10', '2023-09-28 05:06:10'),
('6205d15f-c17d-4fd8-a2f3-4fe085249d69', 'App\\Notifications\\BidNotification', 162, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0645\\u0632\\u0627\\u062f \\u062a\\u062c\\u0631\\u064a\\u0628\\u064a  \",\"en\":\"new offer on auction \\u0645\\u0632\\u0627\\u062f \\u062a\\u062c\\u0631\\u064a\\u0628\\u064a\",\"url\":\"auction\\/71\\/\\u0645\\u0632\\u0627\\u062f \\u062a\\u062c\\u0631\\u064a\\u0628\\u064a\"}', NULL, '2023-09-27 05:58:21', '2023-09-27 05:58:21'),
('620fc563-5cfe-4b88-ab37-c4019216d0c0', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-10-29 03:21:46', '2022-10-29 03:21:46'),
('63911ef6-0fa6-476e-862b-b1be6cc3b8d0', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:49:38', '2023-04-18 11:49:38'),
('65231138-85c5-41fe-935c-d00ce72b496c', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-04-19 13:57:45', '2023-04-18 15:06:38', '2023-04-19 13:57:45'),
('654caa4c-d035-4c8c-b668-f97a0a558bdb', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f\",\"url\":\"user\\/chat\\/\"}', '2023-02-07 04:24:44', '2023-02-07 04:21:55', '2023-02-07 04:24:44'),
('65a9c525-aeaf-4da0-ae68-7411fc08ab94', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-10-25 04:27:39', '2022-10-25 04:00:27', '2022-10-25 04:27:39'),
('65efc6f7-46d4-4752-aaf0-09e35fa360c1', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 03:57:25', '2023-11-06 04:41:13'),
('661c50a2-b9fc-49b6-a70e-9e9d97e00af2', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Jawad  \",\"en\":\"You have a new message from Jawad\",\"url\":\"user\\/chat\\/\"}', '2023-01-06 23:38:31', '2023-01-06 10:21:23', '2023-01-06 23:38:31'),
('66efa93f-e2b4-42a7-b277-17b9732eb8b2', 'App\\Notifications\\BidNotification', 61, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-06-06 03:36:47', '2023-02-06 15:28:15', '2023-06-06 03:36:47'),
('6720a41b-cb43-4088-b648-decf235ddabb', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Jawad  \",\"en\":\"You have a new message from Jawad\",\"url\":\"user\\/chat\\/\"}', '2023-01-06 23:38:31', '2023-01-06 10:20:38', '2023-01-06 23:38:31'),
('68ec19d2-ebcb-4fb2-8231-c22d7826387e', 'App\\Notifications\\BidNotification', 116, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-02-07 04:26:07', '2023-02-07 04:25:08', '2023-02-07 04:26:07'),
('69ee9886-f568-4e97-8250-08fca15f92b5', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-02-16 06:02:01', '2023-02-16 05:45:59', '2023-02-16 06:02:01'),
('6a75a43b-63d4-4f68-bb0d-52c98b64e0e7', 'App\\Notifications\\BidNotification', 119, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f HhhgcTetdd  \",\"en\":\"new offer on auction HhhgcTetdd\",\"url\":\"auction\\/61\\/HhhgcTetdd\"}', '2023-05-27 04:20:09', '2023-05-25 04:18:35', '2023-05-27 04:20:09'),
('6b45d929-f2ab-41db-a816-b08a9b0cd6d9', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u0627\\u0633\\u0648\\u0627\\u0642 \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645  \",\"en\":\"You have a new message from \\u0627\\u0633\\u0648\\u0627\\u0642 \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-17 08:23:00', '2023-04-17 08:23:00'),
('6b4dac2a-dec5-432a-b3ee-0a9533c7d79a', 'App\\Notifications\\BidNotification', 201, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0645\\u0635\\u0641\\u0641 \\u0634\\u0639\\u0631 \\u0628\\u0627\\u0644\\u0644\\u064a\\u0632\\u0631  \",\"en\":\"new offer on auction \\u0645\\u0635\\u0641\\u0641 \\u0634\\u0639\\u0631 \\u0628\\u0627\\u0644\\u0644\\u064a\\u0632\\u0631\",\"url\":\"auction\\/76\\/\\u0645\\u0635\\u0641\\u0641 \\u0634\\u0639\\u0631 \\u0628\\u0627\\u0644\\u0644\\u064a\\u0632\\u0631\"}', NULL, '2023-10-15 05:27:13', '2023-10-15 05:27:13'),
('6b5c097b-7aac-44ad-941f-0218f6bffac0', 'App\\Notifications\\BidNotification', 162, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0645\\u0632\\u0627\\u062f \\u062a\\u062c\\u0631\\u064a\\u0628\\u064a  \",\"en\":\"new offer on auction \\u0645\\u0632\\u0627\\u062f \\u062a\\u062c\\u0631\\u064a\\u0628\\u064a\",\"url\":\"auction\\/71\\/\\u0645\\u0632\\u0627\\u062f \\u062a\\u062c\\u0631\\u064a\\u0628\\u064a\"}', NULL, '2023-09-27 06:19:48', '2023-09-27 06:19:48'),
('6d4531a0-5a82-4600-96c8-20e9a77cef96', 'App\\Notifications\\BidNotification', 119, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 tst78874  \",\"en\":\"You have a new message from tst78874\",\"url\":\"user\\/chat\\/\"}', '2023-03-31 04:42:24', '2023-03-23 02:48:08', '2023-03-31 04:42:24'),
('6db18342-9524-47a7-a4d5-99511bb05b31', 'App\\Notifications\\BidNotification', 69, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-10-25 04:38:37', '2022-10-25 04:38:37'),
('6f40e1c0-b5c4-4a02-af25-74e00459aa29', 'App\\Notifications\\BidNotification', 117, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-05-11 15:18:20', '2023-05-11 15:18:20'),
('707ed57f-6b28-477d-8d67-8554db0ac3a8', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-26 01:51:30', '2022-08-27 12:15:38'),
('71075c9d-e13b-4b77-b7c4-faf52cdd1433', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0637\\u0644\\u0628 \\u0634\\u0631\\u0627\\u0621 \\u0642\\u064a\\u062f \\u0627\\u0644\\u062a\\u0646\\u0641\\u064a\\u0630 \\u0628\\u0631\\u0642\\u0645 4467  \",\"en\":\"You have a pending purchase order number 4467\",\"url\":\"user\\/orders\\/16\\/4467\"}', '2022-03-08 13:43:52', '2022-03-08 13:28:37', '2022-03-08 13:43:52'),
('718658f0-bea7-4e49-b586-762d33077025', 'App\\Notifications\\BidNotification', 117, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f Almalki-khaled@hotmail.com  \",\"en\":\"new offer on auction Almalki-khaled@hotmail.com\",\"url\":\"auction\\/41\\/Almalki-khaled@hotmail.com\"}', '2023-04-16 10:54:06', '2023-04-09 20:40:05', '2023-04-16 10:54:06'),
('7274dd9d-2da0-4b6b-a794-49c66bf7d45d', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-26 01:36:03', '2022-08-27 12:15:38'),
('72edfaf5-9fd2-4dc4-8647-c3c49d9b250a', 'App\\Notifications\\BidNotification', 69, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:52:13', '2023-04-18 11:52:13'),
('73035407-ebca-4fe2-968f-398cde7cc5df', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-26 01:38:04', '2022-08-27 12:15:38'),
('73eb9f12-dc7b-402e-9ccb-a4f206239d4e', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-04-18 15:06:26', '2023-04-18 11:37:59', '2023-04-18 15:06:26'),
('749b09d9-7132-4ede-97c3-2c9e14838b05', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2023-01-16 06:46:57', '2023-01-26 23:11:32'),
('759491ae-9ff9-441f-b13f-78fbb4c325c1', 'App\\Notifications\\BidNotification', 124, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 asd504  \",\"en\":\"You have a new message from asd504\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-03-31 04:43:46', '2023-03-31 04:43:46'),
('75a8eae9-a1fd-439b-b4ba-0717d0b2b589', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-12-26 01:59:28', '2023-01-26 23:11:32'),
('75ce2f03-1aca-4926-af52-6c20f7670615', 'App\\Notifications\\BidNotification', 119, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-04-18 12:57:31', '2023-04-18 11:37:52', '2023-04-18 12:57:31'),
('7667ec21-8bd1-4f3c-ab11-585f983a39d0', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', '2023-01-06 05:32:54', '2022-12-31 02:21:45', '2023-01-06 05:32:54'),
('766c3de6-c64a-4100-b6f3-41284e22121d', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-05-04 06:33:57', '2023-05-04 06:33:57'),
('778365b2-edb4-4caa-92f1-f190f5af31c2', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u0627\\u0633\\u0648\\u0627\\u0642 \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645  \",\"en\":\"You have a new message from \\u0627\\u0633\\u0648\\u0627\\u0642 \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-16 10:54:32', '2023-04-16 10:54:32'),
('7852680e-b3a9-4881-b558-941053ebeab2', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-16 05:18:37', '2023-02-16 05:18:37'),
('7877a93c-13ac-4f26-97af-f3bae1cda64b', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 moataz  \",\"en\":\"You have a new message from moataz\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-26 13:06:14', '2022-08-27 12:15:38'),
('793aee6f-1e70-47bf-a64d-29a0a8074b34', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u0645\\u062d\\u0645\\u062f \\u0632\\u0627\\u0647\\u0631 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0644\\u0647 \\u0639\\u0644\\u064a \\u062e\\u0627\\u0644\\u062f  \",\"en\":\"You have a new message from \\u0645\\u062d\\u0645\\u062f \\u0632\\u0627\\u0647\\u0631 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0644\\u0647 \\u0639\\u0644\\u064a \\u062e\\u0627\\u0644\\u062f\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-10-29 19:24:45', '2023-01-26 23:11:32'),
('79f1bf2c-f8ee-425f-beac-c6b866862b94', 'App\\Notifications\\BidNotification', 113, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-12-31 02:18:48', '2022-12-31 02:17:53', '2022-12-31 02:18:48'),
('7a95acc9-48d3-4f62-99f6-d9afad92cb6a', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2023-01-06 10:18:53', '2023-01-26 23:11:32'),
('7abaaad6-0c36-421d-b85c-a21e1b6dd051', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 testApp  \",\"en\":\"You have a new message from testApp\",\"url\":\"user\\/chat\\/\"}', '2022-12-26 01:57:21', '2022-12-26 01:57:06', '2022-12-26 01:57:21'),
('7b48a2a8-285e-4898-9ef8-aa20660a362a', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-26 01:36:22', '2022-08-27 12:15:38'),
('7b5f15fc-1013-4f63-9296-7d1ef4a8c037', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', '2022-12-31 02:19:06', '2022-12-31 02:16:25', '2022-12-31 02:19:06'),
('7d8a8da2-658e-4009-bef5-46fecb2b4e9c', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-16 05:16:00', '2023-02-16 05:16:00'),
('7eabaff9-f63b-4bde-bac3-29cbaa717988', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-19 15:13:34', '2023-04-19 15:13:34'),
('7fbf158d-7222-4cf0-a9e5-0d2024ceabfa', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-04-18 11:37:42', '2023-04-06 04:04:49', '2023-04-18 11:37:42'),
('811b60ed-a244-47df-bb8a-1a5cd5c8f84d', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-06 15:40:00', '2023-02-06 15:40:00'),
('81e0bc4c-092b-44e8-8c1c-d1af1f06674d', 'App\\Notifications\\BidNotification', 135, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0634\\u0627\\u0627\\u0644 \\u0645\\u0646\\u0632\\u0644\\u064a \\u062e\\u0627\\u0631\\u062c\\u064a  \",\"en\":\"new offer on auction \\u0634\\u0627\\u0627\\u0644 \\u0645\\u0646\\u0632\\u0644\\u064a \\u062e\\u0627\\u0631\\u062c\\u064a\",\"url\":\"auction\\/30\\/\\u0634\\u0627\\u0627\\u0644 \\u0645\\u0646\\u0632\\u0644\\u064a \\u062e\\u0627\\u0631\\u062c\\u064a\"}', NULL, '2023-04-03 19:17:04', '2023-04-03 19:17:04'),
('8203282c-041a-4fca-81ee-cd7bb20fe8e9', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', '2022-12-31 02:19:06', '2022-12-31 02:14:37', '2022-12-31 02:19:06'),
('82b29b02-9c33-4116-9248-62dfe9a13a6d', 'App\\Notifications\\BidNotification', 141, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0645\\u0627\\u0643\\u0646\\u0629 \\u0642\\u0647\\u0648\\u0647  \",\"en\":\"new offer on auction \\u0645\\u0627\\u0643\\u0646\\u0629 \\u0642\\u0647\\u0648\\u0647\",\"url\":\"auction\\/59\\/\\u0645\\u0627\\u0643\\u0646\\u0629 \\u0642\\u0647\\u0648\\u0647\"}', '2023-05-23 16:11:59', '2023-05-20 06:32:23', '2023-05-23 16:11:59'),
('8421c205-58b8-4e7c-a77d-17c88e43cbd3', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0637\\u0644\\u0628 \\u0634\\u0631\\u0627\\u0621 \\u0642\\u064a\\u062f \\u0627\\u0644\\u062a\\u0646\\u0641\\u064a\\u0630 \\u0628\\u0631\\u0642\\u0645 2895  \",\"en\":\"You have a pending purchase order number 2895\",\"url\":\"user\\/orders\\/17\\/2895\"}', NULL, '2022-06-14 00:21:58', '2022-06-14 00:21:58'),
('84763119-5ef7-4c35-bcb7-3b2a74c36573', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Jawad  \",\"en\":\"You have a new message from Jawad\",\"url\":\"user\\/chat\\/\"}', '2023-01-06 23:38:31', '2023-01-06 10:21:03', '2023-01-06 23:38:31'),
('84e6b981-c06f-41ce-ae11-45519f5281a2', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 03:56:30', '2023-11-06 04:41:13'),
('85133285-fea9-4b84-92df-096b7f35b69f', 'App\\Notifications\\BidNotification', 55, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-08-26 01:50:15', '2022-08-26 01:50:15'),
('856e0966-6de0-47d6-a74a-45ccac104a19', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639  \",\"en\":\"new offer on auction \\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639\",\"url\":\"auction\\/57\\/\\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639\"}', NULL, '2023-05-18 07:05:43', '2023-05-18 07:05:43'),
('868bef91-95f3-4674-bee6-003b2a4fee26', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-08 06:18:58', '2023-02-08 06:18:58'),
('86c6374a-90f1-4182-b051-6c46ba09aee1', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', '2023-01-06 05:32:54', '2022-12-31 02:19:19', '2023-01-06 05:32:54'),
('871478e2-79a5-4baf-a7a4-56cdd9fe5b71', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-08-26 01:51:36', '2022-08-26 01:51:36'),
('885c0166-fefa-48f3-a821-0298a71ad764', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0645\\u0632\\u0627\\u062f \\u062c\\u0648\\u0627\\u0644\\u0627\\u062a  \",\"en\":\"new offer on auction \\u0645\\u0632\\u0627\\u062f \\u062c\\u0648\\u0627\\u0644\\u0627\\u062a\",\"url\":\"auction\\/56\\/\\u0645\\u0632\\u0627\\u062f \\u062c\\u0648\\u0627\\u0644\\u0627\\u062a\"}', '2023-11-06 04:41:13', '2023-05-12 22:37:32', '2023-11-06 04:41:13'),
('896f7788-ad0f-495b-aced-bdc96878e5c3', 'App\\Notifications\\BidNotification', 112, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-01-06 10:19:01', '2023-01-06 10:19:01'),
('8a34aa1a-19ef-4faa-bf65-8579f66dbbc8', 'App\\Notifications\\BidNotification', 113, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-12-31 02:18:48', '2022-12-31 02:18:07', '2022-12-31 02:18:48'),
('8a77e4a1-6b78-443e-b817-fb71461d08f3', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 03:37:10', '2023-11-06 04:41:13'),
('8c6cba1a-7e85-4603-ae8d-5334e5630b05', 'App\\Notifications\\BidNotification', 62, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-26 13:05:26', '2022-08-26 01:51:23', '2022-08-26 13:05:26'),
('8ca4bc1a-13cc-470f-b9b5-0be6dba9133e', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:57:44', '2023-04-18 11:57:44'),
('8ca53b95-a96a-4411-a77b-65c4d97ab5cc', 'App\\Notifications\\BidNotification', 135, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-05-11 15:18:18', '2023-05-11 15:18:18'),
('8ccf9425-019f-4cd3-a66d-2b32b0e92633', 'App\\Notifications\\BidNotification', 69, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-12-31 02:14:35', '2022-12-31 02:14:35'),
('8cda033e-ac2a-459d-a132-9ea2b64d567d', 'App\\Notifications\\BidNotification', 62, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2022-09-02 17:05:39', '2022-08-27 12:15:57', '2022-09-02 17:05:39'),
('8e1f19b8-9eb2-4b38-93c6-cf04998382c7', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-08-27 12:17:18', '2022-08-27 12:17:18'),
('8e665f09-c585-442e-9c1a-5f26d23fc65d', 'App\\Notifications\\BidNotification', 135, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0641\\u0644\\u0627\\u0634 \\u0645\\u064a\\u0645\\u0648\\u0631\\u064a \\u0662\\u0665\\u0666 \\u062c\\u064a\\u062c\\u0627  \",\"en\":\"new offer on auction \\u0641\\u0644\\u0627\\u0634 \\u0645\\u064a\\u0645\\u0648\\u0631\\u064a \\u0662\\u0665\\u0666 \\u062c\\u064a\\u062c\\u0627\",\"url\":\"auction\\/31\\/\\u0641\\u0644\\u0627\\u0634 \\u0645\\u064a\\u0645\\u0648\\u0631\\u064a \\u0662\\u0665\\u0666 \\u062c\\u064a\\u062c\\u0627\"}', NULL, '2023-04-06 04:25:48', '2023-04-06 04:25:48'),
('8fc59c78-5fe1-47cd-96fc-3c449ea62a87', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639  \",\"en\":\"new offer on auction \\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639\",\"url\":\"auction\\/57\\/\\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639\"}', NULL, '2023-05-16 15:32:41', '2023-05-16 15:32:41'),
('9052e723-b76e-4593-a78a-72508df9caad', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-05-11 15:14:08', '2023-05-11 15:14:08'),
('90e8449e-53e3-4e6c-ae87-8c355cb2c3c9', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631  \",\"en\":\"new offer on auction \\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631\",\"url\":\"auction\\/4\\/\\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631\"}', '2022-08-19 21:03:00', '2022-08-19 20:58:10', '2022-08-19 21:03:00'),
('92c7f851-c183-43c5-9dc1-f256718f290e', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-04-18 11:37:42', '2023-04-06 04:27:31', '2023-04-18 11:37:42'),
('92e57e44-c418-4b05-8df5-f84cbe594790', 'App\\Notifications\\BidNotification', 113, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-12-31 02:18:48', '2022-12-31 02:17:41', '2022-12-31 02:18:48'),
('93a6f050-b018-41b6-bb7f-0f4ea515bf58', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 moataz  \",\"en\":\"You have a new message from moataz\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-26 13:05:31', '2022-08-27 12:15:38'),
('95859c44-027b-4d99-b826-825f4b5d839b', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 testApp  \",\"en\":\"You have a new message from testApp\",\"url\":\"user\\/chat\\/\"}', '2022-12-26 01:57:21', '2022-12-26 01:56:40', '2022-12-26 01:57:21'),
('95f970fd-e99b-496e-98c3-73a78a5b60b2', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 moataz  \",\"en\":\"You have a new message from moataz\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-21 23:14:21', '2022-08-27 12:15:38'),
('96e34bdd-5a77-45af-a0d5-73bcf9d91ab6', 'App\\Notifications\\BidNotification', 112, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-01-16 06:33:00', '2023-01-16 06:33:00'),
('9714348e-c814-4c82-9fc4-4d7b533a2a7b', 'App\\Notifications\\BidNotification', 62, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-26 13:05:26', '2022-08-26 01:50:59', '2022-08-26 13:05:26'),
('97324ccf-c56c-48c4-b406-552b980eba02', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-26 01:34:28', '2022-08-27 12:15:38'),
('98590df4-82fe-46be-851c-fa0753d253ce', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0645\\u0632\\u0627\\u062f \\u062c\\u0648\\u0627\\u0644\\u0627\\u062a  \",\"en\":\"new offer on auction \\u0645\\u0632\\u0627\\u062f \\u062c\\u0648\\u0627\\u0644\\u0627\\u062a\",\"url\":\"auction\\/56\\/\\u0645\\u0632\\u0627\\u062f \\u062c\\u0648\\u0627\\u0644\\u0627\\u062a\"}', '2023-11-06 04:41:13', '2023-05-11 15:17:02', '2023-11-06 04:41:13'),
('98d79c7f-1524-4143-ba9b-f1e361609353', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-12-26 01:58:01', '2023-01-26 23:11:32'),
('98fe2482-8e72-46cd-be03-497b46880cfe', 'App\\Notifications\\BidNotification', 117, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u062c\\u0645\\u0644 \\u0644\\u0644\\u0628\\u064a\\u0639  \",\"en\":\"new offer on auction \\u062c\\u0645\\u0644 \\u0644\\u0644\\u0628\\u064a\\u0639\",\"url\":\"auction\\/50\\/\\u062c\\u0645\\u0644 \\u0644\\u0644\\u0628\\u064a\\u0639\"}', NULL, '2023-04-19 15:13:25', '2023-04-19 15:13:25'),
('99554ec2-14d5-405d-ad2e-82ea935887ba', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-08-26 01:52:48', '2022-08-26 01:52:48'),
('9c95ad76-b9e8-437c-8319-b246ca7c7b77', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-23 02:31:18', '2022-08-27 12:15:38'),
('9d96f7c3-f057-4498-ac7b-40ed39c1a60a', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-04-18 11:37:42', '2023-04-16 10:56:01', '2023-04-18 11:37:42'),
('a06c6625-f836-481d-9f78-ae018edfa204', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-05-11 15:15:21', '2023-05-11 15:15:21'),
('a1f7b777-9db1-4c47-b19d-2df2a6b66ba7', 'App\\Notifications\\BidNotification', 119, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 tst78874  \",\"en\":\"You have a new message from tst78874\",\"url\":\"user\\/chat\\/\"}', '2023-03-31 04:42:24', '2023-03-23 02:48:02', '2023-03-31 04:42:24'),
('a27e6948-f8ab-4ee1-baa3-0721bc3b015e', 'App\\Notifications\\BidNotification', 55, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-08-26 01:52:41', '2022-08-26 01:52:41'),
('a280b64a-c179-4c7c-a1e1-6cb0b5f509ce', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-19 15:14:46', '2023-04-19 15:14:46'),
('a2be3ed1-5b44-456e-bd3f-38145bc3d4d1', 'App\\Notifications\\BidNotification', 201, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0645\\u0635\\u0641\\u0641 \\u0634\\u0639\\u0631 \\u0628\\u0627\\u0644\\u0644\\u064a\\u0632\\u0631  \",\"en\":\"new offer on auction \\u0645\\u0635\\u0641\\u0641 \\u0634\\u0639\\u0631 \\u0628\\u0627\\u0644\\u0644\\u064a\\u0632\\u0631\",\"url\":\"auction\\/76\\/\\u0645\\u0635\\u0641\\u0641 \\u0634\\u0639\\u0631 \\u0628\\u0627\\u0644\\u0644\\u064a\\u0632\\u0631\"}', NULL, '2023-10-15 05:25:12', '2023-10-15 05:25:12'),
('a404fae1-17da-4457-b9d8-a1ab56d77382', 'App\\Notifications\\BidNotification', 131, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Khaled  \",\"en\":\"You have a new message from Khaled\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-03-30 18:22:30', '2023-03-30 18:22:30'),
('a592deb4-c14f-46e8-95e5-5f17a66dba93', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2023-01-06 05:33:35', '2023-01-26 23:11:32'),
('a5f58323-6196-4c83-90b3-30f5bd2f4c30', 'App\\Notifications\\BidNotification', 119, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Nadir  \",\"en\":\"You have a new message from Nadir\",\"url\":\"user\\/chat\\/\"}', '2023-03-31 04:42:24', '2023-03-21 09:09:14', '2023-03-31 04:42:24'),
('a7bf9bee-74cf-402d-af33-e1402444ba01', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-01-16 06:29:26', '2023-01-16 06:29:26'),
('a92f323e-ff19-4e3b-8be7-d4d75150a2bd', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u062c\\u0645\\u0633 \\u062a\\u0627\\u0647\\u0648  \",\"en\":\"new offer on auction \\u062c\\u0645\\u0633 \\u062a\\u0627\\u0647\\u0648\",\"url\":\"auction\\/14\\/\\u062c\\u0645\\u0633 \\u062a\\u0627\\u0647\\u0648\"}', '2023-02-07 04:24:44', '2023-02-06 15:42:31', '2023-02-07 04:24:44');
INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('a9b93afd-d3b0-41c6-b877-1fad5546b37d', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639  \",\"en\":\"new offer on auction \\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639\",\"url\":\"auction\\/57\\/\\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639\"}', NULL, '2023-05-18 07:13:12', '2023-05-18 07:13:12'),
('a9bc89c2-3781-4ee1-bf51-5a77485df050', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-02-06 15:38:39', '2023-02-06 15:28:09', '2023-02-06 15:38:39'),
('aaf5e365-dbe9-472c-9ad3-a32de13a9d61', 'App\\Notifications\\BidNotification', 69, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:37:58', '2023-04-18 11:37:58'),
('abacc232-9868-4535-a31e-70b37dd99fee', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-26 01:34:09', '2022-08-26 01:31:39', '2022-08-26 01:34:09'),
('aee39aac-848c-466d-898c-2c3435803c6f', 'App\\Notifications\\BidNotification', 150, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0643\\u0627\\u0645\\u064a\\u0631\\u0627 \\u0643\\u0627\\u0646\\u0648\\u0646 \\u0627\\u062d\\u062a\\u0631\\u0627\\u0641\\u064a\\u0629  \",\"en\":\"new offer on auction \\u0643\\u0627\\u0645\\u064a\\u0631\\u0627 \\u0643\\u0627\\u0646\\u0648\\u0646 \\u0627\\u062d\\u062a\\u0631\\u0627\\u0641\\u064a\\u0629\",\"url\":\"auction\\/64\\/\\u0643\\u0627\\u0645\\u064a\\u0631\\u0627 \\u0643\\u0627\\u0646\\u0648\\u0646 \\u0627\\u062d\\u062a\\u0631\\u0627\\u0641\\u064a\\u0629\"}', NULL, '2023-05-27 10:42:55', '2023-05-27 10:42:55'),
('aef04c42-bf16-400d-bec5-b4c087e29b1e', 'App\\Notifications\\BidNotification', 162, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0645\\u0632\\u0627\\u062f \\u062a\\u062c\\u0631\\u064a\\u0628\\u064a  \",\"en\":\"new offer on auction \\u0645\\u0632\\u0627\\u062f \\u062a\\u062c\\u0631\\u064a\\u0628\\u064a\",\"url\":\"auction\\/71\\/\\u0645\\u0632\\u0627\\u062f \\u062a\\u062c\\u0631\\u064a\\u0628\\u064a\"}', NULL, '2023-09-28 04:13:14', '2023-09-28 04:13:14'),
('b0289689-aaad-439a-b3a3-a4f6d7f97071', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 asd504  \",\"en\":\"You have a new message from asd504\",\"url\":\"user\\/chat\\/\"}', '2023-04-18 11:37:42', '2023-03-31 04:42:52', '2023-04-18 11:37:42'),
('b0356e92-814b-49ec-a47b-b8e3e205c25f', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639  \",\"en\":\"new offer on auction \\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639\",\"url\":\"auction\\/57\\/\\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639\"}', NULL, '2023-05-14 19:03:51', '2023-05-14 19:03:51'),
('b03aabaf-9539-4ab1-acb7-1e77b9aeb66c', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f\",\"url\":\"user\\/chat\\/\"}', '2023-02-07 16:29:19', '2023-02-07 04:27:58', '2023-02-07 16:29:19'),
('b03c909f-fee1-4b7a-b628-4df86dd60c76', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-10-25 04:00:21', '2022-08-27 12:27:35', '2022-10-25 04:00:21'),
('b0b47f74-e50f-436f-bb3a-6be92f73865f', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2023-01-16 06:28:59', '2023-01-26 23:11:32'),
('b0cfbf83-d8d8-4896-82aa-06819fef7726', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 03:36:56', '2023-11-06 04:41:13'),
('b255b97f-a87b-4f66-a17e-d96d4a138556', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 moataz  \",\"en\":\"You have a new message from moataz\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-21 23:14:14', '2022-08-27 12:15:38'),
('b30b13c9-3975-4f7b-8def-a0ba7b6b7254', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-02-06 15:40:52', '2023-02-06 15:38:44', '2023-02-06 15:40:52'),
('b4223288-a5a1-4345-9abc-04205e41f47b', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-19 15:14:37', '2023-04-19 15:14:37'),
('b468a68c-59ca-4980-8376-13c96e287739', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0637\\u0644\\u0628 \\u0634\\u0631\\u0627\\u0621 \\u0642\\u064a\\u062f \\u0627\\u0644\\u062a\\u0646\\u0641\\u064a\\u0630 \\u0628\\u0631\\u0642\\u0645 1704  \",\"en\":\"You have a pending purchase order number 1704\",\"url\":\"user\\/orders\\/14\\/1704\"}', '2022-03-08 13:19:07', '2022-03-07 14:37:27', '2022-03-08 13:19:07'),
('b4a6b08e-f36d-4ec2-a2f4-d1b1128224e5', 'App\\Notifications\\BidNotification', 125, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 asd504  \",\"en\":\"You have a new message from asd504\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-03-31 04:43:40', '2023-03-31 04:43:40'),
('b4ba1970-0313-4936-b549-07a8f6be0011', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 04:13:52', '2023-04-18 04:13:52'),
('b63e8eb1-a1bb-4788-a627-ed2cfc21a445', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-05-11 15:18:06', '2023-11-06 04:41:13'),
('b6b7efed-bc1e-4954-9966-6b5668b1e5d1', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-05-04 06:33:29', '2023-05-04 06:33:29'),
('b78ac79e-7634-48d0-ae2a-c54089f8377d', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u0627\\u0628\\u0648 \\u062c\\u0648\\u0627\\u062f  \",\"en\":\"You have a new message from \\u0627\\u0628\\u0648 \\u062c\\u0648\\u0627\\u062f\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-03 02:17:16', '2023-11-06 04:41:13'),
('b7d8ee93-6781-41cf-80f3-5072a9b082f9', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-05-11 15:20:33', '2023-11-06 04:41:13'),
('b8a097b7-980d-4f41-9fa2-1d577f8ec5f4', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 testApp  \",\"en\":\"You have a new message from testApp\",\"url\":\"user\\/chat\\/\"}', '2022-12-26 01:57:47', '2022-12-26 01:57:46', '2022-12-26 01:57:47'),
('b8cafe2f-4b67-4d75-b71a-1b8962bfeb8c', 'App\\Notifications\\BidNotification', 116, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-02-07 04:26:07', '2023-02-07 04:25:23', '2023-02-07 04:26:07'),
('b9de5497-1679-4633-9e8e-0fece7f87d74', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-12-31 01:36:49', '2023-01-26 23:11:32'),
('ba0a4a56-0ba9-4429-9103-c1815af86c84', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-08-27 12:17:40', '2022-08-27 12:17:40'),
('ba2a2bf5-9c95-4c20-b4be-2e49e47d7a42', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 asd504  \",\"en\":\"You have a new message from asd504\",\"url\":\"user\\/chat\\/\"}', '2023-04-18 11:37:42', '2023-03-31 04:43:33', '2023-04-18 11:37:42'),
('ba93a766-3e2c-4bb9-ab6d-cf7abbe0c012', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-02-16 05:45:56', '2023-02-10 01:45:16', '2023-02-16 05:45:56'),
('bac661b1-219f-4d2c-8f0f-617e283857e3', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', '2022-12-31 02:19:06', '2022-12-31 02:13:59', '2022-12-31 02:19:06'),
('bb736034-d134-4d63-85d2-51fbca605258', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-19 15:14:50', '2023-04-19 15:14:50'),
('bb9ac18f-5e82-4b5d-927a-7b94042f2bf1', 'App\\Notifications\\BidNotification', 110, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-12-26 01:58:29', '2022-12-26 01:56:54', '2022-12-26 01:58:29'),
('bbaadcbc-1b38-4c3c-98d3-51c798603015', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', '2023-01-06 05:32:54', '2022-12-31 02:19:29', '2023-01-06 05:32:54'),
('bc19ee3a-e087-4602-a6e1-0491a1672454', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-19 07:12:34', '2023-02-19 07:12:34'),
('bc627b64-2205-4592-848e-7e1261ee8a50', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-12-26 01:55:48', '2023-01-26 23:11:32'),
('bcb52b43-b27d-48f5-b949-6b49412c831f', 'App\\Notifications\\BidNotification', 58, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-08-26 01:51:38', '2022-08-26 01:51:38'),
('bd037844-4082-4806-b468-f7201bdb9d64', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-26 01:50:33', '2022-08-27 12:15:38'),
('bd47c046-2944-4c4e-b841-f6a1f99b3962', 'App\\Notifications\\BidNotification', 116, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-16 07:56:32', '2023-02-16 07:56:32'),
('be2d824a-b78e-4b29-8891-49656fd9ae27', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:37:59', '2023-04-18 11:37:59'),
('be8165ea-90ac-4aca-8929-992b71d180e6', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631  \",\"en\":\"new offer on auction \\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631\",\"url\":\"auction\\/4\\/\\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631\"}', '2023-04-06 04:27:11', '2023-04-06 04:04:43', '2023-04-06 04:27:11'),
('bec48103-f74d-4916-8fd1-21d885049f32', 'App\\Notifications\\BidNotification', 62, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:37:58', '2023-04-18 11:37:58'),
('bef66ca6-6a40-46ed-96d7-12f222d4c26c', 'App\\Notifications\\BidNotification', 113, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-01-06 05:33:41', '2023-01-06 05:33:41'),
('bf15eb4f-b1bd-41a5-b94a-e57d77c12c3d', 'App\\Notifications\\BidNotification', 69, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-12-31 02:19:12', '2022-12-31 02:19:12'),
('bf590cf7-99a3-46e5-9324-6f02b5cf434c', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-10 01:46:56', '2023-02-10 01:46:56'),
('c09787cd-5743-48cd-9398-0706a1f75384', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u062c\\u0647\\u0627\\u0632 \\u0622\\u064a\\u0641\\u0648\\u0646 13 \\u0634\\u0628\\u0647 \\u062c\\u062f\\u064a\\u062f  \",\"en\":\"new offer on auction \\u062c\\u0647\\u0627\\u0632 \\u0622\\u064a\\u0641\\u0648\\u0646 13 \\u0634\\u0628\\u0647 \\u062c\\u062f\\u064a\\u062f\",\"url\":\"auction\\/5\\/\\u062c\\u0647\\u0627\\u0632 \\u0622\\u064a\\u0641\\u0648\\u0646 13 \\u0634\\u0628\\u0647 \\u062c\\u062f\\u064a\\u062f\"}', '2022-06-02 06:20:51', '2022-06-02 06:13:48', '2022-06-02 06:20:51'),
('c1ed02a9-9b5c-463b-91bb-6faa33de82ba', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-02-06 15:38:39', '2023-02-06 15:31:34', '2023-02-06 15:38:39'),
('c2988f52-16a7-4aa2-a357-e702941ff82f', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', '2022-12-31 02:19:06', '2022-12-31 02:18:02', '2022-12-31 02:19:06'),
('c2fd975e-3b9e-4b73-834f-363bba5ac9ac', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u0645\\u062d\\u0645\\u062f \\u0632\\u0627\\u0647\\u0631 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0644\\u0647 \\u0639\\u0644\\u064a \\u062e\\u0627\\u0644\\u062f  \",\"en\":\"You have a new message from \\u0645\\u062d\\u0645\\u062f \\u0632\\u0627\\u0647\\u0631 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0644\\u0647 \\u0639\\u0644\\u064a \\u062e\\u0627\\u0644\\u062f\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-10-29 19:17:24', '2023-01-26 23:11:32'),
('c3cc7ea6-c6a3-4f1c-ba4a-2a1251c29824', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:37:48', '2023-04-18 11:37:48'),
('c412a4d1-ec89-4b2b-85f7-757e5304ceed', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u062c\\u0647\\u0627\\u0632 \\u0622\\u064a\\u0641\\u0648\\u0646 13 \\u0634\\u0628\\u0647 \\u062c\\u062f\\u064a\\u062f 2  \",\"en\":\"new offer on auction \\u062c\\u0647\\u0627\\u0632 \\u0622\\u064a\\u0641\\u0648\\u0646 13 \\u0634\\u0628\\u0647 \\u062c\\u062f\\u064a\\u062f 2\",\"url\":\"auction\\/13\\/\\u062c\\u0647\\u0627\\u0632 \\u0622\\u064a\\u0641\\u0648\\u0646 13 \\u0634\\u0628\\u0647 \\u062c\\u062f\\u064a\\u062f 2\"}', '2023-01-16 06:29:33', '2023-01-16 06:28:09', '2023-01-16 06:29:33'),
('c4cd97d1-d46b-4198-8de7-1c9f4ee7dda2', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-26 01:35:35', '2022-08-27 12:15:38'),
('c5700c80-d6f9-46fb-b457-c89c9757f5c0', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u0644\\u0627\\u0633\\u0641 \\u062a\\u0645 \\u0627\\u0644\\u063a\\u0627\\u0621 \\u0627\\u0644\\u0637\\u0644\\u0628 \\u0631\\u0642\\u0645 4467  \",\"en\":\"Unfortunately, the order number has been cancelled. 4467\",\"url\":\"user\\/orders\\/16\\/4467\"}', '2022-03-08 13:43:52', '2022-03-08 13:32:29', '2022-03-08 13:43:52'),
('c69cc41f-5694-4983-9a9b-b2316de629c3', 'App\\Notifications\\BidNotification', 98, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f test  \",\"en\":\"new offer on auction test\",\"url\":\"auction\\/68\\/test\"}', NULL, '2023-07-30 05:48:53', '2023-07-30 05:48:53'),
('c7795109-5b3d-46d2-99f6-0260d056e100', 'App\\Notifications\\BidNotification', 62, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-26 13:05:26', '2022-08-26 01:52:59', '2022-08-26 13:05:26'),
('c78d1012-9ab2-44d7-b1f3-6903b5c79443', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u062c\\u0645\\u0633 \\u062a\\u0627\\u0647\\u0648 \\u0644\\u0644\\u0628\\u064a\\u0639  \",\"en\":\"new offer on auction \\u062c\\u0645\\u0633 \\u062a\\u0627\\u0647\\u0648 \\u0644\\u0644\\u0628\\u064a\\u0639\",\"url\":\"auction\\/6\\/\\u062c\\u0645\\u0633 \\u062a\\u0627\\u0647\\u0648 \\u0644\\u0644\\u0628\\u064a\\u0639\"}', '2022-08-26 01:34:09', '2022-08-21 23:05:01', '2022-08-26 01:34:09'),
('c8bb8688-88bd-4ddf-9862-0467c8216721', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-08-27 12:17:58', '2022-08-27 12:17:58'),
('c91ed9e3-3ff0-464e-a8d7-821337b31749', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0645\\u0637\\u0639\\u0645 \\u0644\\u0644\\u0628\\u064a\\u0639  \",\"en\":\"new offer on auction \\u0645\\u0637\\u0639\\u0645 \\u0644\\u0644\\u0628\\u064a\\u0639\",\"url\":\"auction\\/17\\/\\u0645\\u0637\\u0639\\u0645 \\u0644\\u0644\\u0628\\u064a\\u0639\"}', '2023-04-03 19:14:12', '2023-02-19 04:58:39', '2023-04-03 19:14:12'),
('c924e5ff-f9ab-4a61-b148-ffba20a93910', 'App\\Notifications\\BidNotification', 110, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-12-26 01:58:30', '2022-12-26 01:56:37', '2022-12-26 01:58:30'),
('ca45f172-265b-4b6b-bd5e-fd96936fd36f', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-10 01:45:07', '2023-02-10 01:45:07'),
('ca5aecc9-34ce-48e2-a2a2-7d6f9cee4929', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0645\\u0637\\u0639\\u0645 \\u0644\\u0644\\u0628\\u064a\\u0639  \",\"en\":\"new offer on auction \\u0645\\u0637\\u0639\\u0645 \\u0644\\u0644\\u0628\\u064a\\u0639\",\"url\":\"auction\\/17\\/\\u0645\\u0637\\u0639\\u0645 \\u0644\\u0644\\u0628\\u064a\\u0639\"}', '2023-05-12 23:02:20', '2023-05-08 01:07:56', '2023-05-12 23:02:20'),
('cd71a001-81b4-40b7-9d29-802c2cd57c88', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-10 01:21:31', '2023-02-10 01:21:31'),
('ce69055a-1111-4e93-b074-e8d0aab514e8', 'App\\Notifications\\BidNotification', 69, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-12-31 02:19:07', '2022-12-31 02:19:07'),
('d0660cd9-2892-4829-aa6d-36bd23617607', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', '2022-12-31 02:19:06', '2022-12-31 02:14:31', '2022-12-31 02:19:06'),
('d069a723-fd8c-4ff2-b58e-ca385c74318e', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-23 02:31:06', '2022-08-27 12:15:38'),
('d0860788-8c57-4d43-95cd-391d5f279998', 'App\\Notifications\\BidNotification', 167, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0643\\u0627\\u0633\\u0627\\u062a \\u0634\\u0627\\u064a \\u062a\\u0631\\u0643\\u064a  \",\"en\":\"new offer on auction \\u0643\\u0627\\u0633\\u0627\\u062a \\u0634\\u0627\\u064a \\u062a\\u0631\\u0643\\u064a\",\"url\":\"auction\\/74\\/\\u0643\\u0627\\u0633\\u0627\\u062a \\u0634\\u0627\\u064a \\u062a\\u0631\\u0643\\u064a\"}', NULL, '2023-09-28 05:10:18', '2023-09-28 05:10:18'),
('d1c27d37-59fa-459b-8231-6b70db8f223f', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-05-11 15:18:22', '2023-11-06 04:41:13'),
('d219e47e-13f9-4243-ae1c-1eb470e7a333', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631  \",\"en\":\"new offer on auction \\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631\",\"url\":\"auction\\/4\\/\\u0627\\u0631\\u0636 \\u0628\\u0627\\u0648\\u0634\\u064a\\u0642\\u0631\"}', '2022-12-26 01:52:16', '2022-12-04 21:27:43', '2022-12-26 01:52:16'),
('d258d1a9-3256-4487-bd49-e81bc27dbc6e', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u0645\\u062d\\u0645\\u062f \\u0632\\u0627\\u0647\\u0631 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0644\\u0647 \\u0639\\u0644\\u064a \\u062e\\u0627\\u0644\\u062f  \",\"en\":\"You have a new message from \\u0645\\u062d\\u0645\\u062f \\u0632\\u0627\\u0647\\u0631 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0644\\u0647 \\u0639\\u0644\\u064a \\u062e\\u0627\\u0644\\u062f\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-10-30 20:00:43', '2023-01-26 23:11:32'),
('d2ca4d08-d770-4ed7-ad44-1b5ee5823ee8', 'App\\Notifications\\BidNotification', 62, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2022-09-02 17:05:39', '2022-08-27 12:17:28', '2022-09-02 17:05:39'),
('d4009f4b-a2ea-46db-9e86-43f653143435', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-12-31 02:17:38', '2023-01-26 23:11:32'),
('d53c3c0e-8f1d-4531-8698-cbcc96cc51fe', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 moataz  \",\"en\":\"You have a new message from moataz\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-26 13:11:00', '2022-08-27 12:15:38'),
('d55c7de7-5b59-4158-ad9d-d85283086010', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 testApp  \",\"en\":\"You have a new message from testApp\",\"url\":\"user\\/chat\\/\"}', '2022-12-26 02:06:13', '2022-12-26 01:59:43', '2022-12-26 02:06:13'),
('d6a23f40-f9c1-4894-a8e7-e30b3be35af1', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', '2023-01-06 05:32:54', '2022-12-31 02:19:15', '2023-01-06 05:32:54'),
('d6e8e620-f5c6-4eed-b837-68b6ee1b7c77', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2023-01-06 10:18:07', '2023-01-26 23:11:32'),
('d976ac09-8169-420b-a966-c625e6a0a062', 'App\\Notifications\\BidNotification', 69, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-10-25 04:38:19', '2022-10-25 04:38:19'),
('da05b183-abc5-46fa-95d7-66fbad0467c2', 'App\\Notifications\\BidNotification', 58, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-08-26 01:50:19', '2022-08-26 01:50:19'),
('dc90e5e9-a705-4209-8a02-dadeb24e7f4e', 'App\\Notifications\\BidNotification', 62, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-26 13:05:26', '2022-08-26 01:50:39', '2022-08-26 13:05:26'),
('dcdcb128-7a78-4f0e-880b-b9e0baae9c6e', 'App\\Notifications\\BidNotification', 62, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-26 13:05:26', '2022-08-26 01:50:25', '2022-08-26 13:05:26'),
('de134b05-3694-41fc-beaf-ac61619618e8', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f\",\"url\":\"user\\/chat\\/\"}', '2023-02-07 16:29:19', '2023-02-07 04:25:40', '2023-02-07 16:29:19'),
('df76b53e-fdfc-4f39-9c18-a4f86706adca', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-05-11 15:17:08', '2023-11-06 04:41:13'),
('dfaf0819-bab6-486c-a0cb-e352b34d00a0', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-26 01:50:08', '2022-08-27 12:15:38'),
('e15ec4e3-518d-4cf5-a480-cc677acc9248', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 moataz  \",\"en\":\"You have a new message from moataz\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-11-24 05:49:42', '2023-01-26 23:11:32'),
('e30db640-1fae-4262-8a8f-0f6c237b9132', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2023-01-16 06:30:53', '2023-01-26 23:11:32'),
('e4ea5281-6148-43c0-8a12-63541dc5ec1c', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u0627\\u0628\\u0648 \\u062c\\u0648\\u0627\\u062f  \",\"en\":\"You have a new message from \\u0627\\u0628\\u0648 \\u062c\\u0648\\u0627\\u062f\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-03 02:17:36', '2023-11-06 04:41:13'),
('e54367b8-74ba-4f88-940d-0865a8ee72c5', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:51:29', '2023-04-18 11:51:29'),
('e7eeb010-dbcb-44e9-9a80-8a125b812ac2', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:51:07', '2023-04-18 11:51:07'),
('e895c1d4-480f-4f03-a481-489b406e98a0', 'App\\Notifications\\BidNotification', 116, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-04-18 11:37:57', '2023-04-18 11:37:57'),
('e961a731-a354-49c2-bf53-1cf37e6cc8ed', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-02-16 07:55:25', '2023-02-16 07:53:13', '2023-02-16 07:55:25'),
('ea0bd8d9-d666-4da8-a8fd-c4b3ef966ff0', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2023-01-06 05:32:57', '2023-01-26 23:11:32'),
('ea803cf3-84aa-42d1-b768-e36af86c38fb', 'App\\Notifications\\BidNotification', 209, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f test  \",\"en\":\"new offer on auction test\",\"url\":\"auction\\/78\\/test\"}', NULL, '2023-11-08 19:49:14', '2023-11-08 19:49:14'),
('eaed9051-508b-4898-8ed3-15a45104a6ab', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-10-25 04:27:39', '2022-10-25 04:01:02', '2022-10-25 04:27:39'),
('ec3a5b31-f59f-4b5b-b856-7de63871e050', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2022-08-27 12:15:38', '2022-08-26 01:37:37', '2022-08-27 12:15:38'),
('ec4241b9-bbad-4a7c-9e80-54a944f5d573', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-04-18 15:06:26', '2023-04-18 11:52:10', '2023-04-18 15:06:26'),
('ee06dea4-5b9c-491a-9261-240b07c23c29', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-08-27 12:17:32', '2022-08-27 12:17:32'),
('ef87122f-37e8-483e-98ca-0b262e129e5a', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-12-26 01:56:31', '2023-01-26 23:11:32'),
('f09d18b2-7261-435a-902e-b47263c8c481', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u0645\\u062d\\u0645\\u062f \\u0632\\u0627\\u0647\\u0631 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0644\\u0647 \\u0639\\u0644\\u064a \\u062e\\u0627\\u0644\\u062f  \",\"en\":\"You have a new message from \\u0645\\u062d\\u0645\\u062f \\u0632\\u0627\\u0647\\u0631 \\u0639\\u0628\\u062f\\u0627\\u0644\\u0644\\u0647 \\u0639\\u0644\\u064a \\u062e\\u0627\\u0644\\u062f\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2022-10-29 19:22:01', '2023-01-26 23:11:32'),
('f0ca44a9-45e3-457b-bccc-e378ef9ad590', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 03:54:58', '2023-11-06 04:41:13'),
('f126fda8-3ccc-4658-bb9c-8177303a2284', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0639\\u0631\\u0628\\u064a\\u0629 \\u0641\\u0648\\u0631\\u062f \\u0644\\u0644\\u0628\\u064a\\u0639 \\u0628\\u0627\\u0644\\u0645\\u0632\\u0627\\u062f  \",\"en\":\"new offer on auction \\u0639\\u0631\\u0628\\u064a\\u0629 \\u0641\\u0648\\u0631\\u062f \\u0644\\u0644\\u0628\\u064a\\u0639 \\u0628\\u0627\\u0644\\u0645\\u0632\\u0627\\u062f\",\"url\":\"auction\\/2\\/\\u0639\\u0631\\u0628\\u064a\\u0629 \\u0641\\u0648\\u0631\\u062f \\u0644\\u0644\\u0628\\u064a\\u0639 \\u0628\\u0627\\u0644\\u0645\\u0632\\u0627\\u062f\"}', '2022-03-08 13:19:07', '2022-02-28 19:20:26', '2022-03-08 13:19:07'),
('f24478b8-df33-4c1f-9ceb-1de26981bf36', 'App\\Notifications\\BidNotification', 69, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-10-25 04:37:02', '2022-10-25 04:37:02'),
('f5cd556c-b942-47df-811f-0e695d4747a5', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Mohamed  \",\"en\":\"You have a new message from Mohamed\",\"url\":\"user\\/chat\\/\"}', '2023-11-06 04:41:13', '2023-06-06 03:56:38', '2023-11-06 04:41:13'),
('f63c9580-d617-4a89-b59b-d1da4f160cf9', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 Asd995  \",\"en\":\"You have a new message from Asd995\",\"url\":\"user\\/chat\\/\"}', '2022-12-31 02:19:06', '2022-12-31 02:18:54', '2022-12-31 02:19:06'),
('f67fd1e7-40b0-4cd2-8f90-50a990a7c4df', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2023-01-16 06:29:42', '2023-01-26 23:11:32'),
('f7bda0ed-ca44-448a-83c6-9cd977ee15b8', 'App\\Notifications\\BidNotification', 55, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-01-16 06:29:26', '2023-01-16 06:29:26'),
('f7fa5f2c-ae73-451b-a67a-ef0944a9b8a9', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-16 05:36:00', '2023-02-16 05:36:00'),
('f87d8174-4907-43d6-9260-220f67b3aae6', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', '2023-02-06 15:41:15', '2023-02-06 15:40:21', '2023-02-06 15:41:15'),
('fb4ac3d6-be35-4c95-a0f1-93a35fac8e0e', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-05-01 04:38:41', '2023-05-01 04:38:41'),
('fb600b81-9d52-4bb3-834f-29570d9763dd', 'App\\Notifications\\BidNotification', 69, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2022-10-29 03:21:50', '2022-10-29 03:21:50'),
('fdf5d6bc-735b-40b2-b7a1-064d6eb7136d', 'App\\Notifications\\BidNotification', 59, 'App\\User', '{\"ar\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u0636 \\u062c\\u062f\\u064a\\u062f \\u0639\\u0644\\u064a \\u0645\\u0632\\u0627\\u062f \\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639  \",\"en\":\"new offer on auction \\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639\",\"url\":\"auction\\/57\\/\\u0634\\u0642\\u0629 \\u0641\\u0627\\u062e\\u0631\\u0629 \\u0644\\u0644\\u0628\\u064a\\u0639\"}', NULL, '2023-05-16 15:30:51', '2023-05-16 15:30:51');
INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('ff911ebc-379b-4516-bd4a-ed75a48e744f', 'App\\Notifications\\BidNotification', 56, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 admin  \",\"en\":\"You have a new message from admin\",\"url\":\"user\\/chat\\/\"}', NULL, '2023-02-16 07:53:43', '2023-02-16 07:53:43'),
('ffa67155-384b-42c0-b649-6d6f6316d2f8', 'App\\Notifications\\BidNotification', 1, 'App\\User', '{\"ar\":\"\\u0644\\u062f\\u064a\\u0643 \\u0631\\u0633\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u0646 \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a  \",\"en\":\"You have a new message from \\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u0643\\u064a\",\"url\":\"user\\/chat\\/\"}', '2023-01-26 23:11:32', '2023-01-16 06:30:22', '2023-01-26 23:11:32');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `status` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `user_id`, `amount`, `auction_id`, `status`, `created_at`, `updated_at`) VALUES
(67, 162, 20.00, 96, 'delivered', '2023-12-05 08:28:30', NULL),
(68, 166, 300.00, 97, 'delivered', '2023-12-05 12:44:02', NULL),
(69, 201, 200.00, 98, 'delivered', '2023-12-05 13:03:54', NULL),
(70, 166, 200.00, 96, 'pending', '2023-12-05 13:27:30', NULL),
(71, 162, 500.00, 99, 'waiting', '2023-12-05 18:17:20', NULL),
(72, 170, 450.00, 99, 'delivered', '2023-12-05 18:18:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_number` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` enum('operation','done','canceled') NOT NULL,
  `comment` text DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `rate_comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `seller_id`, `ad_id`, `amount`, `status`, `comment`, `rate`, `rate_comment`, `created_at`, `updated_at`) VALUES
(15, 8721, 55, 56, 7, 200, 'done', NULL, NULL, NULL, '2022-03-08 12:31:00', '2022-03-08 12:34:15'),
(16, 4467, 55, 56, 11, 342, 'canceled', NULL, NULL, NULL, '2022-03-08 13:28:36', '2022-03-08 13:32:29'),
(17, 2895, 55, 56, 11, 342, 'operation', NULL, NULL, NULL, '2022-06-14 00:21:58', '2022-06-14 00:21:58');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('dev.mohamedreda@gmail.com', '$2y$10$eOCt08hlSQa.xow6F0.iL.5ni7TUVP7EuHdWD7nPKXK4.wgdQUfU2', '2017-09-30 18:09:32'),
('dev.mohamedreda@gmail.com', '$2y$10$eOCt08hlSQa.xow6F0.iL.5ni7TUVP7EuHdWD7nPKXK4.wgdQUfU2', '2017-09-30 18:09:32'),
('my.bussnice@gmail.com', '$2y$10$sPoDNwDAIXt3Z1oSG6YVY.KAn70ABC4kLfT.oLNiaYt0mmtdOTN..', '2022-05-16 19:02:02'),
('phplovers52@gmail.com', '$2y$10$vThXBwMMSuBW6ufkpkLKmO..JRsLthSDYGIDRtQbf6RNB8QOZwW8e', '2022-06-14 23:47:48'),
('phplovers52@gmail.com', '20idL7hS3ued1RZrDrHZ3dAuIuBlPNGJPpQpzzp2tXHvPExl9XPvuKsomDjw5kcH', '2022-06-15 20:29:49'),
('moh.zahir.mz@gmail.com', 'BP8yILLx7c7hGnmIWyGRbe05YB7vN87v1zdMa9joH3KY1CysKtaxgawj7MmKyNQi', '2022-10-27 14:17:52'),
('moh.zahir.mz@gmail.com', 'z6cual0NmkvDRBgdWfBZQcolpNKyfBnHb4HWmeWnIavtV8MeQzBHTYZpCo7kL1Cw', '2022-11-17 15:12:20'),
('moh.zahir.mz@gmail.com', 'VzlhcOPbjGlh6fTdq1yHgX2mzuGEmS6HChL8f25D7bOUFCuZEruNOkEaLov6foPR', '2022-11-17 17:56:05'),
('moh.zahir.mz@gmail.com', '6yCxAShWancir3M2xE8CGbjluwkhBuWmjkrqJx4FOBUUe3y6dfJPNEZr2oUPGqJG', '2022-11-17 18:02:53'),
('my.bussnice@gmail.com', 'xSWVZTnppwO1Ir20cbnasrFcdDPlN48UjkjiBBxMMQ23bmTSnV3kHnGCy3kfBYgg', '2023-02-14 16:20:06'),
('mo@mo.com', 'EsFjy80Jw3x92VZ1XDXysK1zKp45kxqOXR0YJXz3OEcqYfwaaN5hoTuimoRQcMXH', '2023-04-11 02:49:07'),
('mo@mo.com', 'DdtGfDPcBexiTHDNmb7iN4BLwdhVvuj6nluluUBSQ8urMGxnifDo3AIf79FtcXtm', '2023-04-24 04:15:50'),
('mo@mo.com', 'kZFgrd8ZCAgCuLYgwPqLEhFZEi0IQBxfzIug30geLbksl1VvMm7x1bKInLl4keyd', '2023-04-24 04:19:24'),
('mahmoud.elshwaiukh@gmail.com', 'XkVYWFk2CjVcepxr6hbGLdXBlDbqWpZJ1ycyhW4c8B8LVBg9CUiXnm9YE3QDi5SO', '2023-05-18 06:27:56'),
('My.bussnice@gmail.com', 'xA6yvVTbdC4Ry2dcGvDvZqkGzGEx8oFhmLV88bkwY2mNt4bmgz6kNPW12OyMfbas', '2023-05-18 06:28:59'),
('mahmoud.elshwaiukh@gmail.com', 'iyyMXVNrjCZ82RMrKmefJboZsnnqbIA24zuMSnuFhAcxQZBz4yCVVd0xzQ3dA0if', '2023-05-19 04:30:12'),
('mahmoud.elshwaiukh@gmail.com', 'jT8Wbib4DeVVkxTwVfUXbxieKgNdhG3Jf7MRBpDyruyMBEEHtpaIoyaqNbvLBIIa', '2023-05-19 04:38:14');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `pay_number` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `net` double DEFAULT NULL,
  `type` enum('ad','auction') DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `reciver_id` int(11) DEFAULT NULL,
  `status` enum('pending','done','cancel') NOT NULL DEFAULT 'pending',
  `time` int(11) DEFAULT NULL,
  `comment` varchar(199) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `pay_number`, `amount`, `net`, `type`, `order_id`, `user_id`, `reciver_id`, `status`, `time`, `comment`, `created_at`, `updated_at`) VALUES
(50, 3456, 200, 196, NULL, 15, 55, 56, 'done', 1647952456, NULL, '2022-03-08 12:31:01', '2022-03-08 12:34:16'),
(51, 3453, 342, 335.16, NULL, 16, 55, 56, 'cancel', NULL, NULL, '2022-03-08 13:28:36', '2022-03-08 13:32:29'),
(52, 1385, 342, 335.16, NULL, 17, 55, 56, 'pending', NULL, NULL, '2022-06-14 00:21:58', '2022-06-14 00:21:58');

-- --------------------------------------------------------

--
-- Table structure for table `payment_process`
--

CREATE TABLE `payment_process` (
  `payment_id` int(11) NOT NULL,
  `payment_token` text NOT NULL,
  `payment_type` text NOT NULL,
  `payment_status` text NOT NULL,
  `payment_gateway` text NOT NULL,
  `amount` text NOT NULL,
  `user_id` text NOT NULL,
  `created_at` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_process`
--

INSERT INTO `payment_process` (`payment_id`, `payment_token`, `payment_type`, `payment_status`, `payment_gateway`, `amount`, `user_id`, `created_at`) VALUES
(3, '07072782196171633773', 'deposite', 'success', 'myfatoorah', '150', '163', '2023-09-26 12:26:14pm'),
(4, '07072782244171635072', 'deposite', 'success', 'myfatoorah', '150', '163', '2023-09-26 01:11:07pm'),
(5, 'none', 'withdraw', 'pending', 'none', '450', '163', 'Tue Sep 26 2023 22:27:46 GMT+0300'),
(6, '07072782284171638073', 'deposite', 'success', 'myfatoorah', '150', '162', '2023-09-26 02:53:01pm'),
(7, '07072785765171706974', 'deposite', 'success', 'myfatoorah', '150', '163', '2023-09-27 03:40:45am'),
(8, '07072787580171765974', 'deposite', 'success', 'myfatoorah', '150', '', '2023-09-27 03:59:20pm'),
(9, '07072787582171766174', 'deposite', 'success', 'myfatoorah', '150', '', '2023-09-27 04:01:00pm'),
(10, 'none', 'withdraw', 'pending', 'none', '200', '163', 'Thu Sep 28 2023 01:01:33 GMT+0300'),
(11, 'none', 'withdraw', 'pending', 'none', '200', '163', 'Thu Sep 28 2023 01:01:33 GMT+0300'),
(12, '07072831458172441572', 'deposite', 'success', 'myfatoorah', '150', '170', '2023-10-07 04:00:00pm'),
(13, '07072831460172441672', 'deposite', 'success', 'myfatoorah', '150', '170', '2023-10-07 04:09:25pm'),
(14, '07072858076173000071', 'deposite', 'success', 'myfatoorah', '150', '201', '2023-10-13 07:15:20am'),
(15, '07072858103173001171', 'deposite', 'success', 'myfatoorah', '150', '201', '2023-10-13 07:17:36am'),
(16, 'none', 'withdraw', 'pending', 'none', '100', '201', 'Fri Oct 13 2023 16:18:51 GMT+0300'),
(17, '07072969209177066774', 'deposite', 'success', 'myfatoorah', '150', '211', '2023-11-02 03:38:39am'),
(18, '07072969221177067373', 'deposite', 'success', 'myfatoorah', '150', '211', '2023-11-02 03:40:51am'),
(19, '07072969237177068274', 'deposite', 'success', 'myfatoorah', '150', '211', '2023-11-02 03:44:02am'),
(20, '07072969245177068574', 'deposite', 'success', 'myfatoorah', '400', '211', '2023-11-02 03:46:08am'),
(21, '07072969308177071974', 'deposite', 'success', 'myfatoorah', '500', '211', '2023-11-02 03:59:22am'),
(22, '07072996101177678774', 'deposite', 'success', 'myfatoorah', '500', '214', '2023-11-08 03:12:40am'),
(23, '07072996120177679474', 'deposite', 'success', 'myfatoorah', '59788', '214', '2023-11-08 03:16:34am'),
(24, 'none', 'withdraw', 'pending', 'none', '500', '201', 'Mon Nov 20 2023 15:06:29 GMT+0300'),
(25, '07073050874178950473', 'deposite', 'success', 'myfatoorah', '30000', '220', '2023-11-20 02:58:58pm'),
(26, '07073103314180162771', 'deposite', 'success', 'myfatoorah', '10000', '166', '2023-12-01 04:33:19pm'),
(27, '', 'withdraw', '', '', '500', '170', 'December 5, 2023, 12:47 am'),
(28, '', 'deposite', '', '', '500', '162', 'December 5, 2023, 12:47 am'),
(29, '', 'withdraw', '', '', '20.00', '162', 'December 5, 2023, 1:32 am'),
(30, '', 'deposite', '', '', '20.00', '170', 'December 5, 2023, 1:32 am'),
(31, '07073121063180585972', 'deposite', 'success', 'myfatoorah', '100000', '201', '2023-12-05 05:59:43am'),
(32, '', 'withdraw', '', '', '500', '166', 'December 5, 2023, 11:14 am'),
(33, '', 'deposite', '', '', '500', '162', 'December 5, 2023, 11:14 am'),
(34, '', 'withdraw', '', '', '450.00', '170', 'December 5, 2023, 11:22 am'),
(35, '', 'deposite', '', '', '450.00', '166', 'December 5, 2023, 11:22 am'),
(36, '', 'withdraw', '', '', '5685', '214', 'December 11, 2023, 4:59 am'),
(37, '', 'deposite', '', '', '5685', '170', 'December 11, 2023, 4:59 am'),
(38, '', 'withdraw', '', '', '5685', '214', 'December 11, 2023, 6:04 am'),
(39, '', 'deposite', '', '', '5685', '170', 'December 11, 2023, 6:04 am'),
(40, '', 'withdraw', '', '', '100', '170', 'December 11, 2023, 2:17 pm'),
(41, '', 'deposite', '', '', '100', '166', 'December 11, 2023, 2:17 pm'),
(42, '', 'withdraw', '', '', '100', '201', 'December 11, 2023, 3:38 pm'),
(43, '', 'deposite', '', '', '100', '170', 'December 11, 2023, 3:38 pm');

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `rate` char(5) NOT NULL,
  `rate_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0 for ads,1 for auction',
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `user_id`, `rate`, `rate_id`, `type`, `comment`, `created_at`, `updated_at`) VALUES
(5, 56, '5', 17, 1, 'sdsddds', '2023-05-08 01:14:42', '2023-05-08 01:14:42'),
(6, 56, '5', 17, 1, 'this is new rate', '2023-05-08 01:15:38', '2023-05-08 01:15:38');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(99) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `owner_id`, `order_id`, `rate`, `details`, `type`, `created_at`, `updated_at`) VALUES
(8, 56, 55, 15, 4, 'شكرا لك اخي الكريم', NULL, '2022-03-10 17:52:03', '2022-03-10 17:52:03');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `name` text NOT NULL,
  `role` text NOT NULL,
  `status` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `name`, `role`, `status`, `created_at`) VALUES
(6, 'مدير النظام', 'super_admin', 'users, departments, banner, ads, auctions, finance, managment', '', '2024-02-17 22:26:06'),
(7, 'مدير', 'admin', 'users, departments, banner, ads, auctions, finance, managment', '', '2024-02-17 22:26:32'),
(8, 'محرر', 'editor', 'users, departments, banner, ads, auctions', '', '2024-02-17 22:27:14');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(8, '{\"ar\":\"تبريد وتكييف\",\"en\":\"air condation\"}', '', 'active', '2022-01-24 14:38:10', '2022-03-13 10:07:23'),
(9, '{\"ar\":\"مصاعد\",\"en\":\"elevator\"}', '', 'active', '2022-01-24 14:38:46', '2022-03-13 10:07:51'),
(10, '{\"ar\":\"المرآب\",\"en\":\"Garage/Parking\"}', '', 'active', '2022-01-24 14:39:22', '2022-01-24 14:39:22'),
(11, '{\"ar\":\"الألواح الشمسية\",\"en\":\"Solar Panels\"}', '', 'active', '2022-01-24 14:39:57', '2022-01-24 14:39:57');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `ob_key` text NOT NULL,
  `val` text NOT NULL,
  `last_update` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `ob_key`, `val`, `last_update`) VALUES
(1, 'phone_number', '2462486', '2024-02-10 01:44:25'),
(2, 'email', 'info@most3mal.com', '2024-02-10 01:44:25'),
(3, 'app_name', 'تطبيق مستعمل', '2024-02-10 01:45:07'),
(4, 'facebook', 'thgrfe', '2024-02-10 02:08:31'),
(5, 'youtube', '', '2024-02-10 02:08:31'),
(6, 'instagram', '', '2024-02-10 02:08:31'),
(7, 'x', 'hgfd', '2024-02-10 02:08:31'),
(8, 'snapchat', 'dfgjhkl', '2024-02-10 02:08:31'),
(9, 'privacy', '', '2024-02-10 02:42:49'),
(10, 'how_to_use', '', '2024-02-10 02:42:49'),
(11, 'address', '', '2024-02-10 02:43:08');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `login_color` varchar(200) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `admin_path` varchar(191) DEFAULT NULL,
  `admin_theme` varchar(191) DEFAULT NULL,
  `website_theme` varchar(191) DEFAULT NULL,
  `language` enum('en','ar') DEFAULT NULL,
  `multi_lang` enum('yes','no') DEFAULT NULL,
  `commission` int(11) DEFAULT NULL,
  `website_status` enum('open','closed') DEFAULT NULL,
  `allow_admin_theme` enum('yes','no') DEFAULT NULL,
  `allow_website_theme` enum('yes','no') DEFAULT NULL,
  `close_message` longtext DEFAULT NULL,
  `allow_register` enum('yes','no') DEFAULT NULL,
  `session_timeout` varchar(50) DEFAULT NULL,
  `copy_right` varchar(199) NOT NULL DEFAULT 'Alweseemy',
  `facebook` varchar(255) DEFAULT NULL,
  `How_does_work` text DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `googleplus` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `footer_desc` text DEFAULT NULL,
  `home_image` varchar(225) DEFAULT NULL,
  `home_pageTitle` varchar(199) DEFAULT NULL,
  `home_pageDesc` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `proccessing_fee` double DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `email`, `phone`, `mobile`, `color`, `login_color`, `logo`, `icon`, `keywords`, `description`, `address`, `admin_path`, `admin_theme`, `website_theme`, `language`, `multi_lang`, `commission`, `website_status`, `allow_admin_theme`, `allow_website_theme`, `close_message`, `allow_register`, `session_timeout`, `copy_right`, `facebook`, `How_does_work`, `twitter`, `googleplus`, `linkedin`, `footer_desc`, `home_image`, `home_pageTitle`, `home_pageDesc`, `created_at`, `proccessing_fee`, `updated_at`) VALUES
(1, '{\"ar\":\"مستعمل . كوم\",\"en\":\"mestamal.com\"}', 'mestamal@gmail.com', '0534691112', '0534691112', NULL, '#012f7b', 'images/83381647705434.png', 'images/15771642873378.png', '{\"ar\":\"هذا اختبار هذا اختبار هذا اختبار\",\"en\":null}', '{\"ar\":\"<p><strong>شروط الخدمة</strong></p>\\r\\n\\r\\n<p>القبول بشروط الاستخدام :</p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>توضح هذه الصفحة شروط الاستخدام التي تتيح لك إدارة الموقع بموجبها الدخول إلى الموقع واستخدامه، سواء بصفة زائر أو مستخدم مسجل. لذلك نرجو قراءة شروط الاستخدام هذه بعناية قبل أن تبدأ باستخدام الموقع<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>وبمجرد دخولك إلى الموقع واستخدامك إياه، تكون قد قبلت بشروط الاستخدام هذه ووافقت على الالتزام بها<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>وإذا لم توافق على هذه الشروط، فلا يسمح لك باستخدام الموقع<span dir=\\\"LTR\\\">. </span></li>\\r\\n\\t<li>في حال استخدم المشتري حساب مسروق بموقع مستعمل . كوم سيتم إلغاء المعاملة بين الطرفين ( المعلن والمشتري ) والخصم من المعلن والمشتري <span dir=\\\"LTR\\\">.</span></li>\\r\\n</ul>\\r\\n\\r\\n<p>تتغير شروط الاستخدام من حين لآخر، وفي حالة إجراء مثل هذه التغييرات يجب على مستخدم الموقع متابعة تحديثات الشروط والأحكام للإطلاع على كل جديد . استمرار المُستخدِم في استعمال الموقع الإلكتروني <strong>مستعمل</strong>.<strong> كوم</strong> قائم على قبول شروط وأحكام الاستخدام هذه، حسب ما يجري تعديلها من وقت لآخر من أجل معاملة أفضل وجودة أعلى. أي مخالفة لهذه الاتفاقية من قبل العميل<span dir=\\\"LTR\\\"> / </span>المشترك ستعرض حسابه للإيقاف أو الحذف بدون إشعار مسبق ودون استرجاع أي مبالغ مالية ولا يحق له المطالبة بها .</p>\\r\\n\\r\\n<p><br />\\r\\n<strong>انتفاء المسؤولية القانونية</strong> :<br />\\r\\nيقر المُستخدِم بأنه المسؤول الوحيد عن طبيعة الاستخدام الذي يحدده للموقع الإلكتروني <strong>مستعمل</strong>.<strong>كوم</strong> ، وتخلي إدارة موقع <strong>مستعمل</strong>.<strong> كوم من طرفها&nbsp; </strong>، إلى أقصى مدى يجيزه القانون، من كامل المسؤولية عن أية خسائر أو أضرار أو نفقات أو مصاريف يتكبدها مستخدمي الموقع ( المعلن والمشتري ) أو يتعرضون لها هم أو أي طرف آخر من جراء استخدام الموقع الإلكتروني <strong>مستعمل</strong>.<strong>كوم </strong>، أو العجز عن استخدامه لأي ظرف كان <span dir=\\\"LTR\\\">.</span></p>\\r\\n\\r\\n<p><br />\\r\\n<strong>حالات انقطاع المعاملة والسهو والخطأ في الموقع الإلكتروني مستعمل. كوم</strong> :</p>\\r\\n\\r\\n<p><br />\\r\\nتبذل إدارة الموقع قصارى جهدها للحرص والحفاظ على استمرار عمل الموقع الإلكتروني بدون مشاكل وتوفر للمستخدم أعلى درجات الحماية ، رغم ذلك قد تقع في أي وقت أخطاء وحالات سهو وانقطاع للمعاملة وتأخير لها، وفي مثل هذه الحالات سنتوقع من المستخدمين الصبر حتى تعود المعاملة إلى وضعها الطبيعي ..</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p><strong>التسجيل :</strong></p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;بعض أجزاء الموقع لا تعمل إلا للأعضاء المشتركين والمسجلين بعد تقديم بعض المعلومات الشخصية عنهم وهويتهم . يقر المشترك عند تسجيله بالموقع بأن المعلومات المقدمة هي كاملة ودقيقة ، ويلتزم بأنه لن يقوم بالتسجيل في الموقع ولن يحاول دخوله منتحلاً اسم مشترك آخر ولن يستخدم اسماً قد ترى الإدارة أنه غير مناسب، أو غير ملائم، مثل أرقام الهواتف، والأسماء المنتحلة لشخصيات شهيرة أو رموز أو أي طرف آخر يعد منتحلاً لشخصيته ، وكذلك الأسماء غير المفهومة أو التي تخدش الحياء ، وما في حكمها كما يقر المستخدم المسجل في موقع <strong>مستعمل</strong>.<strong>كوم</strong> أن عمره أكبر من 18 سنة ، وقد يطلب موقع<strong> مستعمل</strong>.<strong> كوم </strong>وثائق تثبت ذلك في حال دعت الحاجة<span dir=\\\"LTR\\\">. </span><br />\\r\\nكما يمنع نهائياً التسجيل بأكثر من حساب في الموقع وهذا يعرض كل حسابات المستخدم للإيقاف والمسائلة القانونية عند تعرض الموقع أو أحد المستخدمين لضرر <span dir=\\\"LTR\\\">.</span><br />\\r\\nيمنع استخدام أكثر من شخص لنفس الحساب حيث ان الحساب في <strong>مستعمل</strong>.<strong> كوم</strong> حساب فردي ويقر ويلتزم المستخدم عند التسجيل أنه الوحيد الذي سيستخدمه وأنه مسؤول عن كل التعاملات التي تتم عبره<span dir=\\\"LTR\\\">.</span><br />\\r\\nيمنع نهائيا بيع الحساب او التنازل عنه في موقع <strong>مستعمل</strong>.<strong>كوم</strong> ، وعند اكتشاف عملية بيع أي حساب يتم إيقافه مباشرة مع جميع رصيده ولا يمكن لأي طرف الاستفادة منه<span dir=\\\"LTR\\\">. </span></p>\\r\\n\\r\\n<p><strong>حماية المستخدمين</strong> :</p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>تلتزم إدارة موقع <strong>مستعمل</strong>.<strong> كوم </strong>بحماية المشتري من الإحتيال وذلك من خلال التزامه بآلية عمل الموقع كما نلتزم بتوفير الخدمة &nbsp;له على أن تكون جميع المراسلات والاتفاقيات كلها ضمن الطلب في موقع <strong>مستعمل</strong>.<strong>كوم </strong>وأن يكون جميع المستخدمين للموقع مطبقين لجميع شروط الاستخدام لكي نضمن حقهم <span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>في بعض الحالات يتم ايقاف الحساب بسبب اختراق أو شك من إدارة الموقع من سوء استخدام للحساب وفي هذه الحالة قد تتسلم رسالة او اشعار بطلب وثائق شخصية وأرقام هواتف ومعلومات تثبت شخصية المستخدم وبعدها يحق للإدارة إعادة الحساب أو الاستمرار في إيقافه حسب المعلومات المتوفرة &nbsp;<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>من خلال اشتراكك في موقع <strong>مستعمل</strong>.<strong> كوم</strong> أنت موافق وعلى علم تام نافي للجهالة ان قرار موقع <strong>مستعمل</strong>.<strong> كوم </strong>في المشاكل التي تحدث بين البائع والمشتري يكون الحكم النهائي لموقع <strong>مستعمل</strong>.<strong> كوم </strong>ولا يحق للطرفين الاعتراض على الحكم بأي حال، كما يعتبر هذا الحكم ملزما للطرفين بشكل كامل <span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>في بعض الحالات يتم طلب الوثائق الشخصية لإثبات هوية المستخدم أو إثبات ملكية حساب باي بال المستخدم في الشراء من الموقع أو أي حساب آخر أو طريقة دفع للأموال خاصة بالشراء وفي حال لم يتم إرسالها يبقي الموقع على الحساب مع رصيده في حالة إيقاف<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>في حال عدم رضى المشتري عن المعاملة وعدم قدرة البائع على إثبات ما قام به على المشتري فينبغي عليه أن يبلغ الدعم الفني لموقع <strong>مستعمل</strong>.<strong> كوم</strong> وسيعيد الموقع المبلغ من البائع إلى المشتري في حال قررت إدارة الموقع ذلك ولا يحق للطرفين الإعتراض على ذلك <span dir=\\\"LTR\\\">. </span>&nbsp;</li>\\r\\n</ul>\\r\\n\\r\\n<p><strong>الرقابة على المحتوى</strong> <strong>:</strong><br />\\r\\nتحتفظ إدارة موقع <strong>مستعمل</strong>.<strong> كوم</strong> الإلكتروني بالحق في مراقبة أي محتوى يدخله المشترك ، دون أن يكون ذلك لزاماً عليها، ذلك أنها لا تستطيع مراقبة كل مدخلات المشتركين، لذا تحتفظ بالحق (من دون التزام) في حذف أو إزالة أو تحرير أي مواد مدخلة من شأنها انتهاك شروط وأحكام الموقع أو مخالفة أنظمة المملكة العربية السعودية .</p>\\r\\n\\r\\n<p>إن قوانين حقوق النشر والتأليف المحلية و العالمية والأجنبية والمعاهدات الدولية تحمي جميع محتويات هذا الموقع، ومن خلال الاشتراك فيه فإن المشترك يوافق ضمنيا وبشكل صريح على الالتزام بإشعارات حقوق النشر التي تظهر على صفحاته<span dir=\\\"LTR\\\">. </span></p>\\r\\n\\r\\n<p><br />\\r\\n<strong>الإبلاغ عن الانتهاكات</strong> :<br />\\r\\nيمنع نشر أي محتوى يخالف أية قوانين دولية أو اتحادية أو وطنية أو محلية أو خاصة بحقوق النشر أو براءات الاختراع أو العلامات التجارية أو حقوق الملكية الفكرية الأخرى<span dir=\\\"LTR\\\"> .</span><br />\\r\\nلا يتحمل <strong>مستعمل</strong>.<strong> كوم</strong> (الموقع أو إدارته) المسؤولية عن أي محتوى يقدمه أحد المستخدمين وينتهك به حقوق ملكية تعود لمستخدم أو جهة أخرى <span dir=\\\"LTR\\\">.</span></p>\\r\\n\\r\\n<p><br />\\r\\n<strong>السلوك والاستخدام المقبول بعدم استخدام الإعلانات المزعجة</strong> :<br />\\r\\nتوافق بموجب هذه الشروط على عدم نشر أو إرسال أو إتاحة أي محتوى او خدمات من خلال هذا الموقع يكون أو يتعارض مع القوانين أو الأنظمة في المملكة العربية السعودية والأنظمة الدولية . وبهذا الخصوص، توافق على عدم نشر أو إرسال أو إتاحة أي محتوى من خلال هذا الموقع إذا كان هذا المحتوى أو المعاملة المقدمة <span dir=\\\"LTR\\\">:</span></p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>غير قانوني أو ضار أو يمثل تهديداً أو إساءة استخدام أو تشهيراً أو قذفاً أو انتهاكاً للحرمة أو أي معلومات ضارة بالقُصر .</li>\\r\\n\\t<li>ذا طبيعة سياسية و/أو ينتقد أي حكومة أو موظف من الموظفين في نطاق أي دائرة اختصاص قانوني &nbsp;<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>ذا طبيعة إباحية أو فيه أي نوع من أنواع التعري أو المحتويات الجنسية الصريحة أو المنحرفة<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>مناهضاً للإسلام أو يستخف بالدين الإسلامي بأي شكل من الأشكال<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>ذا طبيعة عنصرية أو تمييزية تجاه أي عرق أو دين أو عقيدة أو جنسية أو جنس أو أي مجموعة أخرى من الأفراد<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>يجسد أي شخص آخر<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>يستدرج الى بيع بضائع أو سلع مقلده أو ممنوعة بحسب أنظمة المملكة العربية السعودية.</li>\\r\\n\\t<li>إرسال رسائل بالبريد الإلكتروني أو عن طريق التواصل مع البائع أو مقدم المعاملة إلى مستخدم آخر للموقع عبر صراحة عن رغبته بأن تراسله بهذا الشأن <span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>يتضمن روابط إلى مواقع إلكترونية أخرى <span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>يمثل إعلاناً لبيع أي شيء غير مشروع بموجب أنظمة المملكة العربية السعودية وأي قانون أو تنظيم نافذ في دائرة الاختصاص القانوني التي يتم بيع المنتج فيها أو إليها<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>يخالف أنظمة المملكة العربية السعودية وأي قوانين دولية أو اتحادية أو وطنية أو محلية خاصة بحقوق النشر والتأليف أو براءات الاختراع أو العلامات التجارية أو غيرها من قوانين حقوق الملكية الفكرية<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>يتضمن أي فيروسات برمجية أو برمجيات اختراق مما يعرف بأحصنة طروادة أو الديدان الإلكترونية أو القنابل المنطقية أو غيرها من المواد الخبيثة أو الضارة تقنياً<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>يعطل التدفق الطبيعي للبيانات من خلال إرسال عدد زائد من الرسائل <span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>يستخدم عناوين اتصال وبيانات تسجيل بالموقع مضللة لإخفاء هويته الحقيقيه <span dir=\\\"LTR\\\">.</span></li>\\r\\n</ul>\\r\\n\\r\\n<p><strong>كما توافق على عدم </strong><strong><span dir=\\\"LTR\\\">:</span></strong></p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>التحرش بالمستخدمين الآخرين للموقع أو مضايقتهم أو مطاردتهم <span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>تجميع معلومات شخصية عن المستخدمين لأغراض تجارية أو غير قانونية<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>نشر محتوى لا يناسب أو لا يتعلق بفئة الخدمات او المعاملات او المواضيع أو موضوع المناقشة الذي ينشر فيه هذا المحتوى<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>نشر نفس السلعة أو المعاملة في أكثر من فئتين من فئات الخدمات<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>القيام عن طريق هذا الموقع أو عن طريق الاتصال بأي من المستخدمين الآخرين للموقع بنشر أو إرسال أو إتاحة أي رسائل مزعجة أو غير مرغوبة أو رسائل متسلسلة أو ما يعرف بمكائد الاحتيال الهرمي أو إعلانات البريد الإلكتروني غير المرغوب بها<span dir=\\\"LTR\\\">. </span></li>\\r\\n\\t<li>محاولة الدخول دون تصريح إلى الموقع أو إلى الخادم الذي يوجد عليه الموقع أو إلى أي خادم أو جهاز حاسوب أو قاعدة بيانات متصلة بالموقع .</li>\\r\\n\\t<li>وتفادياً للشك ، فإن قائمة المحتويات والتصرفات الممنوعة المذكورة أعلاه ليست شاملة وتحتفظ ادارة موقع <strong>مستعمل</strong>.<strong> كوم</strong> بحقها في إزالة أي محتوى تعتبره وفقاً لتقديرها الخاص والمطلق (مرفوضاً أو يتعارض مع القوانين أو الأنظمة النافذة بالمملكة العربية السعودية دون الحاجة لأي إشعار<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>اتخاذ الإجراءات اللازمة لمنع الأشخاص الذين يحاولون نشر محتويات، و/أو التصرف بطريقة مخالفة .</li>\\r\\n\\t<li>يختار المشترك كلمة سر / مرور لحسابه ، وسيُدخل عنواناً بريدياً خاصاً به لمراسلته عليه ، وتكون مسؤولية حماية كلمة السر هذه وعدم مشاركتها أو نشرها تحت مسؤولية المشترك ، وفي حال حدوث أي معاملات باستخدام كلمة السر هذه فسيتحمل المشترك كافة المسؤوليات المترتبة على ذلك ، دون أدنى مسؤولية على موقع <strong>مستعمل</strong> .<strong> كوم </strong><span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>يتحمل المشترك كامل المسؤولية عن جميع المحتويات الخاصة به ، التي يرفعها وينشرها عبر الموقع<span dir=\\\"LTR\\\">. </span></li>\\r\\n\\t<li>يلتزم المشترك بألا ينشر أي شيء يخالف الشريعة الإسلامية بأي شكل من الأشكال، أو أي أغراض وتصرفات غير قانونية ، على سبيل المثال لا الحصر، مثل: القرصنة ونشر وتوزيع مواد أو برامج منسوخة أو غير مرخص بها أو الخداع والتزوير أو الاحتيال أو التهديد أو إزعاج أي شخص أو شركة أو جماعة أو نشر مواد إباحية أو جنسية أو نشر فيروسات أو ملفات تجسس أو وضع روابط إلى مواقع تحتوي على مثل هذه المخالفات ، كما يمنع انتهاك حقوق الملكية الفكرية أو تشويه سمعة شخص أو مؤسسة أو شركة أو تعمد نشر أي معلومات تسبب ضررا لشركة أو شخص أو دولة أو جماعة وعدم وضع مواد قرصنة وبرامج مسروقة وجميع ما يخالف الأعراف والقوانين المنظمة ، ويكون المشترك بالموقع &nbsp;مسؤولاً مسؤولية كاملة عن كل ما يقدمه عبر حسابه على الموقع<span dir=\\\"LTR\\\">. </span></li>\\r\\n\\t<li>يمنع منعاً باتاً استخدام خدمات الموقع لأغراض سياسية ، ويمنع التعرض لأي دولة عربية أو إسلامية أو أي دولة حول العالم بأي شكل من الأشكال .</li>\\r\\n\\t<li>انت توافق وتقر انه يحق لموقع <strong>مستعمل </strong>.<strong> كوم </strong>الوصول إلى معلومات الحساب والمحتوى في حالة الضرورة المعقولة من أجل حماية الموقع <span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>الترويج والدعاية والإعلان لأي موقع يقدم خدمات منافسة لموقع <strong>مستعمل</strong> .<strong> كوم</strong> .</li>\\r\\n\\t<li>تحتفظ إدارة موقع <strong>مستعمل </strong>.<strong> كوم</strong> الإلكتروني بحقها في حذف أي معاملة واي طلب وحظر حساب أي عضو يقوم بعملية الدعاية والإعلان لأي موقع يقدم خدمات منافسة لموقع <strong>مستعمل </strong>.<strong> كوم </strong>و/ أو لخدمات مشتركي <strong>مستعمل </strong>.<strong> كوم</strong> وأي مشترك يثبت عليه ذلك سيكون معرضاً لحظر حسابه.</li>\\r\\n\\t<li>هذه السياسة محل تغيير دائم وتطوير، وعلى المشتركين مراجعة هذه السياسات بشكل دوري لمتابعة كل جديد<span dir=\\\"LTR\\\">. </span></li>\\r\\n</ul>\\r\\n\\r\\n<p><strong>مخالفات شروط الاستخدام</strong> :<br />\\r\\nنرجو إبلاغنا إذا علمت بوجود أي مخالفات من الآخرين لشروط الاستخدام هذه<span dir=\\\"LTR\\\">.</span></p>\\r\\n\\r\\n<p><br />\\r\\n<strong>أحكام عامة</strong> :</p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>أنت توافق على أن كون شروط الاستخدام هذه بصيغة إلكترونية لا يؤثر بأي شكل على صلاحيتها وإلزاميتها القانونية<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>تمثل شروط الاستخدام هذه كامل الاتفاقية بينك وبين موقع <strong>مستعمل</strong>.<strong> كوم </strong>بالنسبة لموضوعها والتعاملات والمعاملات علية وهي تنسخ كل ما عداها من اتفاقات أو ضمانات أو تفاهمات أو مناقشات شفهية أو خطية راهنة أو سابقة بينك وبين إدارة الموقع أو من يمثله ، سواء كانت صريحة أم ضمنية<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>إن تأخر ادارة موقع <strong>مستعمل</strong>.<strong> كوم </strong>أو عدم قيامها بممارسة حق ما أو التصرف حيال خرق ما لشروط الاستخدام هذه لا يمثل تنازلاً عن حقنا في ممارسة ذلك في المستقبل <span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>تعتبر أحكام شروط الاستخدام هذه قابلة للتجزئة ، فإذا ما تبين أن أي حكم منها غير قانوني أو غير صالح بموجب قانون من القوانين النافذة ، فإن هذا الحكم يمكن تغييره إلى الحد اللازم منطقياً لجعله قانونياً وصالحاً وملزماً<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>لا يجوز لك أن تتصرف بأي جزء من شروط الاستخدام هذه دون إذن خطي صريح من مالك الموقع او من يمثله قانونياً بذلك<span dir=\\\"LTR\\\">. </span>أما ادارة موقع <strong>مستعمل</strong>.<strong> كوم </strong>فيجوز لها التصرف بشروط الاستخدام هذه فوراً بعد نشر إخطار بذلك على الموقع <span dir=\\\"LTR\\\">.</span></li>\\r\\n</ul>\\r\\n\\r\\n<p><strong>اتفاقية الاستخدام :</strong></p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>آلية عمل الموقع : بمجرد ضغط البائع على أزرار تم التسليم وضغط المشتري على أزرار تم الاستلام - فعندها يتم تحويل المبلغ بشكل آلي إلى حساب البائع .</li>\\r\\n\\t<li>في حال عدم ضغط البائع ( المعلن ) على &nbsp;أزرار تم التسليم للمنتج وعدم ضغط الطرف الآخر المشتري على أزرار تم الاستلام أو أحدهما أو كليهما فسيتم إعادة المبلغ إلى حساب المشتري لأنه لم تتم علمية البيع &nbsp;، ولا يحق لأياً من الطرفين البائع ( المعلن ) أو المشتري مطالبة موقع مستعمل . كوم باسترداد إي مبالغ مالية نظراً لعدم التزام أحد الطرفين أو كليهما بآلية عمل الموقع الموضحة .</li>\\r\\n\\t<li>يتم حجز مبلغ عملية البيع عدة أيام في بوابة الدفع كنظام متبع من قبل بوابة الدفع الإلكتروني للتأكد من سلامة عملية البيع بين الطرفين وبعدها سيتم إيداع المبلغ في حساب البائع<span dir=\\\"LTR\\\"> . </span></li>\\r\\n\\t<li>عميل الموقع ( البائع أو المعلن ) بإمكانه عرض منتجة بقسم المزاد لمدة أسبوع وسيكون البيع لأفضل سعر &nbsp;، ويحق للبائع التراجع عن البيع في حال لم يجد السعر المناسب والمستحق لمنتجة .</li>\\r\\n\\t<li>الإتفاق بين المعلن بالموقع والمشتري يكون من خلال المحادثة المتاحة بالموقع ، وفي حال قام أحدهما بكتابة وسيلة للتواصل بينهما خارج موقع مستعمل . كوم سيعرضه ذلك لإلغاء حسابه بالموقع .</li>\\r\\n\\t<li>في حال وجود عيب في المنتج أو عدم مطابقته للمتفق عليه بين المعلن ( البائع ) والمشتري بعد استلامه من قبل المشتري فليس على موقع مستعمل . كوم أدنى مسؤولية تجاه ذلك .</li>\\r\\n\\t<li>الموقع يتعامل مع بوابة الدفع ميسر وهي بوابة موثوقة وجميع التعاملات المالية داخل الموقع تخضع لشروطهم وأحكامهم وسياساتهم <span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>عملية توصيل المنتج يتم الاتفاق فيها بين المعلن بالموقع ( البائع ) والمشتري ولن يتم إيداع المبلغ المتفق عليه بين المعلن والمشتري في حساب المعلن ( البائع ) إلا بعد ضغط المعلن لأزرار تم التسليم وضغط المشتري لأزرار تم الاستلام <span dir=\\\"LTR\\\">&nbsp;&nbsp;.</span></li>\\r\\n\\t<li>توصيل المنتجات ليس من اختصاص ولا مسؤولية موقع مستعمل . كوم .</li>\\r\\n\\t<li>يجب على المعلن تحديث الإعلان كل أسبوع كإجراء للتأكد من مصداقية الإعلان وأنه نشط وإلا سيتم حذفه من قبل إدارة الموقع ..</li>\\r\\n\\t<li>عند الدخول في اتفاق من قبل المشتري مع المعلن فسيتم إخفاء الإعلان من الظهور بصفحة الإعلان بشكل آلي لحين الانتهاء من عملية البيع بينهما <span dir=\\\"LTR\\\">&nbsp;.</span></li>\\r\\n\\t<li>موقع مستعمل . كوم وسيط بين المعلن ( البائع ) والمشتري ويوفر بيئة آمنه بينها ولا يتحمل أي تبعات ولا مسؤولية لما يحصل بين المعلن ( البائع ) والمشتري من خلافات مابعد البيع <span dir=\\\"LTR\\\">. </span></li>\\r\\n\\t<li>عند ضغط المعلن ( البائع ) على أزرار تم التسليم وضغط المشتري على أزرار تم البيع فهذا يعني انتهاء عملية البيع بينهما وتأكيداً من قبل الطرفين على البدء بإيداع المبلغ المسجل بمحفظة المشتري في حساب المعلن ( البائع ) ولا يتحمل موقع مستعمل . كوم أي تبعات بعد ذلك لما يحدث بين الطرفي ( المعلن - البائع ) و ( المشتري ) من خلاف لأي سبب .</li>\\r\\n\\t<li>سيتم تحصيل نسبة مئوية ٣٪ &nbsp;لصالح موقع مستعمل . كوم كمقدم خدمة من مبلغ عملية البيع بين المعلن ( البائع ) والمشتري وكذلك نسبة مئوية إضافية ٢.٧٥ ٪ &nbsp;لصالح بوابة الدفع الإلكتروني ميسر من أجل تحسين خدمة الموقع <span dir=\\\"LTR\\\">&nbsp;.</span></li>\\r\\n</ul>\\r\\n\\r\\n<p><strong>عموله ومصاريف خدمة :</strong></p>\\r\\n\\r\\n<p>موقع <strong>مستعمل. كوم</strong> لا يقدم الخدمة مباشرة بل هو وسيط كمسوق إلكتروني بين مقدم الخدمة أي البائع أو المعلن ، وطالب الخدمة (المشتري) ، أي أن الموقع يأخذ نسبة مئوية بسيطة ( يتم تحصيلها من المعلن أو البائع ) بالإضافة إلى نسبة بوابة الدفع الإلكتروني عن كل عملية تتم داخل الموقع .</p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>يحق لموقع مستعمل . كوم تغيير نسبة الموقع حسب ما تقتضيه الضروف .</li>\\r\\n</ul>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p><strong>محدودية المسؤوليات :</strong></p>\\r\\n\\r\\n<p>&nbsp;تنفي ادارة موقع <strong>مستعمل</strong>.<strong> كوم </strong>بموجب هذه الشروط، وإلى أقصى حد يسمح به القانون النافذ بالمملكة العربية السعودية ، أي مسؤولية لها عن أي أضرار أياً كانت وهذا يشمل بدون تحديد الأضرار والخسائر المباشرة وغير المباشرة والخاصة والعقابية والعارضة التي تصيب أي مستخدم فيما يتعلق بالموقع أو فيما يتعلق باستخدام الموقع أو عدم القدرة على استخدامه أو نتائج استخدامه، وكذلك أية مواقع أخرى مرتبطة به وأية مواد منشورة عليه، وهذا يشمل لكن من دون تحديد أي مسؤولية عن خسارة دخل أو إيراد. أو خسارة عمل<span dir=\\\"LTR\\\">. </span>أو خسارة أرباح أو عقود. أو ضياع بيانات. أو خسارة سمعة حسنة. أو هدر أوقات إدارية أو مكتبية. وأي خسارة أو ضرر آخر من أي نوع كان وكيفما نشأ وسواء كان بسبب الإساءة بما فيها الإهمال أو مخالفة العقد أو غير ذلك، حتى لو كان ذلك قابلاً للتوقع . وعلى وجه الخصوص لا يتحمل موقع <strong>مستعمل</strong>.<strong> كوم </strong>المسؤولية عن أية أضرار أو خسائر تصيبك أو تصيب طرفاً آخر نتيجة<span dir=\\\"LTR\\\">: </span></p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>استخدام الموقع أو عدم القدرة على استخدامه<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>الخدمات أو المعاملات أو السلع التي يتم الحصول عليها عن طريق الموقع<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>أي محتوى معروض على الموقع<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>هجوم انتشاري يمنع المعاملة، أو فيروسات أو مواد أخرى ضارة تقنياً يمكن ان تصيب أجهزتك الحاسوبية أو برامجك أو بياناتك أو المواد والأجهزة الأخرى التي تمتلكها بسبب استخدامك للموقع أو تنزيلك لأي مواد منشورة عليه ، أو على أي موقع آخر أو مقدم خدمة مرتبط به<span dir=\\\"LTR\\\">.</span></li>\\r\\n</ul>\\r\\n\\r\\n<p><strong>إنهاء إمكانية الدخول إلى الموقع</strong> :</p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>تحتفظ ادارة موقع <strong>مستعمل</strong>.<strong> كوم </strong>بحقها في حجبك أو منعك من دخول الموقع لقاء أي خرق لشروط الاستخدام هذه في أي وقت ودون الحاجة لإخطارك بذلك<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>تحتفظ ادارة موقع <strong>مستعمل</strong>.<strong> كوم </strong>بحقها في حذف أي محتوى تضيفه أنت على الموقع في أي وقت<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>لا تتحمل ادارة موقع <strong>مستعمل</strong>.<strong> كوم </strong>المسؤولية تجاهك أو تجاه الآخرين عن إنهاء إمكانية دخولك إلى الموقع أو حذف المحتوى الذي تنشره أنت<span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>وأنت تتعهد بعدم محاولة استخدام الموقع بعد هذا الإنهاء.</li>\\r\\n</ul>\\r\\n\\r\\n<p>&nbsp;</p>\",\"en\":\"<p>Terms of Service<br />\\r\\nAcceptance of the terms of use:<br />\\r\\n&bull; This page describes the terms of use under which the site administration allows you to access and use the site, whether as a visitor or a registered user. Therefore, please read these Terms of Use carefully before you start using the Site.<br />\\r\\n&bull; By accessing and using the Site, you accept and agree to be bound by these Terms of Use.<br />\\r\\n&bull; IF YOU DO NOT AGREE TO THESE TERMS, YOU ARE NOT ALLOWED TO USE THE SITE.<br />\\r\\n&bull; If the buyer used a stolen account on a used site. The transaction between the two parties (the advertiser and the buyer) will be canceled and the discount will be from the advertiser and the buyer.<br />\\r\\nThe terms of use change from time to time, and in the event that such changes are made, the site user must follow the updates of the terms and conditions to see all new. The user&#39;s continued use of the website is in use. com is based on accepting these terms and conditions of use, as amended from time to time for better treatment and higher quality. Any violation of this agreement by the customer/subscriber will expose his account to suspension or deletion without prior notice and without refunding any money and he is not entitled to claim it.</p>\\r\\n\\r\\n<p>Disclaimer of legal liability:<br />\\r\\nThe user acknowledges that he is solely responsible for the nature of the use that he makes of the user site, and releases the administration of the user site. Com on its part, to the fullest extent permitted by law, from all liability for any losses, damages, expenses or expenses incurred by the users of the site (the advertiser and the buyer) or they or any other party are exposed to as a result of using the website user.com, or the inability to use it For any circumstance.</p>\\r\\n\\r\\n<p>Cases of transaction interruptions, omissions and errors in the website is used. com:</p>\\r\\n\\r\\n<p>The site administration makes every effort to ensure and maintain the continuity of the website&rsquo;s work without problems and provide the user with the highest levels of protection, despite that, errors, omissions, interruptions and delays in the transaction may occur at any time. In such cases, we will expect users to be patient until the transaction returns to normal. .</p>\\r\\n\\r\\n<p>Registration :</p>\\r\\n\\r\\n<p>&nbsp;Some parts of the site only work for registered and subscribed members after providing some personal information about them and their identity. The subscriber acknowledges when registering on the site that the information provided is complete and accurate, and he is committed that he will not register on the site and will not attempt to enter it under the name of another subscriber and will not use a name that the administration may deem to be inappropriate, or inappropriate, such as phone numbers, the names of famous personalities or symbols Or any other party who is considered an impersonator, as well as incomprehensible or indecent names, and the like. The registered user of the user site states that he is over 18 years old, and he may request a user site. com documents to prove it in case the need arises.<br />\\r\\nIt is also permanently prohibited to register with more than one account on the site, and this exposes all user accounts to suspension and legal accountability when the site or one of the users is harmed.<br />\\r\\nIt is forbidden to use more than one person for the same account as the account is in a user. Com is an individual account and the user acknowledges and undertakes upon registration that he is the only one who will use it and that he is responsible for all transactions that take place through it.<br />\\r\\nIt is strictly forbidden to sell or give up the account on the used.com site, and upon discovery of the sale of any account, it is immediately suspended with all its balance and no party can benefit from it.<br />\\r\\nUser protection:<br />\\r\\n&bull; Adhere to user site management. Com protects the buyer from fraud through his commitment to the mechanism of the site&#39;s work, and we are committed to providing the service to him, provided that all correspondence and agreements are all within the request on the user site.com and that all users of the site apply all terms of use in order to guarantee their right.<br />\\r\\n&bull; In some cases, the account is suspended due to a breach or suspicion from the site management of misuse of the account. In this case, you may receive a message or a notification requesting personal documents, phone numbers and information proving the user&#39;s identity, and then the administration has the right to return the account or continue to stop it according to the available information.<br />\\r\\n&bull; By subscribing to a used site. Com, you agree and are fully aware of the lack of ignorance that the decision of the site is used. Com in the problems that occur between the seller and the buyer will be the final judge of the used site. The two parties have no right to object to the ruling in any way, and this ruling is considered completely binding on both parties.<br />\\r\\n&bull; In some cases, personal documents are requested to prove the identity of the user or to prove ownership of the PayPal account used to purchase from the site or any other account or method of payment of funds for the purchase.<br />\\r\\n&bull; If the buyer is not satisfied with the transaction and the seller is unable to prove what he has done to the buyer, he should inform the technical support of a used site. The site will return the amount from the seller to the buyer in the event that the site management decides that, and the two parties have no right to object to that.<br />\\r\\nContent Control:<br />\\r\\nMaintains user site management. e-com has the right to monitor any content entered by the subscriber, without being obligated to do so, as it cannot monitor all subscribers&#39; entries, so it reserves the right (without obligation) to delete, remove or edit any entered materials that violate the terms and conditions of the site or Violation of the regulations of the Kingdom of Saudi Arabia.<br />\\r\\nAll contents of this site are protected by local, international and foreign copyright laws and international treaties, and by subscribing to it, the subscriber implicitly and explicitly agrees to be bound by the copyright notices that appear on its pages.</p>\\r\\n\\r\\n<p>Reporting violations:<br />\\r\\nIt is prohibited to post any content that violates any international, federal, national or local laws, copyrights, patents, trademarks or other intellectual property rights.<br />\\r\\nUser can not bear. com (the site or its administration) is responsible for any content provided by a user that infringes the proprietary rights of&nbsp;</p>\\r\\n\\r\\n<p>user or other party.</p>\\r\\n\\r\\n<p>Acceptable behavior and use not to use annoying ads:<br />\\r\\nYou hereby agree not to publish, transmit or make available through this site any content or services that are or are in conflict with the laws or regulations of the Kingdom of Saudi Arabia and international regulations. In this regard, you agree not to post, transmit or make available any content through this website if such content or the submitted transaction:<br />\\r\\n&bull; Illegal, harmful, threatening, abusive, defamatory, defamatory, violating or any information harmful to minors.<br />\\r\\n&bull; Is of a political nature and/or criticizes any government or employee within the scope of any legal jurisdiction.<br />\\r\\n&bull; It is pornographic or contains any kind of nudity or sexually explicit or perverted content.<br />\\r\\n&bull; Anti-Islam or belittles the Islamic religion in any way.<br />\\r\\n&bull; Is of a racist or discriminatory nature towards any race, religion, creed, nationality, gender or any other group of individuals.<br />\\r\\n&bull; Represents anyone else.<br />\\r\\n&bull; He is tempted to sell counterfeit or prohibited goods or merchandise according to the regulations of the Kingdom of Saudi Arabia.<br />\\r\\n&bull; Sending e-mail messages or by communicating with the seller or the provider of the transaction to another user of the site, expressly expressing his desire to communicate with him in this regard.<br />\\r\\n&bull; Includes links to other websites.<br />\\r\\n&bull; Represents an advertisement for the sale of anything illegal under the laws of the Kingdom of Saudi Arabia and any law or regulation in force in the jurisdiction in which or to which the product is sold.<br />\\r\\n&bull; Violates the laws of the Kingdom of Saudi Arabia and any international, federal, national or local laws relating to copyrights, patents, trademarks or other intellectual property rights laws.<br />\\r\\n&bull; It includes any software viruses or hacking software known as Trojan horses, electronic worms, logic bombs, or other malicious or technically harmful materials.<br />\\r\\n&bull; Disrupts the normal flow of data by sending an excessive number of messages.<br />\\r\\n&bull; Uses deceptive website contact addresses and registration data to conceal his true identity.<br />\\r\\nYou also agree not to:<br />\\r\\n&bull; Harassment, harassment or stalking of other users of the site.<br />\\r\\n&bull; Collect personal information about users for commercial or illegal purposes.<br />\\r\\n&bull; Posting content that is not appropriate or not related to the category of services, transactions, topics or discussion topic in which this content is published.<br />\\r\\n&bull; Posting the same good or transaction in more than two categories of services.<br />\\r\\n&bull; Through this site or by contacting any of the other users of the site to publish, send or make available any spam or unwanted messages or chain messages or what is known as pyramid schemes or unsolicited e-mail advertisements.<br />\\r\\n&bull; Attempting to gain unauthorized access to the site, the server on which the site is located, or any server, computer or database connected to the site.<br />\\r\\n&bull; For the avoidance of doubt, the list of prohibited content and actions mentioned above is not exhaustive and the user site maintains it. Com reserves the right to remove any content it considers at its sole and absolute discretion (objectionable or in conflict with the laws or regulations in force in the Kingdom of Saudi Arabia without the need for any notice.<br />\\r\\n&bull; Take the necessary measures to prevent people who try to publish contents, and/or act in an illegal manner.<br />\\r\\n&bull; The subscriber chooses a password/password for his account, and he will enter his own mailing address to be sent to, and the responsibility to protect this password and not share or publish it is under the subscriber&#39;s responsibility, and in the event of any transactions using this password, the subscriber will bear all the responsibilities resulting from that, without the slightest Responsibility on the user site. com.<br />\\r\\n&bull; The subscriber bears full responsibility for all of his content, which he uploads and publishes through the site.<br />\\r\\n&bull; The subscriber is obligated not to publish anything that violates Islamic law in any way, or any illegal purposes and actions, including but not limited to: piracy, publication and distribution of copied or unauthorized materials or programs, deception, forgery, fraud, threat or inconvenience Any person, company or group, publishing pornographic or sexual materials, spreading viruses or spying files, or placing links to sites containing such violations. A company, a person, a country or a group, and not to put piracy materials, stolen programs, and all that contravenes the norms and regulating laws, and the subscriber on the site is fully responsible for everything he submits through his account on the site.<br />\\r\\n&bull; It is strictly forbidden to use the site&#39;s services for political purposes, and it is forbidden to attack any Arab or Islamic country or any country around the world in any way.<br />\\r\\n&bull; You agree and acknowledge that the site is a user. .com will have access to account information and content as reasonably necessary in order to protect the site.<br />\\r\\n&bull; Promotion, publicity and advertising for any site that offers competing services for a used site. com.<br />\\r\\n&bull; Maintains user site management. e-com has the right to delete any transaction and any request and to ban the account of any member who performs the process of advertising for any site that provides services that compete with a user site. com and/or for user subscriber services. com and any subscriber who proves this will be subject to banning his account.<br />\\r\\n&bull; This policy is subject to permanent change and development, and subscribers should review these policies periodically to follow up on everything new.<br />\\r\\nViolations of the terms of use:<br />\\r\\nPlease let us know if you become aware of any violations of these Terms of Use by others.</p>\\r\\n\\r\\n<p>General Provisions :<br />\\r\\n&bull; You agree that the fact that these Terms of Use are in electronic form does not in any way affect their validity and legal enforceability.<br />\\r\\n&bull; These Terms of Use constitute the entire agreement between you and a user site. com with regard to its subject matter and the dealings and transactions on it, and it copies all other agreements, guarantees, understandings or discussions&nbsp;</p>\\r\\n\\r\\n<p>current or prior oral or written statements between you and the Site Administration or its representative, whether express or implied.<br />\\r\\n&bull; The delay in managing a used site. Com&#39;s failure to exercise a right or act in breach of these Terms of Use does not constitute a waiver of our right to do so in the future.<br />\\r\\n&bull; The provisions of these Terms of Use are indivisible, and if any provision of them is found to be illegal or invalid under a law in force, this provision can be changed to the logically necessary extent to make it legal, valid and binding.<br />\\r\\n&bull; You may not act in any part of these Terms of Use without the express written permission of the site owner or his legal representative to do so. As for managing a user site. Com may dispose of these Terms of Use immediately after posting a notice to that effect on the site.<br />\\r\\nUsage Agreement:<br />\\r\\n&bull; The site&#39;s mechanism of action: as soon as the seller clicks on the delivered buttons and the buyer clicks on the received buttons - then the amount is automatically transferred to the seller&#39;s account.<br />\\r\\n&bull; In the event that the seller (the advertiser) does not press the delivered buttons for the product and the other party buyer does not press the received buttons or one or both, the amount will be returned to the buyer&rsquo;s account because the sale process has not been completed, and neither party has the right to the seller (the advertiser) or the buyer User site claim. Com to recover any sums of money due to the non-compliance of one or both of the parties with the mechanism of the site&#39;s work shown.<br />\\r\\n&bull; The amount of the sale process is reserved for several days in the payment gateway as a system followed by the electronic payment gateway to ensure the integrity of the sale process between the two parties, after which the amount will be deposited into the seller&#39;s account.<br />\\r\\n&bull; The site&#39;s customer (the seller or the advertiser) can offer a product in the auction section for a week, and the sale will be for the best price.<br />\\r\\n&bull; The agreement between the advertiser on the site and the buyer is through the conversation available on the site, and in the event that one of them writes a means of communication between them outside a used site. Com will expose him to cancel his account on the site.<br />\\r\\n&bull; In the event of a defect in the product or its non-conformity with the agreed upon between the advertiser (seller) and the buyer after receiving it from the buyer, it is not on a used site. com has no responsibility for that.<br />\\r\\n&bull; The site deals with the easy payment gateway, which is a reliable gateway, and all financial transactions within the site are subject to their terms, conditions and policies.<br />\\r\\n&bull; The process of delivering the product is agreed upon between the advertiser on the site (the seller) and the buyer, and the amount agreed upon between the advertiser and the buyer will not be deposited into the account of the advertiser (the seller) until after the advertiser pressed the delivery buttons and the buyer clicked the received buttons.<br />\\r\\n&bull; Delivery of products is not the competence or responsibility of a user site. com.<br />\\r\\n&bull; The advertiser must update the advertisement every week as a procedure to ensure the credibility of the advertisement and that it is active, otherwise it will be deleted by the site administration..<br />\\r\\n&bull; When entering into an agreement by the buyer with the advertiser, the advertisement will be hidden from appearing on the advertisement page automatically until the completion of the sale process between them.<br />\\r\\n&bull; Used site. Com is an intermediary between the advertiser (seller) and the buyer and provides a safe environment between them and does not bear any consequences or responsibility for what happens between the advertiser (seller) and the buyer of post-sale disputes.<br />\\r\\n&bull; When the advertiser (seller) presses the Delivered buttons and the buyer presses the Sold buttons, this means the end of the sale process between them and a confirmation by both parties to start depositing the amount registered in the buyer&#39;s wallet in the advertiser&#39;s (seller) account, and a user site is not responsible. Com any consequences after that for what happens between the parties (the advertiser - the seller) and (the buyer) of a dispute for any reason.<br />\\r\\n&bull; A percentage of 3% will be collected in favor of a used site. Com as a service provider from the amount of the sale process between the advertiser (seller) and the buyer, as well as an additional percentage of 2.75% in favor of the electronic payment gateway Maiser in order to improve the site&#39;s service.<br />\\r\\nCommission and service charges:<br />\\r\\nused site. Com does not provide the service directly, but rather is an intermediary as an electronic marketer between the service provider, i.e. the seller or advertiser, and the service requester (the buyer), meaning that the site takes a simple percentage (to be collected from the advertiser or seller) in addition to the percentage of the electronic payment gateway for each transaction that takes place within Site .<br />\\r\\n&bull; The right to a user site. Com change the percentage of the site as required by circumstances.</p>\\r\\n\\r\\n<p>Limited Responsibilities:<br />\\r\\n&nbsp;Deny managing a user site. Com under these Terms, and to the fullest extent permitted by applicable law in the Kingdom of Saudi Arabia, shall have no liability for any damages whatsoever and this includes without limitation direct, indirect, special, punitive and incidental damages and losses to any user in connection with the Site or in connection with the use of the Site or failure to The ability to use it or the results of its use, as well as any other websites linked to it and any material posted on it, this includes but is not limited to any liability for loss of income or revenue. or losing a job. or loss of profits or contracts. or data loss. Or lose a good reputation. Or wasting administrative or office time. And any other loss or damage of any kind and howsoever arising and whether due to abuse, including negligence, breach of contract or otherwise, even if that is foreseeable. In particular, the site does not bear the user. We are liable for any damages or losses to you or a third party as a result of:<br />\\r\\n&bull; Use of, or inability to use, the Website.<br />\\r\\n&bull; Services, transactions or goods obtained through the site.<br />\\r\\n&bull; Any content displayed on the Site.<br />\\r\\n&bull; A proliferation attack that prevents transaction, viruses or other technologically harmful material that may infect your computer hardware, software, data or other materials and devices owned by you due to your use of the Site or your downloading of any material posted on it, or on any other website or service provider linked to it.<br />\\r\\nTermination of access to the site:<br />\\r\\n&bull; Maintains user site management. Com reserves the right to block you or prevent you from entering the site for any reason&nbsp;Breach these Terms of Use at any time and without notice to you.<br />\\r\\n&bull; Maintains user site management. Com reserves the right to delete any content you add on the site at any time.<br />\\r\\n&bull; You are not responsible for managing a user site. We are liable to you or others for terminating your access to the Site or deleting content posted by you.<br />\\r\\n&bull; You undertake not to attempt to use the Site after such termination..</p>\"}', '{\"ar\":\"المملكة العربية السعودية - جده\",\"en\":\"Saudi Saudi Arabia - Jeddah\"}', 'admin', 'layout1', 'layout1', 'ar', NULL, 2, 'open', 'yes', 'no', 'bn', 'yes', '2800', 'Alweseemy', 'https://www.facebook.com/', '{\"ar\":\"<p><strong>اتفاقية الاستخدام :</strong></p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>آلية عمل الموقع : بمجرد ضغط البائع على أزرار تم التسليم وضغط المشتري على أزرار تم الاستلام - فعندها يتم تحويل المبلغ بشكل آلي إلى حساب البائع .</li>\\r\\n\\t<li>في حال عدم ضغط البائع ( المعلن ) على &nbsp;أزرار تم التسليم للمنتج وعدم ضغط الطرف الآخر المشتري على أزرار تم الاستلام أو أحدهما أو كليهما فسيتم إعادة المبلغ إلى حساب المشتري لأنه لم تتم علمية البيع &nbsp;، ولا يحق لأياً من الطرفين البائع ( المعلن ) أو المشتري مطالبة موقع مستعمل . كوم باسترداد إي مبالغ مالية نظراً لعدم التزام أحد الطرفين أو كليهما بآلية عمل الموقع الموضحة .</li>\\r\\n\\t<li>يتم حجز مبلغ عملية البيع عدة أيام في بوابة الدفع كنظام متبع من قبل بوابة الدفع الإلكتروني للتأكد من سلامة عملية البيع بين الطرفين وبعدها سيتم إيداع المبلغ في حساب البائع<span dir=\\\"LTR\\\"> . </span></li>\\r\\n\\t<li>عميل الموقع ( البائع أو المعلن ) بإمكانه عرض منتجة بقسم المزاد لمدة أسبوع وسيكون البيع لأفضل سعر &nbsp;، ويحق للبائع التراجع عن البيع في حال لم يجد السعر المناسب والمستحق لمنتجة .</li>\\r\\n\\t<li>الإتفاق بين المعلن بالموقع والمشتري يكون من خلال المحادثة المتاحة بالموقع ، وفي حال قام أحدهما بكتابة وسيلة للتواصل بينهما خارج موقع مستعمل . كوم سيعرضه ذلك لإلغاء حسابه بالموقع .</li>\\r\\n\\t<li>في حال وجود عيب في المنتج أو عدم مطابقته للمتفق عليه بين المعلن ( البائع ) والمشتري بعد استلامه من قبل المشتري فليس على موقع مستعمل . كوم أدنى مسؤولية تجاه ذلك .</li>\\r\\n\\t<li>الموقع يتعامل مع بوابة الدفع ميسر وهي بوابة موثوقة وجميع التعاملات المالية داخل الموقع تخضع لشروطهم وأحكامهم وسياساتهم <span dir=\\\"LTR\\\">.</span></li>\\r\\n\\t<li>عملية توصيل المنتج يتم الاتفاق فيها بين المعلن بالموقع ( البائع ) والمشتري ولن يتم إيداع المبلغ المتفق عليه بين المعلن والمشتري في حساب المعلن ( البائع ) إلا بعد ضغط المعلن لأزرار تم التسليم وضغط المشتري لأزرار تم الاستلام <span dir=\\\"LTR\\\">&nbsp;&nbsp;.</span></li>\\r\\n\\t<li>توصيل المنتجات ليس من اختصاص ولا مسؤولية موقع مستعمل . كوم .</li>\\r\\n\\t<li>يجب على المعلن تحديث الإعلان كل أسبوع كإجراء للتأكد من مصداقية الإعلان وأنه نشط وإلا سيتم حذفه من قبل إدارة الموقع ..</li>\\r\\n\\t<li>عند الدخول في اتفاق من قبل المشتري مع المعلن فسيتم إخفاء الإعلان من الظهور بصفحة الإعلان بشكل آلي لحين الانتهاء من عملية البيع بينهما <span dir=\\\"LTR\\\">&nbsp;.</span></li>\\r\\n\\t<li>موقع مستعمل . كوم وسيط بين المعلن ( البائع ) والمشتري ويوفر بيئة آمنه بينها ولا يتحمل أي تبعات ولا مسؤولية لما يحصل بين المعلن ( البائع ) والمشتري من خلافات مابعد البيع <span dir=\\\"LTR\\\">. </span></li>\\r\\n\\t<li>عند ضغط المعلن ( البائع ) على أزرار تم التسليم وضغط المشتري على أزرار تم البيع فهذا يعني انتهاء عملية البيع بينهما وتأكيداً من قبل الطرفين على البدء بإيداع المبلغ المسجل بمحفظة المشتري في حساب المعلن ( البائع ) ولا يتحمل موقع مستعمل . كوم أي تبعات بعد ذلك لما يحدث بين الطرفي ( المعلن - البائع ) و ( المشتري ) من خلاف لأي سبب .</li>\\r\\n\\t<li>سيتم تحصيل نسبة مئوية ٣٪ &nbsp;لصالح موقع مستعمل . كوم كمقدم خدمة من مبلغ عملية البيع بين المعلن ( البائع ) والمشتري وكذلك نسبة مئوية إضافية ٢.٧٥ ٪ &nbsp;لصالح بوابة الدفع الإلكتروني ميسر من أجل تحسين خدمة الموقع <span dir=\\\"LTR\\\">&nbsp;.</span></li>\\r\\n</ul>\\r\\n\\r\\n<p><strong>عموله ومصاريف خدمة :</strong></p>\\r\\n\\r\\n<p>موقع <strong>مستعمل. كوم</strong> لا يقدم الخدمة مباشرة بل هو وسيط كمسوق إلكتروني بين مقدم الخدمة أي البائع أو المعلن ، وطالب الخدمة (المشتري) ، أي أن الموقع يأخذ نسبة مئوية بسيطة ( يتم تحصيلها من المعلن أو البائع ) بالإضافة إلى نسبة بوابة الدفع الإلكتروني عن كل عملية تتم داخل الموقع .</p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>يحق لموقع مستعمل . كوم تغيير نسبة الموقع حسب ما تقتضيه الضروف .</li>\\r\\n</ul>\",\"en\":\"<p>Usage Agreement:</p>\\r\\n\\r\\n<p>The site&rsquo;s mechanism of action: Once the seller clicks on the &ldquo;Delivered&rdquo; buttons and the buyer clicks on the &ldquo;Received&rdquo; buttons - then the amount is automatically transferred to the seller&rsquo;s account.<br />\\r\\nIn the event that the seller (the advertiser) does not press the delivered buttons for the product and the other buyer party does not press the received buttons or one or both of them, the amount will be returned to the buyer&rsquo;s account because the sale process has not been completed, and neither of the seller (the advertiser) or the buyer has the right to claim used site. Com to recover any sums of money due to the non-compliance of one or both of the parties with the mechanism of the site&#39;s work shown.<br />\\r\\nThe amount of the sale process is reserved for several days in the payment gateway as a system followed by the electronic payment gateway to ensure the integrity of the sale process between the two parties, after which the amount will be deposited into the seller&rsquo;s account.<br />\\r\\nThe customer of the site (the seller or the advertiser) can offer a product in the auction section for a week, and the sale will be for the best price.<br />\\r\\nThe agreement between the advertiser on the site and the buyer is through the conversation available on the site, and in the event that one of them writes a means of communication between them outside a used site. Com will expose him to cancel his account on the site.<br />\\r\\nIn the event of a defect in the product or its non-conformity with the agreed upon between the advertiser (seller) and the buyer after receiving it from the buyer, it is not on a used site. com has no responsibility for that.<br />\\r\\nThe site deals with the easy payment gateway, which is a reliable gateway, and all financial transactions within the site are subject to their terms, conditions and policies.<br />\\r\\nThe process of delivering the product is agreed upon between the advertiser on the site (the seller) and the buyer, and the amount agreed upon between the advertiser and the buyer will not be deposited into the account of the advertiser (the seller) except after the advertiser pressed the delivery buttons and the buyer clicked the received buttons.<br />\\r\\nThe delivery of products is not the responsibility or the responsibility of a user site. com.<br />\\r\\nThe advertiser must update the advertisement every week as a measure to ensure the credibility of the advertisement and that it is active, otherwise it will be deleted by the site administration..<br />\\r\\nWhen entering into an agreement by the buyer with the advertiser, the advertisement will be hidden from appearing on the advertisement page automatically until the completion of the sale process between them.<br />\\r\\nused site. Com is an intermediary between the advertiser (seller) and the buyer and provides a safe environment between them and does not bear any consequences or responsibility for what happens between the advertiser (seller) and the buyer of post-sale disputes.<br />\\r\\nWhen the advertiser (seller) presses the Delivered buttons and the buyer clicks the Sold buttons, this means the end of the sale process between them and a confirmation by both parties to start depositing the amount recorded in the buyer&rsquo;s wallet in the advertiser&rsquo;s account (seller) and a user site is not responsible. Com any consequences after that for what happens between the parties (the advertiser - the seller) and (the buyer) of a dispute for any reason.<br />\\r\\nA percentage of 3% will be charged for a used site. Com as a service provider from the amount of the sale process between the advertiser (seller) and the buyer, as well as an additional percentage of 2.75% in favor of the electronic payment gateway Maiser in order to improve the service of the site.<br />\\r\\nCommission and service charges:</p>\\r\\n\\r\\n<p>used site. Com does not provide the service directly, but rather is an intermediary as an electronic marketer between the service provider, i.e. the seller or advertiser, and the service requester (the buyer), meaning that the site takes a simple percentage (to be collected from the advertiser or seller) in addition to the percentage of the electronic payment gateway for each transaction that takes place within Site .</p>\\r\\n\\r\\n<p>The site is entitled to a user. Com change the percentage of the site as required by circumstances.</p>\"}', 'https://www.facebook.com/', 'https://www.facebook.com', 'https://www.facebook.com/', '{\"ar\":\"هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.\\r\\n\\\\\",\"en\":\"This text is an example of text that can be replaced in the same space. This text was generated from the Arabic text generator, where you can generate such text or many other texts in addition to increasing the number of \\\\\"}', 'images/10841655224989.png', '{\"ar\":\"أفضل موقع إعلاني في العالم\",\"en\":\"The best advertising site in the world\"}', '{\"ar\":\"السيارة ، المنزل ، الهاتف المحمول أو أي شيء آخر؟\",\"en\":\"The car, the house, the mobile phone or something else?\"}', '2017-06-17 19:41:22', 3, '2023-01-07 14:25:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` text NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `phone` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lang` varchar(191) DEFAULT NULL,
  `admin_theme` varchar(191) DEFAULT NULL,
  `status` enum('inactive','active') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `type` varchar(99) NOT NULL DEFAULT 'editor',
  `whats_app` int(15) DEFAULT NULL,
  `agent_type` int(11) DEFAULT NULL,
  `image` varchar(199) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `verification` enum('yes','no') NOT NULL DEFAULT 'no',
  `identy_id` varchar(99) DEFAULT NULL,
  `address` varchar(199) DEFAULT NULL,
  `current_balance` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `token`, `name`, `email`, `password`, `phone`, `lang`, `admin_theme`, `status`, `remember_token`, `type`, `whats_app`, `agent_type`, `image`, `about`, `verification`, `identy_id`, `address`, `current_balance`, `created_at`, `updated_at`) VALUES
(230, '193ddd03c62a4f7bb40a2249b32403095f8af6f5899d1c59f683390d9efc6782', 'Asd', 'mo@mo.com', '$2y$10$F/X7otTBDW5FsisUzTUcKuYCHTY3.oXIVpyhPj4lou3zEE.r/ZU0.', '535258', NULL, NULL, 'active', NULL, 'editor', NULL, NULL, NULL, NULL, 'no', NULL, NULL, 0, '2023-12-14 07:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ads_ad_number_unique` (`ad_number`);

--
-- Indexes for table `auctions`
--
ALTER TABLE `auctions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_offers`
--
ALTER TABLE `item_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_process`
--
ALTER TABLE `payment_process`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `auctions`
--
ALTER TABLE `auctions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `item_offers`
--
ALTER TABLE `item_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74954;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `payment_process`
--
ALTER TABLE `payment_process`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
