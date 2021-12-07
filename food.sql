-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2021 年 12 月 07 日 08:16
-- サーバのバージョン： 10.4.13-MariaDB
-- PHP のバージョン: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `food`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `comments`
--

INSERT INTO `comments` (`id`, `info_id`, `user_id`, `name`, `desc`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '店舗例5', 'いい店舗ですね！', '2021-12-05 15:02:47', '2021-12-05 15:02:47'),
(2, 2, 5, '店舗例5', 'とてもおいしいです！', '2021-12-05 15:03:20', '2021-12-05 15:03:20'),
(3, 3, 6, '店舗例6', 'ままいいですね！', '2021-12-05 15:05:01', '2021-12-05 15:05:01'),
(4, 2, 6, '店舗例6', 'とてもいいです！おいしいかったです。', '2021-12-05 15:05:25', '2021-12-05 15:05:25'),
(5, 1, 6, '店舗例6', 'ままいいですね！僕にっとては', '2021-12-05 15:05:57', '2021-12-05 15:05:57'),
(6, 5, 7, '店舗例7', 'おいしいですね！', '2021-12-05 15:09:01', '2021-12-05 15:09:01'),
(7, 2, 7, '店舗例7', '好きです！', '2021-12-05 15:09:13', '2021-12-05 15:09:13'),
(8, 4, 7, '店舗例7', 'いいですね！', '2021-12-05 15:09:24', '2021-12-05 15:09:24'),
(9, 1, 7, '店舗例7', 'いいですね', '2021-12-05 15:09:52', '2021-12-05 15:09:52'),
(10, 3, 7, '店舗例7', 'いいです！', '2021-12-05 15:11:19', '2021-12-05 15:11:19'),
(11, 1, 8, 'Admin', 'iiiiiiideusne', '2021-12-05 15:57:32', '2021-12-05 15:57:32'),
(12, 4, 8, 'Admin', 'まま', '2021-12-05 15:59:18', '2021-12-05 15:59:18'),
(13, 2, 18, '名前09', 'この店舗はとてもいいです！', '2021-12-05 16:20:25', '2021-12-05 16:20:25'),
(14, 2, 18, '名前09', 'よくなった', '2021-12-05 16:21:36', '2021-12-05 16:21:36'),
(15, 10, 22, 'ヴォダイチン', 'いい店舗ですね', '2021-12-05 22:04:29', '2021-12-05 22:04:29'),
(16, 9, 22, 'ヴォダイチン', '好きですね！', '2021-12-05 22:08:14', '2021-12-05 22:08:14'),
(17, 1, 4, '店舗例４', 'とてもいいですね', '2021-12-06 18:30:39', '2021-12-06 18:30:39');

-- --------------------------------------------------------

--
-- テーブルの構造 `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `info_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `images`
--

