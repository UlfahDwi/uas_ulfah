-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2024 at 12:34 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas_pbl`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `view_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `photo_path`, `category_id`, `created_at`, `updated_at`, `view_count`) VALUES
(1, 'The Rise of Artificial Intelligence', 'Artificial Intelligence (AI) is transforming industries. In this article, we explore the various applications of AI and its impact on society.', '1.png', 1, '2024-10-30 07:28:32', '2024-10-30 13:34:33', 1),
(2, 'Top 10 Programming Languages in 2024', 'Discover the most popular programming languages to learn in 2024. This article lists the languages that are in high demand in the job market.', '22.png', 1, '2024-10-30 07:28:32', '2024-10-30 13:34:48', 1),
(3, 'The Future of Quantum Computing', 'Quantum computing promises to revolutionize how we process information. This article discusses the potential and challenges of this technology.', '33.png', 1, '2024-10-30 07:28:32', '2024-10-30 13:37:55', 0),
(4, 'Understanding Blockchain Technology', 'Blockchain technology is not just for cryptocurrencies. Learn how it is used across various sectors and its potential for the future.', '4.png', 1, '2024-10-30 07:28:32', '2024-10-30 13:40:06', 0),
(5, 'Cybersecurity Trends to Watch', 'In an increasingly digital world, cybersecurity is crucial. Explore the trends and technologies that are shaping cybersecurity today.', '5 new.png', 1, '2024-10-30 07:28:32', '2024-10-30 13:44:39', 0),
(6, '5G Technology and Its Impact', '5G is here, and it’s changing the way we connect. This article covers the implications of 5G technology on communication and internet services.', '6 new.png', 1, '2024-10-30 07:28:32', '2024-10-30 13:52:39', 0),
(7, 'The Importance of Data Privacy', 'As data breaches become more common, data privacy is more important than ever. This article discusses how individuals can protect their information.', '7 new.png', 1, '2024-10-30 07:28:32', '2024-10-30 13:59:40', 0),
(8, 'Emerging Tech Startups to Watch', 'Innovation is thriving in the tech startup ecosystem. Here are some promising startups making waves in the industry.', '8 new.png', 1, '2024-10-30 07:28:32', '2024-10-30 14:03:36', 0),
(10, 'The Role of Technology in Education', 'Technology is reshaping education. Discover how digital tools and platforms are enhancing learning experiences for students.', '10 new.png', 1, '2024-10-30 07:28:32', '2024-10-30 23:03:47', 0),
(11, 'The Benefits of a Balanced Diet', 'Eating a balanced diet is essential for overall health. This article discusses the key components of a healthy diet and their benefits.', '11 new.png', 2, '2024-10-30 07:28:40', '2024-10-30 23:04:04', 0),
(12, 'Mental Health Awareness: Why It Matters', 'Mental health is just as important as physical health. Explore the significance of mental health awareness in today’s society.', '12  new.png', 2, '2024-10-30 07:28:40', '2024-10-30 23:04:18', 0),
(13, '10 Tips for Better Sleep', 'Quality sleep is crucial for good health. Here are ten tips to improve your sleep hygiene and overall wellbeing.', '13 new.png', 2, '2024-10-30 07:28:40', '2024-10-30 23:04:31', 0),
(14, 'The Impact of Exercise on Mental Health', 'Exercise is not just for physical fitness. Learn how regular physical activity can improve your mental health and mood.', '14 new.png', 2, '2024-10-30 07:28:40', '2024-10-30 23:04:45', 0),
(15, 'Meditation and Mindfulness for Beginners', 'Meditation can help reduce stress and improve focus. This article provides a beginner’s guide to meditation and mindfulness practices.', '15 new.png', 2, '2024-10-30 07:28:40', '2024-10-30 23:05:07', 0),
(16, 'Understanding Nutrition Labels', 'Nutrition labels can be confusing. This article explains how to read and understand them to make healthier food choices.', '16 new.png', 2, '2024-10-30 07:28:40', '2024-10-30 23:05:20', 0),
(17, 'The Importance of Hydration', 'Staying hydrated is vital for health. Explore the benefits of water and how much you should be drinking daily.', '17 new.png', 2, '2024-10-30 07:28:40', '2024-10-30 23:05:33', 0),
(18, 'Natural Remedies for Common Ailments', 'Many common ailments can be treated with natural remedies. Discover some effective home remedies for everyday issues.', '18 new.png', 2, '2024-10-30 07:28:40', '2024-10-30 23:05:45', 0),
(19, 'The Benefits of Regular Health Check-Ups', 'Regular health check-ups can catch potential issues early. This article discusses why they are essential for long-term health.', '19 new.png', 2, '2024-10-30 07:28:40', '2024-10-30 23:05:58', 0),
(20, 'How to Manage Stress Effectively', 'Stress is a part of life, but managing it is key to wellbeing. Explore techniques and strategies for effective stress management.', '20 new.png', 2, '2024-10-30 07:28:40', '2024-10-30 23:06:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Technology Post'),
(2, 'Lifestyle Post');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'fadli', 'fadlinurhidayat124@gmail.com', '$2y$10$51DRZPhm7eN8yfzdQY.Tf.jDgUNg9ykNeOj4.5m1qxE963n9kkj2K', '2024-10-30 06:52:48', '2024-10-30 13:02:12');

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `id` bigint(20) NOT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`);

--
-- Constraints for table `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `views_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
