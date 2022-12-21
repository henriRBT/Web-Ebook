-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2022 at 02:28 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas_pw`
--

-- --------------------------------------------------------

--
-- Table structure for table `comics`
--

CREATE TABLE `comics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penerbit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penejemah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comics`
--

INSERT INTO `comics` (`id`, `nama`, `pengarang`, `penerbit`, `penejemah`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Naruto', 'Mashasi Kishimoto', 'Shonen Jump', 'Samehadaku', 'comic1.jpg', NULL, NULL),
(2, 'One Piece', 'Eiichiro Oda', 'gramedia', 'Samehadaku', 'comic2.jpg', NULL, NULL),
(3, 'Bleach', 'Tite Kubo', 'Shonen Jump', 'Samehadaku', 'comic3.jpg', NULL, NULL),
(11, 'onepiece', 'onepiece12', 'onepiece122', 'onepiece1222', 'comic3.jpg', '2022-12-21 13:21:47', '2022-12-21 13:21:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `majalahs`
--

CREATE TABLE `majalahs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penulis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penerbit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun_terbit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `majalahs`
--

INSERT INTO `majalahs` (`id`, `judul`, `penulis`, `penerbit`, `tahun_terbit`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Hai ', 'HAI-ONLINE', 'Kompas Gramedea', '2015', 'majalah1.png', NULL, NULL),
(2, 'Rolling Stone', 'Fathur', 'Kompas', '2002', 'majalah2.png', NULL, NULL),
(3, 'Billboard', 'George', 'Billboard', '2010', 'majalah3.png', NULL, NULL),
(12, 'dilan12', 'dilan12', 'dilan12', '2012', 'majalah2.png', '2022-12-21 13:23:04', '2022-12-21 13:23:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_12_06_005341_create_comics_table', 1),
(11, '2022_12_06_005408_create_majalahs_table', 1),
(12, '2022_12_06_005432_create_novels_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `novels`
--

CREATE TABLE `novels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul_novel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penulis_novel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penerbit_novel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `novels`
--

INSERT INTO `novels` (`id`, `judul_novel`, `penulis_novel`, `penerbit_novel`, `tahun`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'The HOBBIT', 'J.R.R.TOLKIEN', 'Gramedia', '2010', 'novel1.jpg', NULL, NULL),
(2, 'Harry Potter', 'J.K.Rowling', 'Scholastic', '2001', 'novel2.jpg', NULL, NULL),
(9, 'Dilan 1990', 'Gramedia', 'Gramedia', '2015', 'novel3.jpg', '2022-12-21 13:20:34', '2022-12-21 13:20:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00e1b192ad91b81d69aebb9622770b34113d8d8a3196a9439587750f4111bfb120e6e17a32710325', 28, 3, 'authToken', '[]', 0, '2022-12-21 12:24:26', '2022-12-21 12:24:26', '2023-12-21 19:24:26'),
('0659ca80ac64ac4b7f7e4fbe4e43638430d47be0712ca7d42abfb0482fb896fd7c06c21dd4f255ad', 30, 3, 'authToken', '[]', 0, '2022-12-21 13:13:53', '2022-12-21 13:13:53', '2023-12-21 20:13:53'),
('1c81165e93251daa37f50159faef1174be579ea9c5b6403b08e0fd9809e076147dc7aa035e5d2b56', 13, 3, 'authToken', '[]', 0, '2022-12-21 12:15:38', '2022-12-21 12:15:38', '2023-12-21 19:15:38'),
('1dffa045a92b3d38b2fddce54a5f3a7f385938e56f161094bc662c97ccf2c0e7f53c25c4577360c3', 24, 3, 'authToken', '[]', 0, '2022-12-21 06:40:27', '2022-12-21 06:40:27', '2023-12-21 13:40:27'),
('2227293cf5bc047550c0b7dc1ee2ed795ce7873731a662bdf9617a67d745cf8f9954b15c4c909b00', 11, 3, 'authToken', '[]', 0, '2022-12-20 10:37:52', '2022-12-20 10:37:52', '2023-12-20 17:37:52'),
('250aff8b5a201977b28987718fca32082df1c1572bea5f20ad57909847b4fd050228eafea7d080da', 10, 3, 'authToken', '[]', 0, '2022-12-20 06:29:17', '2022-12-20 06:29:17', '2023-12-20 13:29:17'),
('29e364911d37ce584f779e03a0137cbda2a4e60081dbd01918ca9a8f7244c082acf63c90c300d32f', 13, 3, 'authToken', '[]', 0, '2022-12-21 06:06:49', '2022-12-21 06:06:49', '2023-12-21 13:06:49'),
('29f2854fd58374dd2c76531883075a66c720b83003674792efd3a12c6665cdeaaa7424e605eb0402', 13, 3, 'authToken', '[]', 0, '2022-12-20 10:39:45', '2022-12-20 10:39:45', '2023-12-20 17:39:45'),
('2b83b310cdd0efae783b7871d2c608438b27edd2d5284af8cbff303f9e5b2ab9aa7284e166f0fbd3', 25, 3, 'authToken', '[]', 0, '2022-12-21 11:57:50', '2022-12-21 11:57:50', '2023-12-21 18:57:50'),
('2c53d7fb9c199e3c0869a44ac1c840d68c3759fd0444e9e2891b37b39cf28db07c42c95a5b94199a', 8, 3, 'authToken', '[]', 0, '2022-12-19 12:34:43', '2022-12-19 12:34:43', '2023-12-19 19:34:43'),
('2cf1c044f40c30f8be863568ed2bb593876fc90a877bfd8415cc4e3ce1c71b37839a21ebc2da2767', 31, 3, 'authToken', '[]', 0, '2022-12-21 13:15:53', '2022-12-21 13:15:53', '2023-12-21 20:15:53'),
('318441facf74e5eaa29766220bd66d537f7ef180ce91ae33be03f970b95b529d9267499c2b82f134', 13, 3, 'authToken', '[]', 0, '2022-12-21 06:05:52', '2022-12-21 06:05:52', '2023-12-21 13:05:52'),
('318911d6f25cf3779855b1f57707ccccc104e65384222cebffe342f14fad09758e7ee9f9b52230a4', 7, 3, 'authToken', '[]', 0, '2022-12-20 00:34:26', '2022-12-20 00:34:26', '2023-12-20 07:34:26'),
('33c0f7827ed5920af3ce3335274f29927149adc430db85ff49505753d70b4aee50c12b283c1b9287', 13, 3, 'authToken', '[]', 0, '2022-12-21 12:44:17', '2022-12-21 12:44:17', '2023-12-21 19:44:17'),
('3e36dd3731ee3caa17b16bf34fb046d9087ae1c3d31f4791c4ba2a5a2fbe6ddd126fe0d0965e8c90', 7, 3, 'authToken', '[]', 0, '2022-12-20 00:31:30', '2022-12-20 00:31:30', '2023-12-20 07:31:30'),
('41b7b5be6dc1eb60a571c814b1d0be8c7af0a8c2c0359fb799ac24c640b7230fd5ab45e2fcd9d057', 7, 3, 'authToken', '[]', 0, '2022-12-19 12:39:38', '2022-12-19 12:39:38', '2023-12-19 19:39:38'),
('4239f38b1977e82672a471b9b72ee1bbb535184abbb20e4ef931bb414db1603e55d3542022d8f923', 10, 3, 'authToken', '[]', 0, '2022-12-20 06:01:35', '2022-12-20 06:01:35', '2023-12-20 13:01:35'),
('443ab04b16cc3269fc00fa67f7160cc3b67f7dc013d691feda921590d85c8d9a636ffe02495e70b7', 10, 3, 'authToken', '[]', 0, '2022-12-20 06:01:35', '2022-12-20 06:01:35', '2023-12-20 13:01:35'),
('48c6007620fcb5545c2723d39ad603622f38930f9109722b3717195510d94362bb94cb58252aa7c8', 24, 3, 'authToken', '[]', 0, '2022-12-21 06:37:19', '2022-12-21 06:37:19', '2023-12-21 13:37:19'),
('4b83a54df951f7eb729d3829e50c9ca07c2100fa9683414bb413e5fe4b5cd15040f2ea0c2c40c693', 24, 3, 'authToken', '[]', 0, '2022-12-21 11:41:19', '2022-12-21 11:41:19', '2023-12-21 18:41:19'),
('4daa136bf50f9549e7c0ff0f9ba1e1da7461237b841f207b9bb50dfac1706cac7f7cc63487b4312f', 13, 3, 'authToken', '[]', 0, '2022-12-21 06:01:32', '2022-12-21 06:01:32', '2023-12-21 13:01:32'),
('4ddcf40e1c0d2578c1a7ba3f825f58abb1593abb4e5b4b6f541a355f356c8edd54b76f7bcb00e8d6', 7, 3, 'authToken', '[]', 0, '2022-12-20 04:21:06', '2022-12-20 04:21:06', '2023-12-20 11:21:06'),
('4ed11f6af0721d735a89ac0d715269f76430fb930d611abf9123a1a6443ff886915d6fbb7621426c', 7, 3, 'authToken', '[]', 0, '2022-12-20 14:00:15', '2022-12-20 14:00:15', '2023-12-20 21:00:15'),
('58c760269dc1e2d4382089216fa7bfcc17a5dfc368911fde576b50351a63e03fd388e32f1d7d591c', 20, 3, 'authToken', '[]', 0, '2022-12-20 11:47:24', '2022-12-20 11:47:24', '2023-12-20 18:47:24'),
('5d1ea6122f427645a4e237b85502d4874d3e0bd4bc1dce3be5df89a7fe8795afa20d72b861f83417', 13, 3, 'authToken', '[]', 0, '2022-12-21 12:27:25', '2022-12-21 12:27:25', '2023-12-21 19:27:25'),
('5f6017e516ddde41936b839168d79fbf8bf2ba16b5a90f2a7b6a809b31a4d16ac49115dedcece091', 7, 3, 'Authentication Token', '[]', 0, '2022-12-19 12:18:54', '2022-12-19 12:18:54', '2023-12-19 19:18:54'),
('607d2b0c32b16fdff148a0409a06136d6627ed10c93c70975416266598ab072f1b3196cc86cf84e1', 13, 3, 'authToken', '[]', 0, '2022-12-21 12:49:17', '2022-12-21 12:49:18', '2023-12-21 19:49:17'),
('617c601837720f2f9fb9b0efc4ac51a694cb04a11c1be0788d1167fc29077c5639f2b5e007f8797f', 11, 3, 'authToken', '[]', 0, '2022-12-20 08:47:58', '2022-12-20 08:47:58', '2023-12-20 15:47:58'),
('61e10e3e25321715618cab121cf866577cb30a69a6320c00790db0a423fd0f83e1ece062fae9a05c', 13, 3, 'authToken', '[]', 0, '2022-12-21 12:46:09', '2022-12-21 12:46:09', '2023-12-21 19:46:09'),
('63f1cd208fd8f3672f6c79465cb441ed27208c557250ca16639a59f6b40b228a05d2e05591def962', 13, 3, 'authToken', '[]', 0, '2022-12-21 06:02:01', '2022-12-21 06:02:01', '2023-12-21 13:02:01'),
('64ffaf1a613b5f89926eb0f920ff3fb814427b7953414a1826c32877ac1b7a01fdf7653089217678', 3, 3, 'authToken', '[]', 0, '2022-12-20 04:42:47', '2022-12-20 04:42:47', '2023-12-20 11:42:47'),
('67be04ab91c60b72c54914b73a680cac40a9fa5496a592c6afa445e684a217cc08f0df3be699d722', 28, 3, 'authToken', '[]', 0, '2022-12-21 12:26:51', '2022-12-21 12:26:51', '2023-12-21 19:26:51'),
('67c51b0d770cb467fcbc62226ba92159b805a9d1255c7d959332336ddd9314b8d22ad18765915b25', 31, 3, 'authToken', '[]', 0, '2022-12-21 13:18:43', '2022-12-21 13:18:43', '2023-12-21 20:18:43'),
('67eac077536ea3d8627925228016c18be57dd7439cbb884aefe8197f1972b27e7a1e6fde81365e77', 24, 3, 'authToken', '[]', 0, '2022-12-21 06:30:49', '2022-12-21 06:30:49', '2023-12-21 13:30:49'),
('68455a645c9858ba29de62cde506ee379cb73007f066ecb66044b3b2b1a8a1d9a964721855aa8d61', 24, 3, 'authToken', '[]', 0, '2022-12-21 06:18:13', '2022-12-21 06:18:13', '2023-12-21 13:18:13'),
('68b911840473c3d4a333b265db9e2514d97d93632f4993e71a6936623b4db21c25f6dc1f78622d71', 13, 3, 'authToken', '[]', 0, '2022-12-21 12:32:49', '2022-12-21 12:32:49', '2023-12-21 19:32:49'),
('695c1ac6a35d5b15e83d15a6f0281202cae7f3d5d6d00b164bcb3a7d9201cdeb66bf603ae62e7784', 27, 3, 'authToken', '[]', 0, '2022-12-21 12:20:08', '2022-12-21 12:20:08', '2023-12-21 19:20:08'),
('6af1cac5d99fce976379d17c380423c259cfe792b8c650f5c446112c454a00f95045c3441c862466', 13, 3, 'authToken', '[]', 0, '2022-12-21 12:52:11', '2022-12-21 12:52:11', '2023-12-21 19:52:11'),
('6ce88ffb6d1b5f737196712e540dc13379e27cae10d3ce5fa440eff41368b6929434898f3e4ccad2', 7, 3, 'authToken', '[]', 0, '2022-12-19 13:06:26', '2022-12-19 13:06:26', '2023-12-19 20:06:26'),
('725f2b10d75bd8e17a5a949b3f0a88c25ec6e1a5581ca5cbc9bf22cf2bba4d889e3d76a0e21564a3', 7, 3, 'authToken', '[]', 0, '2022-12-19 14:15:09', '2022-12-19 14:15:09', '2023-12-19 21:15:09'),
('751f90ef7043793673c5d2f00d8a9331aa430ba1dc157ccbf9b587a16168408538a5397329d629a4', 13, 3, 'authToken', '[]', 0, '2022-12-21 06:04:26', '2022-12-21 06:04:26', '2023-12-21 13:04:26'),
('789aea50dc4674d9f7d1084e0296b717e46d25a6c3f7a107e9bfe5c27cfd6550337cae2fa01f9eb2', 13, 3, 'authToken', '[]', 0, '2022-12-21 06:03:02', '2022-12-21 06:03:02', '2023-12-21 13:03:02'),
('852774300e8d13ab67e0dab47ee768fcf510755db94c6572ed612287e1f869e8e027f93c3d71b353', 7, 3, 'authToken', '[]', 0, '2022-12-20 13:57:29', '2022-12-20 13:57:29', '2023-12-20 20:57:29'),
('866c4441bde5614eabd6330a4e7a70faba90cc20e635c4245d8f58d02a74892d3e6e0c2d611deef1', 13, 3, 'authToken', '[]', 0, '2022-12-21 12:51:01', '2022-12-21 12:51:01', '2023-12-21 19:51:01'),
('87d7353595f85940b479ef02fdb6ecbe8255518a6743247ac7a868ea787d122a820b3ea63a7b39cb', 10, 3, 'authToken', '[]', 0, '2022-12-20 04:46:11', '2022-12-20 04:46:11', '2023-12-20 11:46:11'),
('8a3afcef2bf61708843dec1b1e6674085736117f8da23395e78196f9cedf34fd1a8d6ee5368cd2d9', 7, 3, 'authToken', '[]', 0, '2022-12-19 14:12:44', '2022-12-19 14:12:44', '2023-12-19 21:12:44'),
('8c4b464dc5ecc9eb90dedc57fb24bcee070c5cf7b36f149672d9e7ae119e33579da6c6a566ea54ba', 7, 3, 'authToken', '[]', 0, '2022-12-20 04:40:41', '2022-12-20 04:40:41', '2023-12-20 11:40:41'),
('8e6fdeee012d2862d251b1d22a50d3eff4e2b22b8932c2bc0655f6b2a8666ee847a6c2a3beb33a14', 7, 3, 'authToken', '[]', 0, '2022-12-19 12:43:39', '2022-12-19 12:43:39', '2023-12-19 19:43:39'),
('95c0234acee16c7548f9eecf89a5ca21b2dc7b6de593fb0c19ff2dca4922f369e73fbbdd9ef15713', 7, 3, 'authToken', '[]', 0, '2022-12-20 07:53:23', '2022-12-20 07:53:23', '2023-12-20 14:53:23'),
('976272e021dd5e9d04f00836d9aa4bcfb7ef1e247ec47e9d308795f7b7af4c06a2e484d09c6d6e9e', 26, 3, 'authToken', '[]', 0, '2022-12-21 12:02:57', '2022-12-21 12:02:58', '2023-12-21 19:02:57'),
('986a6a228f0aae5dd2e6a5c2fffbca04af6dc699f87f4da1a82ee992d9ae00f51bcb52c0ff3634ae', 28, 3, 'authToken', '[]', 0, '2022-12-21 12:56:54', '2022-12-21 12:56:54', '2023-12-21 19:56:54'),
('9bba2101e43d0fc344e6089db448d5049c9896149ed800619de0a35eb1c07e457da653c2d69a9347', 7, 3, 'authToken', '[]', 0, '2022-12-20 00:31:18', '2022-12-20 00:31:18', '2023-12-20 07:31:18'),
('9c9af3f5743101cf7c35f356f520932497edd62892f427cbf19cde1d38d8f02d714efad5e25ef435', 24, 3, 'authToken', '[]', 0, '2022-12-21 06:39:32', '2022-12-21 06:39:32', '2023-12-21 13:39:32'),
('a05f5ccdc2139b9d508c1d692a0d6b029554faa11238ae7c60273cd08d292ec147ea17702f369d93', 13, 3, 'authToken', '[]', 0, '2022-12-20 10:32:22', '2022-12-20 10:32:22', '2023-12-20 17:32:22'),
('a14cf2af3fa95b5ba951d5598609311b8c5fc7fcb738cbeeecf33db4907a208bdc59f2f7e85f7760', 24, 3, 'authToken', '[]', 0, '2022-12-21 06:35:52', '2022-12-21 06:35:52', '2023-12-21 13:35:52'),
('a373565861dfb03486d1b68b3dcd27ff2bf860390c881125c6ec917939d811476d002272a285845e', 24, 3, 'authToken', '[]', 0, '2022-12-21 06:33:49', '2022-12-21 06:33:49', '2023-12-21 13:33:49'),
('a589abb0cb825b3bea00a7c2501e4a524ea9dd9be36fc0d7592d06a7b5fd170e0991769d57efbad8', 13, 3, 'authToken', '[]', 0, '2022-12-21 13:19:15', '2022-12-21 13:19:15', '2023-12-21 20:19:15'),
('aa0ad47095ebfa0fc494b8cc122881cee626b83fc7220b0849df44ee2b242bc276b82383120fc1c2', 8, 3, 'authToken', '[]', 0, '2022-12-19 12:34:28', '2022-12-19 12:34:28', '2023-12-19 19:34:28'),
('ab4c55be447297ba7fb02aeadb2d1080f0ba83a0f1e92d503543604e9c08ae9739a7ebc4ee76b143', 24, 3, 'authToken', '[]', 0, '2022-12-21 06:40:59', '2022-12-21 06:40:59', '2023-12-21 13:40:59'),
('ae6b75ba72a85c71db1a090469d28c885dda7f7595a8f5001acd8f9306bab6ba13acc7910d37e979', 13, 3, 'authToken', '[]', 0, '2022-12-21 12:52:29', '2022-12-21 12:52:29', '2023-12-21 19:52:29'),
('b0156cffe164285ff06b4717278ddb917c65b80628a08306a1cac1d2e606f226852da1ab1ef7f5ec', 13, 3, 'authToken', '[]', 0, '2022-12-21 06:05:12', '2022-12-21 06:05:12', '2023-12-21 13:05:12'),
('b165bc35185826e38acae98b4eb7ae65fd23246c0325407a9649c763276697e2e06d640376270f19', 24, 3, 'authToken', '[]', 0, '2022-12-21 06:38:30', '2022-12-21 06:38:30', '2023-12-21 13:38:30'),
('b4bf64e77658b02e5fdf19ea0bf3199e74523317f8eaa4b5c209e84f39f20e5f59351e45ecf0cba3', 7, 3, 'authToken', '[]', 0, '2022-12-20 04:21:06', '2022-12-20 04:21:06', '2023-12-20 11:21:06'),
('bf04e167c3a6518cd18535bc0903dc3a80b7f1177d2260df1605bb6b00fd721582c8e4771936861a', 7, 3, 'authToken', '[]', 0, '2022-12-20 00:31:31', '2022-12-20 00:31:31', '2023-12-20 07:31:31'),
('bf0d93f92a46c4ed0ad070ba869c50f27078dbbe726763e735d8d6f1dbc5f05319a53d882c7548a0', 24, 3, 'authToken', '[]', 0, '2022-12-21 06:38:01', '2022-12-21 06:38:01', '2023-12-21 13:38:01'),
('bf7e81e52cf9184c940453991985ac98bca79bba42dc6aa4ad9e6f55e20d727bc005b0076497f878', 11, 3, 'authToken', '[]', 0, '2022-12-20 10:40:54', '2022-12-20 10:40:54', '2023-12-20 17:40:54'),
('c331102b6241cfb3bf41a0b19547fadf660be4d4236cf473159cc9ec640a6493fc87e81ad04ff2d8', 7, 3, 'authToken', '[]', 0, '2022-12-20 02:13:07', '2022-12-20 02:13:07', '2023-12-20 09:13:07'),
('c3d804dd2536e79cc2b46fb9cd293c1d29d2d4a8574ae02c704dd5723f89f91cbb7a9cd66c8a2734', 13, 3, 'authToken', '[]', 0, '2022-12-20 10:33:04', '2022-12-20 10:33:04', '2023-12-20 17:33:04'),
('cdf56d3b983266f931e63ca4854285cfef9e46bfdfa85ec3366e7b0328cddb0a9f06fe3ddbb3ff87', 13, 3, 'authToken', '[]', 0, '2022-12-20 14:00:25', '2022-12-20 14:00:25', '2023-12-20 21:00:25'),
('d18785dfbb78e5e438ecf1009d739c80b17ecc7af05cb291fc2e67a5b34ab22a1ea9715d60d47785', 31, 3, 'authToken', '[]', 0, '2022-12-21 13:23:26', '2022-12-21 13:23:26', '2023-12-21 20:23:26'),
('d3290a1d86552d5204f69e0c0c7ea2e532a6889c0ed6fc527f700ebae541dd44c53002dc33817c4b', 13, 3, 'authToken', '[]', 0, '2022-12-20 10:38:25', '2022-12-20 10:38:25', '2023-12-20 17:38:25'),
('d459b8d2a3af7a2f76e8cde52927d9d73e3e44f11c339730a9fb5e396f1a8c6727bf7d048a9fd8a7', 7, 3, 'authToken', '[]', 0, '2022-12-19 13:59:37', '2022-12-19 13:59:37', '2023-12-19 20:59:37'),
('d9c5b172cc5ba6378680cc8345ed23722154a6d19a1cf2179e9a5bd1b4d82f669aee8ae7e96e81fd', 13, 3, 'authToken', '[]', 0, '2022-12-21 12:49:39', '2022-12-21 12:49:39', '2023-12-21 19:49:39'),
('db82233c20710af717cc9022b8b32582e783eadc02ac699ee3895803c3ffd4bf81a7c19710ade563', 13, 3, 'authToken', '[]', 0, '2022-12-21 12:45:05', '2022-12-21 12:45:05', '2023-12-21 19:45:05'),
('df0c06d9598ee4df8a28c5c997543e24bd90e1ce946d33ebeda49315d393fe28bf70b04d1455ab73', 27, 3, 'authToken', '[]', 0, '2022-12-21 12:19:35', '2022-12-21 12:19:35', '2023-12-21 19:19:35'),
('dfe34c4b4de0b10548f7cd7fc9dccb4d285fe934dc670e8b81fb76443284d8790ac916b8490def78', 7, 3, 'authToken', '[]', 0, '2022-12-20 04:21:05', '2022-12-20 04:21:05', '2023-12-20 11:21:05'),
('e5a43b6b8872f823c6dbcb26e33a1c467e08c8b47d40d738dafc3a584a6241f0d3da10bb9cfb3be4', 13, 3, 'authToken', '[]', 0, '2022-12-20 10:40:29', '2022-12-20 10:40:29', '2023-12-20 17:40:29'),
('ec7777b38ad4f3cdc59f823278a3a947be40a1641df0969e07a21a7a456753e6028f5fc5b56e05eb', 7, 3, 'authToken', '[]', 0, '2022-12-21 12:12:17', '2022-12-21 12:12:17', '2023-12-21 19:12:17'),
('f70636d7fb43965984f95143a864b9c91e98563d5400afe0d58306ead9cd32bc886f51378cc2bd3e', 7, 3, 'authToken', '[]', 0, '2022-12-19 12:35:09', '2022-12-19 12:35:09', '2023-12-19 19:35:09'),
('fdaea7a47de3f0e0917f6d9da877709d877f6df62f0752411ce38ce4541aa497812cc7c77ede52f0', 28, 3, 'authToken', '[]', 0, '2022-12-21 12:48:41', '2022-12-21 12:48:41', '2023-12-21 19:48:41');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'R5g0Y0aBkgdS3wh20TYsbGADRGrxRajA7CbRkc93', NULL, 'http://localhost', 1, 0, 0, '2022-12-19 12:07:34', '2022-12-19 12:07:34'),
(2, NULL, 'Laravel Password Grant Client', 'jzdiRsi6osdO70QOJxLUhW6MI93Gn93qHjJrRDms', 'users', 'http://localhost', 0, 1, 0, '2022-12-19 12:07:34', '2022-12-19 12:07:34'),
(3, NULL, 'Laravel Personal Access Client', 'Rv42kctKGunUg87ngjhZKSYSVkLGOGrQcA1ykb4s', NULL, 'http://localhost', 1, 0, 0, '2022-12-19 12:12:02', '2022-12-19 12:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-12-19 12:07:34', '2022-12-19 12:07:34'),
(2, 3, '2022-12-19 12:12:02', '2022-12-19 12:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'authToken', 'faca5e8b8af3ce1ba62f398eb3d94aa8b8d1b57507513dda736dccb93ead9993', '[\"*\"]', NULL, '2022-12-15 11:32:41', '2022-12-15 11:32:41'),
(2, 'App\\Models\\User', 1, 'authToken', '5f6f1deda2cdda2e5a2020877f3d99e5b46d6516216f786360e362f23b6175dd', '[\"*\"]', NULL, '2022-12-15 11:32:42', '2022-12-15 11:32:42'),
(3, 'App\\Models\\User', 1, 'authToken', 'b433913e1c9f765e0cc59125c60f6554488d0b1bf6c48ddb56ef3f2e886711b9', '[\"*\"]', NULL, '2022-12-15 11:34:15', '2022-12-15 11:34:15'),
(4, 'App\\Models\\User', 1, 'authToken', 'ab3c6a1cfdcdba3457af0c54707c59bdf4994e9444d99a95d44bc9bcfa5864bb', '[\"*\"]', NULL, '2022-12-15 11:35:44', '2022-12-15 11:35:44'),
(5, 'App\\Models\\User', 1, 'authToken', '3aa0428eb0efe89aa3e92b9c46a4603f97988a9a75b8124801613979f9fbee8a', '[\"*\"]', NULL, '2022-12-15 11:36:15', '2022-12-15 11:36:15'),
(6, 'App\\Models\\User', 1, 'authToken', '97f9caa199e30baaffb0a2a5262f1111e9b1ec2d030d79f462838314c2c02321', '[\"*\"]', NULL, '2022-12-15 12:03:04', '2022-12-15 12:03:04'),
(7, 'App\\Models\\User', 2, 'authToken', '621d65350e79728a231f875fc47419e296275de4d42ac64c1df750916973fda6', '[\"*\"]', NULL, '2022-12-17 04:08:52', '2022-12-17 04:08:52'),
(8, 'App\\Models\\User', 3, 'authToken', 'af75c4e49dae7f25621adc0699e7ec36f5aa3f7c69232c9ca5e072d64be93e84', '[\"*\"]', NULL, '2022-12-17 04:31:32', '2022-12-17 04:31:32'),
(9, 'App\\Models\\User', 3, 'authToken', '7a3c07aed040f893bcab452ae8f980ebd79759898bffc9e84332ef9aa4443b1f', '[\"*\"]', NULL, '2022-12-17 04:32:03', '2022-12-17 04:32:03'),
(10, 'App\\Models\\User', 3, 'Authentication Token', '8f01b1bf07ed15e91f6350b2dee696238aa085367e7d45f07ac34354e236c887', '[\"*\"]', NULL, '2022-12-17 04:34:45', '2022-12-17 04:34:45'),
(11, 'App\\Models\\User', 3, 'Authentication Token', '201665437d1b97f752e6fbac6dae5f1a913f9e1548fa8e2f2d6e917108218297', '[\"*\"]', NULL, '2022-12-17 04:35:03', '2022-12-17 04:35:03'),
(12, 'App\\Models\\User', 4, 'Authentication Token', 'ee78924a7293fd535570ac1d16c209e86111702129aa6974547dcf21bc8205b5', '[\"*\"]', NULL, '2022-12-17 04:38:17', '2022-12-17 04:38:17'),
(13, 'App\\Models\\User', 4, 'Authentication Token', '16f3339c6f6d08d4a64072cc464d86a5ade91be79a8104be5fa434b1c48528d7', '[\"*\"]', NULL, '2022-12-17 04:42:23', '2022-12-17 04:42:23'),
(14, 'App\\Models\\User', 5, 'Authentication Token', 'ce4f05523f58554c5a385e2363394f881472b75c67cdbb271d2c2cbaddb5ad2a', '[\"*\"]', NULL, '2022-12-17 06:42:58', '2022-12-17 06:42:58'),
(15, 'App\\Models\\User', 5, 'Authentication Token', 'a77586eabd3686325116ac7c0b43a4fda48ae3453e180584fd6c9d94de1f86c1', '[\"*\"]', NULL, '2022-12-17 06:43:13', '2022-12-17 06:43:13'),
(16, 'App\\Models\\User', 5, 'Authentication Token', 'e21b2fe665f3dbd15319c3e9c30ed77e762003f0a6190cb952213555b0074114', '[\"*\"]', NULL, '2022-12-17 06:43:22', '2022-12-17 06:43:22'),
(17, 'App\\Models\\User', 5, 'Authentication Token', '19594ca47f063536ebb2a6995027e60015617b6690c4d628fea016b93987eb73', '[\"*\"]', NULL, '2022-12-17 06:43:27', '2022-12-17 06:43:27'),
(18, 'App\\Models\\User', 5, 'Authentication Token', '18548f451a1ff51c93aaea35ce65c319ca80d88458e054983152e23099102270', '[\"*\"]', NULL, '2022-12-17 06:43:54', '2022-12-17 06:43:54'),
(19, 'App\\Models\\User', 1, 'Authentication Token', '144560d8d7aa435ee86b647e63cccc9fabd80ede6d231a8c2f200424856befca', '[\"*\"]', NULL, '2022-12-17 06:44:41', '2022-12-17 06:44:41'),
(20, 'App\\Models\\User', 6, 'Authentication Token', '2dae14ca5f093f8bb2701e7906a9dacb436233e577a20865fa41b60758f78e51', '[\"*\"]', NULL, '2022-12-17 06:45:31', '2022-12-17 06:45:31'),
(21, 'App\\Models\\User', 6, 'Authentication Token', '8b4cad48b308cea000c6de21a7167fa884620184d5b055dd2f8d790d89e4a733', '[\"*\"]', NULL, '2022-12-17 06:45:35', '2022-12-17 06:45:35'),
(22, 'App\\Models\\User', 6, 'Authentication Token', '2b75f10220bdf535d6a877917c464be4d6556dbf24f4e19d42ca9dadc4e9ad90', '[\"*\"]', NULL, '2022-12-17 06:45:38', '2022-12-17 06:45:38'),
(23, 'App\\Models\\User', 6, 'Authentication Token', '7fd557311c853a00957068426e343ac705b75477f35692ce2ea33a3b6ee31ef9', '[\"*\"]', NULL, '2022-12-17 06:45:53', '2022-12-17 06:45:53'),
(24, 'App\\Models\\User', 6, 'Authentication Token', 'e0b80b215ba7a82954becc5c62b9bce6db2aaba6a882c8b640cd27ad0cb34e3a', '[\"*\"]', NULL, '2022-12-17 06:46:43', '2022-12-17 06:46:43'),
(25, 'App\\Models\\User', 6, 'Authentication Token', '2d5436133700ac71d7489de8ad85bf0f42ea83fb9fb405a621a218404c74cb4f', '[\"*\"]', NULL, '2022-12-17 06:49:44', '2022-12-17 06:49:44'),
(26, 'App\\Models\\User', 6, 'authToken', '5f9cebd6b054fd2815628c843f5af7fb7d2491f63a2e58a9cd5c1f45c5a062b9', '[\"*\"]', NULL, '2022-12-17 06:50:42', '2022-12-17 06:50:42'),
(27, 'App\\Models\\User', 6, 'authToken', 'e495571208732cf026ba9e46b7590101ffde7a19daa237d789414cefa090001b', '[\"*\"]', NULL, '2022-12-17 07:03:32', '2022-12-17 07:03:32'),
(28, 'App\\Models\\User', 6, 'authToken', '684d78ae2fb1cd2c0ebdfe932b1e39cbb63325f47aa5f3c1ab952eece88badbb', '[\"*\"]', NULL, '2022-12-17 07:25:21', '2022-12-17 07:25:21'),
(29, 'App\\Models\\User', 6, 'authToken', '2364c59ba50b8505d1fa7c9f03a1677378d6819127904cd054e09d5d6c25d77f', '[\"*\"]', NULL, '2022-12-17 07:26:02', '2022-12-17 07:26:02'),
(30, 'App\\Models\\User', 6, 'authToken', 'a33fff4a719a6ba7077c1b83b39f41fe3bf060d4d881c453f0e9c5aaef9c1bc6', '[\"*\"]', NULL, '2022-12-17 07:26:18', '2022-12-17 07:26:18'),
(31, 'App\\Models\\User', 6, 'authToken', '62f51595733a57b026ff7fdd33bb35804ebb46e835042f48ca1973586cbf7698', '[\"*\"]', NULL, '2022-12-17 07:26:38', '2022-12-17 07:26:38'),
(32, 'App\\Models\\User', 6, 'authToken', 'a49930ba95924555f6bbb4c680a34a47f10bc26b2745c082440f1aa5227bde64', '[\"*\"]', NULL, '2022-12-17 07:28:30', '2022-12-17 07:28:30'),
(33, 'App\\Models\\User', 6, 'authToken', '44cfc71d1fdd58f26d55122ab15f9ec03d9388c9937cd5458af050fb7b45d67c', '[\"*\"]', NULL, '2022-12-17 07:39:31', '2022-12-17 07:39:31'),
(34, 'App\\Models\\User', 6, 'authToken', '60c4ba6f1a1f49b447529daff8f6ea745efab979cd5642384bb4a8aa321e5b5d', '[\"*\"]', NULL, '2022-12-17 07:42:41', '2022-12-17 07:42:41'),
(35, 'App\\Models\\User', 6, 'authToken', '43338f3c783771174805bdd826b963c04db7897cf905150ef6e1b02674bdf0a4', '[\"*\"]', NULL, '2022-12-17 07:42:53', '2022-12-17 07:42:53'),
(36, 'App\\Models\\User', 6, 'authToken', 'e74820099cb932efe5f243c78a1794876db0cf2b65f288262c84f9a834c6e356', '[\"*\"]', NULL, '2022-12-17 07:43:24', '2022-12-17 07:43:24'),
(37, 'App\\Models\\User', 6, 'authToken', '6b5731f2438aeddc0c4e963769291130fed30690e4c479226b844b685297d8c1', '[\"*\"]', NULL, '2022-12-17 07:43:37', '2022-12-17 07:43:37'),
(38, 'App\\Models\\User', 6, 'authToken', '99602572e8eba46d4b1e5578b5df57f420182c4718bddde8d18f938b17246f3e', '[\"*\"]', NULL, '2022-12-17 07:43:52', '2022-12-17 07:43:52'),
(39, 'App\\Models\\User', 6, 'authToken', '515fa09a8e261066bead6c7e7798ab8f6ecccea1463ade224dd39bf8fc61a5a4', '[\"*\"]', NULL, '2022-12-17 07:47:04', '2022-12-17 07:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ricky13', '$2y$10$2Ce5wmyI83yS6uXrVg7rbOftuEdtNlP9fj3FkZXKZZklWmdUQ7rtK', '12345@gmail.com', NULL, NULL, '2022-12-15 11:32:15', '2022-12-15 11:32:15'),
(2, 'Seto145', '$2y$10$xTXp/38aW0uQ3WMSdaGpcOxmg7d7iancQCCI5qeLaQ75GjnHD6rQu', 'Seto14@gmail.com', NULL, NULL, '2022-12-17 04:08:30', '2022-12-17 04:08:30'),
(7, 'seto88', '12345678', 'seto66@gmail.com', NULL, NULL, '2022-12-19 12:18:40', '2022-12-21 12:12:36'),
(10, 'henri', '123', 'henriaja@gmail.com', NULL, NULL, '2022-12-20 04:46:06', '2022-12-20 07:30:40'),
(13, 'admin', '$2y$10$vE7KOf8DrTDAcJep87T5yO7tGB4Ufefk3tmgablOBs77uljA1HbQK', 'admin@gmail.com', NULL, NULL, '2022-12-20 10:32:10', '2022-12-20 10:32:10'),
(31, 'seto12', '$2y$10$DcR7psmCcG1emrA73IRL9eD0tAOj6AWmYSYG1/bOBuIzXHfHYyB9.', 'seto12@gmail.com', '2022-12-21 13:15:45', NULL, '2022-12-21 13:15:31', '2022-12-21 13:18:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comics`
--
ALTER TABLE `comics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `majalahs`
--
ALTER TABLE `majalahs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `novels`
--
ALTER TABLE `novels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comics`
--
ALTER TABLE `comics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `majalahs`
--
ALTER TABLE `majalahs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `novels`
--
ALTER TABLE `novels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