INSERT INTO `images` (`id`, `info_id`, `name`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 'xoi', 'food/urTgcPnGdUYJm8IisLtIeideGSlCkmnBJqaKYaQx.jpeg', '2021-12-05 14:56:55', '2021-12-05 14:56:55'),
(2, 2, 'tom', 'food/x2YYEI6hIDONmwkriWgAx5R536yQRPyS3XEBjppU.jpeg', '2021-12-05 14:59:49', '2021-12-05 14:59:49'),
(3, 2, 'ocxao', 'food/zOKkqSiYH9mnzL0rsoabCvnPyEwdBohKFtrN2AOE.jpeg', '2021-12-05 15:00:10', '2021-12-05 15:00:10'),
(4, 3, 'Sò', 'food/LHGfIeAEljykvIlPQxqQqJa6pzhJk9XhiNKZJfur.jpeg', '2021-12-05 15:02:22', '2021-12-05 15:02:22'),
(5, 4, 'Típ Bò', 'food/hhcQE1AAUDi9kKsEfWTTwUgyuISfL0T2sSA4lTSg.jpeg', '2021-12-05 15:04:48', '2021-12-05 15:04:48'),
(6, 5, 'Phở bò', 'food/BwBpKa2qy4sYHE8uotsiuUcYgTp0YHkjf2EVgxvL.jpeg', '2021-12-05 15:08:30', '2021-12-05 15:08:30'),
(7, 6, 'Phở gà', 'food/jhPdi9UluZ9cfAobXR8NU5tbQMNQYvQNSYEzWrdz.jpeg', '2021-12-05 16:16:56', '2021-12-05 16:16:56'),
(8, 6, 'Típ', 'food/7LE91B7969YRZLS589qqbU1d6dIUWa2O1d4bYsIr.jpeg', '2021-12-05 16:17:41', '2021-12-05 16:17:41'),
(9, 7, 'Ốc om chuối', 'food/bznoyjE1tKGSVGi2tHmb66ZGygkvAcaEqUh4WfJY.jpeg', '2021-12-05 17:01:08', '2021-12-05 17:01:08'),
(10, 8, '22', 'food/o5AiCWw3AdQIuG08RjDuPciotye5Tuz7cKKsLidH.jpeg', '2021-12-05 17:13:44', '2021-12-05 17:13:44'),
(11, 8, '2222', 'food/PNPYgF0TaTNft9ipNOSMOYoJFQ42zNlxEJJCc0du.jpeg', '2021-12-05 17:44:14', '2021-12-05 17:44:14'),
(12, 8, '33', 'food/gLJX2eAKqhM2lh6Rd83LfRRrPUEv2F7jJhAfgA94.jpeg', '2021-12-05 17:48:40', '2021-12-05 17:48:40'),
(13, 8, '22', 'food/kFDfx6upnuVkA9IY596wkaaTBJL3y4ZAu110Arqa.jpeg', '2021-12-05 17:48:49', '2021-12-05 17:48:49'),
(14, 8, '3', 'food/ULUEOVdM60ze3eBqso6hc8s5jnnDUqU2NilLOqfR.jpeg', '2021-12-05 17:49:09', '2021-12-05 17:49:09'),
(15, 9, '333', 'food/Nz82aAdVM0aDMRZFxbRjYBUSmJciC8S95ykPtKhX.jpeg', '2021-12-05 17:54:37', '2021-12-05 17:54:37'),
(16, 10, '1b24b12', 'food/4INAwK9OSK3AyX1vxTUMJjQIKueRc767ixPTpW3t.jpeg', '2021-12-05 18:32:23', '2021-12-05 18:32:23'),
(17, 11, '125125', 'food/fjUFqK8kmPylTEp7EYjJCW7GPObdP2QC5llgoBkI.jpeg', '2021-12-05 18:32:30', '2021-12-05 18:32:30'),
(18, 13, '123', 'food/yXo6Sq0zfw1XamSPqke3hqDKsZHkz9uQgoJ9oUGv.jpeg', '2021-12-05 22:06:28', '2021-12-05 22:06:28'),
(19, 14, '33', 'food/sTHK0KdBrucG9GX6FgskzjwZjlT1x7Kdvci8Bcux.jpeg', '2021-12-05 22:06:40', '2021-12-05 22:06:40'),
(20, 14, '4444', 'food/GyO0YOzwXBKJWZ9OthFpgn4tjnr4mXDVigB4szna.jpeg', '2021-12-05 22:07:01', '2021-12-05 22:07:01'),
(21, 15, '12', 'food/HmOdQ7W4UGLImvXXO1AmTOqv5xTb1FKTDkNNB67r.jpeg', '2021-12-06 18:33:23', '2021-12-06 18:33:23'),
(22, 16, '2', 'food/sLBdX9yGpPb7wgP0QlI9Dqc3p64alrkSDO4uYV2q.jpeg', '2021-12-06 18:33:31', '2021-12-06 18:33:31'),
(23, 15, '3', 'food/zvuYaXnnRUPwqLEJHv7xlZB6TQKO7PjyVtk2KEct.jpeg', '2021-12-06 18:33:41', '2021-12-06 18:33:41');

-- --------------------------------------------------------

--
-- テーブルの構造 `infomations`
--

