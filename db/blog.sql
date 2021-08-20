SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment_text` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `comment` (`id`, `user_id`, `post_id`, `comment_text`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'hello', '2021-08-19 14:07:33', '2021-08-19 14:07:33'),
(2, 1, 1, 'yoo', '2021-08-19 14:08:06', '2021-08-19 14:08:06'),
(3, 2, 1, 'hello there', '2021-08-19 14:11:49', '2021-08-19 14:11:49');


CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `post_content` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `post` (`id`, `title`, `post_content`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Admin CR', 'jasdasd', 2, '2021-08-19 14:04:37', '2021-08-19 14:04:37');


CREATE TABLE `session` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `session` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('AA8BsFq-20AVpUZh0nJWWK8TFFG_ZvWf', '2021-08-14 14:26:13', '{\"cookie\":{\"originalMaxAge\":600000,\"expires\":\"2021-08-14T14:26:13.274Z\",\"httpOnly\":true,\"path\":\"/\"}}', '2021-08-14 14:16:13', '2021-08-14 14:16:13'),
('c4bSOWF-U8p1lbVuzwT8WhiCdVoQW-rG', '2021-08-14 14:18:06', '{\"cookie\":{\"originalMaxAge\":600000,\"expires\":\"2021-08-14T14:18:06.798Z\",\"httpOnly\":true,\"path\":\"/\"},\"user_id\":1,\"username\":\"admin123\",\"loggedIn\":true}', '2021-08-19 14:07:47', '2021-08-19 14:08:06');

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'eaglele', 'eagle@gmail.com', '$2b$10$fGxebDQpAuDq45S0Erv5X.PfnGvknGChwqMQ3BDSMWVONJNXaH/CS'),
(2, 'admin', 'admin@gmail.com', '$2b$10$/UEbzAylRuSUYq/Z8lQ3legSKaljilNwb5OtwpNo3D4I2c1Ja/A3q');


ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `session`
  ADD PRIMARY KEY (`sid`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;