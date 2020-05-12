-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 10, 2020 at 12:20 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(3, 'Quotes'),
(13, 'medium'),
(15, 'Biography'),
(16, 'Fact');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(12, 11, 'Swart', 'junk@junkie.com', 'wow', 'approved', '2020-04-12'),
(13, 11, 'otedola', 'example@ex.com', 'wise words', 'approved', '2020-04-12'),
(14, 12, 'Swart', 'example@ex.com', 'The greatest writer out of Africa', 'approved', '2020-04-22'),
(15, 7, 'Swart', 'example@ex.com', 'Get to work fellas', 'approved', '2020-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` varchar(255) DEFAULT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`) VALUES
(7, 3, 'Get to work', 'Ayodeji Awosika', '2020-04-27', 'awosika.jpg', '<p>â€œForget about daydreaming for a while and work on getting any traction.â€ Iâ€™m a pro at letting my daydreams go too far. Bestselling books. Movies. Fame. However, I have learned that the best part if the journey is getting to do the work you enjoy. Forget those arbitrary goals and do the work. Do it until you get somewhere, and then do it some more.</p>', 'quotes, motivation', '1', 'Published'),
(11, 3, 'Phil Knight Quotes', 'Phil Knight', '2020-04-27', 'phil.jpg', '<p>The cowards never started and the weak died along the way.</p>', 'quotes, motivation', '2', 'Published'),
(12, 3, 'Chinua Achebe Quotes', 'Chinua Achebe', '2020-04-27', 'Achebe.jpg', '<p>One of the truest tests of integrity is its blunt refusal to be compromised. Among the Igbo the art of conversation is regarded very highly, and proverbs are the palm-oil with which words are eaten. Art is man constant effort to create for himself a different order of reality from that which is given to him.</p>', 'Quotes, Culture', '1', 'Published'),
(15, 3, 'Play the long game', 'Ayodeji Awosika', '2020-05-09', 'awosika.jpg', '<blockquote><p><i>â€œWe are self-interested, but to a fault. Driven by our â€˜fast-brain,â€™ the ego-centric, automatic, cave-man foundation our brain is built on, we almost always make the choice that deeds the darkest nature of our self-interest: instant gratification, greed, discomfort, avoidance, and our lust for familiarity.â€</i></p></blockquote><p>How often do we choose actions that will make us happy in the short-term but miserable in the long-term?</p><p>We must learn to make decisions based on what will have better results down the line. If we donâ€™t, our lives will become an endless loop of short-term gratification.</p>', 'quotes, motivation, honesty', NULL, 'Published');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) DEFAULT '$2y$10$iusesomecrazystrings22'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`) VALUES
(4, 'jide', '$1$aOMsv3h/$1/hTIWuQwSngoG.A5po2r0', 'jide', 'akanni', 'jide@jide.com', NULL, 'admin', NULL),
(5, 'edwin', 'edwin', 'edwin', 'diaz', 'edwindiaz@diaz.com', NULL, 'subscriber', NULL),
(6, 'Money', 'Money', 'Money', 'Man', 'Money@money.com', NULL, 'admin', NULL),
(8, 'bolu', 'bolu', 'Bolu', 'tayo', 'bolu@bolu.com', NULL, 'subscriber', NULL),
(9, 'salam', '$1$GZlD0nuq$zQN/s5u4iSoauABLgRZ9K.', 'salam', 'salam', 'salam@salam.com', NULL, 'subscriber', '$2y$10$iusesomecrazystring22'),
(116, 'majek', '$1$hfPyBoa0$PLR4WsdAVrFSiGBAovf2Y0', 'Majek', 'Majek', 'majek@majek.com', NULL, 'subscriber', '$2y$10$iusesomecrazystring22'),
(117, 'ybgt', '$1$n0/o3irR$vfc3OEkisN7gsLlYeUMty.', 'young', 'boys', 'ybgt@gmail.com', NULL, 'subscriber', '$2y$10$iusesomecrazystring22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