CREATE TABLE `infomations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_count` int(11) NOT NULL,
  `open` int(11) NOT NULL,
  `close` int(11) NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_money` int(11) NOT NULL,
  `max_money` int(11) NOT NULL,
  `delivery` int(11) NOT NULL,
  `genre` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`genre`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `infomations`
--

INSERT INTO `infomations` (`id`, `user_id`, `name`, `address`, `url`, `img_count`, `open`, `close`, `number`, `min_money`, `max_money`, `delivery`, `genre`, `created_at`, `updated_at`) VALUES
(1, 2, '店舗名１', '住所例１', 'https://google.com', 0, 3, 6, '080-5466-2222', 200, 300, 1, '[\"\\u5b9a\\u98df\",\"\\u9eba\\u985e\"]', '2021-12-05 14:56:28', '2021-12-05 14:56:28'),
(2, 4, '店舗４', '住所４', 'https://google.com', 0, 9, 23, '566-4422-1122', 123, 456, 1, '[\"\\u5b9a\\u98df\"]', '2021-12-05 14:59:33', '2021-12-05 14:59:33'),
(3, 5, '店舗5', '住所5', 'https://foodpanda.co.jp/abc', 0, 3, 24, '123-44-556', 123, 123, 1, '[\"\\u5b9a\\u98df\",\"\\u9eba\\u985e\"]', '2021-12-05 15:02:08', '2021-12-05 15:02:08'),
(6, 18, '店舗名10', '住所の例10', 'https://google.co.jp', 0, 12, 24, '080-555-555', 200, 800, 2, '[\"\\u5b9a\\u98df\",\"\\u30ab\\u30ec\\u30fc\"]', '2021-12-05 16:16:39', '2021-12-05 16:23:49'),
(8, 7, '0012 51 2512 5', '12 512 51 25', 'https', 0, 23, 21, '125125125125', 11, 22, 2, '[\"\\u5b9a\\u98df\",\"\\u9eba\\u985e\",\"\\u30ab\\u30ec\\u30fc\"]', '2021-12-05 17:13:29', '2021-12-05 17:47:48'),
(9, 7, 'New', 'New', '125126126', 0, 24, 25, '121251', 2442, 1122, 2, '[\"\\u9eba\\u985e\"]', '2021-12-05 17:54:14', '2021-12-05 17:54:14'),
(10, 21, '15b 12b51b251', '25b125b1251', '125126126', 0, 25, 22, '25125125', 125125, 125125125, 2, '[\"\\u5b9a\\u98df\",\"\\u9eba\\u985e\"]', '2021-12-05 18:31:59', '2021-12-05 18:31:59'),
(11, 21, '15b 12b51b25125n125125', '25b125b12512b512512n', '125126126', 0, 25, 22, '25125125512n51n251', 125125, 125125125, 2, '[\"\\u5b9a\\u98df\",\"\\u9eba\\u985e\"]', '2021-12-05 18:32:04', '2021-12-05 18:32:04'),
(14, 22, '新世界2', '新世界2', 'https://localhost:8000', 0, 12, 14, '080-5653-6222', 9000, 1200, 2, '[\"\\u5b9a\\u98df\",\"\\u9eba\\u985e\",\"\\u30ab\\u30ec\\u30fc\"]', '2021-12-05 22:06:06', '2021-12-05 22:06:06'),
(15, 4, 'HHHHH1', 'HHHHHH2', '126162126', 0, 2, 4, '125126-216-12-6', 125, 245, 2, '[\"\\u9eba\\u985e\",\"\\u5b9a\\u98df\"]', '2021-12-06 18:25:10', '2021-12-06 18:25:10'),
(16, 4, 'HHHHH14346363', 'HHHHHH2246264', '126162126', 0, 2, 4, '125126-216-12-6246', 125, 245, 2, '[\"\\u9eba\\u985e\",\"\\u5b9a\\u98df\"]', '2021-12-06 18:25:42', '2021-12-06 18:25:42');

-- --------------------------------------------------------

--
-- テーブルの構造 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(52, '2014_10_12_000000_create_users_table', 1),
(53, '2014_10_12_100000_create_password_resets_table', 1),
(54, '2021_12_02_154551_create_infomations_table', 1),
(55, '2021_12_02_160012_create_images_table', 1),
(56, '2021_12_04_101014_create_comments_table', 1),
(57, '2021_12_04_124727_create_stars_table', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `stars`
--

CREATE TABLE `stars` (
  `id` int(10) UNSIGNED NOT NULL,
  `info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `stars`
--

INSERT INTO `stars` (`id`, `info_id`, `user_id`, `star`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 4, '2021-12-05 15:02:47', '2021-12-05 15:02:47'),
(2, 2, 5, 5, '2021-12-05 15:03:20', '2021-12-05 15:03:20'),
(3, 3, 6, 3, '2021-12-05 15:05:01', '2021-12-05 15:05:01'),
(4, 2, 6, 5, '2021-12-05 15:05:25', '2021-12-05 15:05:25'),
(5, 1, 6, 3, '2021-12-05 15:05:57', '2021-12-05 15:05:57'),
(6, 1, 7, 3, '2021-12-05 15:09:01', '2021-12-05 15:09:52'),
(7, 2, 7, 4, '2021-12-05 15:09:13', '2021-12-05 15:09:13'),
(8, 4, 7, 5, '2021-12-05 15:09:24', '2021-12-05 15:09:24'),
(9, 3, 7, 5, '2021-12-05 15:11:19', '2021-12-05 15:11:19'),
(10, 4, 8, 3, '2021-12-05 15:57:32', '2021-12-05 15:59:18'),
(11, 2, 18, 4, '2021-12-05 16:20:25', '2021-12-05 16:20:25'),
(12, 2, 18, 5, '2021-12-05 16:21:36', '2021-12-05 16:21:36'),
(13, 10, 22, 5, '2021-12-05 22:04:30', '2021-12-05 22:04:30'),
(14, 9, 22, 5, '2021-12-05 22:08:14', '2021-12-05 22:08:14'),
(15, 1, 4, 0, '2021-12-06 18:30:39', '2021-12-06 18:32:09'),
(16, 1, 4, 5, '2021-12-06 18:31:17', '2021-12-06 18:31:17'),
(17, 1, 4, 0, '2021-12-06 18:31:21', '2021-12-06 18:31:21'),
(18, 1, 4, 0, '2021-12-06 18:31:23', '2021-12-06 18:31:23'),
(19, 1, 4, 0, '2021-12-06 18:31:23', '2021-12-06 18:31:23'),
(20, 1, 4, 0, '2021-12-06 18:31:23', '2021-12-06 18:31:23'),
(21, 1, 4, 0, '2021-12-06 18:31:25', '2021-12-06 18:31:25'),
(22, 1, 4, 0, '2021-12-06 18:31:26', '2021-12-06 18:31:26'),
(23, 1, 4, 0, '2021-12-06 18:31:27', '2021-12-06 18:31:27'),
(24, 1, 4, 0, '2021-12-06 18:31:29', '2021-12-06 18:31:29'),
(25, 1, 4, 0, '2021-12-06 18:31:29', '2021-12-06 18:31:29'),
(26, 1, 4, 0, '2021-12-06 18:31:30', '2021-12-06 18:31:30'),
(27, 3, 4, 5, '2021-12-06 18:32:19', '2021-12-06 18:32:52');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` int(11) NOT NULL DEFAULT 1,
  `role` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `sex`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, '店舗例の１', 'user1@gmail.com', 'res001', '$2y$10$FIzWJUKo1.s8DJ8kC.o6w.nl3LrKVgryjxfRya8qo7AFU/DhIdqbm', 2, 2, 'drXQGlM7CKZ6ipu5YjcbFassTUV7MwnnGc5A53Jk4aHfmAnpH3yOKDRT2fov', '2021-12-05 09:32:44', '2021-12-05 15:54:58'),
(3, '店舗の例３', 'user3@gmail.com', 'user002', '123456789', 1, 1, 'mPix2gRRHCLCJFJcDQujkCIy3PWLyBPArNz7DGaxApgLJaDpGLBEnMIQqJlJ', '2021-12-05 14:48:11', '2021-12-05 18:24:46'),
(4, '店舗例４', 'user004@gmail.com', 'user004', '$2y$10$6EwoiQV5C1MlFmxUuJNLvOeQ.hzZvrUj4icnH4vqxdiGwSLuPEtgq', 2, 1, 'Qz6GhvhSMJBkpYMbuOiSDBhQkRYdSwrTyYi0L9PHiqSRN4CYN7cpacyhOFYf', '2021-12-05 14:57:50', '2021-12-05 14:57:50'),
(5, '店舗例5', 'user005@gmail.com', 'user005', '$2y$10$FVjrs6cBxhn1EMig8EtrI./MDl2cDC6Ei6Xn8As30tln.V8eT/o1e', 2, 1, 'P3M8nQB92uv8VaFo8Yc7g8EpshBl9zcAVtsgfRA7imHh1YMiTDIABVIwIne3', '2021-12-05 14:57:57', '2021-12-05 14:57:57'),
(6, '店舗例6', 'user006@gmail.com', 'user006', '$2y$10$BsgpP9/2GdZM3BIWpMaBvOIa9WA7qNNPnvrZmGOiuH8MkxhrrtocW', 2, 1, 'jFgwZFPBPTUR7To1Qct4H8CEnl98Panz3WUrjL4M6NjeLVsW12k4AG3wGjVY', '2021-12-05 14:58:05', '2021-12-05 14:58:05'),
(7, '店舗例7', 'user007@gmail.com', 'user007', '$2y$10$3SYyxpXMJfcEi3XgzIn2veG7hsu/5P0h8er0vk86x3OK8c7GGQwyG', 1, 1, 'gCrxJ3EHUCqWzx1R07MaebIAO1zqTWPMksAgWUw6j9UFiV84vmSbsOz3proH', '2021-12-05 14:58:12', '2021-12-05 18:26:43'),
(8, 'Admin', 'admin@gmail.com', 'admin', '$2y$10$ZRVFTliW0Lzfex71nfJwX.bxuTupYJiCwiPnmh45n/lbOYh1QW22i', 1, 2, 'PZRwplQOQ2GB4fEpy4s1DfaAOsvR4NvhXazYQyohf9PHmrDGsULFd41vPY2K', '2021-12-05 15:53:53', '2021-12-05 15:55:36'),
(18, '名前09', 'email09@gmail.com', 'user009', '$2y$10$/2/rSRtRpg0YL2hcf5AeRusmVqIpCyecIg7d24ezzZOsi2cNSD5ha', 1, 1, 'bXmGh1xPAlsn9Bdd4yl4CI97Wjmzgaj5tI9fnlz0wLhhQQrMS9pvM6V2535L', '2021-12-05 16:12:26', '2021-12-05 16:27:04'),
(19, 'new01', 'new01', 'newuser01', '123456', 1, 1, NULL, '2021-12-05 18:21:04', '2021-12-05 18:21:04'),
(20, 'NEW', 'admin@gmail.com', 'user111', '$2y$10$51Di4qY4nXNeVnaH4rJboOrQkwk2YW5W3z1v1E8YUTPCNA2FJPbKa', 1, 1, 'd3tSybloMSY6sqb1HMpTqN4axIfTdB6n0CjoTppNgcrezBl25TrjO0epqiPG', '2021-12-05 18:27:43', '2021-12-05 18:29:14'),
(21, 'Adm125', '123456@gmail.com', 'testuser0001', '$2y$10$hXNlz/3GobG2KOUBTcXf6OORC54Ir92KLa7Zo6MRl0Gcv/SuuWfki', 1, 1, '0XWmZGFwu75ACQqwPU0SZ6Yt4cHpSqZs7MxdUV99NqQZJHKx0rCtkTT6qQuL', '2021-12-05 18:30:42', '2021-12-05 18:40:33'),
(22, 'ヴォダイチン', 'admin@gmail.com.vn', '21gjk99', '$2y$10$CPkxWTJmGXK6TXQGGuJkdOiqDTgYQjbS2/mAZVNp4Q0Z2XGyk1aNC', 1, 1, 'sBJwuHbGw7amzAYkJPnSNgTuK7b8F0UapSMI1B666zJW2oxXqcXFlkgt9FNk', '2021-12-05 21:48:11', '2021-12-05 22:03:22');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `infomations`
--
ALTER TABLE `infomations`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- テーブルのインデックス `stars`
--
ALTER TABLE `stars`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- ダンプしたテーブルのAUTO_INCREMENT
--

--
-- テーブルのAUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- テーブルのAUTO_INCREMENT `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- テーブルのAUTO_INCREMENT `infomations`
--
ALTER TABLE `infomations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- テーブルのAUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- テーブルのAUTO_INCREMENT `stars`
--
ALTER TABLE `stars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- テーブルのAUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
